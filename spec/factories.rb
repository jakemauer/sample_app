FactoryGirl.define do
  factory :user do
    # The following are all methods 
    # so it could be written as name() and email() etc.
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password  "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end