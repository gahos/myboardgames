module UsersHelper
  def RatingStar(rating_value)
    if rating_value==0 then
      return "-"
    else
      stars = ""
      rating_value.times do
        stars += "☆"
      end
      return stars
    end
  end
end
