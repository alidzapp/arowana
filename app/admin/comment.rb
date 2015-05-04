ActiveAdmin.register Comment do
  permit_params :user_id, :paste_id, :body

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}
      f.input :paste_id, as: :select, collection: Paste.all.map{|p| [p.name, p.id]}
      f.input :body
    end
    f.submit
  end
end
