class AddManyToManyTables < ActiveRecord::Migration
  def change

    create_table :issues_labels, :id => false do |t|
      t.integer :issue_id
      t.integer :label_id
    end

    create_table :issues_users, :id => false do |t|
      t.integer :issue_id
      t.integer :user_id
    end

  end
end
