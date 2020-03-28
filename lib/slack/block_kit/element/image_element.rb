# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      class ImageElement < Element
        attr_accessor :image_url, :alt_text

        def self.[](hash)
          new.tap do |object|
            object.image_url = hash.fetch(:image_url)
            object.alt_text = hash.fetch(:alt_text)
          end
        end

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
