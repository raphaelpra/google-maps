module Google
  module Maps
    # Defines constants and methods related to configuration
    module Configuration
      # An array of valid keys in the options hash when configuring an {Google::Maps::API}
      VALID_OPTIONS_KEYS = [:end_point, :api_key, :format, :directions_service, :places_service].freeze

      # By default, set "https://maps.googleapis.com/maps/api/" as the server
      DEFAULT_END_POINT = "https://maps.googleapis.com/maps/api/".freeze

      DEFAULT_DIRECTIONS_SERVICE = "directions".freeze
      DEFAULT_PLACES_SERVICE = "place/autocomplete".freeze
      
      DEFAULT_FORMAT = "json".freeze
      
      # API key to connect to Google
      DEFAULT_API_KEY = nil
      
      # @private
      attr_accessor *VALID_OPTIONS_KEYS

      # When this module is extended, set all configuration options to their default values
      def self.extended(base)
        base.reset
      end

      # Convenience method to allow configuration options to be set in a block
      def configure
        yield self
      end

      # Create a hash of options and their values
      def options
        VALID_OPTIONS_KEYS.inject({}) do |option, key|
          option.merge!(key => send(key))
        end
      end

      # Reset all configuration options to defaults
      def reset
        self.end_point = DEFAULT_END_POINT
        self.api_key = DEFAULT_API_KEY
        self.format = DEFAULT_FORMAT
        self.directions_service = DEFAULT_DIRECTIONS_SERVICE
        self.places_service = DEFAULT_PLACES_SERVICE
        self
      end
    end
  end
end
