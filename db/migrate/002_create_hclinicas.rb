class CreateHclinicas < ActiveRecord::Migration
  def self.up
    create_table :hclinicas do |t|
    end
  end

  def self.down
    drop_table :hclinicas
  end
end
