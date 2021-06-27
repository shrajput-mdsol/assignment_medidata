require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'Model Level Validations' do
    context 'When an attempt to create a subject without  is made' do
      it 'should not get created and throw appropriate error message' do
        test_subject = Subject.new
        expect(test_subject.valid?).to be false
        expect(test_subject.errors.messages[:name].first).to eql "can't be blank"
        expect(test_subject.errors.messages[:screening_no].first).to eql "can't be blank"
        expect(test_subject.errors.messages[:site].first).to eql "must exist"
      end
    end
  end
end
