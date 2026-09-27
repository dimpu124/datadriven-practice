def longest_unique_substr(s):
  left = 0
  result = 0
  seen = set()
  for right in range(len(s)):
    ma = 0
    while s[right] in seen:
      seen.remove(s[left])
      left+=1
    seen.add(s[right])
    result = max(result, right - left + 1)






  return result
