import Fluent
import Vapor
import Leaf

struct Item: Codable {
    var title: String
    var description: String
}


func routes(_ app: Application) throws {
    
    app.get { req -> EventLoopFuture<View> in
        return req.view.render("index")
    }

    app.get("index") { (req) -> EventLoopFuture<View> in
        return req.view.render("index")
    }
    
    app.get("buttons") { (req) -> EventLoopFuture<View> in
        return req.view.render("buttons")
    }
    
    app.get("cards") { (req) -> EventLoopFuture<View> in
        return req.view.render("cards")
    }
    
    app.get("404") { (req) -> EventLoopFuture<View> in
        return req.view.render("404")
    }
}
