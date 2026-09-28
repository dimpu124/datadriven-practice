def clock_angle(hour: int, minute: int) -> float:
    if not (1 <= hour <= 12 and 0 <= minute <= 59):
        raise ValueError("hour must be 1-12, minute 0-59")
    minute_deg = 6 * minute
    hour_deg = 30 * (hour % 12) + 0.5 * minute   # % 12 turns 12 into 0
    diff = abs(hour_deg - minute_deg)
    return min(diff, 360 - diff)
    
