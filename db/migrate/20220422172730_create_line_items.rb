class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :menu, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
