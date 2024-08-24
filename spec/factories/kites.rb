FactoryBot.define do
  factory :kite do
    owner_name { 'test_kite_owner' }
    nubmer_of_kites { 'two' }
    association :user
  end
end
