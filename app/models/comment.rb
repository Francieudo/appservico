class Comment < ActiveRecord::Base
	validates :id_photo, :name, :title, :body, :presence =>true
end
