/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package projexer1;

/**
 *
 * @author moises_j_ferreira
 */
public class Nadador extends Atleta {
    private String tipoNado;
    private int qtMetros;

    public Nadador(String nome, String tipoNado, int qtMetros) {
        super(nome);
        this.tipoNado = tipoNado;
        this.qtMetros = qtMetros;
    }

    public String getTipoNado() {
        return tipoNado;
    }

    public void setTipoNado(String tipoNado) {
        this.tipoNado = tipoNado;
    }

    public int getQtMetros() {
        return qtMetros;
    }

    public void setQtMetros(int qtMetros) {
        this.qtMetros = qtMetros;
    }

    @Override
    public String toString() {
        String saida = super.toString() + "\nTipo de Nado: " + tipoNado + "\nMetros: " + qtMetros;
        return saida;
    }
}
