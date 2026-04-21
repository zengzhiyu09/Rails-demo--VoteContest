class Candidate < ApplicationRecord
     # 关联关系
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user
end
