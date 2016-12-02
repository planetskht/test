SimpleRoles.configure do
  valid_roles :user, :admin, :editor
  strategy :many # Default is :one
end
