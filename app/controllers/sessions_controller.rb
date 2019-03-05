class SessionsController < Clearance::SessionsController
  private

  # We don't care about the args here because this is a wrapper for
  # Clearance's SessionsController#authenticate method.
  # Instead of using the default params, we'll pass our own.
  def authenticate(_)
    super(session_params)
  end

  def session_params
    { session: session_params_with_email }
  end

  def session_params_with_email
    params
      .require(:session)
      .permit(:password)
      .merge(email: user.email)
  end

  def user
    User
      .where(email: email_or_username)
      .or(User.where(username: email_or_username)).first || Guest.new
  end

  def email_or_username
    params[:session][:email_or_username]
  end
end
