USE hubmenu;

CREATE TABLE Aluno (
  pk_aluno INT AUTO_INCREMENT PRIMARY KEY,
  nome_aluno VARCHAR(40),
  cpf_aluno VARCHAR(11),
  endereco_aluno VARCHAR(255),
  cidade_aluno VARCHAR(40)
);

INSERT INTO Aluno (pk_aluno, nome_aluno, cpf_aluno, endereco_aluno, cidade_aluno) VALUES
(1, 'Mark Stolf', '11122233344', 'Rua Nevoeiro, 187', 'São Paulo'),
(2, 'Ana Vavassori', '22233344455', 'Avenida Horizonte Azul, 320', 'Florianópolis'),
(3, 'Kamylla Kebab', '33344455566', 'Rua Esmeralda, 15', 'Belo Horizonte'),
(4, 'Silvio Santos', '44455566677', 'Travessa do Luar, 84', 'Curitiba'),
(5, 'Endryo Monster', '55566677788', 'Caminho das Estrelas, 29', 'Porto Alegre'),
(6, 'Yohan P. Diddy', '66677788899', 'Rua das Sombras, 66', 'Recife'),
(7, 'Igor Allied', '77788899900', 'Rua das Flores Douradas, 101', 'Salvador'),
(8, 'Marcio Senhorinha', '88899900011', 'Rua do Grêmio, 122', 'Rio Grande do Sul');

SELECT * FROM Aluno;
