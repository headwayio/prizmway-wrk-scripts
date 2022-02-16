-- Creates a carrier route (as well as origin and destination locations).
-- The server will need to make two geocoding requests per shipper lane, which may take a small amount of time;
-- make sure to set a substantial duration when running this operation to make sure all geocoding requests can be satisfied.

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
            "trailerTypeUuid": "d69987bf-ff26-4ce1-8fae-6a24a86475a3",
            "carrierUuid": "4686e555-8ac2-4014-acc1-7ff0a2d2689d"
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
