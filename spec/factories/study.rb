FactoryBot.define do
  factory :study do
    title {'Test Study'}
    therapeutic_area {'Test Therapeutic Area'}
    phase {2}
    status {'Stopped'}
    start_date {'2021-09-12'}
    projected_end_date {'2022-09-12'}
  end
end