FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Anything' }
    user
  end

  factory :second_post, class: Post do
    date { Date.yesterday }
    rationale { 'Other' }
    user
  end

  factory :post_form_other_user, class: Post do
    association :user, factory: :non_authorized_user, strategy: :build
    date { Date.today }
    rationale { 'Yet another' }
    #user = non_authorized_user
  end
end
