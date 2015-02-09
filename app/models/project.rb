class Project < ActiveRecord::Base
	has_many :discussions, dependent: :nullify
	has_many :tasks, dependent: :nullify
	has_many :categories, dependent: :nullify
	
	validates :title, presence: true, uniqueness: true


end
