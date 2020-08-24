import Fluent
import Vapor

struct SBAdminController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: index)
        routes.get("index", use: index)
        routes.get("buttons", use: buttons)
    }

    func index(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("index")
    }
    
    // MARK: Sidebar
    func buttons(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("buttons")
    }
    
    func cards(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("cards")
    }
    
    func utilitiesColor(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("utilities-color")
    }
    
    func utilitiesBorder(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("utilities-border")
    }
    
    func utilitiesAnimation(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("utilities-animation")
    }
    
    func utilitiesOther(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("utilities-other")
    }
    
    // MARK: Error
    func error404(req: Request) throws -> EventLoopFuture<View> {
        return req.view.render("404")
    }

}
