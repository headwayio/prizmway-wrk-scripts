-- Get the current user

wrk.method = "POST"
wrk.body = '{"operationName":"currentUser","query":"query currentUser { currentUser { email } }"}'
wrk.headers["Authorization"] = string.format("Bearer %s", os.getenv("auth_token"))
wrk.headers["Content-Type"] = "application/json"

response = function(status, headers, body)
    io.write("Status: ".. status .."\n")
    io.write("Body:\n")
    io.write(body .. "\n\n")
  end

