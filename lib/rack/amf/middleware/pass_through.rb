require 'rack/amf/middleware'

module Rack::AMF::Middleware #:nodoc:
  # Middleware which simply passes AMF requests through. If the request is a
  # valid AMF request to be handled, sets <tt>env ['rack-amf.request']</tt> to
  # an initialized RocketAMF::Request object and <tt>env ['rack-amf.response']</tt>
  # to a RocketAMF::Response object. Simply modify the response as necessary
  # and it will be automatically serialized and sent.
  class PassThrough
    include Rack::AMF::Middleware

    def initialize app, options={}
      @app = app
      Rack::AMF::Environment.populate options
    end

    def handle
      @app.call env
    end
  end
end