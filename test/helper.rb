require 'active_record'
require 'active_record/list'
require 'test/unit'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Schema.verbose = false

def setup_db(options = {})
  ActiveRecord::Schema.define(version: 1) do
    create_table :elements do |t|
      t.integer :pos, options
      t.timestamps
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table table
  end
end
