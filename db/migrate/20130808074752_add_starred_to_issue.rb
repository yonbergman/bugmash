class AddStarredToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :starred, :boolean, default: false
  end
end
