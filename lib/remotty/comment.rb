module Remotty
  class Comment
    attr_accessor :token
    attr_accessor :id, :content, :all, :participation, :contributor

    def initialize(token, attributes = nil)
      self.token = token
      if attributes.present?
        attributes = attributes.stringify_keys
        self.id = attributes['id']
        self.content = attributes['content']
        self.all = attributes['all']
        self.participation = Remotty::Participation.new(token, attributes['participation'])
        self.contributor = Remotty::Participation.new(token, attributes['contributor'])
      end
    end

    def post
      Remotty.access_token(token).post("/api/v1/rooms/participations/#{self.participation.id}/comments.json", body: { comment: { content: self.content } })
    end
  end
end
