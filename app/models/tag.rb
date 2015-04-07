class Tag < ActiveRecord::Base
  belongs_to :tagging
  has_many :taggings
  has_many :terms, dependent: :destroy, through: :taggings
end
