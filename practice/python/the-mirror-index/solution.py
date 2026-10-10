def invert_dict(d: dict) -> dict:
    result = {}

    for doc_id, term in d.items():
        key = str(term)

        if key not in result:
            result[key] = []

        result[key].append(doc_id)

    for docs in result.values():
        docs.sort()

    return result
        
