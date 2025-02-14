package expessoa;
/**
 *
 * author Rogério dos Santos
 * Objetivo: Classe Pessoa
 */
public class Pessoa {
    
    private String nome;
    private int idade;
    
    
    public void setNome(String nome){
        if(nome.length() > 3)
           this.nome = nome;
    }
    
    public String getNome(){
        return nome;
    }
        
    public void setIdade(int idade){
         if(idade >=0)
           this.idade = idade;
          
    }
    
    public int getIdade(){
        return idade;
    }
    
}