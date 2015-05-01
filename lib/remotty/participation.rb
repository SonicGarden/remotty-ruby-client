module Remotty
  class Participation
    attr_accessor :id, :name, :token

    def initialize(token, attributes = nil)
      self.token = token
      if attributes.present?
        self.id = attributes['id']
        self.name = attributes['name']
      end
    end

    def post_comment(content)
      response = Remotty.access_token(token).post("/api/v1/rooms/participations/#{self.id}/comments.json", body: { comment: { content: content } }).parsed
      Remotty::Comment.new(token, response)
    end
  end
end
