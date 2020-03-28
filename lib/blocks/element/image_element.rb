# frozen_string_literal: true

module Slack
  module Messages
    module Blocks
      class Element
        class ImageElement < Element
          attr_accessor :image_url, :alt_text
          def to_h
            super.merge(
              image_url: image_url,
              alt_text: alt_text
            )
          end
        end
      end
    end
  end
end
