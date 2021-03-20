package programmers;

import java.util.Comparator;
import java.util.LinkedList;
import java.util.PriorityQueue;

public class Solution {
    public static void main(String[] args) {
        Solution solution = new Solution();
        System.out.println(solution.solution(new int[][]{{0, 3}, {1, 9}, {2, 6}}));
    }


    public int solution(int[][] jobs) {
        LinkedList<Job> waitQueue = new LinkedList<>();
        for (int[] job : jobs) waitQueue.offer(new Job(job[0], job[1]));
        waitQueue.sort(Comparator.comparingInt(Job::getRequestTime));

        PriorityQueue<Job> jobQueue = new PriorityQueue<>(Comparator.comparingInt(Job::getWorkingTime));
        int time = waitQueue.peek().getRequestTime();
        int answer = 0;
        int count = 0;

        while(count<jobs.length){
            while (!waitQueue.isEmpty() && waitQueue.peek().getRequestTime() <= time)
                jobQueue.offer(waitQueue.pollFirst());

            if (!jobQueue.isEmpty()) {
                Job job = jobQueue.poll();

                time += job.getWorkingTime();
                answer += time - job.getRequestTime();
                count++;
            } else {
                time++;
            }
        }

        return answer / count;
    }
}

class Job {
    private int requestTime;
    private int workingTime;

    public Job(int requestTime, int workingTime) {
        this.requestTime = requestTime;
        this.workingTime = workingTime;
    }

    public int getRequestTime() {
        return requestTime;
    }

    public int getWorkingTime() {
        return workingTime;
    }
}