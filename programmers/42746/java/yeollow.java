import java.util.Arrays;

public class Solution {
    public String solution(int[] numbers) {
        String[] strings = new String[numbers.length];
        for (int i = 0; i < strings.length; i++) strings[i] = String.valueOf(numbers[i]);
        Arrays.sort(strings, (str2, str1) -> (str1 + str2).compareTo(str2 + str1));

        return strings[0].equals("0") ? "0" : String.join("", strings);
    }
}