class AddColumnRedactedToStudies < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :redacted, :boolean, default: false
  end
end
