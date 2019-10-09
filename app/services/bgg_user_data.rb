require "rexml/document"

class BGGUser
  attr_accessor :user_name, :collection, :total_games

  def initialize(user_name)
    @user_name = user_name

    # BGG API collection response for the user_name
    response = HTTParty.get('http://www.boardgamegeek.com/xmlapi2/collection?username=DrBarnaby&own=1')
    # Parse the body of the XML into a REXML document
    collection_doc = REXML::Document.new response.body

    # Put all games from the collection into a hash, BGG Object ID => "Name"
    @collection = Hash.new
    collection_doc.elements.each("items/item") do |game|
      @collection[game.attributes["objectid"]] = game[1].text
    end

    # Number of games owned
    @total_games = collection_doc.elements[1].attributes["totalitems"]
  end
end