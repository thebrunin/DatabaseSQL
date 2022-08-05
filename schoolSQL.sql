create database school;
use school;

create table turma(
	id_turma int not null unique auto_increment primary key,
    nome_turma varchar(30)
);

create table professor(
	id_professor int not null unique auto_increment primary key,
    nome_professor varchar(40)
);

create table aula(
	id_aula int not null unique auto_increment primary key,
    nome_aula varchar(30),
    fk_professor int not null,
    fk_turma int not null,
    constraint dar_aula foreign key (fk_professor) references professor(id_professor),
	constraint turma_alvo foreign key (fk_turma) references turma(id_turma)
);

create table aluno(
	id_aluno int not null unique auto_increment primary key,
    nome_aluno varchar(30),
    fk_turma int not null,
    constraint que_turma foreign key (fk_turma) references turma(id_turma)
);

insert into turma
	value (1,"primeiro ano A"), (2,"primeiro ano B");
    
insert into professor
	value (1,"Cleitinho"), (2,"Romero Brito");

insert into aula
	value (1,"matematica", 2, 1), (2,"biologia", 1, 2);
    
insert into aluno
	value (1,"Ricardo", 2), (2,"Robson", 1), (3,"Romario",1);
    
update turma
	set nome_turma="segundo ano A"
    where id_turma=1;

update professor
	set nome_professor="Arlindo"
    where id_professor=1;
    
 update aula
	set nome_aula="biologia avancada"
    where id_aula=2; 
    
update aluno
	set fk_turma=2
    where id_aluno=2;
    
delete from aluno
	where id_aluno=3;
    
delete from aula
	where id_aula=1;
    
delete from turma
	where id_turma=1;
    
delete from professor
	where id_professor=2;
    
select *from (aula, professor, aula);
