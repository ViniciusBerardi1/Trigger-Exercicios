# Trigger-Exercicios

Exemplo 2:

![image](https://github.com/vininis/Trigger-Exercicios/assets/89169305/ddc326d4-ff7c-48d4-b205-4d96f40546ed)


create table  Filmes(
ID 		INT		primary key		auto_increment,	
titulo	varchar(60),
minutos	int
);

create table Log_deletions (
ID 		int		primary key 	auto_increment,
titulo	varchar(60),
quando	datetime,
quem	varchar(40)
);

delimiter $
	create trigger log_deletions after delete on Filmes
			for each row
			begin
				insert into Log_deletions values (null, old.titulo, sysdate(), user());
			end$
delimiter ;


	 insert into Filmes (titulo, minutos) values ("the terrible trigger" , 120);
     insert into Filmes (titulo, minutos) values ("o alto da compadecida", 135);
     insert into Filmes (titulo, minutos) values ("faroeste caboclo"	 , 240);
     insert into Filmes (titulo, minutos) values ("the matrix"			 , 90 );
     insert into Filmes (titulo, minutos) values ("blade runner"		 , -88);
     insert into Filmes (titulo, minutos) values ("o labirinto do fauno" , 110);
     insert into Filmes (titulo, minutos) values ("metropole"			 , 0  );
     insert into Filmes (titulo, minutos) values ("A lista"				 , 120);
     
     
     delimiter $
	create trigger chk_minutos before insert on Filmes
			for each row
            begin
				if new.minutos < 0 then
					
                    signal sqlstate '4500'
                    set message_text = 'valor invalido para minutos',
                    mysql_errno = 2022;
					set new.minutos = null;
				end if;
			end$

delimiter ;


