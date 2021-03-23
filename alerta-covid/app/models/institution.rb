class Institution < ApplicationRecord
    validates :name, presence: true
end
