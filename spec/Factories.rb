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
    couple_id 1
  end

  factory :assignment do 
    points 5
    activity 'mow the lawn'
    validity_period 30
    couple_id 1
  end

  factory :compensation do 
    points 5
    date_of_occurrence '2000-06-16'
    user_id 1
    assignment_id 1
  end

    factory :couple do 
      anniversary '2000-06-16'
      status "engaged"
  end

end
