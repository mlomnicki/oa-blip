require 'omniauth/oauth'

module OmniAuth
  module Strategies
    class Blip < OAuth
      # Authenticate to blip.pl via OAuth.
      #
      # Usage:
      #
      #    use OmniAuth::Strategies::Blip, 'consumerkey', 'consumersecret'
      #
      def initialize(app, consumer_key, consumer_secret)
        super(app, :blip, consumer_key, consumer_secret, :site => 'http://blip.pl')
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super, 'uid' => @access_token.params[:user_id])
      end

    end
  end
end
