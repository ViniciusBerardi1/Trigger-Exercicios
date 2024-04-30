# Trigger-Exercicios

Exemplo 1:

![image](https://github.com/vininis/Trigger-Exercicios/assets/89169305/ea2abc82-6e14-4c2b-a862-ea8991fefe94)

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



