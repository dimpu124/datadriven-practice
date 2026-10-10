from collections import Counter
def distribute(values: list[int], containers: list[str]) -> list[dict]:
    counts = Counter(values)
    result = []
    for k, v in enumerate(sorted(counts)):        # distinct values, in order
        container = containers[k % len(containers)]   # wrap around
        if container == "set":
            group = [v]                           # unique only
        else:
            group = [v] * counts[v]               # every copy
        result.append({"values": group, "container": container})
    return result
        

    
    
