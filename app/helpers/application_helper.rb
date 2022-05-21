module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email_adress = user.email.downcase
    hash = Digest::MD5::hexdigest(email_adress)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-thumbnail shadow mx-auto d-block", style: "height: #{size}px; width: #{size}px; background: #e1e1e1;")
  end
end
