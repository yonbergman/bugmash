class AddStuffToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :github_id, :integer
    add_column :issues, :opened_by, :string
    add_column :issues, :assignee, :string
    add_column :issues, :org, :string
    add_column :issues, :repo, :string

    add_index :issues, :github_id
  end
end
