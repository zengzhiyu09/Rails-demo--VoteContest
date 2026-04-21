class VotesController < ApplicationController
  before_action :authenticate_user! # 确保只有登录用户才能投票

  def create
    # 1. 找到被投票的候选人
    @candidate = Candidate.find(params[:candidate_id])
    existing_vote = Vote.find_by(user: current_user, candidate: @candidate)

    if existing_vote
      # 如果投过了，显示警告并返回首页
      redirect_to root_path, alert: "你已经投给 #{@candidate.name} 了，不能重复投票！"
    else
      # 2. 如果没投过，创建投票记录
      # 使用 transaction 确保数据一致性：既创建记录，又增加计数
      Vote.transaction do
        Vote.create!(user: current_user, candidate: @candidate)
        @candidate.increment!(:votes_count)
      end
    
    # 3. 投票成功后，跳回首页并显示提示
    redirect_to root_path, notice: "成功投给 #{@candidate.name}！"
    end
  end
end