class DashboardPresenter
  attr_reader :user

  def initialize(current)
    if current == nil
      redirect_to root_path
    else
      @user = current
    end
  end

end
