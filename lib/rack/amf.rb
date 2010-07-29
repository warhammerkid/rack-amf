require 'rubygems'
require 'rack'
require 'rocketamf'

require 'rack/amf/environment'

module Rack #:nodoc:
end

# Simple rack middleware that processes amf requests as a standard AMF gateway.
# To use, simply run <tt>use Rack::AMF</tt> in your rackup script. rack-amf
# support two options: <tt>:url</tt> and <tt>:mode</tt>. Setting the url makes
# rack-amf only handle AMF requests that match the given url. The mode can
# either by <tt>:service_manager</tt> or <tt>:pass_through</tt>, defaulting to
# <tt>:service_manager</tt>.
#
# In pass-through mode, rack-amf will set <tt>env ["rack-amf.request"]</tt> and
# <tt>env ["rack-amf.response"]</tt>. See <tt>Rack::AMF::Middleware::PassThrough</tt>
# for more information.
#
# In service-manager mode, you can register a given object to handle all method
# calls for a given path. AMF calls to "TestService.sayHello" will call the
# object's <tt>sayHello</tt> method and return "Hello".
#
# Example:
#   use Rack::AMF :url => "/amf"
#   class TestService
#     def sayHello
#       'Hello'
#     end
#   end
#   Rack::AMF::Environment.register_service 'TestService', TestService.new
module Rack::AMF
  def self.new app, options={} #:nodoc:
    # Set default mode
    options[:mode] = :service_manager if !options[:mode]

    # Which version of the middleware?
    if options[:mode] == :pass_through
      require 'rack/amf/middleware/pass_through'
      Middleware::PassThrough.new(app, options)
    elsif options[:mode] == :service_manager
      require 'rack/amf/middleware/service_manager'
      Middleware::ServiceManager.new(app, options)
    else
      raise "Invalide mode: #{options[:mode]}"
    end
  end
end