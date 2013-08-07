require './lib/bootstrap_pagination_renderer'

class IssuesController < ApplicationController

  before_action :sign_in_required

  def index
    @my_issues = current_user.issues.paginate(:page => params[:my_issues_page])
    @open_issues = Issue.paginate(:page => params[:page])

  end

end