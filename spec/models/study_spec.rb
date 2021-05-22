require 'rails_helper'
require 'pry-byebug'

RSpec.describe Study, type: :model do
  describe "#Model Level Validations" do
    context "when the study without mandatory fields is created" do
      test_study = Study.new

      it "should be invalid and give appropriate error message for title" do
        expect(test_study.valid?).to be false
        expect(test_study.save).to be false
        expect(test_study.errors.messages[:title].first).to eql "can't be blank"
        expect(test_study.errors.messages[:title].last).to eql "is too short (minimum is 6 characters)"
      end

      it "should give appropriate error message for therapeutic_area" do
        expect(test_study.errors.messages[:therapeutic_area].at(0)).to eql "can't be blank"
      end
    end

    context "when a study is created with non numerical phase value" do
      it "should be invalid and give appropriate error message" do
        test_study = Study.new(phase: 'phase')
        expect(test_study.valid?).to be false
        expect(test_study.save).to be false
        expect(test_study.errors.messages[:phase].first).to eql "is not a number"
      end
    end
  end
end