class User < ApplicationRecord
  has_paper_trail only: [:email]

  validates_presence_of :firstname
  validates_presence_of :last_name
  validates_uniqueness_of :email, case_sensitive: false
end
