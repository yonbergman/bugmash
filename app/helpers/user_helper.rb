module UserHelper

  def avatar(user)
    image_tag(user.image, class: 'avatar', title: user.nickname, alt: user.name, data: {toggle: 'tooltip'})
  end

end