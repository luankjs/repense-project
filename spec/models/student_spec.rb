require 'rails_helper'

RSpec.describe Student, type: :model do
  context "Validates name" do
  	it "when nil" do
  		expect { FactoryGirl.create(:student, name: "") }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when different of nil" do
  		student = FactoryGirl.create(:student, register_number: "1122334455")

  		expect(student.name).to eq("MyString")
  	end
  end

  context "Validates register_number" do
  	it "when nil" do
  		expect { FactoryGirl.create(:student, register_number: "") }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when not unique" do
  		student = FactoryGirl.create(:student, register_number: "112233")

  		expect { FactoryGirl.create(:student, register_number: "112233") }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when diff of nil and unique" do
  		expect { FactoryGirl.create(:student, register_number: "445566") }.to change { Student.count }.by(1)
  	end
  end

  context "Validates status" do
  	it "when nil" do
  		expect { FactoryGirl.create(:student, status: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when isn't in [0,1]" do
  		expect { FactoryGirl.create(:student, status: 2) }.to raise_error(ActiveRecord::RecordInvalid)
  	end

  	it "when is diff of nil and is in [0,1]" do
  		expect { FactoryGirl.create(:student, register_number: "778899") }.to change { Student.count }.by(1)
  	end
  end

  context "Validates status if returns correctly str values" do
  	it "when 1" do
  		student = FactoryGirl.create(:student, register_number: "123")

  		expect(student.status_str).to eql("Ativo")
  	end

  	it "when 0" do
  		student = FactoryGirl.create(:student, register_number: "123", status: 0)

  		expect(student.status_str).to eql("Inativo")
  	end

  	it "when call statuses_collection" do
  		expect(Student.statuses_collection).to include(["Ativo", 1])
  		expect(Student.statuses_collection).to include(["Inativo", 0])
  	end
  end
end
