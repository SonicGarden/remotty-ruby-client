module Remotty
  class Group
    attr_accessor :token
    attr_accessor :id, :name

    def initialize(token, attributes = nil)
      self.token = token
      if attributes.present?
        attributes = attributes.stringify_keys
        self.id = attributes['id']
        self.name = attributes['name']
      end
    end

    def post_entry(content)
      Remotty.access_token(token).post("/api/v1/groups/#{self.id}/entries.json", body: {entry: {content: content}})
    end

    def self.list(token)
      response = Remotty.access_token(token).get('/api/v1/groups.json').parsed
      Array(response).map { |attr| Remotty::Group.new(token, attr) }
    end
  end
end
