import Fluent
import Vapor
import Leaf

func routes(_ app: Application) throws {
    
    let directory = app.directory.workingDirectory

    let data = try Data(contentsOf: URL(fileURLWithPath: directory).appendingPathComponent("routes.json", isDirectory: false))
    
    let decoder = JSONDecoder()
    let json = try decoder.decode([EndPoint].self, from: data)
    
    for endPoint in json {
        let path = PathComponent(stringLiteral: endPoint.path)
        
        app.get([path]) { req -> EventLoopFuture<View> in
            return req.view.render(endPoint.name)
        }
    }
    
//    app.post("register") { req -> EventLoopFuture<HTTPStatus> in
//
//        let user = try req.content.decode(User.self)
//
//        let userDidCreate = user.create(on: app.db)
//
//        userDidCreate.whenComplete { result in
//            switch result {
//            case .success(let user)
//                return
//            }
//        }
//    }
    
    
    try app.register(collection: UserController())
    
}

struct InfoResponse: Content {
  let request: User
}

struct EndPoint: Codable {
   let path: String
   let name: String
   
}
