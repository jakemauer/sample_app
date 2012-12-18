module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user

    ### Alternative method: 
    # cookies[:remember_token] = { value: user.remember_token, 
    #                              expire: 20.years.from_now }  
    ###
  end

  def signed_in?
    !current_user.nil?    
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= cookies[:remember_token] && User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)    
  end

end
