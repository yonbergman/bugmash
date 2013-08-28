require './lib/bootstrap_pagination_renderer'

class IssuesController < ApplicationController

  before_action :sign_in_required

  def index
    @my_issues = current_user.issues.ordered.includes(:labels, :users).paginate(:page => params[:my_issues_page])
    @open_issues = Issue.ordered.open_issues.includes(:labels, :users).paginate(:page => params[:page])
  end

  def labels
    @label = Label.find(params[:label])
    @open_issues = @label.issues.ordered.open_issues.includes(:labels, :users).paginate(:page => params[:page])
  end

  def starred
    @open_issues = Issue.starred.ordered.open_issues.includes(:labels, :users).paginate(:page => params[:page])
  end

  def leaderboard
    build_leaderboard
  end

  def create
    params.require(:issue).require(:url)
    issue = GithubImporter.new.query_issue(params[:issue][:url])
    issue.add_user current_user
  rescue Exception => e
      flash[:error] = e.message
  ensure
    redirect_to :back
  end

  def update
    issue = current_issue()
    case params[:todo]
      when 'take'
        issue.add_user current_user
      when 'give_up'
        issue.users.delete current_user
      when 'done'
        issue.done!
      when 'star'
        issue.update!(starred: true)
      when 'unstar'
        issue.update!(starred: false)
      else #do nothing
    end
    redirect_to :back
  end

  private

  def build_leaderboard
    @users = Hash.new(0)
    Issue.done.includes(:users).each do |issue|
      issue.users.each do |user|
        @users[user] += 1
      end
    end
    @users.each do |user, count|
      user.done_issues = count
    end
    @users = @users.keys
    @users.sort_by!(&:done_issues).reverse!
    @count = Issue.done.count
  end

  def current_issue
    Issue.where(id: params[:id]).first
  end

end