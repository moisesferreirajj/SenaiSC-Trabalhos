package projexer1;

import java.util.Scanner;

public class ProjExer1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Digite o nome do jogador de futebol: ");
        String nomeJogador = scanner.nextLine();

        System.out.print("Digite o número de gols: ");
        int nrGols = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Digite o clube: ");
        String clube = scanner.nextLine();

        JogadorFutebol jogador = new JogadorFutebol(nomeJogador, nrGols, clube);

        System.out.print("\nDigite o nome do nadador: ");
        String nomeNadador = scanner.nextLine();

        System.out.print("Digite o tipo de nado: ");
        String tipoNado = scanner.nextLine();

        System.out.print("Digite a quantidade de metros: ");
        int qtMetros = scanner.nextInt();

        Nadador nadador = new Nadador(nomeNadador, tipoNado, qtMetros);

        System.out.println("\nDados do Jogador de Futebol:");
        System.out.println(jogador);

        System.out.println("\nDados do Nadador:");
        System.out.println(nadador);

        scanner.close();
    }
}