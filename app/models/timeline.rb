class Timeline
  def initialize(users, scope = Shout)
    @users = users
    @scope = scope
  end

  def shouts
     scope
       .where(user_id: users)
       .order(created_at: :desc)
  end

  # You can implement this by including ActiveModel::Conversion
  def to_partial_path
    'timelines/timeline'
  end

  private

  attr_reader :users, :scope
end
