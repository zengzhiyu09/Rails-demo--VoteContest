class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 关联关系
  has_many :votes, dependent: :destroy
  has_many :voted_candidates, through: :votes, source: :candidate       
end
