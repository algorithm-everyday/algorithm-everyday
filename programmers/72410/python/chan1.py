#일반적 풀이
def solution(new_id):
    answer = ''
    special = '~!@#$%^&*()=+[{]}:?,<>/'
    

    #step 1 : to lowercase
    new_id = new_id.lower()
    
    #step 2 : remove special character
    
    for i in special:
        if i in new_id:
            new_id = new_id.replace(i,'')
    if (len(new_id)==0):
        return 'aaa'
            
    
    #step 3 : ... -> .
    while(True):
        if '...' in new_id:
            new_id = new_id.replace('...','.')
        elif '..' in new_id:
            new_id = new_id.replace('..','.')
        else:
            break
    
            

    #step 4 : remove start/end '.'
    id_list = list(new_id)
    if (id_list[0]=='.'):
        del id_list[0]
    if (len(id_list)==0):
        return 'aaa'
    elif (id_list[-1]=='.'):
        del id_list[-1]

    #step 5 : empty check
    if (len(id_list)==0):
        return 'aaa'
    
    #step 6 : length check longer
    if (len(id_list)>15):
        id_list = id_list[:15]     
    if (id_list[-1]=='.'):
        del id_list[-1]
    
    #step 7 : lenght check shorter
    while(len(id_list)<3):
        id_list.append(id_list[-1])

   
    answer = ''.join(id_list)



    return answer

solution(".................")
