ActiveRecord::Base.connection.create_table(:publicizeds) { |t| t.string :country_of_origin }

ActiveRecord::Base.send :include,Publicize

class Publicized < ActiveRecord::Base
end

