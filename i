# Replace these with the actual values obtained from the previous response
studio_id = agent_details["job_info"]["studio_id"]
job_id = agent_details["job_info"]["job_id"]
region = "Region"
authorization_token = "Authorization token"
done = False
message = None

while True:
  # Define the URL with placeholders for studio_id and job_id
  url = f"https://api-{region}.stack.tryrelevance.com/latest/studios/{studio_id}/async_poll/{job_id}"

  # Define the authorization header
  headers = {
      "Authorization": authorization_token
  }

  # Send the POST request
  response = requests.get(url, headers=headers)

  message = response.json()

  for update in message['updates']:
    if update['type'] == "chain-success":
      done = True

  if done == True:
    break;

  time.sleep(1000)