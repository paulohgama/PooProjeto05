package br.com.grupo6;
/* @author Bran */

/* Criação dos Get's e Set's essenciais da classe usuário */

public class Usuario {
    private String nome;
    private long dataTeste;
    private String[] resposta;
    private double resultadoTeste;

    public String[] getResposta() {
        return resposta;
    }

    public void setResposta(String[] resposta) {
        this.resposta = resposta;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public long getDataTeste() {
        return dataTeste;
    }

    public void setDataTeste(long dataTeste) {
        this.dataTeste = dataTeste;
    }

    public double getResultadoTeste() {
        return resultadoTeste;
    }

    public void setResultadoTeste(double resultadoTeste) {
        this.resultadoTeste = resultadoTeste;
    }
       
}