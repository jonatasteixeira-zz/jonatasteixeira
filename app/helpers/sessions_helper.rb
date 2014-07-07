module SessionsHelper

  def sign_in(user)
    logger.info "logged in"
    session[:current_user_id] = user.id
    self.current_user = user
  end

  def signed_in?
    !self.current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if session[:current_user_id]
      return @current_user = User.find(session[:current_user_id])
    else
      return nil
    end   
  end

  def sign_out
    logger.info "logged out"
    session[:current_user_id] = self.current_user = nil
  end

end
