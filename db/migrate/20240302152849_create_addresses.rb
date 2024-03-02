class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :citizen, null: false, foreign_key: true
      t.string :cep, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :neighborhood, null: false
      t.string :number, null: false
      t.string :complement
      t.string :ibge_code
      t.timestamps
    end
  end
end
