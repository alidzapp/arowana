ActiveAdmin.register Paste do
  permit_params :language, :expires_at, :name, :user_id, :body

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}
      f.input :language, as: :select, collection: Paste.languages.keys.to_a
      f.input :name
      f.input :expires_at
      f.input :body
    end
  end
end
