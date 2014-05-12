FactoryGirl.define do
    factory :user do
    	sequence(:name) { |n| "Person #{n}" }
    	sequence(:email) { |n| "person_#{n}@mailer.com"}
        #name    "Pac Man"
        #email   "bucken83@hotmail.com"
        password    "foobar"
        password_confirmation   "foobar"
    end
end
