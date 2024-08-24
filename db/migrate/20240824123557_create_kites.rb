class CreateKites < ActiveRecord::Migration[7.1]
  def change
    create_table :kites do |t|
      t.string :owner_name
      t.string :nubmer_of_kites

      t.timestamps
    end
  end
end
