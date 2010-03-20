require 'rack/amf/middleware'
require 'logger'

module Rack::AMF::Middleware #:nodoc:
  # Internal AMF handler, it uses the ServiceManager to handle request service
  # mapping.
  class ServiceManager
    include Rack::AMF::Middleware

    def initialize app, options={}
      @app = app
      Rack::AMF::Environment.populate options
    end

    def handle env
      req = env['rack-amf.request']
      res = env['rack-amf.response']

      logger = ::Logger.new(env['rack.errors'])
      res.each_method_call req do |method, args|
        handle_method method, args, logger
      end
    end

    private
    def handle_method method, args, logger = nil
      path = method.split('.')
      method_name = path.pop
      path = path.join('.')

      s = Rack::AMF::Environment.services
      if s[path]
        if s[path].respond_to?(method_name)
          logger.info("Handling call to #{path}##{method_name}") if logger
          s[path].send(method_name, *args)
        else
          logger.error("Service #{path} does not respond to #{method_name}") if logger
          raise "Service #{path} does not respond to #{method_name}"
        end
      else
        logger.error("Service #{path} does not respond to #{method_name}") if logger
        raise "Service #{path} does not exist"
      end
    end
  end
end