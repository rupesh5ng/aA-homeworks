class Post < ApplicationRecord
    validates :title,:author_id, presence: true, uniqueness: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :Sub
    
end
