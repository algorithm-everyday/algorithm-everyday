// https://programmers.co.kr/learn/courses/30/lessons/42842
public class Solution{
    public int[] solution(int brown, int yellow) {
        int[] answer = {};
        int sum = brown + yellow;
        for (int i = 3; i <= sum; i++) {
            if (sum % i == 0) {
                int col = sum / i;
                int row = sum / col;

                int x = col - 2;
                int y = row - 2;
                if (x * y == yellow && x >= y)
                    answer = new int[]{col, row};
            }
        }

        return answer;
    }
}
