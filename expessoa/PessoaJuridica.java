package expessoa;
/**
 *
 * author Rogério dos Santos
 * Objetivo: Classe Pessoa Jurídica
 * 
 */
public class PessoaJuridica extends Pessoa {
    
    private String cnpj;
    private String tipoEmpresa;

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getTipoEmpresa() {
        return tipoEmpresa;
    }

    public void setTipoEmpresa(String tipoEmpresa) {
        this.tipoEmpresa = tipoEmpresa;
    }
    
     public String toString(){
        String saida = "Nome:..............."  + super.getNome() + 
                       "\nTempo Empresa:...."  +  super.getIdade() +
                       "\nCnpj.............."  +  getCnpj() +
                       "\nTipo Empresa:....."  +  getTipoEmpresa();
                      
        return saida; 
    } 
}