class Task < ActiveRecord::Base
	validates :title, presence: true
#	validates_uniqueness_of :title, scope: [:project_id]
end
