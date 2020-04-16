class House < ApplicationRecord
    has_many(:person, {
        primary_key: :id,   # house's id
        foreign_key: :house_id,
        class_name: :Person
    })
    
end