import java.util.*;

class Solution {
    public int solution(String begin, String target, String[] words) {
        return bfs(begin, target, words);
    }

    static Map<String, Boolean> visit = new HashMap<>();

    private int bfs(String begin, String target, String[] words) {
        int answer = 0;
        Queue<Word> queue = new LinkedList<>();
        for (String word : words) {
            visit.put(word, false);
        }

        queue.offer(new Word(begin, answer));
        while (!queue.isEmpty()) {
            Word cur = queue.poll();
            answer = cur.getStage() + 1;
            for (String word : words) {
                if (isDiffOneChar(cur.getWord(), word) && !visit.get(word)) {
                    queue.offer(new Word(word, answer));
                    visit.put(word, true);
                }
            }

            if(queue.stream().anyMatch(word -> word.getWord().equals(target)))
                return queue.stream()
                    .filter(word -> word.getWord().equals(target))
                    .findAny()
                    .get()
                    .getStage();
        }

        return 0;
    }

    //    최대 O(10)
    private boolean isDiffOneChar(String cur, String word) {
        int count = 0;
        for (int i = 0; i < cur.length(); i++) {
            if (cur.charAt(i) != word.charAt(i)) {
                count++;
            }
        }

        return count == 1;
    }
}

class Word {

    private String word;
    private int stage;

    public Word(String word, int stage) {
        this.word = word;
        this.stage = stage;
    }

    public String getWord() {
        return word;
    }

    public int getStage() {
        return stage;
    }
}