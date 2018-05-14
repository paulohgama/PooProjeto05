/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.grupo6;

import java.util.ArrayList;

/**
 *
 * @author PauloHGama
 */
public class Rankings {
    public static ArrayList<Usuario> ultimos = new ArrayList();
    public static ArrayList<Usuario> melhores = new ArrayList();

    public static ArrayList<Usuario> getUltimos() {
        return ultimos;
    }

    public static ArrayList<Usuario> getMelhores() {
        return melhores;
    }
    
    
}
