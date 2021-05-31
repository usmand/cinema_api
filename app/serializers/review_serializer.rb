class ReviewSerializer < ApplicationSerializer
  fields :score, :feedback

  association :user, blueprint: UserSerializer
end
