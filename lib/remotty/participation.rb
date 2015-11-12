module Remotty
  class Participation
    attr_accessor :id, :name, :icon_url, :token, :email, :user_id

    def initialize(token, attributes = nil)
      self.token = token
      if attributes.present?
        self.id = attributes['id']
        self.name = attributes['name']
        self.icon_url = attributes['icon_url']
        self.email = attributes['email']
        self.user_id = attributes['user_id']
      end
    end

    def post_comment(content, show_log = false)
      response = Remotty.access_token(token).post("/api/v1/rooms/participations/#{self.id}/comments.json", body: { comment: { content: content, show_log: show_log } }).parsed
      Remotty::Comment.new(token, response)
    end

    def self.list(token)
      response = Remotty.access_token(token).get('/api/v1/rooms.json').parsed
      Array(response['participations']).map { |attr| Remotty::Participation.new(token, attr) }
    end
  end
end
