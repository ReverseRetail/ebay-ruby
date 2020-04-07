# frozen_string_literal: true

require 'helper'
require 'ebay_bs/oauth/client_credentials_grant'

module EbayBs
  module Oauth
    class TestClientCredentialsGrant < Minitest::Test
      def setup
        VCR.insert_cassette('client_credentials_grant')
        @grant = ClientCredentialsGrant.new.sandbox
      end

      def teardown
        VCR.eject_cassette
      end

      def test_request
        response = @grant.request
        assert response.status.ok?
      end

      def test_mint_access_token
        assert @grant.mint_access_token
      end
    end
  end
end
