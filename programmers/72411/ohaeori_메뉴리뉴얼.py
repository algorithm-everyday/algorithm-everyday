from itertools import combinations
from collections import Counter


def solution(orders, course):
    answer = []
    for num in course:
        temp = []
        for menu in orders:
            temp += combinations(sorted(menu), num)
        counter = Counter(temp)
        if len(counter) != 0 and max(counter.values()) != 1:
            for f in counter:
                if counter[f] == max(counter.values()):
                    answer += [''.join(f)]

    return sorted(answer)