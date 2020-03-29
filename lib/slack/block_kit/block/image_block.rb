# frozen_string_literal: true

module Slack
  module BlockKit
    class Block
      class ImageBlock < Block
        attr_accessor :image_url, :alt_text, :title

        def self.[](hash)
          new.tap do |object|
            object.image_url = hash[:image_url] if hash.key?(:image_url)
            object.alt_text = hash[:alt_text] if hash.key?(:alt_text)
            object.title = hash[:title] if hash.key?(:title)
            object.block_id = hash[:block_id] if hash.key?(:block_id)
          end
        end

        def title=(obj)
          raise TypeError, 'text must be a Text Object' unless obj.is_a?(CompositionObjects::Text)

          @title = obj
        end

        def to_h
          super.merge(
            image_url: image_url,
            alt_text: alt_text,
            title: title&.to_h
          ).reject { |_, v| v.nil? || v.empty? }
        end
      end
    end
  end
end
