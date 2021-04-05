#디스크컨트롤러
#https://programmers.co.kr/learn/courses/30/lessons/42627

import heapq

def solution(jobs):
    h=[]
    sum_time = 0
    latestJob,now=-1,0
    complete_job_num=0
    job_num=len(jobs)

    while complete_job_num!=job_num:
        for start,burst in jobs:
            if latestJob<start<=now:
                heapq.heappush(h,[burst,start])
        if h!=[]:
            [burst,start]=heapq.heappop(h)
            latestJob=now
            now+=burst
            sum_time += now - start
            #print(now,sum)
            complete_job_num+=1
        else:
            now+=1
    return sum_time//job_num
