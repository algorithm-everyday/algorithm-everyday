import java.util.Arrays;

class Solution {
    public static int[] solution(int[] progresses, int[] speeds) {
        int[] answer = new int[100];
        int days = 0;
        for (int i = 0; i < progresses.length; i++) {
            while (progresses[i] + (days * speeds[i]) < 100)  days++;
            answer[days]++;
        }

        return Arrays.stream(answer).filter(idx -> idx != 0).toArray();
    }
}