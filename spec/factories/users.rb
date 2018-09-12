FactoryBot.define do
  sequence :email do |n|
    "test#{n}@generated.test"
  end

  factory :user do
    first_name { 'Jon' }
    last_name { 'Snow' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    phone { '+48732230324' }
  end

  factory :second_user, class: User do
    first_name { 'Wiesiek' }
    last_name { 'Klaun' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    phone { '+48732230324' }
  end

  factory :admin_user, class: AdminUser do
    first_name { 'Mike' }
    last_name { 'Brown' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    phone { '+48732230324' }
  end

  factory :non_authorized_user, class: User do
    first_name { 'Non' }
    last_name { 'Auth' }
    email { generate :email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    phone { '+48732230324' }
  end
end
