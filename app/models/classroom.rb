class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, presence: true
  validates :course, presence: true

  before_create :set_entry_at

  def set_entry_at
  	self.entry_at = Time.zone.now  	
  end
end
