package br.com.grupo6;


/**
 *
 * @author PauloHGama
 */
public class Ordenando {
    public void Quick(int inicio, int fim)
    {
        int i, j, meio;
        double pivo, aux;
        String nome;
        long data;
        
        i = inicio;
        j = fim;
   
        meio = (int) ((i + j) / 2);
        pivo = Rankings.getMelhores().get(meio).getResultadoTeste();
   
        do
        {
            while (Rankings.getMelhores().get(i).getResultadoTeste() < pivo) i = i + 1;
            while (Rankings.getMelhores().get(j).getResultadoTeste() > pivo) j = j - 1;
      
            if(i <= j)
            {
                Usuario u = Rankings.getMelhores().get(i);
                aux = u.getResultadoTeste();
                nome = u.getNome();
                data = u.getDataTeste();
                u.setDataTeste(Rankings.getMelhores().get(j).getDataTeste());
                u.setNome(Rankings.getMelhores().get(j).getNome());
                u.setResultadoTeste(Rankings.getMelhores().get(j).getResultadoTeste());
                Rankings.getMelhores().set(i, u);
                u = Rankings.getMelhores().get(j);
                u.setResultadoTeste(aux);
                u.setDataTeste(data);
                u.setNome(nome);
                Rankings.getMelhores().set(j, u);
                i = i + 1;
                j = j - 1;
         
            }
        }
        while(j > i);
   
   if(inicio < j) Quick(inicio, j);
   if(i < fim) Quick(i, fim);   
}
    public void OrdemInversa()
    {
        int cont = Rankings.getMelhores().size()-1;
        double[] apoio = new double[Rankings.getMelhores().size()];
        for(int i = 0; i < Rankings.getMelhores().size(); i++)
        {
            apoio[i] = Rankings.getMelhores().get(i).getResultadoTeste();
        }
        for(int i = 0; i < Rankings.getMelhores().size(); i++)
        {
            Usuario u = Rankings.getMelhores().get(i);
            u.setResultadoTeste(apoio[cont]);
            Rankings.getMelhores().set(i, u);
            cont--;
        }
    }
}
 
