FactoryGirl.define do 

  factory :user do 
    name 'Terry'
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
    gender 'male'
    birthdate '2000-06-16'
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