class Student < ActiveRecord::Base
	validates :name, presence: true
	validates :register_number, presence: true, uniqueness: true
	validates :status, presence: true
	validates_inclusion_of :status, :in => [0,1]

  STUDENT_STATUSES = {
  	0 => :inactive
    1 => :active
  }

  def status_str
    I18n.t(STUDENT_STATUSES[self.status], scope: "student_statuses")
  end
end
