class CreateSites < ActiveRecord::Migration[5.2]
  
  def change
    create_table :sites do |t| 
      t.string :name 
      t.string :address
      t.string :description
      t.integer :neighborhood_id
    end
  end
end
