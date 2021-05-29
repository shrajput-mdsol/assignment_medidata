require 'rails_helper'
RSpec.describe Site, type: :model do
  describe 'Model Level Validations' do
    context 'When an attempt to create a site without name is made' do
      let(:site) { create(:site, name: '') }
      it 'should not be created and throw an appropriate error message' do
        expect{site.valid?}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
      end
    end

    context 'When an attempt to create a site with non numeric no_of_subjects is made' do
      let(:site) { create(:site, no_of_subjects: 'fifty') }
      it 'should not be created and throw an appropriate error message' do
        expect{site.valid?}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: No of subjects is not a number')
      end
    end

    context 'When an attempt to create a site without study is made' do
      let(:site) {create(:site, study_id: '')}
      it 'should not be created and throw an appropriate error message' do
        expect{site.valid?}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Study must exist')
      end
    end
  end
end
#Validation failed: Study must exist
# Validation failed: Study must exist