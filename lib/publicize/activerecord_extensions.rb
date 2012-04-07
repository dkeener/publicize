require 'active_record'

module Publicize
  module ActiveRecordExtensions

    PublicizedField = Struct.new(:name, :label)

    def self.included(base)
      base.send(:extend, ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        attr_accessor :controller
      end
    end

    module ClassMethods

      # Defines a field to be publicized. This may be a "virtual" field, i.e. -
      # it may be a method rather than a database-derived class attribute.

      def publicize_field(name, opts={})
        publicized_fields << PublicizedField.new(name, opts[:as].nil? ? name : opts[:as])
      end

      # Defines whether 1) the resource is publicized, and 2) optionally under
      # which name.

      def publicize_model(name = self.name)
        @publicized_name = name.to_s.downcase.dasherize
        @publicized = true
      end
      
      # Indicates whether the model has been publicized or not.
      
      def is_publicized?
        @publicized.nil? ? false : true
      end

      # Gets an array of the fields specified to be publicized.

      def publicized_fields
        @publicized_fields ||= []
      end

      # Gets the name under which a model will be publicized. Defaults to the
      # name of the model itself.

      def publicized_name
        @publicized_name || self.name.downcase.dasherize
      end
      
      # Returns the PublicizedField structure associated with the specified
      # label.
      
      def select_publicized_field(label)
        publicized_fields.select {|x| x.label.to_s == label.to_s}
      end

    end

    module InstanceMethods
      
      def as_json(options = {})
        if self.class.is_publicized?

          # Based on ActiveRecord setting, do {"name" : {"field1" : "value1", ...}}
          if ActiveRecord::Base.include_root_in_json == true
            {self.class.publicized_name => publicize.as_json(options)}
          else
            publicize.as_json(options)
          end

        else
          super(options)
        end
      end
      
      def to_xml(options = {})
        if self.class.is_publicized?
          xml = options[:builder] ||= Builder::XmlMarkup.new(options)
          xml.instruct! unless options[:skip_instruct]
          xml.level_one do
            xml.tag!(:test, 'content')
          end
        else
          super(options)
        end
      end
      
      # Generates an ordered hash containing publicized fields for a class
      # instance. Not generally used directly by end users of the gem.
      
      def publicize
        if !self.class.is_publicized?
          logger.warn("WARNING (Publicize): Attempted to publicize an unpublicized model")
          return nil
        end
        # TODO: Can switch to a regular hash when using Ruby 1.9
        hsh = ActiveSupport::OrderedHash.new
        self.class.publicized_fields.each do |pf|
          hsh[pf.label.nil? ? pf.name : pf.label] = ((v = eval(pf.name.to_s)).nil? ? '' : v)
        end
        hsh
      end
      
    end
    
  end
end

ActiveRecord::Base.send(:include, Publicize::ActiveRecordExtensions)
