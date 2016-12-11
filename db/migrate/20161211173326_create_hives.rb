class CreateHives < ActiveRecord::Migration[5.0]
  def change
    create_table :hives do |t|

      t.timestamps
    end
  end
end
