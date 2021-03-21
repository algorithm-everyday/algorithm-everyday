package programmers;

import java.util.*;

public class Solution {
    public int[] solution(String[] genres, int[] plays) {
        Map<String, Integer> hash = new HashMap<>();
        List<Integer> list = new ArrayList<>();

        for (int i = 0; i < plays.length; i++)
            hash.put(genres[i], hash.getOrDefault(genres[i], 0) + plays[i]);

        hash = sortedByValue(hash);
        for (String key : hash.keySet()) {
            PriorityQueue<Music> maxHeap = new PriorityQueue<>(Music::orderMusic);

            for (int i = 0; i < genres.length; i++)
                if (genres[i].equals(key)) maxHeap.offer(new Music(plays[i], i));

            int count = 0;
            while (!maxHeap.isEmpty()) {
                if (count++ >= 2) break;
                list.add(maxHeap.poll().getPk());
            }
        }

        int[] answer = new int[list.size()];
        for (int i = 0; i < list.size(); i++) answer[i] = list.get(i);

        return answer;
    }

    public static Map<String, Integer> sortedByValue(Map<String, Integer> hash) {
        List<Map.Entry<String, Integer>> entries = new LinkedList<>(hash.entrySet());
        Collections.sort(entries, (o1,o2)->o2.getValue().compareTo(o1.getValue()));

        LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> entry : entries) {
            result.put(entry.getKey(), entry.getValue());
        }

        return result;
    }
}

class Music {
    private int plays;
    private int pk;

    public Music(int plays, int pk) {
        this.plays = plays;
        this.pk = pk;
    }

    public int getPlays() {
        return plays;
    }

    public int getPk() {
        return pk;
    }

    public static int orderMusic(Music music1, Music music2) {
        if (music1.getPlays() == music2.getPlays()) {
            return music1.getPk() - music2.getPk();
        }

        return music2.getPlays() - music1.getPlays();
    }
}