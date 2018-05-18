package br.com.grupo6;

/**
 *
 * @author PauloHGama
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
 
public class ManipulandoArquivos {
 
    public int cont;
    public String[] leitor(String path) throws IOException {
        BufferedReader buffRead;
        String[] vetor;
        String linha;
        buffRead = new BufferedReader(new FileReader(path));
        while (true) {
            linha = buffRead.readLine();
            if (linha != null) {
                cont++;
            } else
                break;
        }
        buffRead.close();
        vetor = new String[cont];
        buffRead = new BufferedReader(new FileReader(path));
        for(int i = 0; i < vetor.length; i++)
        {
            vetor[i] = buffRead.readLine();
        }
        return vetor;
    }
 
    public static void escritor(String path, String[] vetor) throws IOException {
        BufferedWriter buffWrite = new BufferedWriter(new FileWriter(path));
        String linha = "";
        for(int i = 0; i < vetor.length; i++)
        {
            linha+=vetor[i];
        }
        buffWrite.write(linha);
        buffWrite.close();
    }    
}
