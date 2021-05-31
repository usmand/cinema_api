class MoviePolicy < ApplicationPolicy
  def update?
    @user.owner?
  end
end