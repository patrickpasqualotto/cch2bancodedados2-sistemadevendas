CONSULTA 1
SELECT*FROM tb_produtos 
SELECT cod_produto FROM tb_produtos WHERE des_produto = 'Heineken Caixa 6 Latas 350ml'; 

-- PARA OBTER A QUANTIDADE DO ESTOQUE DO PRODUTO
SELECT qte_produto FROM tb_produtos WHERE des_produto = 'Heineken Caixa 6 Latas 350ml';

CREATE TABLE tempos_execucao_consulta(
    execucao_num INT,
    tempo_ms NUMERIC
);
-- drop pra limpar ela antes de executar a nova consulta por exemplo
DROP TABLE tempos_execucao_consulta;

drop function medir_tempo_execucao()
CREATE OR REPLACE FUNCTION medir_tempo_execucao()
RETURNS VOID AS $$
DECLARE
    inicio TIMESTAMP;
    fim TIMESTAMP;
    tempo_execucao NUMERIC; 
    i INT;
BEGIN
  FOR i in 1..100 LOOP
    inicio := clock_timestamp();
    PERFORM
        qte_produto FROM tb_produtos WHERE des_produto = 'Heineken Caixa 6 Latas 350ml'; 

    fim := clock_timestamp();
		tempo_execucao := EXTRACT(MILLISECOND FROM (fim - inicio));		
        INSERT INTO tempos_execucao_consulta (execucao_num, tempo_ms)
        VALUES (i, tempo_execucao);
    END LOOP;

END;
$$ LANGUAGE plpgsql;

SELECT medir_tempo_execucao();

select*from tempos_execucao_consulta;

SELECT 
    AVG(tempo_ms) AS tempo_medio,
    MIN(tempo_ms) AS tempo_minimo,
    MAX(tempo_ms) AS tempo_maximo
FROM tempos_execucao_consulta;

DROP TABLE tempos_execucao_consulta;

USING hash
-- B-Tree
CREATE INDEX idx_produtos ON tb_produtos (des_produto);
DROP INDEX idx_produtos;

-- hash
CREATE INDEX idx_produtos ON tb_produtos USING hash (des_produto);
DROP INDEX idx_produtos;

--B-Tree
CREATE INDEX idx_produtos ON tb_produtos USING BRIN(des_produto);
DROP INDEX idx_produtos;