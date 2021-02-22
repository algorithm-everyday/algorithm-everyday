#가장 큰 정사각형 찾기
#https://programmers.co.kr/learn/courses/30/lessons/12905
import numpy as np

def solution(board):
    #모두 0일경우 return 0
    if max(map(max,board))==0:
        return 0
    x,y=np.shape(board)
    for i in range(x-1):
        for j in range(y-1):
            if board[i+1][j+1] != 0:
                board[i+1][j+1]=min(board[i][j],board[i][j+1],board[i+1][j])+1
    return max(map(max,board))**2
