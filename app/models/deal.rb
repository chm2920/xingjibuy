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
  
  has_many :cart_items
  has_many :order_items
  
  before_destroy :ensure_not_referenced_by_any_item
  
  def ensure_note_referenced_by_any_item
    if cart_items.count.zero?
      return true
    else
      error[:base] << "Cart Items Present"
      return false
    end
  end

end
