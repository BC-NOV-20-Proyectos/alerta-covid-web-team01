class Role < ApplicationRecord
    has_many :users
    has_and_belongs_to_many :permissions

    def set_permissions(permissions)
        permissions.each do |id|
            permission = Permission.find(id)
            self.permissions << permission
            case permission.subject_class
            when 'Part'
                case permission.action
                when 'create'
                    self.permissions << Permission.where(subject_class: 'Drawing', action: 'create')
                when 'update'
                    self.permissions << Permission.where(subject_class: 'Drawing', action: ['update', 'destroy'])
                end
            end
        end
    end
end
