# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #remove confirmable

  validates :username, presence: true, uniqueness: {case_sensitive: false}

	has_friendship
  has_many :photos, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  # callbacks
  def on_friendship_created(friendship)
	  
	end

	def on_friendship_accepted(friendship)
	  
	end

	def on_friendship_blocked(friendship)
	  
	end

	def on_friendship_destroyed(friendship)
	  
	end
end
