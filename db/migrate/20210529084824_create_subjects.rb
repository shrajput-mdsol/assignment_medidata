class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.references :sites, null: false, foreign_key: true
      t.string :name
      t.integer :screening_no
      t.string :status
      t.datetime :enrollment_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
