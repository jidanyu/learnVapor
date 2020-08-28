import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "first_name")
    var firstName: String
    
    @Field(key: "last_name")
    var lastName: String
    
    @Field(key: "email_address")
    var emailAddress: String
    
    @Field(key: "password")
    var password: String

    init() { }

    init(id: UUID? = nil, firstName: String, lastName: String, email_address: String, password: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = email_address
        self.password = password
    }
}
