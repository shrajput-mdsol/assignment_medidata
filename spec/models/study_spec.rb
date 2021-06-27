require 'rails_helper'

RSpec.describe Study, type: :model do
  describe "#Model Level Validations" do
    context "when an attempt to create study without mandatory fields is made" do
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

    context "when an attempt to create study with non numerical phase value is made" do
      it "should be invalid and give appropriate error message" do
        test_study = Study.new(phase: 'phase')
        expect(test_study.valid?).to be false
        expect(test_study.save).to be false
        expect(test_study.errors.messages[:phase].first).to eql "is not a number"
      end
    end

    context 'when an attempt to create study with phase value greater than 5 is made' do
      it 'should be invalid and give appropriate error message' do
        test_study = Study.new(phase: 6)
        expect(test_study.valid?).to be false
        expect(test_study.errors.messages[:phase].first).to eql "must be less than or equal to 5"
      end
    end

    context 'when an attempt to create study with duplicate title is made' do
      let(:test_study1) {create(:study, title:'test_title')}
      let(:test_study2) {create(:study, title:'test_title')}

      it 'should get created for the first attempt' do
        expect(test_study1.valid?).to be true
        expect{test_study2.valid?}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Title has already been taken')
      end
    end
  end
end