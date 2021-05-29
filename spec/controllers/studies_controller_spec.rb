require 'rails_helper'

RSpec.describe StudiesController, type: :controller do
  describe 'CRUD on Study' do
    context "When study is saved successfully" do
      #let(:study) { build(:study) }
      let(:study_parameters) do
        { title: 'test title', therapeutic_area: 'test therapeutic area', status: 'Created', phase: 1 }
      end
      it 'should return response status as 302' do
        post :create, params: { study: study_parameters }
        expect(response.body).eql? ''
        expect(response.status).to be 302
      end
    end

    context 'When study inputs are not valid and it is not saved successfully' do
      let(:study_parameters) do
        { title: '', therapeutic_area: '', status: 'Created', phase: '' }
      end
      it 'should not give response status as 302' do
        post :create, params: { study: study_parameters }
        expect(response.status).not_to be 302
      end
    end
  end
end
