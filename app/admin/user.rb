ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
    :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
    :current_sign_in_at_ip, :last_sign_in_at_ip

  index do
    id_column
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    actions
  end
end
