def max_avg_subarray(nums, k):
    if len(nums) < k:
        return None
    stage = nums[:k]
    max_avg = sum(stage)/k
    for right in range(k,len(nums)):
        stage.pop(0)
        stage.append(nums[right])
        av = sum(stage)/k
        max_avg = max(max_avg,av)
    return max_avg
        
        
    
