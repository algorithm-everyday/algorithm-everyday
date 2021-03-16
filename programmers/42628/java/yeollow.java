import java.util.Collections;
import java.util.PriorityQueue;

class Solution {
    public int[] solution(String[] operations) {
        int[] answer = new int[2];
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        PriorityQueue<Integer> minHeap = new PriorityQueue<>();

        for (String operation : operations) {
            String[] splitOperation = operation.split(" ");
            switch (splitOperation[0]) {
                case "I":
                    maxHeap.offer(Integer.valueOf(splitOperation[1]));
                    minHeap.offer(Integer.valueOf(splitOperation[1]));

                    break;

                case "D":
                    if (splitOperation[1].contains("-")) {
                        if (!minHeap.isEmpty()) {
                            int min = minHeap.peek();

                            minHeap.remove(min);
                            maxHeap.remove(min);
                        }
                    } else {
                        if (!maxHeap.isEmpty()) {
                            int max = maxHeap.peek();

                            maxHeap.remove(max);
                            minHeap.remove(max);
                        }
                    }

                    break;
            }
        }

        answer[0] = maxHeap.isEmpty() ? 0 : maxHeap.peek();
        answer[1] = minHeap.isEmpty() ? 0 : minHeap.peek();

        return answer;
    }
}