require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET #new" do 
        it "renders the new template" do 
            get :new 
            expect(response).to render_template(:new)
        end
    end

    describe "POST #create" do 
        context "with invalid params" do 
            before(:each) do 
                post :create, params: { user: FactoryBot.attributes_for(:user, password: '') }
            end
            
            it "validates the presence of username and password" do 
                expect(response).to render_template(:new)
                puts flash[:errors]
                expect(flash[:errors]).to be_present

            end
        end
        context "with valid params" do 
            before(:each) do 
                post :create, params: { user: FactoryBot.attributes_for(:user) }
            end

            it "redirects to the user homepage" do 
                expect(response).to redirect_to(user_path(User.last))
            end
        end 
    end
end
