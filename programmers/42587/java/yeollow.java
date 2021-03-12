import java.util.Collections;
import java.util.PriorityQueue;


class Solution {
    public int solution(int[] priorities, int location) {
        PriorityQueue<Integer> queue = new PriorityQueue<>(Collections.reverseOrder());
        int answer = 0;

        for (int priority : priorities)
            queue.offer(priority);

        while (!(queue.isEmpty())) {
            for (int i = 0; i < priorities.length; i++) {
                if (queue.peek() == priorities[i]) {
                    queue.poll();
                    answer++;

                    if (location == i) {
                        queue.clear();

                        break;
                    }
                }
            }
        }


        return answer;
    }
}