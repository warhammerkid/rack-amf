module Rack::AMF
  # Manages services if using the ServiceManager middleware, as well as the url
  # to restrict AMF requests to, and the mode. The URL and mode are automatically
  # set when you call <code>use Rack::AMF, options</code> in your rack
  # application.
  module Environment
    class << self
      attr_accessor :url, :mode, :services

      # Used to register a service for use with the ServiceManager middleware.
      # To register a service, simply pass in the root path for the service and
      # an object that can receive service calls.
      #
      # Example:
      #
      #   Rack::AMF::Environment.register_service 'SpecialService', SpecialService.new
      #   Rack::AMF::Environment.register_service 'org.rack-amf.AMFService', AMFService.new
      def register_service path, service
        @services ||= {}
        @services[path] = service
      end

      # Populates the environment from the given options hash, which was passed
      # in through rack
      def populate options={} #:nodoc:
        url = options[:url] if options.key?(:url)
        mode = options[:mode] if options.key?(:mode)
      end
    end
  end
end