import Fluent

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            .id()
            .field("first_name", .string, .required)
            .field("last_name", .string, .required)
            .field("email_address", .string, .required)
            .field("password", .string, .required)
            .unique(on: "email_address")
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
}


