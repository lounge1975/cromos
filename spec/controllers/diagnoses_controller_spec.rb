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

describe DiagnosesController do

  # This should return the minimal set of attributes required to create a valid
  # Diagnosis. As you add validations to Diagnosis, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all diagnoses as @diagnoses" do
      diagnosis = Diagnosis.create! valid_attributes
      get :index
      assigns(:diagnoses).should eq([diagnosis])
    end
  end

  describe "GET show" do
    it "assigns the requested diagnosis as @diagnosis" do
      diagnosis = Diagnosis.create! valid_attributes
      get :show, :id => diagnosis.id
      assigns(:diagnosis).should eq(diagnosis)
    end
  end

  describe "GET new" do
    it "assigns a new diagnosis as @diagnosis" do
      get :new
      assigns(:diagnosis).should be_a_new(Diagnosis)
    end
  end

  describe "GET edit" do
    it "assigns the requested diagnosis as @diagnosis" do
      diagnosis = Diagnosis.create! valid_attributes
      get :edit, :id => diagnosis.id
      assigns(:diagnosis).should eq(diagnosis)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Diagnosis" do
        expect {
          post :create, :diagnosis => valid_attributes
        }.to change(Diagnosis, :count).by(1)
      end

      it "assigns a newly created diagnosis as @diagnosis" do
        post :create, :diagnosis => valid_attributes
        assigns(:diagnosis).should be_a(Diagnosis)
        assigns(:diagnosis).should be_persisted
      end

      it "redirects to the created diagnosis" do
        post :create, :diagnosis => valid_attributes
        response.should redirect_to(Diagnosis.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved diagnosis as @diagnosis" do
        # Trigger the behavior that occurs when invalid params are submitted
        Diagnosis.any_instance.stub(:save).and_return(false)
        post :create, :diagnosis => {}
        assigns(:diagnosis).should be_a_new(Diagnosis)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Diagnosis.any_instance.stub(:save).and_return(false)
        post :create, :diagnosis => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested diagnosis" do
        diagnosis = Diagnosis.create! valid_attributes
        # Assuming there are no other diagnoses in the database, this
        # specifies that the Diagnosis created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Diagnosis.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => diagnosis.id, :diagnosis => {'these' => 'params'}
      end

      it "assigns the requested diagnosis as @diagnosis" do
        diagnosis = Diagnosis.create! valid_attributes
        put :update, :id => diagnosis.id, :diagnosis => valid_attributes
        assigns(:diagnosis).should eq(diagnosis)
      end

      it "redirects to the diagnosis" do
        diagnosis = Diagnosis.create! valid_attributes
        put :update, :id => diagnosis.id, :diagnosis => valid_attributes
        response.should redirect_to(diagnosis)
      end
    end

    describe "with invalid params" do
      it "assigns the diagnosis as @diagnosis" do
        diagnosis = Diagnosis.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Diagnosis.any_instance.stub(:save).and_return(false)
        put :update, :id => diagnosis.id, :diagnosis => {}
        assigns(:diagnosis).should eq(diagnosis)
      end

      it "re-renders the 'edit' template" do
        diagnosis = Diagnosis.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Diagnosis.any_instance.stub(:save).and_return(false)
        put :update, :id => diagnosis.id, :diagnosis => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested diagnosis" do
      diagnosis = Diagnosis.create! valid_attributes
      expect {
        delete :destroy, :id => diagnosis.id
      }.to change(Diagnosis, :count).by(-1)
    end

    it "redirects to the diagnoses list" do
      diagnosis = Diagnosis.create! valid_attributes
      delete :destroy, :id => diagnosis.id
      response.should redirect_to(diagnoses_url)
    end
  end

end
