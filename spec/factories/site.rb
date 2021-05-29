FactoryBot.define do
  factory :site do
    name {'Test Site'}
    no_of_subjects {50}
    site_open_date {'2022-01-1'}
    site_close_date {'2023-01-1'}
    screen_failure_rate { 0.50 }
    address {'Test Address'}
    association :study
  end
end