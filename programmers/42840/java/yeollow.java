import java.util.ArrayList;
import java.util.List;

// https://programmers.co.kr/learn/courses/30/lessons/42840
public class Solution {
    public int[] solution(int[] answers) {
        List<Integer> answerList = new ArrayList<>();

        int[] way1 = new int[]{1, 2, 3, 4, 5};
        int[] way2 = new int[]{2, 1, 2, 3, 2, 4, 2, 5};
        int[] way3 = new int[]{3, 3, 1, 1, 2, 2, 4, 4, 5, 5};

        int way1Count = 0;
        int way2Count = 0;
        int way3Count = 0;
        for (int i = 0; i < answers.length; i++) {
            if(way1[i%way1.length] == answers[i]) way1Count++;
            if(way2[i%way2.length] == answers[i]) way2Count++;
            if(way3[i%way3.length] == answers[i]) way3Count++;
        }

        int max = Math.max(way1Count, Math.max(way2Count, way3Count));
        if(max == way1Count) answerList.add(1);
        if(max == way2Count) answerList.add(2);
        if(max == way3Count) answerList.add(3);

        int[] answer = new int[answerList.size()];
        for (int i = 0; i < answer.length; i++) {
            answer[i] = answerList.get(i);
        }

        return answer;
    }


}
