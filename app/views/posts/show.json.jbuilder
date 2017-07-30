json.partial! "posts/post", post: @post
json.extract! @post, :id, :title, :image, :created_at, :updated_at
