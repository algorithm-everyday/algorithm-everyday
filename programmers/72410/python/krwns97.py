def stage_1(new_id):
    new_id = new_id.lower()
    return new_id

def stage_2(new_id):
    temp_id=''
    for ch in new_id:
        if ch.isalpha() or ch.isdigit():
            temp_id+=ch
        elif ch=='-' or ch=='_' or ch =='.':
            temp_id+=ch
    return temp_id

def stage_3(new_id):
    while '..' in new_id:
        new_id=new_id.replace('..','.')
    return new_id

def stage_4(new_id):
    if new_id[0]=='.':
        if len(new_id)==1:
            return ''
        new_id=new_id[1:]

    if new_id[-1]=='.':
        if len(new_id)==1:
            return ''
        new_id=new_id[:-1]
    return new_id

def stage_5(new_id):
    if new_id=='':
        return 'a'
    return new_id

def stage_6(new_id):
    if len(new_id)>15:
        new_id=new_id[:15]
        return stage_4(new_id)
    return new_id

def stage_7(new_id):
    while len(new_id)<3:
        new_id=new_id+new_id[-1]
    return new_id

def solution(new_id):
    new_id = stage_1(new_id)
    new_id = stage_2(new_id)
    new_id = stage_3(new_id)
    new_id = stage_4(new_id)
    new_id = stage_5(new_id)
    new_id = stage_6(new_id)
    new_id = stage_7(new_id)
    return new_id
