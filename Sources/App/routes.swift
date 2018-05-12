import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    // return a String
    router.get("name") { req in
        return "Ethan Hunt"
    }

    // return an Int
    router.get("age") { req in
        return 23
    }

    // return JSON
    router.get("json") { req in
        return Person(name: "Martin J. Lasek", age: 26)
    }

    // return a view using leaf
    router.get("view") { req -> Future<View> in
        return try req.view().render("welcome")
    }

    // return a view with data
    router.get("bonus") { req -> Future<View> in
        let developer = Person(name: "Martin", age: 26)
        return try req.view().render("whoami", developer)
    }
}

/// note: structs or classes
/// must conform to Content to be able to encode to JSON
struct Person: Content {
    var name: String
    var age: Int
}
