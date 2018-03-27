import Vapor
import Leaf

public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    let myService = try EngineServerConfig.detect(from: &env, port: 8002)
    services.register(myService)

    try services.register(LeafProvider())
}
