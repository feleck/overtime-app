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
end
