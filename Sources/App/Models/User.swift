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
    
    @Field(key: "email_addresss")
    var emailAddresss: String
    
    @Field(key: "password")
    var password: String

    init() { }

    init(id: UUID? = nil, firstName: String, lastName: String, email_addresss: String, password: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddresss = email_addresss
        self.password = password
    }
}
