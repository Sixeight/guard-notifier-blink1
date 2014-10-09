
module Guard
  module Notifier
    class Blink1 < Base
      require "colorable"

      DEFAULT_METHODS = {
        success: "blink",
        pending: "blink",
        failed:  "blink",
        notify:  "blink",
      }

      DEFAULT_COLORS = {
        success: "#00ff00",
        pending: "#ffff00",
        failed:  "#ff0000",
        notify:  "#0000ff",
      }.freeze
      
      DEFAULT_COUNTS = {
        success: 3,
        pending: 3,
        failed:  3,
        notify:  3,
      }.freeze

      def self.available?(opts = {})
        super && command?("blink1-tool")
      end

      def notify(message, opts = {})
        super

        method = fetch_config :method, opts, DEFAULT_METHODS
        color  = fetch_config :color,  opts, DEFAULT_COLORS
        count  = fetch_config :count,  opts, DEFAULT_COUNTS

        execute method, color, count
      end

      private
      def execute(method, color, count)
        rbg_color = color.to_color.rgb.join(", ")
        __send__ method, rbg_color, count
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

      def off
        system "blink1-tool", "--off"
      end

      def fetch_config(name, opts, defaults)
        type = opts[:type]
        config  = opts[name]
        config ||= (opts[:"#{name}s"] || {})[type]
        config ||= defaults[type]
        config
      end

      def self.command?(name)
        system "type #{name} > /dev/null 2>&1"
      end
    end

    NOTIFIERS << {blink1: Blink1}
  end
end

