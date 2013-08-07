class Issue < ActiveRecord::Base

  has_and_belongs_to_many :labels
  has_and_belongs_to_many :users

end
