class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :guesser, :class_name => 'User', optional: true
  belongs_to :code
end
