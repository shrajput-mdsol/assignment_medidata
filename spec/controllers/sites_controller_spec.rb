require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  describe "CRUD operation on Sites" do
    let(:site_parameters) { { name: 'test site', no_of_subjects: 40, site_open_date: '2022-01-1', site_close_date: '2023-01-1',
                              screen_failure_rate: 0.50, address: 'test address', study_id: 1 } }

    context "When the site is saved successfully" do

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

    context "When an attempt to delete a site is made" do
      let(:test_site) {create(:site)}
      it "should delete site and redirect to index page" do
        get :destroy, params: {id: test_site.id}
        expect(response.status).to be 302
      end
    end

    # context "When an attempt to edit a site is made" do
    #   let(:test_site) {create(:site)}
    #   it "should be updated as per the param updated" do
    #     get :update, params: {id: test_site.id, site: site_parameters}
    #     expect(response.status).to be 302
    #   end
    # end
  end
end