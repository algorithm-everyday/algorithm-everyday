import java.util.Arrays;

class Solution {
    public int solution(int n, int s, int a, int b, int[][] fares) {
        int[][] map = new int[n + 1][n + 1];
        for (int i = 0; i <= n; i++) {
            Arrays.fill(map[i], 100_000_000);
            map[i][i] = 0;
        }
        for (int[] fare : fares)
            map[fare[0]][fare[1]] = map[fare[1]][fare[0]] = fare[2];

        for (int k = 1; k <= n; k++)
            for (int i = 1; i <= n; i++)
                for (int j = 1; j <= n; j++)
                    if (map[i][j] > map[i][k] + map[k][j])
                        map[i][j] = map[i][k] + map[k][j];

        int answer = map[s][a] + map[s][b];

        for (int i = 1; i <= n; i++)
            answer = Math.min(answer, map[s][i] + map[i][a] + map[i][b]);


        return answer;
    }
}