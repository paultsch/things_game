class CodeUser < ApplicationRecord
  belongs_to :code
  belongs_to :user
end
