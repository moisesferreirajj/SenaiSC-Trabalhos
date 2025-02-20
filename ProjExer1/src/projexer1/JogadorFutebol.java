/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package projexer1;

/**
 *
 * @author moises_j_ferreira
 */
public class JogadorFutebol extends Atleta {
    private int nrGols;
    private String clube;

    public JogadorFutebol(String nome, int nrGols, String clube) {
        super(nome);
        this.nrGols = nrGols;
        this.clube = clube;
    }

    public int getNrGols() {
        return nrGols;
    }

    public void setNrGols(int nrGols) {
        this.nrGols = nrGols;
    }

    public String getClube() {
        return clube;
    }

    public void setClube(String clube) {
        this.clube = clube;
    }

    @Override
    public String toString() {
        String saida = super.toString() + "\nGols: " + nrGols + "\nClube: " + clube;
        return saida;
    }
}