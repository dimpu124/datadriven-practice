def run_length_encoding(s: str):
    if not s:
        return ""
    out = ''
    letter = s[0]
    cont = 1
    for i in range(1, len(s)):
        if letter == s[i]:
            cont += 1
        else:
            out += letter + str(cont)
            letter = s[i]
            cont = 1
    out += letter + str(cont)      # add the last group
    return out
