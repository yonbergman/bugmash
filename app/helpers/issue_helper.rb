module IssueHelper
  def belongs_to_current_user?(issue)
    current_user.issues.include? issue
  end

  def star_tag(issue)
    if issue.starred?
      link_to issue_path(issue, todo: 'unstar'), method: :put do
        content_tag :i, '', class: 'icon-star'
      end
    else
      link_to issue_path(issue, todo: 'star'), method: :put do
        content_tag :i, '', class: 'icon-star-empty'
      end
    end
  end
end