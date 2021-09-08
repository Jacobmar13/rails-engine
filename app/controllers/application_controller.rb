class ApplicationController < ActionController::API

  def page_redirect
    params[:page] = 1 if params[:page] && params[:page] <= '0'
  end

end
