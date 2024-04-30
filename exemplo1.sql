create table Pedidos(
	IDPedido INT auto_increment primary key,
    DataPedido DATETIME,
    NomeCliente varchar(100)
    );
    
    insert into Pedidos (DataPedido, NomeCliente) values
    (NOW(),'cliente1'),
    (now(),'cliente2 '),
    (now(),'cliente3 ');
    
    DELIMITER $
    CREATE TRIGGER RegistroDataCriacaoPedido
    before insert on Pedidos
    for EACH ROW
	begin
		set new.DataPedido = now();
	end;
    
    DELIMITER $;
    
    
    insert into Pedidos(NomeCliente) values	('NovoCliente');
    
    select * from Pedidos;