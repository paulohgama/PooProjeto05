package br.com.grupo6;

import java.util.ArrayList;

/**
 *
 * @author joaop
 */
public class Quiz {
    private static ArrayList<Question> test;
    public static ArrayList<Question> getTest()
    {
        if(test == null)
        {
            test = new ArrayList<>();
            test.add(new Question("1 - Qual o nome do primeiro presidente do Brasil", "Deodoro da Fonseca", new String[]{"Dedoro da Fonseca","Martin Afonso","Tiago Thomaz"}));
            test.add(new Question("2 - Em qual ano Cristo nasceu?", "Ano 0", new String[]{" Ano 32","Ano 0","Ano 1998"}));
            test.add(new Question("3 - Qual a fronteira mais antiga da Europa?", "A portuguesa", new String[]{"A irlandesa","A italiana","A portuguesa"}));
            test.add(new Question("4 - Qual a primeira vila do Brasil?", "São Vicente", new String[]{"São Vicente","Praia Grande","Cubatão"}));
            test.add(new Question("5 - Complete: O sapo sabia...", "...assobiar", new String[]{"...assobiar","...gritar",".. sair pulando"}));
            test.add(new Question("6 -Complete: O rato roeu a roupa do rei... ", "de Roma!", new String[]{"do Lesoto","de Roma!","de Wakanda"}));
            test.add(new Question("7 - Quais as letras do alfabeto sem as consoantes?", "A-E-I-O-U", new String[]{"AAaaaaaaaaaaaaaaaaaa","123","A-E-I-O-U"}));
            test.add(new Question("8 - Qual o oceano entre a América e a África", "Atlântico", new String[]{"Atlântico","Índico","Pacífico"}));
            test.add(new Question("9 - Qual a cidade símbolo da qualidade de vida?", "São Vicente", new String[]{"São Vicente","Zurich","Oslo"}));
            test.add(new Question("10- Qual país tem os melhores maratonistas?", "Quênia", new String[]{"Trinnidad e Tobago","Ilhas Jersey","Quênia"}));
        }
        
    return test;
    }
}
