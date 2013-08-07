class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :url
      t.string :state
      t.string :status
      t.integer :comment_count
      t.string :pull_request_url
      t.datetime :gh_created_at
      t.datetime :gh_updated_at

      t.timestamps
    end
  end
end
