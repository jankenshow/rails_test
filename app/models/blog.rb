class Blog < ApplicationRecord
    belongs_to :users, optional: true
    
    validates :title, :body, presence: true
    validates :body, length: { minimum: 5 }
end
