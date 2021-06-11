import java.util.*;

public class Solution {
    private static final int SRC = 0;
    private static final int DST = 1;

    private static ArrayList<String> answer = new ArrayList<>();
    private static String route = "";
    private static boolean[] visited;

    public static String[] solution(String[][] tickets) {
        for (int i = 0; i < tickets.length; i++) {
            visited = new boolean[tickets.length];
            String src = tickets[i][SRC];
            String dst = tickets[i][DST];

            if (src.equals("ICN")) {
                route = src + ",";
                visited[i] = true;
                dfs(tickets, dst, 1);
            }
        }
        Collections.sort(answer);
        return answer.get(0).split(",");
    }

    private static void dfs(String[][] tickets, String dst, int visitCount) {
        route += dst + ",";

        if (visitCount == tickets.length) {
            answer.add(route);
            return;
        }

        for (int i = 0; i < tickets.length; i++) {
            String nextSrc = tickets[i][SRC];
            String nextDst = tickets[i][DST];
            if (nextSrc.equals(dst) && !visited[i]) {
                visited[i] = true;
                dfs(tickets, nextDst, visitCount + 1);
                visited[i] = false;
                route = route.substring(0, route.length() - 4);
            }
        }
    }
}