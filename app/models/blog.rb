class Blog < ApplicationRecord
    belongs_to :users
    
    validates :title, :body, presence: true
    validates :body, length: { minimum: 10 }
end
