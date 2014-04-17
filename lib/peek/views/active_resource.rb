class ActiveResource::Connection
  class << self
    attr_accessor :request_time, :request_count
  end
  self.request_time = Atomic.new(0)
  self.request_count = Atomic.new(0)

  def request_with_timing(method, path, *arguments)
    start = Time.now
    request_without_timing(method, path, *arguments)
  ensure
    duration = (Time.now - start)
    ActiveResource::Connection.request_time.update { |value| value + duration }
    ActiveResource::Connection.request_count.update { |value| value + 1 }
  end
  alias_method_chain :request, :timing
  
end

module Peek
  module Views
    class ActiveResource < View
      def duration
        ::ActiveResource::Connection.request_time.value
      end

      def formatted_duration
        ms = duration * 1000
        if ms >= 1000
          "%.2fms" % ms
        else
          "%.0fms" % ms
        end
      end

      def calls
        ::ActiveResource::Connection.request_count.value
      end

      def results
        { :duration => formatted_duration, :calls => calls }
      end

      private

      def setup_subscribers
        # Reset each counter when a new request starts
        before_request do
          ::ActiveResource::Connection.request_time.value = 0
          ::ActiveResource::Connection.request_count.value = 0
        end
      end
    end
  end
end
