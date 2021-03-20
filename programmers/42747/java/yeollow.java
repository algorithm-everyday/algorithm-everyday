import java.util.Arrays;

// https://programmers.co.kr/learn/courses/30/lessons/42747
public class Solution {
    public int solution(int[] citations) {
        Arrays.sort(citations);
        int answer = 0;
        for (int i = 0; i < citations.length; i++) {
            int h = citations.length - i;
            if (citations[i] >= h) {
                answer = h;

                break;
            }
        }

        return answer;
    }
}