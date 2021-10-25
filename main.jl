using HTTP
using JSON3

# Login function
function tryLogin(req::HTTP.Request)
    body = JSON3.read(IOBuffer(HTTP.payload(req)))

    println("---[LOGIN ATTEMPT]--\nUsername: " * body.username * "\nPassword: " * body.password)

    # Some account validation checks here.

    return HTTP.Response(200, "{\"success\":true}")
end

# Routing
const ROUTER = HTTP.Router()
HTTP.@register(ROUTER, "POST", "/login", tryLogin)

HTTP.serve(ROUTER, "127.0.0.1", 8080)