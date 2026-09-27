def flatten_the_nest(items: list):
    result = []
    for i in items:
        if isinstance(i, list):
            result.extend(flatten_the_nest(i))
        else:
            result.append(i)
            
            
            
    
    return result
