FactoryGirl.define do
  factory :user do
    # The following are all methods 
    # so it's could be written as name() and email() etc.
    name      "Jake Mauer"
    email     "jake@jakemauer.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end