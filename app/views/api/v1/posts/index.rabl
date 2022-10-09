collection @posts
attributes :id, :title, :text, :user_id
child(:comments) { attributes :text, :user_id, :post_id }