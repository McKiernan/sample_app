FactoryGirl.define do
    factory :user do
        name    "Pac Man"
        email   "pac@hotmail.com"
        password    "foobar"
        password_confirmation   "foobar"
    end
end
