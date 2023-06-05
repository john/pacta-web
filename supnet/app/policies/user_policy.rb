class UserPolicy < ApplicationPolicy
  # # Here we are overriding :update? inherited from ApplicationPolicy
  # def update?
  #   user.admin? or not record.published?
  # end
end