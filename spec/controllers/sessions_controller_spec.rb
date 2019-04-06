require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    describe "GET #new" do
        it "renders the user sign-in form" do
            get :new
            expect(response).to render_template(:new)
        end
    end
    
    describe "POST #create" do
        # before(:each) do
        #     subject(:user) { FactoryBot.create(:user) }
        # end
        context "with invalid params" do
            it "redirects to the user sign-in form" do
                post :create, params: { user: FactoryBot.attributes_for(:user, password: "") }
                expect(response).to render_template(:new)
            end
        end
        context "with valid params" do
            it "redirects to the user home page" do
                user_attr = FactoryBot.attributes_for(:user)
                user = User.create(user_attr)
                post :create, params: { user: user_attr }
                expect(response).to redirect_to(user_path(User.last))
            end
        end
    end

    # describe "DELETE #destroy" do
    #     it "logs out" do
    #         delete :destroy, pa
    # end 
end
