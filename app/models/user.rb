class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :nullify
  has_many :discussions, dependent: :nullify
  
  has_many :members, dependent: :destroy
  has_many :projectwm, through: :members, source: :project
 
  def full_name
       if first_name || last_name
       #{first_name} #{last_name}”.squeeze(" ").strip
       else
            email
       end
  end  

end
