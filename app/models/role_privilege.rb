class RolePrivilege < ApplicationRecord
  belongs_to :role_id
  belongs_to :privilege_id
end
