class Solution {
    static int count = 0;
    public int solution(int[] numbers, int target) {
        dfs(numbers[0], 1, numbers, target);
        dfs(-numbers[0], 1, numbers, target);

        return count;
    }

    public static void dfs(int sum, int idx, int[] numbers, int target) {
        if (idx == numbers.length) {
            if (sum == target) {
                count++;

                return;
            } else {
                return;
            }
        }

        dfs(sum + numbers[idx], idx + 1, numbers, target);
        dfs(sum - numbers[idx], idx + 1, numbers, target);
    }
}