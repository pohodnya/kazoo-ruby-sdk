module KazooRubySdk
  class Base
    def initialize
      @auth_token = KazooRubySdk::Session.auth_token
      @api_url = KazooRubySdk::Session.api_url
      @realm = KazooRubySdk::Session.realm
      @account_id = KazooRubySdk::Session.account_id
      @owner_id = KazooRubySdk::Session.owner_id
      @pipe = KazooRubySdk::Session.api_url
    end
  end
end