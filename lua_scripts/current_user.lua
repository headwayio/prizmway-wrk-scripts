-- Get the current user

query = [[
  query currentUser {
    currentUser {
      email
    }
  }
]]

wrk.method = "POST"
wrk.body = '{"query": "' .. string.gsub(query, '\n', '') .. '"}'
wrk.headers["Authorization"] = string.format("Bearer %s", os.getenv("auth_token"))
wrk.headers["Content-Type"] = "application/json"

response = function(status, headers, body)
    io.write("Status: ".. status .."\n")
    io.write("Body:\n")
    io.write(body .. "\n\n")
  end
