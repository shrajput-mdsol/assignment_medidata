class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :title
      t.string :therapeutic_area
      t.integer :phase, :default => 0
      t.string :status
      t.datetime :start_date
      t.datetime :projected_end_date
      t.timestamps
    end
  end
end
