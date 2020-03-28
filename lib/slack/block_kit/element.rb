# frozen_string_literal: true

module Slack
  module BlockKit
    class Element
      def to_h
        @type ||= self.class.name.split('::').last.chomp('Element').downcase
        { type: @type }
      end
    end
  end
end

require_relative 'element/image_element'
