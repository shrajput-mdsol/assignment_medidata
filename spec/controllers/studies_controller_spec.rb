require 'rails_helper'

RSpec.describe StudiesController, type: :controller do
  describe 'Create a Study' do
    context "When study is saved successfully" do
      # creating param hash
      let(:study_parameters) { { title: 'test title', therapeutic_area: 'test therapeutic area', status: 'Created', phase: 1 } }
      it 'should return response status as 302' do
        post :create, params: { study: study_parameters }
        expect(response.body).eql? ''
        expect(response.status).to be 302
      end
    end

    context 'When study inputs are not valid and it is not saved successfully' do
      let(:study_parameters) { { title: '', therapeutic_area: '', status: 'Created', phase: '' } }
      it 'should not give response status as 302' do
        post :create, params: { study: study_parameters }
        expect(response.status).not_to be 302
      end
    end
  end

  context "When an attempt to delete a study is made" do
    let(:test_study) {create(:study)}
    it "should ask for a confirmation" do
      #Have to check how we can test UI things
    end

    it "should delete study on confirmation" do
      get :destroy, params: {id: test_study.id}
      expect(response.status).to be 302
    end
  end

  context 'When an attempt to edit a study is made' do
    id = 1
    let(:study_params) { { title: 'test title', therapeutic_area: 'test therapeutic area', status: 'Created', phase: 1, id:id}}

    it "should get edited if the edit values comply with model level validation" do
      patch :update, params: {id: id, study: study_params}
      expect(response.status).to be 302
    end
  end
end
