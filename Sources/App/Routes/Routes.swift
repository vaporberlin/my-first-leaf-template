import Vapor

extension Droplet {
  func setupRoutes() throws {
  
    get("name") { req in
      return "Ethan Hunt"
    }
    
    get("age") { req in
      return "\(23)"
    }
    
    get("json") { req in
      return try JSON(node: ["name": "Martin J. Lasek", "age": 26])
    }
    
    get("view") { req in
      return try self.view.make("myview")
    }
    
    get("bonus") { req in
      return try self.view.make("mydataview", ["name": "Taichi"])
    }
  }
}
