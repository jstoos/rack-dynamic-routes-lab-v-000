class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/items/"
      item_title = req.path.split("/items/").last
      item = @@items.find {|i| i.name == item_title
      resp.write item.name

      if items.all.include?(env)
        resp.write "The price of that item is #{}"
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
