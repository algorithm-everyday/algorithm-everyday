import java.util.Arrays;

// https://programmers.co.kr/learn/courses/30/lessons/42748
public class Solution {
    public int[] solution(int arr[], int commands[][]) {
        int[] answer = new int[commands.length];
        for (int i = 0; i < commands.length; i++) {
            int[] temp = Arrays.copyOfRange(arr, commands[i][0] - 1, commands[i][1]);
            Arrays.sort(temp);

            answer[i] = temp[commands[i][2] - 1];
        }

        return answer;
    }
}