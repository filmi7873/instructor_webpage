class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.admin
      instructors_dashboard_path
    else
      students_dashboard_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to students_dashboard_path, alert: "You can’t evaluate your own presentation." # error just in case 
  end
end
