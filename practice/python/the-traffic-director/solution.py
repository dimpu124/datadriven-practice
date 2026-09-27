def load_balancer_round_robin(servers: list, requests: list) -> dict:
  left = 0
  result ={}
  for right in range(len(requests)):
    if left > len(servers)-1:
      left=0
      result[requests[right]] = servers[left]
    else:
      result[requests[right]] = servers[left]
      left+=1
    

  return result
