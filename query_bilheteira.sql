---- P.1
select titulo, dia, hora
from espetaculo;

---- P.2 
select categoria, titulo
from espetaculo;

---- P.3  (Data de nascimento inválida encontrada: Tony Carreira:1060-02-01)
select nome, d_nasc
from artista
WHERE tipo = 'cantor'
ORDER BY d_nasc asc;

---- P.4
select email, nome
from espetador
where cidade = 'Porto'
order by email;

---- P.5
select a.nome as artista, e.dia, e.titulo
from artista a
join espetaculo e on a.nif = e.artista
order by a.nome asc, e.dia desc;

---- P.6
select es.nome, b.lugar, b.custo
from espetador es
join bilhete b on es.email = b.email
order by es.nome asc, b.custo desc;

---- P.7
select distinct es.nome as espetador, a.nome as artista
from espetador es
join bilhete b on es.email = b.email
join espetaculo e on b.id_espetaculo = e.id
join artista a on e.artista = a.nif;

---- P.8
select nome 
from espetador 
where cidade = 'Porto'
union
select nome 
from artista 
where tipo = 'ator';

---- P.9
select nome 
from espetador 
where cidade != 'Porto'
and nome not in (select nome from artista);

---- P.10
select e.id, e.titulo, sum(b.custo) as receita_total
from espetaculo e
join bilhete b on e.id = b.id_espetaculo
group by e.id, e.titulo;

---- P.11
select e.categoria, sum(b.custo) as receita_total
from espetaculo e
join bilhete b on e.id = b.id_espetaculo
group by e.categoria;

---- P.12
select email, count(id_espetaculo)
from bilhete
where id_espetaculo in(
  	select id 
    from espetaculo 
    where artista = (select nif from artista where nome = 'Tony Carreira')
)
group by email 
order by count desc
limit 1

----------------- João Pedro Chaves D'el Rei Costa ------------------------------------------------