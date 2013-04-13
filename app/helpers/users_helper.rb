module UsersHelper
  def gravatar_for(current_user, options = { size: 100 })
    gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, class: "gravatar")
  end
end