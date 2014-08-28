module Paperclip
  module Interpolations
    def img_type attachment, style_name
      attachment.instance.img_type
    end
  end
end
