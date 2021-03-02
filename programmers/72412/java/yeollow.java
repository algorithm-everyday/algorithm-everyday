import java.util.*;

public class Solution {
    public int[] solution(String[] info, String[] query) {
        Map<String, List<Integer>> infos = new HashMap<>();
        for (String in : info) {
            String[] split = in.split(" ");
            int score = Integer.parseInt(split[4]);

            for (int i = 0; i < (1 << 4); i++) {
                StringBuilder key = new StringBuilder();

                for (int j = 0; j < 4; j++) {
                    if ((i & (1 << j)) > 0) key.append(split[j]);
                }
                infos.computeIfAbsent(key.toString(), s -> new ArrayList<>()).add(score);
            }
        }

        for (Map.Entry<String, List<Integer>> entry : infos.entrySet())
            entry.getValue().sort(null);

        int[] answer = new int[query.length];
        List<Integer> empty = new ArrayList<>();
        for (int i = 0; i < query.length; i++) {
            String[] split = query[i].replaceAll("-", "").split(" and | ");
            String key = String.join("", split[0], split[1], split[2], split[3]);
            int score = Integer.parseInt(split[4]);

            List<Integer> list = infos.getOrDefault(key, empty);

            int left = 0, right = list.size();

            while (left < right) {
                int mid = (left + right) / 2;

                if (list.get(mid) < score) left = mid + 1;
                else right = mid;
            }

            answer[i] = list.size() - left;
        }

        return answer;
    }
}