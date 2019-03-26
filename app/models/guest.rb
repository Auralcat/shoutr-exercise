# This is so email_or_username doesn't fail.
class Guest
  def email
    ""
  end

  def liked?(*args)
    false
  end
end
