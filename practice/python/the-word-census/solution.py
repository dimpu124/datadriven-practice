from collections import Counter
def build_frequency_tree(text: str) -> dict:
    if not text:
        return {}
    text_list = text.lower().split()
    count = Counter(text_list)






    return dict(sorted(count.items(),key=lambda x: x[1]))
