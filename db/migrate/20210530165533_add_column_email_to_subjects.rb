class AddColumnEmailToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :email, :string
  end
end
