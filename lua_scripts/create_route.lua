-- Creates a carrier route (as well as origin and destination locations).
-- The server will need to make two geocoding requests per shipper lane, which may take a small amount of time;
-- make sure to set a substantial duration when running this operation to make sure all geocoding requests can be satisfied.

trailer_type_uuid = string.format(os.getenv("trailer_type_uuid"))
carrier_uuid = string.format(os.getenv("carrier_uuid"))

query = [[
    mutation createRoutes($routes: [RouteInput]!) {
        createRoutes(routes: $routes) {
          ...route
        }
    }

    fragment route on Route {
        uuid
    }
]]

variables = [[
    "routes": [
        {
            "name":"Atlanta hub to Memphis hub",
            "originLocation": {
                "name":"Atlanta hub",
                "centerLngLat": [-84.47405, 33.844371]
            },
            "destinationLocation": {
                "name": "Memphis hub",
                "centerLngLat": [-89.847782, 35.050667]
            },
            "originProximity": 25,
            "destinationProximity": 25,
            "trailerTypeUuid": "]] .. trailer_type_uuid .. [[",
            "carrierUuid": "]] .. carrier_uuid .. [["
        }
    ]
]]

wrk.method = "POST"
wrk.body = '{"variables": {' .. string.gsub(variables, '\n', '') .. '}, "query": "' .. string.gsub(query, '\n', '') .. '"}'
wrk.headers["Authorization"] = string.format("Bearer %s", os.getenv("auth_token"))
wrk.headers["Content-Type"] = "application/json"

response = function(status, headers, body)
    io.write("Status: ".. status .."\n")
    io.write("Body:\n")
    io.write(body .. "\n\n")
  end
