class CandidatesController < ApplicationController
  # 只有登录用户才能投票
  before_action :authenticate_user!
  
  #   def index
  #   # 1. 获取所有候选人并按 ID 排序
  #   all_candidates = Candidate.order(:id)

  #   # 2. 计算总页数
  #   @per_page = 20
  #   # 计算总页数：3条数据 / 20 = 0.15 -> 向上取整为 1 页
  #   @total_pages = (all_candidates.count.to_f / @per_page).ceil
    
  #   # 【强制修正】确保总页数至少为 1（防止数据库为空时出错）
  #   @total_pages = 1 if @total_pages == 0

  #   # 3. 处理当前页码参数 (核心修复部分)
  #   # 先尝试获取参数，如果没有则为 1
  #   page_param = params[:page].to_i
  #   page_param = 1 if page_param < 1
    
  #   # 如果请求的页码超过总页数，强制设为总页数
  #   @current_page = page_param > @total_pages ? @total_pages : page_param

  #   # 4. 查询当前页的数据
  #   # 使用 offset 和 limit 进行分页
  #   @candidates = all_candidates.offset((@current_page - 1) * @per_page).limit(@per_page)

  #   Rails.logger.info "DEBUG: Current Page is #{@current_page.inspect}"
  # end


  def vote
    # 1. 找到被点击的那个候选人
    @candidate = Candidate.find(params[:id])
    
    # 2. 给票数加 1
    @candidate.increment!(:votes_count)
    
    # 3. 投票成功后，弹个提示，然后跳回首页
    redirect_to root_path, notice: "成功投给 #{@candidate.name}！"
  end
end