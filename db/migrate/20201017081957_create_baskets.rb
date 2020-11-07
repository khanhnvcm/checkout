class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
    	t.references :product, null: false, foreign_key: true
    	t.integer :quantity
      t.timestamps
    end
  end
end
