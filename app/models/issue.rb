class Issue < ActiveRecord::Base

  has_and_belongs_to_many :labels
  has_and_belongs_to_many :users

  scope :open_issues, -> { where(pull_request_url: nil, state: 'open') }
  scope :ordered, -> { order(id: :desc) }
  scope :starred, -> { where(starred: true) }

  validates_inclusion_of :org, in: %w(rails)

  enum :status, [:open, :wip, :done]


  def add_user(user)
    unless users.include?(user)
      users << user
      self.save
    end
  end


end
