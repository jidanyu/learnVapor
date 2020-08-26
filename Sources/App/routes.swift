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
    
    app.post("register") { req -> EventLoopFuture<View> in
        //TODO: 新建一个用户,成功进入后台,失败提示
        return req.view.render("")
    }
    
}


struct EndPoint: Codable {
   let path: String
   let name: String
   
}
