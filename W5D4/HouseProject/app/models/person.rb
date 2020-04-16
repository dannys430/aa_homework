class Person < ApplicationRecord
    belongs_to(:house, {
        primary_key: :id,   # person's id
        foreign_key: :house_id,
        class_name: :House
    })
    
    # validates :name, presence: true
end