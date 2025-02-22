use bd_aula_join;

#
select count(*) from cliente;
select count(*) from produto;
select count(*) from colaborador;

#
select * from cliente;

#
select nome_pro, preco_pro, fk_marca from produto
where fk_marca = 1 or fk_marca = 3
order by fk_marca desc;

#
select cli.nome_cli as Cliente,
       cli.cadastro_cli as Ano,
       cid.nome_cid as Cidade
from cidade cid
join Cliente cli on cid.pk_cidade = cli.fk_cidade
where cid.nome_cid in ('Joinville', 'Araquari');

#
select produto.nome_pro as Produto,
       marca.nome_mar as Marca
from marca
inner join produto on marca.pk_marca = produto.fk_marca
where marca.nome_mar = "bosch" or marca.nome_mar = "makita"
order by produto.nome_pro;

#
select prod.nome_pro as Produto,
       mar.nome_mar as Marca,
       cat.nome_cat as Categoria8
from marca mar
join produto prod on mar.pk_marca  = prod.fk_marca
join categoria cat on cat.pk_categoria = prod.fk_categoria
where mar.nome_mar in ("bosch","wap", "makita")
order by prod.nome_pro;

#
select it.fk_os as Nota_Fiscal,
       prod.nome_pro as Produto,
       prod.preco_pro as Preco_Unitario,
       it.quantidade as Quantidade,
       it.preco as Preco_Total,
       it.desconto as Desconto
from item it
join ordem_servico os on it.fk_os = os.pk_os
join produto prod on prod.pk_produto = it.fk_produto
where os.pk_os = 48;

#
select cli.nome_cli as Cliente,
       cli.cadastro_cli as Cadastro,
       cid.nome_cid as Cidade
       from cidade cid
join cliente cli on cid.pk_cidade = cli.fk_cidade
where cid.nome_cid in ('Joinville', 'Itajai')
AND YEAR(cli.cadastro_cli) = 2023
order by cli.nome_cli

# Usando o select SUM para obter contagem dos preços somando os valores de uma coluna...
select sum(preco) as Valor_Total from item where fk_os = 35;

##############################
# 11/02/2025 - Moises João Ferreira
# BANCO DE DADOS GENÉRICO
# Prof. Alann Perini
# Atividades
##############################

#1. Liste alfabeticamente o código e nome dos clientes de Joinville:
    select cli.nome_cli as Cliente,
           cli.cadastro_cli as Cadastro,
           cid.nome_cid as Cidade
    from cidade cid
    join cliente cli on cid.pk_cidade = cli.fk_cidade
    where cid.nome_cid in ('Joinville')
    order by cli.nome_cli

#2. Liste alfabeticamente o nome dos colaboradores que residam em Joinville ou Blumenau, mas apenas os que tenham nascido em 1990.
    select col.nome_col as Colaborador,
    col.nasc_col as DatadeNascimento,
        cid.nome_cid as Cidade
    from colaborador col
    join cidade cid on cid.pk_cidade = col.fk_cidade
    where cid.nome_cid in('Joinville', 'Blumenau')
    and year(col.nasc_col) = 1990
    order by col.nome_col;

#3. Liste o código e o nome dos produtos da marca Bosch ou Makita com preços entre 50 e 100 reais.
    select prod.nome_pro as Produto,
    prod.pk_produto as ID,
        mar.nome_mar as Marca,
        prod.preco_pro as Preço
    from produto prod
    join marca mar on prod.fk_marca = mar.pk_marca
    where mar.nome_mar in('Bosch', 'Makita')
    and prod.preco_pro >= 50
    and prod.preco_pro <= 100;
    #and prod.preco_pro between 100 and 50;

#4. Liste alfabeticamente apenas o nome dos fornecedores que vendem produtos da marca Makita.
    select distinct forn.razao_for as Fornecedor,
        mar.nome_mar as Marca
    from fornecedor forn
    join forn_prod fd on fd.fk_fornecedor = forn.pk_fornecedor
    join produto prod on  fd.fk_produto =  prod.pk_produto
    join marca mar on mar.pk_marca = prod.fk_marca
    where mar.nome_mar = 'Makita'
    order by forn.razao_for;

#5. Liste alfabeticamente apenas o nome dos clientes que residam em São Paulo, Rio de Janeiro ou Porto Alegre que compraram produtos em 2010.
    select cli.nome_cli as Cliente,
    cid.nome_cid as Cidade,
        os.abertura_os as DataDeCompra
    from cliente cli
    join cidade cid on cid.pk_cidade = cli.fk_cidade
    join ordem_servico os on cli.pk_cliente = os.fk_cliente
    where cid.nome_cid in('Sao Paulo', 'Rio de Janeiro', 'Porto Alegre')
    and year(os.abertura_os) = 2010;

#6. Altere o registro do primeiro colaborador para o seu nome completo. Feito isso, liste o nome de todos os clientes que foram atendidos por você em 2000.
    update colaborador
    set nome_col = 'Moises Ferreira'
    where pk_colaborador = 1;

    select cli.nome_cli as Clientes,
    os.abertura_os as DataDeCompra,
        col.nome_col as AtendidoPor
    from cliente cli
    join ordem_servico os on os.fk_cliente = cli.pk_cliente
    join colaborador col on col.pk_colaborador = os.fk_colaborador
    where col.pk_colaborador = '1';

#Liste alfabeticamente o nome do produto, sua marca e categoria, mas apenas os da marca Gong ou Makita que sejam da categoria motosserras.
    select prod.nome_pro as Produto,
        mar.nome_mar as Marca,
        cat.nome_cat as Categoria
    from produto prod
    join marca mar on mar.pk_marca = prod.fk_marca
    join categoria cat on cat.pk_categoria = prod.fk_categoria
    where mar.nome_mar in('Gong', 'Makita')
    and cat.nome_cat = 'motoserras';

#7. Altere o registro do 10° cliente para o nome do seu(sua) vizinho(a) nesta aula.
    update cliente
    set nome_cli = 'Mark Stolf'
    where pk_cliente = 10;

    select nome_cli as Cliente
    from cliente
    where pk_cliente = 10;
#Liste o número de todas as ordens de serviço emitidas em 2000 que contenham produtos com preço faturado acima de 500 reais.
    select distinct os.pk_os as Número,
        sum(it.preco) as ValorTotal,
        year(os.abertura_os) as Ano
    from ordem_servico os
    join item it on it.fk_os = os.pk_os
    where year(os.abertura_os) = 2000
    and it.preco > 500
    group by os.pk_os;

#8. Liste o código e o nome de todos os produtos com preço entre 300 e 500 reais, mas que tenham exatamente o icms de 17%.
    select pk_produto as Código,
        nome_pro as Produto,
        preco_pro as Preço,
        icms_pro as ICMS
    from produto prod
    where icms_pro = 17
    and preco_pro between 300 and 500;

#9. Liste alfabeticamente o nome dos colaboradores que nasceram entre 1980 e 1990;
    select nome_col as Nome,
        year(nasc_col) as Ano_de_Nascimento
    from colaborador
    where year(nasc_col) between 1980 and 1990
    order by nasc_col;

#10. Liste alfabeticamente o nome dos clientes (acrescente também seu código) dos que foram cadastrados no ano passado;
    select nome_cli as Cliente,
	    cadastro_cli as Data_De_Cadastro
    from cliente
    where year(cadastro_cli) = 2024;

#11. Liste alfabeticamente o nome dos produtos da marca Bosch, com preço superior a 100 reais;
    select prod.nome_pro as Produto,
        mar.nome_mar as Marca,
        prod.preco_pro as Preço
    from produto prod
    join marca mar on mar.pk_marca = prod.fk_marca
    where prod.preco_pro > 100
    and mar.nome_mar = 'Bosch';

#12. Liste o número das ordens de serviço do cliente que começam seu nome com Elvis;
    select os.pk_os as Número,
	    cli.nome_cli as Cliente
    from ordem_servico os
    join cliente cli on cli.pk_cliente = os.fk_cliente
    where cli.nome_cli like ('Elvis%');

#13. Liste alfabeticamente a razão social e e-mail dos fornecedores de Sao Paulo, Rio de Janeiro ou Natal. Liste inclusive, o nome da cidade.
    select forn.razao_for as razão_social,
        forn.email_for as Email,
        cid.nome_cid as Cidade
    from fornecedor forn
    join cidade cid on cid.pk_cidade = forn.fk_cidade
    where cid.nome_cid in('Sao Paulo', 'Rio de Janeiro', 'Natal')
    order by forn.razao_for;

#14. Liste o número das ordens de serviço emitidas por colaboradores que iniciem seu nome com Emma, mas apenas as que foram registradas entre jan/2000 e dez/2001.
     select os.pk_os as Número,
        col.nome_col as Colaborador,
        os.abertura_os as DataDeCompra
    from ordem_servico os
    join colaborador col on col.pk_colaborador = os.fk_colaborador
    where col.nome_col like('Emma%')
    and os.abertura_os between '2000-01-01' and '2001-12-31';

#15. Liste alfabeticamente o nome dos clientes de Ibirama, Dona Emma, Rio do Sul ou Presidente Getúlio que compraram produtos da marca Makita neste ano;
    select cli.nome_cli as Cliente,
        mar.nome_mar as Marca,
        cid.nome_cid as Cidade
    from cliente cli
    join cidade cid on cli.fk_cidade = cid.pk_cidade
    join ordem_servico os on cli.pk_cliente = os.fk_cliente
    join item it on os.pk_os = it.fk_os
    join produto prod on it.fk_produto = prod.pk_produto
    join marca mar on prod.fk_marca = mar.pk_marca
    where cid.nome_cid in('Ibirama', 'Dona Emma', 'Sao Francisco do Sul', 'Presidente Getúlio')
    and mar.nome_mar = 'Makita'
    and year(os.abertura_os) = 2023
    order by cli.nome_cli;

#16. Altere o nome de um dos colaboradores para o seu nome completo.
    update colaborador
    set nome_col = 'Moises Ferreira'
    where pk_colaborador = 1;
#Liste alfabeticamente o nome dos clientes que você atendeu no ano passado, mas apenas os clientes ibiramenses.
    select cli.nome_cli as Clientes,
        os.abertura_os as DataDeCompra,
        col.nome_col as AtendidoPor
    from cliente cli
    join ordem_servico os on os.fk_cliente = cli.pk_cliente
    join colaborador col on col.pk_colaborador = os.fk_colaborador
    join cidade cid on cid.pk_cidade = cli.fk_cidade
    where year(os.abertura_os) = 2024
    and col.pk_colaborador = '1'
    and cid.nome_cid = 'Curitiba';
#Não tem Ibirama então botei Curitiba...
#17. Liste o nome dos produtos fornecidos por empresas de Ibirama. Não repita o nome dos produtos (use DISTINCT no select).
    select distinct prod.nome_pro as Produtos,
         forn.razao_for as Empresa,
        cid.nome_cid as Cidade
    from produto prod
    join forn_prod fd on fd.fk_produto = prod.pk_produto
    join fornecedor forn on fd.fk_fornecedor = forn.pk_fornecedor
    join cidade cid on cid.pk_cidade = forn.fk_cidade
    where cid.nome_cid = 'Curitiba';
#Não tem Ibirama então botei Curitiba...

#18. Liste alfabeticamente o nome dos clientes que não residam em Ibirama, Dona Emma, Rio do Sul ou Presidente Getúlio;
    select cli.nome_cli as Cliente,
        cid.nome_cid
    from cliente cli
    join cidade cid on cli.fk_cidade = cid.pk_cidade
    where cid.nome_cid not in('Ibirama', 'Dona Emma', 'Rio do Sul', 'Presidente Getúlio')
    order by cli.nome_cli;

#19. Liste alfabeticamente o nome dos produtos da marca Makita que foram vendidos neste ano para clientes que foram atendidos por você.
    select distinct prod.nome_pro as Produtos,
        col.nome_col as VendidoPor
    from cliente cli
    join ordem_servico os on os.fk_cliente = cli.pk_cliente
    join colaborador col on col.pk_colaborador = os.fk_colaborador
    join item it on it.fk_os = os.pk_os
    join produto prod on it.fk_produto = prod.pk_produto
    join marca mar on prod.fk_marca = mar.pk_marca
    join cidade cid on cid.pk_cidade = cli.fk_cidade
    where year(os.abertura_os) = 2023
    and col.pk_colaborador = 1
    and mar.nome_mar = 'Makita'
    order by prod.nome_pro;