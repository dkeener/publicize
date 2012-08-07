ActiveRecord::Base.connection.create_table(:unpublicizeds) { |t| t.string :whirlygig }

class Unpublicized < ActiveRecord::Base

end