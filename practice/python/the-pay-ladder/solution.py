import heapq

def top_n_salaries(employees: list[dict], n: int) -> list[int]:
    distinct = {e["salary"] for e in employees}   # dedupe: 90000 counted once

    h = []                                        # min-heap, max size n
    for s in distinct:
        heapq.heappush(h, s)
        if len(h) > n:
            heapq.heappop(h)                      # evict smallest; h keeps the top n

    result = []
    while h:
        result.append(heapq.heappop(h))           # comes out ascending
    return result[::-1]                           # flip to largest first
