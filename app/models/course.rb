class Course < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :status, presence: true
	validates_inclusion_of :status, :in => [0,1]

  COURSE_STATUSES = {
  	0 => :inactive,
    1 => :active
  }

  def status_str
    I18n.t(COURSE_STATUSES[self.status], scope: "course_statuses")
  end

  def self.statuses_collection
    statuses_collection = []

    COURSE_STATUSES.each_pair do |key, value|
        statuses_collection << [I18n.t(value, scope: "course_statuses"), key]
    end

    return statuses_collection
  end
end
