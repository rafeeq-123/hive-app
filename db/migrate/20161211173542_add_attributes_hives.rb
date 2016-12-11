class AddAttributesHives < ActiveRecord::Migration[5.0]
  def change
  	add_column :hives, :bee_type, :string
  	add_column :hives, :queen_name, :string
  	add_column :hives, :honey_description, :text
  	add_column :hives, :location, :string
  end
end
