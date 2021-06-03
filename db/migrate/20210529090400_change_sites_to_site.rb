class ChangeSitesToSite < ActiveRecord::Migration[6.1]
  def change
    rename_column :subjects, :sites_id, :site_id
  end
end
