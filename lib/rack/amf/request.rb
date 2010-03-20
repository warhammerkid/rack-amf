module Rack::AMF
  class Request < RocketAMF::Request #:nodoc:
    def version
      $stderr.puts("DEPRECATION WARNING: use amf_version instead of version")
      amf_version
    end
  end
end