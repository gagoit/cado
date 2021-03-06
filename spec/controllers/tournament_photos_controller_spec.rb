require 'spec_helper'

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

describe TournamentPhotosController do

  # This should return the minimal set of attributes required to create a valid
  # TournamentPhoto. As you add validations to TournamentPhoto, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TournamentPhotosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tournament_photos as @tournament_photos" do
      tournament_photo = TournamentPhoto.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tournament_photos).should eq([tournament_photo])
    end
  end

  describe "GET show" do
    it "assigns the requested tournament_photo as @tournament_photo" do
      tournament_photo = TournamentPhoto.create! valid_attributes
      get :show, {:id => tournament_photo.to_param}, valid_session
      assigns(:tournament_photo).should eq(tournament_photo)
    end
  end

  describe "GET new" do
    it "assigns a new tournament_photo as @tournament_photo" do
      get :new, {}, valid_session
      assigns(:tournament_photo).should be_a_new(TournamentPhoto)
    end
  end

  describe "GET edit" do
    it "assigns the requested tournament_photo as @tournament_photo" do
      tournament_photo = TournamentPhoto.create! valid_attributes
      get :edit, {:id => tournament_photo.to_param}, valid_session
      assigns(:tournament_photo).should eq(tournament_photo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TournamentPhoto" do
        expect {
          post :create, {:tournament_photo => valid_attributes}, valid_session
        }.to change(TournamentPhoto, :count).by(1)
      end

      it "assigns a newly created tournament_photo as @tournament_photo" do
        post :create, {:tournament_photo => valid_attributes}, valid_session
        assigns(:tournament_photo).should be_a(TournamentPhoto)
        assigns(:tournament_photo).should be_persisted
      end

      it "redirects to the created tournament_photo" do
        post :create, {:tournament_photo => valid_attributes}, valid_session
        response.should redirect_to(TournamentPhoto.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tournament_photo as @tournament_photo" do
        # Trigger the behavior that occurs when invalid params are submitted
        TournamentPhoto.any_instance.stub(:save).and_return(false)
        post :create, {:tournament_photo => {  }}, valid_session
        assigns(:tournament_photo).should be_a_new(TournamentPhoto)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TournamentPhoto.any_instance.stub(:save).and_return(false)
        post :create, {:tournament_photo => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tournament_photo" do
        tournament_photo = TournamentPhoto.create! valid_attributes
        # Assuming there are no other tournament_photos in the database, this
        # specifies that the TournamentPhoto created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TournamentPhoto.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => tournament_photo.to_param, :tournament_photo => { "these" => "params" }}, valid_session
      end

      it "assigns the requested tournament_photo as @tournament_photo" do
        tournament_photo = TournamentPhoto.create! valid_attributes
        put :update, {:id => tournament_photo.to_param, :tournament_photo => valid_attributes}, valid_session
        assigns(:tournament_photo).should eq(tournament_photo)
      end

      it "redirects to the tournament_photo" do
        tournament_photo = TournamentPhoto.create! valid_attributes
        put :update, {:id => tournament_photo.to_param, :tournament_photo => valid_attributes}, valid_session
        response.should redirect_to(tournament_photo)
      end
    end

    describe "with invalid params" do
      it "assigns the tournament_photo as @tournament_photo" do
        tournament_photo = TournamentPhoto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TournamentPhoto.any_instance.stub(:save).and_return(false)
        put :update, {:id => tournament_photo.to_param, :tournament_photo => {  }}, valid_session
        assigns(:tournament_photo).should eq(tournament_photo)
      end

      it "re-renders the 'edit' template" do
        tournament_photo = TournamentPhoto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TournamentPhoto.any_instance.stub(:save).and_return(false)
        put :update, {:id => tournament_photo.to_param, :tournament_photo => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tournament_photo" do
      tournament_photo = TournamentPhoto.create! valid_attributes
      expect {
        delete :destroy, {:id => tournament_photo.to_param}, valid_session
      }.to change(TournamentPhoto, :count).by(-1)
    end

    it "redirects to the tournament_photos list" do
      tournament_photo = TournamentPhoto.create! valid_attributes
      delete :destroy, {:id => tournament_photo.to_param}, valid_session
      response.should redirect_to(tournament_photos_url)
    end
  end

end
