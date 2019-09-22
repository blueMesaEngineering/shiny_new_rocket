class CreateDatapoints < ActiveRecord::Migration[6.0]
  def change
    create_table :datapoints do |t|
      t.bigint :stock_id
      t.string :type
      t.datetime :date
      t.decimal :open
      t.decimal :high
      t.decimal :low
      t.decimal :close
      t.float :volume
      t.integer :openint

      t.timestamps
    end
  end
end
