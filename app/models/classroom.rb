class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, presence: true
  validates :course, presence: true

  validate :student_already_registered

  before_create :set_entry_at

  def set_entry_at
  	self.entry_at = Time.zone.now  	
  end

  def student_already_registered
  	if Classroom.find_by(student: self.student, course: self.course)
  		errors.add(:course_id, I18n.t(:already_registered, scope: "activerecord.errors.models.classroom.attributes.course"))
  	end
  end
end
