class Pet < ApplicationRecord
	mount_uploader :photo, PhotoUploader

	belongs_to :user

	validates :name, uniqueness: { scope: :user_id }
end
