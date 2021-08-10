-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header

wrk.method = "POST"
wrk.body = "operationName=currentUser&query=query currentUser { currentUser { email } }"
wrk.headers["Authorization"] = "Bearer SFMyNTY.g2gDYSduBgCzBJQwewFiAAFRgA.Wg3LLVeEw2EedleJFFj-i4mhJ6--BtfHwzWLEkydIv0"
