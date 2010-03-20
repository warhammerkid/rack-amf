module Rack::AMF
  class Response < RocketAMF::Response #:nodoc:
    def initialize request
      @request = request
      super()
    end

    # Builds response, iterating over each method call and using the return value
    # as the method call's return value
    def each_method_call *args, &block
      if args.length == 0
        $stderr.puts("DEPRECATION WARNING: Use each_method_call request, &block instead of each_method_call &block")
        super(@request, &block)
      else
        super(*args, &block)
      end
    end
  end
end