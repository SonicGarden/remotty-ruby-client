module Remotty
  class User
    attr_accessor :id, :name, :participation, :token

    def initialize(token, attributes = nil)
      self.token = token
      if attributes.present?
        self.id = attributes['id']
        self.name = attributes['name']
        self.participation = Remotty::Participation.new(token, attributes['participation'])
      end
    end

    def self.me(token)
      response = Remotty.access_token(token).get('/api/v1/me.json').parsed
      Remotty::User.new(token, response)
    end

  end
end
