package br.com.grupo6;
import java.util.ArrayList;
public class BD {
    private static ArrayList<Usuarios> usuarios;
    public static String user = "";
    public static ArrayList<Usuarios> getUsuarios() {
        if (usuarios==null) {
            usuarios = new ArrayList<>();
        }
        return usuarios;
    }
}
