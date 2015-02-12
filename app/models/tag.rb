class Tag < ActiveRecord::Base

  has_many :classifications, dependent: :destroy
  has_many :projects, through: :classfications


end
