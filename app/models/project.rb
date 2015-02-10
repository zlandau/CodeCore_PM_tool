class Project < ActiveRecord::Base
  belongs_to :user
	has_many :discussions, dependent: :nullify
	has_many :tasks, dependent: :nullify
	has_many :categories, dependent: :nullify
	
	validates :title, presence: true, uniqueness: true

  def done_tasks
    self.tasks.where('status = true')
  end
  def not_done_tasks
    self.tasks.where('status = false')
  end
end
