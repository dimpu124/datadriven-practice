def forward_fill(values: list) -> list:
    if values:
        first = values[0]
        for i in range(1,len(values)):
            if values[i] is None:
                values[i] = first
            else:
                first = values[i]
                
        return values
    else:
        return []
        
