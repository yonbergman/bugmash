# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title "MyString"
    url "MyString"
    state "MyString"
    status "MyString"
    comment_count ""
    pull_request_url "MyString"
    gh_created_at "2013-08-07 17:39:33"
    gh_updated_at "2013-08-07 17:39:33"
  end
end
