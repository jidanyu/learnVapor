import Fluent
import FluentSQLiteDriver
import Vapor
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    //serve files from /Public folder
     app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // Configure Leaf
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease
//    app.leaf.configuration.rootDirectory = "../Resources/Views"

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateTodo())
    app.migrations.add(CreateUser())

    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
