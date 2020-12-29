class Movie < ActiveRecord::Base
  def image
    if title == 'The Black Panther'
      'black_panther.jpg'
    elsif title == 'Kindergarten Teacher'
      'The_Kindergarten_Teacher.jpg'
    end
  end
end
