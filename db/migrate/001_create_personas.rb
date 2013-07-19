class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
    end
  end

  def self.down
    drop_table :personas
  end
end
