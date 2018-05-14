package br.com.grupo6;

import java.util.ArrayList;

/**
 *
 * @author PauloHGama
 */
public class Quiz {
    private static ArrayList<Question> test;
    public static ArrayList<Question> getTest()
    {
        if(test == null)
        {
            test = new ArrayList<>();
            test.add(new Question("1+2", "3", new String[]{"1","2","3"}));
            test.add(new Question("1+3", "4", new String[]{"1","2","4"}));
            test.add(new Question("1+4", "5", new String[]{"1","3","5"}));
            test.add(new Question("1+5", "6", new String[]{"2","4","6"}));
            test.add(new Question("1+6", "7", new String[]{"2","3","7"}));
        }
        
    return test;
    }
}
