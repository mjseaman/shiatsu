helpers do
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.clear
  end

  def patient?
    return false unless current_user
    current_user.type == "Patient" 
  end

  def therapist?
    return false unless current_user
    current_user.type == "Therapist" 
  end
  
end
