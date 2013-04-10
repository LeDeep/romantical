FactoryGirl.define do 

  factory :user do 
    name 'Bill'
    sequence(:username) {|n| "user#{n}"}
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    password "fooAAnnn$$54"
    password_confirmation 'fooAAnnn$$54'
  
    factory :user_with_profile do 
      after(:create) do |user, evaluator|
        FactoryGirl.create(:profile, user: user)
      end
    end
  end

  factory :profile do 
    name 'Steve'
    points 1000
    gender 'male'
    in_relationship_with 'Mary'
    relationship_status 'married'
    anniversary '2013-04-05'
    age 41
    city 'chicago'
    state 'IL'
    user_id 1
  end

  factory :picture do 
    picture_file_name 'Steve'
    picture_content_type 'image/jpg'
    picture_file_size 1
    picture_updated_at '2013-04-05'   
    user_id 1
  end

end