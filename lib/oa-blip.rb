require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Blip < OAuth
      # Authenticate to blip.pl via OAuth.
      #
      # Usage:
      #
      #    use OmniAuth::Strategies::Blip, 'consumerkey', 'consumersecret'
      #
      def initialize(app, consumer_key, consumer_secret, options = {}, &block)
        options.merge!({:site => 'http://blip.pl'})
        super(app, :blip, consumer_key, consumer_secret, options)
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super, {
          'uid'       => user_hash['id'].to_s,
          'user_info' => user_info,
          'extra'     => {'user_hash' => user_hash}
        })
      end

      def user_info
        {
          'nickname'  => user_hash['login'],
          'location'  => user_hash['location'],
          'image'     => image_url
        }
      end

      def user_hash
        @user_hash ||= MultiJson.decode @access_token.get('/profile').body
      end

      def image_url
        @image_url ||= MultiJson.decode(@access_token.get(user_hash['avatar_path']).body)['url'] rescue nil
      end

    end
  end
end