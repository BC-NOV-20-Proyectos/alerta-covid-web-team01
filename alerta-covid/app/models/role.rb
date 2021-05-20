class Role < ApplicationRecord
    validates :name, presence: true
    has_many :users
    has_and_belongs_to_many :permissions
    after_destroy :delete_permissions_role

    def set_permissions(permissions)
        permissions.each do |id|
            permission = Permission.find(id)
            self.permissions << permission
        end
    end

    def delete_permissions_role
      ActiveRecord::Base.connection.execute("DELETE FROM permissions_roles WHERE role_id = #{self.id.to_s}")
    end
end
