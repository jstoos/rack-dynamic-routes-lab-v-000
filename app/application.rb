class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      item = @@items.find {|i| i.name == item_title}
        if item.price?
          resp.write "The price of that item is #{item.price}"
          resp.status = 200
        else
          resp.write "Item not found"
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
