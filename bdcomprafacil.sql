create database BDCompraFacil;
use BDCompraFacil;

create table cliente(
codcli int,
nomecli varchar(45),
email varchar(45),
datacadastro date,
constraint pkcodcli primary key (codcli));

create table produto(
codprod int,
nomeprod varchar(45),
valorunitario decimal,
codforn int,
constraint pkcodprod primary key (codprod),
constraint fkcodforn foreign key (codforn) references fornecedor(codforn));

create table fornecedor(
codforn int,
nomeforn varchar(45),
cidade varchar(45),
constraint pkcodforn primary key (codforn));

create table pedido(
codpedido int,
codclipe int,
datapedido date,
valortotal decimal,
constraint pkcodpedido primary key (codpedido),
constraint fkcodclipe foreign key (codclipe) references cliente(codcli));

create table item_pedido(
codpedido int,
codproduto int,
quantidade int,
precovenda decimal,
constraint fkcodpedido foreign key (codpedido) references pedido(codpedido),
constraint fkcodproduto foreign key (codproduto) references produto(codprod));

create table transportadora(
codtransportadora int,
nometransportadora varchar(45),
cnpj varchar(45),
constraint pkcodtransportadora primary key (codtransportadora));

create table entrega(
codentrega int,
codpedidoen int,
codtransportadoraen int,
statusentrega varchar(45),
dataenvio date,
constraint pkcodentrega primary key (codentrega),
constraint fkcodpedidoen foreign key (codpedidoen) references pedido(codpedido),
constraint fkcodtransportadoraen foreign key (codtransportadoraen) references transportadora(codtransportadora));

create table estoque(
codestoque int,
codprodutoet int,
quantidadeatual int,
localizacao varchar(50),
constraint pkcodestoque primary key (codestoque),
constraint fkcodprodutoet foreign key (codprodutoet) references produto(codprod));

show tables;

INSERT INTO fornecedor VALUES
(1,'Fornecedor Alpha','São Paulo'),
(2,'Fornecedor Beta','Rio de Janeiro'),
(3,'Fornecedor Gama','Belo Horizonte'),
(4,'Fornecedor Delta','Curitiba'),
(5,'Fornecedor Épsilon','Porto Alegre'),
(6,'Fornecedor Zeta','Campinas'),
(7,'Fornecedor Eta','Santos'),
(8,'Fornecedor Teta','Sorocaba'),
(9,'Fornecedor Iota','Ribeirão Preto'),
(10,'Fornecedor Kappa','São José dos Campos'),
(11,'Fornecedor Lambda','Uberlândia'),
(12,'Fornecedor Mu','Franca'),
(13,'Fornecedor Nu','Jundiaí'),
(14,'Fornecedor Xi','Piracicaba'),
(15,'Fornecedor Ômicron','Limeira'),
(16,'Fornecedor Pi','Araraquara'),
(17,'Fornecedor Rô','Bauru'),
(18,'Fornecedor Sigma','Marília'),
(19,'Fornecedor Tau','Presidente Prudente'),
(20,'Fornecedor Ômega','Araçatuba');

INSERT INTO cliente VALUES
(1,'Ana Silva','ana@gmail.com','2024-01-10'),
(2,'Bruno Costa','bruno@gmail.com','2024-01-11'),
(3,'Carlos Lima','carlos@gmail.com','2024-01-12'),
(4,'Daniela Rocha','daniela@gmail.com','2024-01-13'),
(5,'Eduardo Souza','eduardo@gmail.com','2024-01-14'),
(6,'Fernanda Alves','fernanda@gmail.com','2024-01-15'),
(7,'Gabriel Pires','gabriel@gmail.com','2024-01-16'),
(8,'Helena Martins','helena@gmail.com','2024-01-17'),
(9,'Igor Freitas','igor@gmail.com','2024-01-18'),
(10,'Juliana Barros','juliana@gmail.com','2024-01-19'),
(11,'Kleber Nunes','kleber@gmail.com','2024-01-20'),
(12,'Larissa Teixeira','larissa@gmail.com','2024-01-21'),
(13,'Marcos Rangel','marcos@gmail.com','2024-01-22'),
(14,'Natália Farias','natalia@gmail.com','2024-01-23'),
(15,'Otávio Mendes','otavio@gmail.com','2024-01-24'),
(16,'Patrícia Azevedo','patricia@gmail.com','2024-01-25'),
(17,'Rafael Torres','rafael@gmail.com','2024-01-26'),
(18,'Sabrina Lopes','sabrina@gmail.com','2024-01-27'),
(19,'Thiago Guedes','thiago@gmail.com','2024-01-28'),
(20,'Vanessa Moraes','vanessa@gmail.com','2024-01-29');

INSERT INTO transportadora VALUES
(1,'TransLog','11.111.111/0001-01'),
(2,'Rápido Express','22.222.222/0001-02'),
(3,'Move Cargas','33.333.333/0001-03'),
(4,'Brasil Entregas','44.444.444/0001-04'),
(5,'Speed Transportes','55.555.555/0001-05'),
(6,'Via Norte','66.666.666/0001-06'),
(7,'Via Sul','77.777.777/0001-07'),
(8,'Carga Certa','88.888.888/0001-08'),
(9,'LogMais','99.999.999/0001-09'),
(10,'FastWay','10.101.010/0001-10'),
(11,'UltraCargo','11.121.131/0001-11'),
(12,'MegaTrans','12.232.343/0001-12'),
(13,'PrimeLog','13.343.454/0001-13'),
(14,'TopEntrega','14.454.565/0001-14'),
(15,'EconoTrans','15.565.676/0001-15'),
(16,'FlexLog','16.676.787/0001-16'),
(17,'SmartCargo','17.787.898/0001-17'),
(18,'QuickMove','18.898.909/0001-18'),
(19,'UrbanLog','19.909.010/0001-19'),
(20,'GlobalTrans','20.010.121/0001-20');

INSERT INTO produto VALUES
(1,'Notebook',3500,1),
(2,'Mouse',80,2),
(3,'Teclado',120,3),
(4,'Monitor',900,4),
(5,'Impressora',850,5),
(6,'Scanner',700,6),
(7,'Webcam',150,7),
(8,'Headset',200,8),
(9,'HD Externo',400,9),
(10,'SSD',600,10),
(11,'Pen Drive',50,11),
(12,'Cadeira Gamer',1200,12),
(13,'Mesa Escritório',900,13),
(14,'Roteador',300,14),
(15,'Switch',450,15),
(16,'Fonte',350,16),
(17,'Placa de Vídeo',2500,17),
(18,'Memória RAM',400,18),
(19,'Processador',1800,19),
(20,'Cooler',150,20);

INSERT INTO pedido VALUES
(1,1,'2024-02-01',3580),
(2,2,'2024-02-02',120),
(3,3,'2024-02-03',900),
(4,4,'2024-02-04',850),
(5,5,'2024-02-05',200),
(6,6,'2024-02-06',400),
(7,7,'2024-02-07',600),
(8,8,'2024-02-08',50),
(9,9,'2024-02-09',1200),
(10,10,'2024-02-10',300),
(11,11,'2024-02-11',450),
(12,12,'2024-02-12',350),
(13,13,'2024-02-13',2500),
(14,14,'2024-02-14',400),
(15,15,'2024-02-15',1800),
(16,16,'2024-02-16',150),
(17,17,'2024-02-17',900),
(18,18,'2024-02-18',700),
(19,19,'2024-02-19',80),
(20,20,'2024-02-20',3500);

INSERT INTO item_pedido VALUES
(1,1,1,3500),
(2,3,1,120),
(3,4,1,900),
(4,5,1,850),
(5,8,1,200),
(6,9,1,400),
(7,10,1,600),
(8,11,1,50),
(9,12,1,1200),
(10,14,1,300),
(11,15,1,450),
(12,16,1,350),
(13,17,1,2500),
(14,18,1,400),
(15,19,1,1800),
(16,20,1,150),
(17,13,1,900),
(18,6,1,700),
(19,2,1,80),
(20,1,1,3500);

INSERT INTO entrega VALUES
(1,1,1,'Enviado','2024-02-02'),
(2,2,2,'Entregue','2024-02-03'),
(3,3,3,'Entregue','2024-02-04'),
(4,4,4,'Enviado','2024-02-05'),
(5,5,5,'Entregue','2024-02-06'),
(6,6,6,'Enviado','2024-02-07'),
(7,7,7,'Entregue','2024-02-08'),
(8,8,8,'Entregue','2024-02-09'),
(9,9,9,'Enviado','2024-02-10'),
(10,10,10,'Entregue','2024-02-11'),
(11,11,11,'Enviado','2024-02-12'),
(12,12,12,'Entregue','2024-02-13'),
(13,13,13,'Enviado','2024-02-14'),
(14,14,14,'Entregue','2024-02-15'),
(15,15,15,'Enviado','2024-02-16'),
(16,16,16,'Entregue','2024-02-17'),
(17,17,17,'Enviado','2024-02-18'),
(18,18,18,'Entregue','2024-02-19'),
(19,19,19,'Entregue','2024-02-20'),
(20,20,20,'Enviado','2024-02-21');

INSERT INTO estoque VALUES
(1,1,50,'Depósito A'),
(2,2,200,'Depósito A'),
(3,3,150,'Depósito B'),
(4,4,80,'Depósito B'),
(5,5,60,'Depósito C'),
(6,6,40,'Depósito C'),
(7,7,100,'Depósito A'),
(8,8,90,'Depósito B'),
(9,9,70,'Depósito C'),
(10,10,65,'Depósito A'),
(11,11,300,'Depósito B'),
(12,12,30,'Depósito C'),
(13,13,25,'Depósito A'),
(14,14,120,'Depósito B'),
(15,15,110,'Depósito C'),
(16,16,95,'Depósito A'),
(17,17,20,'Depósito B'),
(18,18,85,'Depósito C'),
(19,19,40,'Depósito A'),
(20,20,130,'Depósito B');

describe cliente;
describe fornecedor;
describe transportadora;
describe produto;
describe pedido;
describe item_pedido;
describe entrega;
describe estoque;

select*from cliente;
select*from fornecedor;
select*from transportadora;
select*from produto;
select*from pedido;
select*from item_pedido;
select*from entrega;
select*from estoque;

alter table produto add column descontomaximo decimal(5,2);
update produto set valorunitario=valorunitario*1.10 where codforn=5 and valorunitario<100;
delete from fornecedor where cidade= 'São Paulo' or nomeforn like 'b%';

/*Consulta simples e mais*/
select codcli as identificador, email from cliente order by datacadastro asc;

select nomecli, datacadastro from cliente where datacadastro between '2024-01-01' and '2024-12-31';

select nomeprod, valorunitario from produto where nomeprod not like '%Notebook%' and valorunitario > 500;

select nomeforn, cidade from fornecedor where cidade in ('São Paulo', 'Rio de Janeiro', 'Belo Horizonte');

select nometransportadora from transportadora where codtransportadora not in (1, 5, 10, 15);

/*Joins, Filtros e mais*/
select c.nomecli, p.codpedido, p.valortotal from cliente c inner join pedido p on c.codcli = p.codclipe where p.valortotal > 500;

select pr.nomeprod, f.nomeforn, f.cidade from produto pr inner join fornecedor f on pr.codforn = f.codforn order by f.nomeforn desc;

select p.codpedido, pr.nomeprod, ip.quantidade from pedido p
inner join item_pedido ip on p.codpedido = ip.codpedido
inner join produto pr on ip.codproduto = pr.codprod
where p.datapedido > '2025-01-01' and ip.quantidade > 2;

select c.nomecli, pr.nomeprod, p.datapedido from cliente c inner join pedido p on c.codcli = p.codclipe inner join item_pedido ip on p.codpedido = ip.codpedido
inner join produto pr on ip.codproduto = pr.codprod where cidade = 'Cidade B' or pr.codprod = 15;

select f.codforn, count(distinct pr.codprod) as produtosfornecidos from fornecedor f
inner join produto pr on f.codforn = pr.codforn group by f.codforn;

select f.cidade, min(pr.valorunitario) as produtomaisbarato from fornecedor f
inner join produto pr on f.codforn = pr.codforn group by f.cidade;

select localizacao, max(quantidadeatual) as estoquemax from estoque group by localizacao;

select c.nomecli, t.nometransportadora from cliente c inner join pedido p on c.codcli = p.codclipe inner join entrega e on p.codpedido = e.codpedidoen 
inner join transportadora t on e.codtransportadoraen = t.codtransportadora where e.statusentrega <> 'Entregue' and t.codtransportadora <> 7;

select t.nometransportadora, e.statusentrega from entrega e
inner join transportadora t on e.codtransportadoraen = t.codtransportadora
where t.nometransportadora like 'T%' and e.codentrega between 100 and 200;

select c.nomecli, pr.nomeprod, p.datapedido, e.statusentrega from cliente c
inner join pedido p on c.codcli = p.codclipe
inner join item_pedido ip on p.codpedido = ip.codpedido
inner join produto pr on ip.codproduto = pr.codprod
inner join entrega e on p.codpedido = e.codpedidoen
where pr.codprod in (2, 4, 6) order by e.dataenvio desc;

/*10 exercicios a mais*/
select p.codpedido,
       sum(ip.precovenda * ip.quantidade) as faturamentobruto
from pedido p
inner join item_pedido ip on p.codpedido = ip.codpedido
group by p.codpedido;

select c.codcli, avg(p.valortotal) as ticketmedio
from cliente c
inner join pedido p on c.codcli = p.codclipe
group by c.codcli;

select c.nomecli, p.datapedido, e.statusentrega
from cliente c
inner join pedido p on c.codcli = p.codclipe
inner join entrega e on p.codpedido = e.codpedidoen
where c.nomecli not like '%Junior%'
or e.statusentrega <> 'Enviado';

select pr.nomeprod, f.nomeforn, es.quantidadeatual
from produto pr
inner join fornecedor f on pr.codforn = f.codforn
inner join estoque es on pr.codprod = es.codprodutoet
order by f.nomeforn asc, es.quantidadeatual desc;

select c.nomecli, pr.nomeprod, ip.precovenda
from cliente c
inner join pedido p on c.codcli = p.codclipe
inner join item_pedido ip on p.codpedido = ip.codpedido
inner join produto pr on ip.codproduto = pr.codprod
where p.datapedido between '2025-03-01' and '2025-05-31'
and ip.precovenda > 200;

select month(p.datapedido) as mes,
       count(distinct c.codcli) as totalclientes
from cliente c
inner join pedido p on c.codcli = p.codclipe
group by month(p.datapedido);

update estoque es
inner join produto pr on es.codprodutoet = pr.codprod
set es.quantidadeatual = 0
where pr.codprod in (7, 8, 9, 11);

select c.nomecli, p.datapedido
from cliente c
inner join pedido p on c.codcli = p.codclipe
where c.email like '%@gmail.com%'
and c.codcli not in (1, 2, 3);

select pr.nomeprod, min(ip.precovenda) as menorprecohistorico
from produto pr
inner join item_pedido ip on pr.codprod = ip.codproduto
group by pr.nomeprod;

select c.nomecli, pr.nomeprod, t.nometransportadora, e.statusentrega
from cliente c
inner join pedido p on c.codcli = p.codclipe
inner join item_pedido ip on p.codpedido = ip.codpedido
inner join produto pr on ip.codproduto = pr.codprod
inner join entrega e on p.codpedido = e.codpedidoen
inner join transportadora t on e.codtransportadoraen = t.codtransportadora
where e.statusentrega = 'Cancelado'
or t.nometransportadora = 'Entrega Rápida';
