# frozen_string_literal: true

module Slack
  module Messages
    module Blocks
      class Block
        attr_reader :block_id

        def block_id=(obj)
          # raise TypeError unless obj.kind_of?(Block::Id)
          raise TypeError, 'block_id must be a string' unless block_id.respond_to?(:to_str)

          @block_id = obj.to_str
        end

        def to_h
          @type ||= self.class.name.split('::').last.chomp('Block').downcase
          { type: @type,
            block_id: @block_id }
        end

        # TODO: because i am lazy
        class FileBlock < Block; end
        class ImageBlock < Block; end
        class InputBlock < Block; end
      end
    end
  end
end

require_relative 'block/action_block'
require_relative 'block/context_block'
require_relative 'block/divider_block'
require_relative 'block/section_block'
