class Code < ApplicationRecord
  has_many :code_users
  has_many :users, through: :code_users

  def self.find_by_code(code)
    where(gamecodes: code).first
  end

end
