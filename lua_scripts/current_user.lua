-- Get the current user

wrk.method = "POST"
wrk.body = '{"operationName":"currentUser","query":"query currentUser { currentUser { email } }"}'
wrk.headers["Authorization"] = string.format("Bearer %s", os.getenv("token"))
wrk.headers["Content-Type"] = "application/json"
