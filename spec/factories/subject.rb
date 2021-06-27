FactoryBot.define do
  factory :subject do
    name {'test subject'}
    screening_no {101}
    status {'created'}
    enrollment_date {'2021-09-12'}
    end_date {'2021-09-12'}
    rating {'Happy'}
    email {'shikha.rajpoot@gmail.com'}
    association :site
  end
end