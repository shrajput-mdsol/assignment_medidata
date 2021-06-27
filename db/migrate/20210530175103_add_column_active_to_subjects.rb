class AddColumnActiveToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :active, :boolean, default: true
  end
end
