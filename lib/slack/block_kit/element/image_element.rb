# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ImageElement < Element
        using Refinements::HashCompact
        attr_accessor :image_url, :alt_text

        def self.populate(hash, object)
          object.image_url = hash.fetch(:image_url)
          object.alt_text = hash.fetch(:alt_text)

          super(hash, object)
        end

        def to_h
          super.merge(
            image_url: image_url,
            alt_text: alt_text
          ).compact
        end
      end
    end
  end
end
