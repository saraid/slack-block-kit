# frozen_string_literal: true

module Slack
  module BlockKit
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
