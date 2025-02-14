package expessoa;

import expessoa.Pessoa;
import expessoa.PessoaFisica;
import expessoa.PessoaJuridica;

import java.util.Scanner;
/**
 *
 * author Rogério
 * Objetivo: Classe principal
 */
public class ExPessoa {
    
    public static void main(String[] args){
        Scanner leitura = new Scanner(System.in);
        Pessoa p = new Pessoa();
        PessoaFisica pf = new PessoaFisica();
        PessoaJuridica pj = new PessoaJuridica();
        
        String nome = "", cpf = "", estCivil = "";
        float altura = 0;
        int   idade = 0;
        System.out.println("<--- Dados Pessoais --->");
        System.out.println("Informe o nome ");
        nome = leitura.next();
        
        System.out.println("Informe o cpf ");
        cpf = leitura.next();
        
        System.out.println("Informe a altura ");
        altura = leitura.nextFloat();
        
        System.out.println("Informe a idade ");
        idade = leitura.nextInt();        
        
        System.out.println("Informe o estado civil ");
        estCivil = leitura.next();

        pf.setNome(nome);
        pf.setCpf(cpf);
        pf.setAltura(altura);
        pf.setIdade(idade);
        pf.setEstCivil(estCivil);
        
        System.out.println(p.toString());
    }
}