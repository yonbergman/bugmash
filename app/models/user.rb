class User < ActiveRecord::Base

  attr_accessor :done_issues

  has_and_belongs_to_many :issues

  scope :with_done_issues, -> { includes(:issues).where(issues: {status: :done}) }

end
