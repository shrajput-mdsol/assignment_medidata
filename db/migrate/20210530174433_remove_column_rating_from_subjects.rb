class RemoveColumnRatingFromSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :subjects, :rating
  end
end
