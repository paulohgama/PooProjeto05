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
    public static ArrayList<User> ultimos = new ArrayList();
    public static ArrayList<User> melhores = new ArrayList();

    public static ArrayList<User> getUltimos() {
        return ultimos;
    }

    public static ArrayList<User> getMelhores() {
        return melhores;
    }
    
    
}
