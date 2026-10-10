def run_length_encoding(s: str):
    if not s:                          # handle empty string
        return ""
    out = []
    cont = 1
    for i in range(len(s) - 1):
        if s[i] == s[i + 1]:
            cont += 1
        else:
            out.append(s[i] + str(cont))
            cont = 1
    out.append(s[-1] + str(cont))      # the LAST letter, always
    return "".join(out)
            
                   
        
        
      
