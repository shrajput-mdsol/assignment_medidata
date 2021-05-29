require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  describe "CRUD operation on Sites" do
    context "When the site is saved successfully" do
      test_study = Study.create(id: rand(0..50), title: 'test study', phase: 2, status: 'planned', therapeutic_area: 'test therapeutic area')
      let(:site_parameters) do
        { name: 'test site', no_of_subjects: 40, site_open_date: '2022-01-1', site_close_date: '2023-01-1', screen_failure_rate: 0.50, address: 'test address', study_id: test_study.id }
      end
      it "should return the response status as 302" do
        post :create, params: { site: site_parameters }
        expect(response.body).eql? ''
        expect(response.status).to be 302
      end
    end

    context "When the site is not saved successfully" do
      let(:site_parameters) do
        { name: '', no_of_subjects: 'fifty' }
      end
      it "should not return response status as 302" do
        post :create, params: { site: site_parameters }
        expect(response.status).not_to be 302
      end
    end
  end
end