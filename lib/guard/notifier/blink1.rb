
module Guard
  module Notifier
    class Blink1 < Base
      require "colorable"

      DEFAULT_METHOD = :blink
      DEFAULT_COLORS = {
        success: "#00ff00",
        pending: "#ffff00",
        failed:  "#ff0000",
        notify:  "#0000ff",
      }.freeze
      DEFAULT_COUNT = 3

      def self.available?(opts = {})
        super && command?("blink1-tool")
      end

      def notify(message, opts = {})
        super

        type = opts[:type]
        method = opts[:method] || DEFAULT_METHOD
        colors = opts[:colors] || {}
        color = colors[type] || DEFAULT_COLORS[type]
        color = color.to_color.rgb.join(",")
        count = opts[:count] || DEFAULT_COUNT

        execute method, color, count
      end

      private
      def execute(method, color, count)
        __send__ method, color, count
      rescue
        ::Guard::UI.error 'unrecognized method is set to :method option.'
      end

      def emission(color, count)
        system "blink1-tool", "--rgb=#{color}"
      end

      def blink(color, count)
        system "blink1-tool", "--rgb=#{color}", "--blink=#{count}"
      end

      def glimmer(color, count)
        system "blink1-tool", "--rgb=#{color}", "--glimmer=#{count}"
      end

      def self.command?(name)
        system "type #{name} > /dev/null 2>&1"
      end
    end

    NOTIFIERS << {blink1: Blink1}
  end
end

