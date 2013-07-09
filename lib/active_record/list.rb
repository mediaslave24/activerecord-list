module ActiveRecord
  module List
    extend ActiveSupport::Concern

    def move_higher
      return unless higher_item

      self.class.transaction do
        higher_item.increment_position
        decrement_position
      end
    end

    def move_lower
      return unless lower_item

      self.class.transaction do
        lower_item.decrement_position
        increment_position
      end
    end

    def lower_item
      return unless in_list?
      self.class.find :first,
        conditions: "#{position_column} > #{position}",
        order: "#{position_column} DESC"

    end

    def higher_item
      return unless in_list?
      self.class.find :first,
        conditions: "#{position_column} < #{position}",
        order: "#{position_column} DESC"
    end

    def increment_position
      return unless in_list?
      increment! position_column
    end

    def decrement_position
      return unless in_list?
      decrement! position_column
    end

    def in_list?
      !position.nil?
    end

    def position
      self.send(position_column).to_i
    end

    def position_column
      self.class.position_column
    end

    private

    def add_to_bottom

    end

    def add_to_top

    end

    included do
      before_create
    end

    module ClassMethods
      def position_column
        :pos
      end

      def init_position
        0
      end

      def add_new_at
        :bottom
      end
    end
  end
end
