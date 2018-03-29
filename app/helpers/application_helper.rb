module ApplicationHelper

def gravatorMarc_for(user)
  gravator_anid= Digest::MD5::hexdigest(user.email.downcase)
  gravator_url= "https://secure.gravatar.com/avatar/#{gravator_anid}"
  image_tag(gravator_url, class:"img-circle")
end

end
