# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class ImageBlock < Block
        using Refinements::HashCompact
        attr_accessor :image_url, :alt_text, :title

        def self.populate(hash, object)
          object.image_url = hash.fetch(:image_url)
          object.alt_text = hash.fetch(:alt_text)
          object.title = hash[:title] if hash.key?(:title)
        end

        def title=(obj)
          raise TypeError, 'title must be a Text Object' unless obj.is_a?(CompositionObjects::Text)

          @title = obj
        end

        def image_url=(url)
          raise RangeError, 'image_url is max 3000 characters' unless url.size <= 3000

          @image_url = url
        end

        def alt_text=(text)
          raise RangeError, 'alt_text is max 2000 characters' unless text.size <= 2000

          @alt_text = text
        end

        def to_h
          super.merge(
            image_url: image_url,
            alt_text: alt_text,
            title: title&.to_h
          ).compact
        end
      end
    end
  end
end
