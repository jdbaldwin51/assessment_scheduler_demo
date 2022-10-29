class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  enum role: [:normal, :admin]

  def set_advisor(user)
    advisor = Advisor.where('email = ?', user.email) 
    current_user = advisor
  end
end
