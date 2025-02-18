CREATE GROUP administradores;
CREATE GROUP gerentes;
CREATE GROUP operadores_caixa;
CREATE GROUP repositores_estoque;
CREATE GROUP financeiro;
CREATE GROUP atendimento;

CREATE ROLE pedromaranhao LOGIN PASSWORD '080202' IN ROLE administradores;
CREATE ROLE patrick LOGIN PASSWORD '140999' IN ROLE financeiro;
CREATE ROLE celio LOGIN PASSWORD '060799' IN ROLE financeiro;
CREATE ROLE erickserio LOGIN PASSWORD '290200' IN ROLE repositores_estoque; 
CREATE ROLE erickfeliz LOGIN PASSWORD '251201' IN ROLE repositores_estoque;
CREATE ROLE iury LOGIN PASSWORD '121107' IN ROLE operadores_caixa;
CREATE ROLE mateus LOGIN PASSWORD '011099' IN ROLE operadores_caixa;


-- libera todas os privilegios para o administrador
GRANT ALL PRIVILEGES ON tb_fornecedores, tb_funcionarios, tb_itens, tb_produtos, tb_vendas TO administradores;

-- libera acesso apenas para ver e atualizar estoque para os repositores e para dar acesso e
-- opção para eles cadastrarem novos fornecedores
GRANT SELECT, UPDATE ON tb_produtos TO repositores_estoque;
GRANT INSERT, SELECT ON tb_fornecedores TO repositores_estoque;

--Dando permissão para os caixas para lançarem as vendas e os itens
GRANT SELECT, INSERT, UPDATE ON tb_vendas TO operadores_caixa;
GRANT SELECT, INSERT, UPDATE ON tb_itens TO operadores_caixa;
GRANT SELECT ON tb_fornecedores TO operadores_caixa;


-- Libera acesso para o grupo do financeiro visualizar as vendas e funcionarios
GRANT SELECT ON tb_vendas, tb_funcionarios TO financeiro;

SELECT*FROM tb_vendas
SELECT*FROM tb_funcionarios;