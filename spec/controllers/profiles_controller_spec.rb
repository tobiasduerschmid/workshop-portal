require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ProfilesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Profile. As you add validations to Profile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.build(:profile).attributes }

  let(:invalid_attributes) { FactoryGirl.build(:profile, school: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProfilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context "with an existing profile" do
    before :each do
      @profile = Profile.create! valid_attributes
      sign_in @profile.user
    end

    describe "GET #index" do
      it "assigns all profiles as @profiles" do
        get :index, params: {}, session: valid_session
        expect(assigns(:profiles)).to eq([@profile])
      end
    end

    describe "GET #show" do
      it "assigns the requested profile as @profile" do
        get :show, id: @profile.to_param, session: valid_session
        expect(assigns(:profile)).to eq(@profile)
      end
    end

    describe "GET #new" do
      it "assigns a new profile as @profile" do
        get :new, params: {}, session: valid_session
        expect(assigns(:profile)).to be_a_new(Profile)
      end
    end

    describe "GET #edit" do
      it "assigns the requested profile as @profile" do
        get :edit, id: @profile.to_param, session: valid_session
        expect(assigns(:profile)).to eq(@profile)
      end
    end
    
    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {
              first_name: "Karl",
              last_name: "Doe",
              gender: "male",
              birth_date: 15.years.ago,
              school: "Schule am Griebnitzsee",
              street_name: "August-Bebel-Str. 88",
              zip_code: "14482",
              city: "Potsdam",
              state: "Babelsberg",
              country: "Deutschland",
              graduates_school_in: "Bereits Abitur"
          }
        }

        it "updates the requested profile" do
          put :update, id: @profile.to_param, profile: new_attributes, session: valid_session
          @profile.reload
          expect(@profile.street_name).to eq(new_attributes[:street_name])
        end

        it "assigns the requested profile as @profile" do
          put :update, id: @profile.to_param, profile: valid_attributes, session: valid_session
          expect(assigns(:profile)).to eq(@profile)
        end

        it "redirects to the profile" do
          put :update, id: @profile.to_param, profile: valid_attributes, session: valid_session
          expect(response).to redirect_to(@profile)
        end
      end

      context "with invalid params" do
        it "assigns the profile as @profile" do
          put :update, id: @profile.to_param, profile: invalid_attributes, session: valid_session
          expect(assigns(:profile)).to eq(@profile)
        end

        it "re-renders the 'edit' template" do
          put :update, id: @profile.to_param, profile: invalid_attributes, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested profile" do
        expect {
          delete :destroy, id: @profile.to_param, session: valid_session
        }.to change(Profile, :count).by(-1)
      end

      it "redirects to the profiles list" do
        delete :destroy, id: @profile.to_param, session: valid_session
        expect(response).to redirect_to(profiles_url)
      end
    end
  end
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Profile" do
        sign_in FactoryGirl.create(:user)
        expect {
          post :create, profile: valid_attributes, session: valid_session
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        sign_in FactoryGirl.create(:user)
        post :create, profile: valid_attributes, session: valid_session
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end

      it "redirects to the created profile" do
        sign_in FactoryGirl.create(:user)
        post :create, profile: valid_attributes, session: valid_session
        expect(response).to redirect_to(Profile.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        sign_in FactoryGirl.create(:user)
        post :create, profile: invalid_attributes, session: valid_session
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        sign_in FactoryGirl.create(:user)
        post :create, profile: invalid_attributes, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
