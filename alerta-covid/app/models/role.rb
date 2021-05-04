class Role < ApplicationRecord
    has_many :users
    has_and_belongs_to_many :permissions

    def set_permissions(permissions)
        permissions.each do |id|
            permission = Permission.find(id)
            self.permissions << permission
        end
    end
end
