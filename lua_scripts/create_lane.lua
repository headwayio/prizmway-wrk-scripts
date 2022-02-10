-- Creates a shipper lane (as well as origin and destination locations).
-- The server will need to make two geocoding requests per shipper lane, which may take a small amount of time;
-- make sure to set a substantial duration when running this operation to make sure all geocoding requests can be satisfied.

wrk.method = "POST"
wrk.body = '{"operationName":"createShipperLane","variables":{"shipperLane":{"shipperUuid":"8352ac66-87d7-4b61-9d5e-91e4fc582bbf","trailerTypeUuid":"d69987bf-ff26-4ce1-8fae-6a24a86475a3","laneId":"","miles":200,"destinationLocationUuid":null,"destinationLocation":{"shipperLocationTypeUuid":"f2ae67f1-3579-4dd3-9196-2c07f0ff0596","name":"Portland","address":"Portland, OR 97213","accommodations":[],"loadingTypeUuid":"05447a1e-a72c-47e8-9027-a65bf8565b44","loadingBeginTime":null,"loadingEndTime":null},"originLocationUuid":null,"originLocation":{"shipperLocationTypeUuid":"cb477334-d086-4de2-94d5-6d1a6e492bd6","name":"Tuxedo","address":"Tuxedo, NY 10987","accommodations":[],"loadingTypeUuid":"05447a1e-a72c-47e8-9027-a65bf8565b44","loadingBeginTime":null,"loadingEndTime":null},"stops":[]}},"query":"mutation createShipperLane($shipperLane: ShipperLaneInput!) {createShipperLane(shipperLane: $shipperLane) { uuid }}"}'
wrk.headers["Authorization"] = string.format("Bearer %s", os.getenv("token"))
wrk.headers["Content-Type"] = "application/json"

response = function(status, headers, body)
    io.write("Status: ".. status .."\n")
    io.write("Body:\n")
    io.write(body .. "\n\n")
  end

-- TODO - when running this, some requests succeed while others fail with the error
-- errors: [
--     location_id: {"has already been taken",
--      [constraint: :unique, constraint_name: "location_id_shipper_id_index"]}
--   ],
