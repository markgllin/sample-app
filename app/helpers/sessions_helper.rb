module SessionsHelper
  # logs in the given user
  def log_in(user)
    session[:user_id] = user.id     # this 'sessions' hash is separate/different and distinct from the Sessions controller. This 'sessions' method is defined by Rails. See 8.2.1.
  end

  # returns the current logged-in user (if any)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?    # this points to the method `current_user`, not the instance variable `@current_user`
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
