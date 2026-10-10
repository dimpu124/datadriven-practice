def hourly_event_counts(logs: list[tuple[str, str]]) -> dict[str, dict[str, int]]:
    d = {}
    for i in logs:
        time = i[0][:13]
        event = i[1]
        if time not in d:
            d[time] = {event : 1}
        else:
            if event in d[time]:
                d[time][event]+=1
            else:
                d[time][event] = 1
    return d
            
    
