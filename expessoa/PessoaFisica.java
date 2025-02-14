package expessoa;
/**
 *
 * author Rogérioa dos Santos
 * Objetivo: Classe pessoa física
 * 
 */
public class PessoaFisica extends Pessoa {
    
    private String cpf;
    private String estCivil;
    private float altura;

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEstCivil() {
        return estCivil;
    }

    public void setEstCivil(String estCivil) {
        this.estCivil = estCivil;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }
    
    public String toString(){
        String saida = "Nome:....."   + super.getNome() + 
                       "\nIdade:...." + super.getIdade() +
                       "\nCpf:......" + getCpf() +
                       "\nAltura:..." + getAltura() +
                       "\nEst. Civil" + getEstCivil();
        return saida;
    } 
}
