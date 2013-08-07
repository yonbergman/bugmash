class GithubImporter

  DEFAULT_REPO = 'https://www.github.com/rails/rails'
  REPO_REGEX = /https:\/\/github.com\/([\w\-_]+)\/([\w\-_]+)\/?/
  ISSUE_REGEX = /https:\/\/github.com\/([\w\-_]+)\/([\w\-_]+)\/issues\/(\d+)\/?/

  def query_repo(repo_url = DEFAULT_REPO)
    repo = breakdown_repo_url(repo_url)
    issues = Octokit.issues repo
    issues.map do |issue|
      build_issue(issue)
    end
  end

  def query_issue(issue_url)
    repo, issue_id = *breakdown_issue_url(issue_url)
    issue_json = Octokit.issue repo, issue_id
    build_issue issue_json
  end


  def build_issue(issue)
    issue_data = ActionController::Parameters.new(normalize_issue(issue))
    issue = Issue.where(github_id: issue_data[:github_id]).first_or_create
    issue.update(issue_data)
    issue
  end

  def normalize_issue(issue)
    {
        title: issue['title'],
        url: issue['html_url'],
        state: issue['state'],
        pull_request_url: issue['pull_request']['html_url'],
        comment_count: issue['comments'],
        github_id: issue['id'],
        opened_by: issue['user']['login'],
        assignee: assignee(issue),
        gh_created_at: issue['created_at'],
        gh_updated_at: issue['updated_at'],
        labels: labels(issue),
        repo: repo(issue),
        org: org(issue),
    }
  end

  def org(issue)
    issue['html_url'].match(REPO_REGEX)[1]
  end

  def repo(issue)
    issue['html_url'].match(REPO_REGEX)[2]
  end

  def assignee(issue)
    issue['assignee']['login'] if issue['assignee']
    nil
  end

  def labels(issue)
    issue['labels'].map do |label_json|
      data = ActionController::Parameters.new(label_json)
      Label.where(url: label_json['url']).first_or_create(data)
    end
  end


  def breakdown_repo_url(repo_url)
    matched = repo_url.match(REPO_REGEX)
    raise StandardError.new("Inavlid repo url") unless matched
    "#{matched[1]}/#{matched[2]}"
  end

  def breakdown_issue_url(issue_url)
    matched = issue_url.match(ISSUE_REGEX)
    raise StandardError.new("Inavlid issue url") unless matched
    repo = "#{matched[1]}/#{matched[2]}"
    issue_id = matched[3]
    [repo, issue_id]
  end



end