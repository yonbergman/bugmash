namespace :github do
  task :update => :environment do
    issues = GithubImporter.new.query_repo
    puts "Found #{issues.count} issues"
    issues_to_remove = Issue.where(repo: 'rails').all - issues
    puts "Closing #{issues_to_remove.count} issues"
    issues_to_remove.each do |issue|
      issue.update(state: 'closed')
    end
    puts 'Done'
  end
end