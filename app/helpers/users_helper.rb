module UsersHelper
  def all_users
    User.all
  end

  def histroy?
    user.versions.presence && !user_versions.empty?
  end

  def user_versions
    user.versions.map(&:object).compact.map(&:with_indifferent_access)
  end
end
