ActiveRecord::Base.connection.create_table(:publicizeds) { |t| t.string :whirlygig }

ActiveRecord::Base.send :include,Publicize

class Publicized < ActiveRecord::Base
  publicize_model :as => :entry
end

