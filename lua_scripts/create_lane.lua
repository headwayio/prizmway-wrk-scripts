-- Creates a shipper lane (as well as origin and destination locations).
-- The server will need to make two geocoding requests per shipper lane, which may take a small amount of time;
-- make sure to set a substantial duration when running this operation to make sure all geocoding requests can be satisfied.

shipper_uuid = string.format(os.getenv("shipper_uuid"))
trailer_type_uuid = string.format(os.getenv("trailer_type_uuid"))
shipper_location_type_uuid = string.format(os.getenv("shipper_location_type_uuid"))
loading_type_uuid = string.format(os.getenv("loading_type_uuid"))

wrk.method = "POST"
wrk.body = '{"operationName":"createShipperLane","variables":{"shipperLane":{"shipperUuid":"' .. shipper_uuid .. '","trailerTypeUuid":"' .. trailer_type_uuid .. '","laneId":"","miles":200,"destinationLocationUuid":null,"destinationLocation":{"shipperLocationTypeUuid":"' .. shipper_location_type_uuid .. '","name":"Portland","address":"Portland, OR 97213","accommodations":[],"loadingTypeUuid":"' .. loading_type_uuid .. '","loadingBeginTime":null,"loadingEndTime":null},"originLocationUuid":null,"originLocation":{"shipperLocationTypeUuid":"' .. shipper_location_type_uuid .. '","name":"Tuxedo","address":"Tuxedo, NY 10987","accommodations":[],"loadingTypeUuid":"' .. loading_type_uuid .. '","loadingBeginTime":null,"loadingEndTime":null},"stops":[]}},"query":"mutation createShipperLane($shipperLane: ShipperLaneInput!) {createShipperLane(shipperLane: $shipperLane) { uuid }}"}'
wrk.headers["Authorization"] = string.format("Bearer %s", os.getenv("auth_token"))
wrk.headers["Content-Type"] = "application/json"

response = function(status, headers, body)
    io.write("Status: ".. status .."\n")
    io.write("Body:\n")
    io.write(body .. "\n\n")
  end
