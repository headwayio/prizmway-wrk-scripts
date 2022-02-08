-- Creates a shipper lane (as well as origin and destination locations).
-- The server will need to make two geocoding requests per shipper lane, which may take a small amount of time;
-- make sure to set a substantial duration when running this operation to make sure all geocoding requests can be satisfied.

wrk.method = "POST"
wrk.body = '{"operationName":"createShipperLane","variables":{"shipperLane":{"shipperUuid":"8352ac66-87d7-4b61-9d5e-91e4fc582bbf","trailerTypeUuid":"d69987bf-ff26-4ce1-8fae-6a24a86475a3","laneId":"","miles":200,"destinationLocationUuid":null,"destinationLocation":{"shipperLocationTypeUuid":"f2ae67f1-3579-4dd3-9196-2c07f0ff0596","name":"Charleston","address":"Charleston, SC 29401","accommodations":[],"loadingTypeUuid":"05447a1e-a72c-47e8-9027-a65bf8565b44","loadingBeginTime":null,"loadingEndTime":null},"originLocationUuid":null,"originLocation":{"shipperLocationTypeUuid":"cb477334-d086-4de2-94d5-6d1a6e492bd6","name":"Wilmington","address":"Wilmington, NC 28401","accommodations":[],"loadingTypeUuid":"05447a1e-a72c-47e8-9027-a65bf8565b44","loadingBeginTime":null,"loadingEndTime":null},"stops":[]}},"query":"mutation createShipperLane($shipperLane: ShipperLaneInput!) {createShipperLane(shipperLane: $shipperLane) { uuid }}"}'
wrk.headers["Authorization"] = "Bearer SFMyNTY.g2gDYQNuBgA11kXWfgFiAAFRgA.qZIufRV2p3wjy5RrfUBME--VyOm64ur98k5BSeH1FR8"
wrk.headers["Content-Type"] = "application/json"
