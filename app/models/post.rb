class Post < ApplicationRecord
    has_many :comments, depenndent :destroy
end
