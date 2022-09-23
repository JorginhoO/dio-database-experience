-- Recuperações simples com SELECT Statement
select * from dbo.Cliente;

-- Filtros com WHERE Statement
select * from dbo.Cliente where Nome like 'L%';

-- Crie expressões para gerar atributos derivados
select (sum(ValorPecas)+sum(ValorMaoDeObra)) as ValorTotal from dbo.Servico;

-- Defina ordenações dos dados com ORDER BY
select Descricao, (ValorPecas + ValorMaoDeObra) as Total from dbo.Servico order by Total desc;

-- Condições de filtros aos grupos – HAVING Statement
select idPeca from dbo.ServicoPeca group by idPeca having count(idPeca)>1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select c.Nome
    from dbo.Cliente c
    inner join dbo.OrdemServico o on c.id = o.idCliente
    inner join dbo.StatusOrdemServico so on so.id = o.idStatusOrdemServico
    WHERE
    so.Identificacao = 'ABERTO'
