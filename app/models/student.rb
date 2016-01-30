class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :courses, through: :classrooms

	validates :name, presence: true
	validates :register_number, presence: true, uniqueness: true
	validates :status, presence: true
	validates_inclusion_of :status, :in => [0,1]

  STUDENT_STATUSES = {
  	0 => :inactive,
    1 => :active
  }

  def status_str
    I18n.t(STUDENT_STATUSES[self.status], scope: "student_statuses")
  end

  def self.statuses_collection
    statuses_collection = []

    STUDENT_STATUSES.each_pair do |key, value|
        statuses_collection << [I18n.t(value, scope: "student_statuses"), key]
    end

    return statuses_collection
  end
end
