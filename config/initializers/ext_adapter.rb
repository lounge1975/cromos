require "dm-do-adapter/adapter"
module DataMapper
  module Adapters

    # DataObjectsAdapter is the base class for all adapers for relational
    # databases. If you want to add support for a new RDBMS, it makes
    # sense to make your adapter class inherit from this class.
    #
    # By inheriting from DataObjectsAdapter, you get a copy of all the
    # standard sub-modules (Quoting, Coersion and Queries) in your own Adapter.
    # You can extend and overwrite these copies without affecting the originals.
    class DataObjectsAdapter < AbstractAdapter
      protected

      # @api private
      def normalized_uri
        @normalized_uri ||=
          begin
            keys = [
              :adapter, :user, :password, :host, :port, :path, :fragment,
              :scheme, :query, :username, :database ]
            query = DataMapper::Ext::Hash.except(@options, keys)
            query = nil if query.empty?

            # Better error message in case port is no Numeric value
            port = @options[:port].nil? ? nil : @options[:port].to_int
            DataObjects::URI.new(
              :scheme => @options[:adapter],
              :user => @options[:user] || @options[:username],
              :password => @options[:password],
              :host => @options[:host],
              :port => port,
              :path => @options[:path] || @options[:database],
              :query => query,
              :fragment => @options[:fragment]
            ).freeze
          end
      end
    end
  end
end
