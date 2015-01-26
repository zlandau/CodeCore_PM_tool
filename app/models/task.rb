class Task < ActiveRecord::Base
	belongs_to :project
	validates :title, presence: true
	validates :body, presence: true
	
#	validates_uniqueness_of :title, scope: [:project_id]
end
