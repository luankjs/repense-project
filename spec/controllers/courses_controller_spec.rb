require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:valid_attributes) {
    {name: "Course", description: "Course description", status: 1}
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all courses as @courses" do
      course = Course.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET #show" do
    it "assigns the requested course as @course" do
      course = Course.create! valid_attributes
      get :show, {:id => course.to_param}, valid_session
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "GET #new" do
    it "assigns a new course as @course" do
      get :new, {}, valid_session
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe "GET #edit" do
    it "assigns the requested course as @course" do
      course = Course.create! valid_attributes
      get :edit, {:id => course.to_param}, valid_session
      expect(assigns(:course)).to eq(course)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, {:course => valid_attributes}, valid_session
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, {:course => valid_attributes}, valid_session
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
      end

      it "redirects to the created course" do
        post :create, {:course => valid_attributes}, valid_session
        expect(response).to redirect_to(Course.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        post :create, {:course => invalid_attributes}, valid_session
        expect(assigns(:course)).to be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        post :create, {:course => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "New Name Course" }
      }

      it "updates the requested course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => new_attributes}, valid_session
        course.reload
        expect(course.name).to eq("New Name Course")
      end

      it "assigns the requested course as @course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => valid_attributes}, valid_session
        expect(assigns(:course)).to eq(course)
      end

      it "redirects to the course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => valid_attributes}, valid_session
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid params" do
      it "assigns the course as @course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => invalid_attributes}, valid_session
        expect(assigns(:course)).to eq(course)
      end

      it "re-renders the 'edit' template" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      course = Course.create! valid_attributes
      expect {
        delete :destroy, {:id => course.to_param}, valid_session
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = Course.create! valid_attributes
      delete :destroy, {:id => course.to_param}, valid_session
      expect(response).to redirect_to(courses_url)
    end
  end

end
