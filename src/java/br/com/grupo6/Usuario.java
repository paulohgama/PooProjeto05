package br.com.grupo6;
/* @author Bran */

/* Criação dos Get's e Set's essenciais da classe usuário */

public class Usuario {
    private String nome;
    private double resultadoTeste;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getResultadoTeste() {
        return resultadoTeste;
    }

    public void setResultadoTeste(double resultadoTeste) {
        this.resultadoTeste = resultadoTeste;
    }
       
}