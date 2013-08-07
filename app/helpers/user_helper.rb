module UserHelper

  def avatar(user)
    image_tag(user.image, :class => 'avatar')
  end

end