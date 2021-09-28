# Visualizar os databases existentes
SHOW DATABASES;

# Criar um database chamado "sistema"
CREATE SCHEMA sistema;

# Visualizar novamente os databases existentes e definir como padrão
# o database "sistema"
SHOW DATABASES;
USE sistema;

# Definir o mecanismo padrão como InnoDB (transacional). Este comando funciona
# somente no MySQL.
# InnoDB é padrão no mySQL
SET STORAGE_ENGINE=InnoDB;

# Definir o mecanismo padrão para aceitar acentuação na inclusão de dados. Isso deve ser feito
# antes da entrada de dados. Os dados que já foram armazenados não mostrará acentuação.
ALTER DATABASE sistema CHARACTER SET = utf8mb4;

# Criar a tabela "departamento", conforme especificado no diagrama
CREATE TABLE departamento (
	id_departamento int primary key auto_increment,
    nome varchar(100) not null,
    telefone varchar(15) not null
);

# Visualizar a estrutura da tabela "departamento"
DESCRIBE departamento;

# Criar a tabela "funcionario", conforme especificado no diagrama (observe a chave
# estrangeira - Foreign Key):
CREATE TABLE funcionario (
	id_funcionario int primary key auto_increment,
    nome varchar(100) not null,
    id_departamento int,
    data_cadastro date,
    foreign key (id_departamento) references departamento(id_departamento)
);

# Deletar a tabela funcionário
DROP TABLE funcionario;

# Criar a tabela "funcionario", conforme especificado no diagrama (sem a chave estrangeira
# - Foreign Key)
CREATE TABLE funcionario (
	id_funcionario int primary key auto_increment,
    nome varchar(100) not null,
    id_departamento int,
    data_cadastro date
);

# Alterar a tabela criada anteriormente para adicionar a chave estrangeira (para quando se
# esquece da chave estrangeira).
ALTER TABLE funcionario ADD CONSTRAINT FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);

DESCRIBE departamento;
DESCRIBE funcionario;

# Inserindo registros na tabela "departamento" (sem especificação dos campos)
INSERT INTO departamento 
VALUES (default,'Expedição','111222333');

# Inserindo registros na tabela "departamento" (com especificação dos campos)
INSERT INTO departamento (nome,telefone)
VALUES ('PCP','444555666');

# Inserir mais 5 registros na tabela “departamento”
INSERT INTO departamento (nome,telefone)
VALUES ('Qualidade','777888999');
INSERT INTO departamento (nome,telefone)
VALUES ('Laboratório','111000111');
INSERT INTO departamento (nome,telefone)
VALUES ('Produção','222000222');
INSERT INTO departamento (nome,telefone)
VALUES ('TI','333000333');
INSERT INTO departamento (nome,telefone)
VALUES ('SST','444000444');

# Visualizar todos os dados da tabela "departamento"
SELECT * FROM departamento;

# Visualizar todos os campos e todos os atributos da tabela "departamento" em ordem
# alfabética de nome
SELECT * FROM departamento
ORDER BY departamento.nome ASC;

# Visualizar os dados da tabela "departamento" em ordem decrescente de nome
SELECT * FROM departamento
ORDER BY departamento.nome DESC;

# Visualizar os dados dos departamentos para os quais não foram atribuídos telefones
SELECT * FROM departamento
WHERE departamento.telefone = null;

# Visualizar os dados dos departamentos que tenham telefones
SELECT * FROM departamento
WHERE departamento.telefone != "";

# Visualizar os dados dos departamentos cujo código seja igual a 300. Perceba que
# "id_departamento" é a chave primária
SELECT * FROM departamento
WHERE departamento.id_departamento=300;

# Visualizar os dados dos departamentos cujo nome começa com a letra "P"
SELECT * FROM departamento
WHERE departamento.nome LIKE "P%";

# Visualizar os dados dos departamentos cujo nome termina com a palavra "dade"
SELECT * FROM departamento
WHERE departamento.nome LIKE "%dade";

# Visualizar os dados dos departamentos cujo nome contenha a palavra "de"
SELECT * FROM departamento
WHERE departamento.nome LIKE "%de%";

# Visualizar os dados dos departamentos cujo nome NÃO contenha a palavra "de"
SELECT * FROM departamento
WHERE departamento.nome NOT LIKE "%de%";

# Visualizar o telefone do departamento cujo código identificador seja igual a 3
SELECT * FROM departamento
WHERE departamento.id_departamento=3;

# Apagar departamento cujo código seja igual a 4
DELETE FROM departamento
WHERE departamento.id_departamento=4;

SELECT * FROM departamento;

# Digite o comando para fechar/desconectar do MySQL

# Digite o comando para verificar a versão e data atual
SELECT @@version, now();

# Digite o comando para verificar o usuário
SELECT CURRENT_USER;

# Digite o comando para cancelar outro comando que está no meio do processo de entrada no
# prompt
KILL QUERY 16;

# Exibir variáveis do sistema
SHOW VARIABLES;

# Exibir processos
SHOW PROCESSLIST;