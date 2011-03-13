require 'paperclip_processors/watermark_p'
class Deal < ActiveRecord::Base

  has_attached_file :image, :processors => [:watermark],
    :styles => {  
      :original => {  
        :geometry => '440x280#',  
        :watermark_path => "#{Rails.root}/public/images/rails.png",
        :position => 'SouthEast'
      }
    },
    :url => "/uploads/:class/:attachment/:id_:style.jpg",
    :path => ":rails_root/public/uploads/:class/:attachment/:id_:style.jpg"
    
  STATE = {
    :begin => 0,
    :success => 1,
    # 屏蔽
    :ended => 2,
    :out => 3
  }

end
