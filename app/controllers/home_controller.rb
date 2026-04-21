class HomeController < ApplicationController
  def index
    # 按 ID 倒序排列，并分页，每页 20 个
    @candidates = Candidate.order(id: :desc).page(params[:page]).per(20)
  end
end
