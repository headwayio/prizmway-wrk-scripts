-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header

wrk.method = "POST"
wrk.body = "operationName=currentUser&query=query currentUser { currentUser { email } }"
wrk.headers["Authorization"] = "Bearer SFMyNTY.g2gDYQNuBgC7tzLGfgFiAAFRgA.TLEZl73fVKbAeNw8um5tN1tWBY3JSEjuXaxfYgE7X7c"
