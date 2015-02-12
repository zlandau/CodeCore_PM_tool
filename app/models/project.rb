class Project < ActiveRecord::Base
  belongs_to :user
	has_many :discussions, dependent: :nullify
	has_many :tasks, dependent: :nullify

  has_many :members, dependent: :destroy
  has_many :project_users, through: :members, source: :user
  
	has_many :classifications, dependent: :destroy
	has_many :tags, through: :classifications
  
	validates :title, presence: true, uniqueness: true

  def done_tasks
    self.tasks.where('status = true')
  end
  def not_done_tasks
    self.tasks.where('status = false')
  end
end
