require 'rails_helper'

RSpec.describe Classroom, type: :model do
  before(:each) do
  	@student = FactoryGirl.create(:student)
  	@course = FactoryGirl.create(:course)
  end

  context "Validates student" do
  	it "when nil" do
  		expect { FactoryGirl.create(:classroom, course: @course) }.to raise_error(ActiveRecord::RecordInvalid)
  	end
  end

  context "Validates course" do
  	it "when nil" do
  		expect { FactoryGirl.create(:classroom, student: @student) }.to raise_error(ActiveRecord::RecordInvalid)
  	end
  end

  context "Validates entry_at" do
  	it "when nil" do
  		expect { FactoryGirl.create(:classroom, student: @student, course: @course) }.to change{ Classroom.count }.by(1)
  	end
  end
end
