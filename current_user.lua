-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header

wrk.method = "POST"
wrk.body = '{"operationName":"currentUser","query":"query currentUser { currentUser { email } }"}'
wrk.headers["Authorization"] = "Bearer SFMyNTY.g2gDYQNuBgA11kXWfgFiAAFRgA.qZIufRV2p3wjy5RrfUBME--VyOm64ur98k5BSeH1FR8"
wrk.headers["Content-Type"] = "application/json"
