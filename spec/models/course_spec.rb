require 'rails_helper'

RSpec.describe Course, type: :model do
  context "Validates name" do
  	it "when nil" do
  		expect { FactoryGirl.create(:course, name: "") }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when different of nil" do
  		expect{ FactoryGirl.create(:course) }.to change { Course.count }.by(1)
  	end
  end

  context "Validates description" do
  	it "when nil" do
  		expect { FactoryGirl.create(:course, description: "") }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when diff of nil" do
  		expect { FactoryGirl.create(:course) }.to change { Course.count }.by(1)
  	end
  end

  context "Validates status" do
  	it "when nil" do
  		expect { FactoryGirl.create(:course, status: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when isn't in [0,1]" do
  		expect { FactoryGirl.create(:course, status: 2) }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when is diff of nil and is in [0,1]" do
  		expect { FactoryGirl.create(:course) }.to change { Course.count }.by(1)
  	end
  end

  context "Validates status if returns correctly str values" do
  	it "when 1" do
  		course = FactoryGirl.create(:course)

  		expect(course.status_str).to eql("Ativo")
  	end

  	it "when 0" do
  		course = FactoryGirl.create(:course, status: 0)

  		expect(course.status_str).to eql("Inativo")
  	end

  	it "when call statuses_collection" do
  		expect(Course.statuses_collection).to include(["Ativo", 1])
  		expect(Course.statuses_collection).to include(["Inativo", 0])
  	end
  end
end
