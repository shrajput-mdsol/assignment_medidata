class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :no_of_subjects
      t.datetime :site_open_date
      t.datetime :site_close_date
      t.decimal :screen_failure_rate
      t.string :address
      t.references :study, null: false, foreign_key: true
      t.timestamps
    end
  end
end
