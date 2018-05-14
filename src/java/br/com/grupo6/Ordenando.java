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
        
        i = inicio;
        j = fim;
   
        meio = (int) ((i + j) / 2);
        pivo = Rankings.getMelhores().get(meio).getPercent();
   
        do
        {
            while (Rankings.getMelhores().get(i).getPercent() < pivo) i = i + 1;
            while (Rankings.getMelhores().get(j).getPercent() > pivo) j = j - 1;
      
            if(i <= j)
            {
                aux = Rankings.getMelhores().get(i).getPercent();
                User u = Rankings.getMelhores().get(i);
                u.setPercent(Rankings.getMelhores().get(j).getPercent());
                Rankings.getMelhores().set(i, u);
                u = Rankings.getMelhores().get(j);
                u.setPercent(aux);
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
            apoio[i] = Rankings.getMelhores().get(i).getPercent();
        }
        for(int i = 0; i < Rankings.getMelhores().size(); i++)
        {
            User u = Rankings.getMelhores().get(i);
            u.setPercent(apoio[cont]);
            Rankings.getMelhores().set(i, u);
            cont--;
        }
    }
}
 