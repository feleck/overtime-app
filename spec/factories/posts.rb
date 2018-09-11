FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Anything' }
    overtime_request { 1.5 }
    user
  end

  factory :second_post, class: Post do
    date { Date.yesterday }
    rationale { 'Other' }
    overtime_request { 2.5 }
    association :user, factory: :second_user, strategy: :build
  end

  factory :post_form_other_user, class: Post do
    association :user, factory: :non_authorized_user, strategy: :build
    date { Date.today }
    rationale { 'Yet another' }
    overtime_request { 1.5 }
  end
end
