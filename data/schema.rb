require 'active_record'
require_relative('../environment.rb')

ActiveRecord::Schema.define do
  create_table :actors do |t|
    t.string :name, null: false
    # Potences for the skills. 1 equals average growth. 2 is excellent growth.
    t.integer :health, null: false, default: 1
    t.integer :magic, null: false, default: 1
    t.integer :strength, null: false, default: 1
    t.integer :defense, null: false, default: 1
  end

  add_index :actors, :name, unique: true
end
