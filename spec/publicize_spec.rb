require File.join(File.dirname(__FILE__), %w[spec_helper])

def json_to_hash(json)
  JSON.parse json
end

describe Publicized do

  context 'when publicized' do
    before { Publicized.send :publicize_model,:as => :entry }

    it 'is publicized' do
      subject.class.should be_publicized
    end

    it 'publicizes json data as the named class' do
      json = subject.to_json
      hash = json_to_hash json
      first_key = hash.keys.first
      first_key.should == 'entry'
    end

    context 'when fields are not publicized' do
      it 'publicizes an empty hash' do
        json = subject.to_json
        hash = json_to_hash json
        public_attributes = hash.values.pop
        public_attributes.should be_blank
      end
    end

    context 'when fields are publicized' do
      before { Publicized.send :publicize_field,:country_of_origin,:as => :country }
      it 'publicizes them' do
        json = subject.to_json
        hash = json_to_hash json
        public_attributes = hash.values.pop
        public_attributes.should == {"country" => ""}
      end

    end

  end

end

