--cria tablespace TBS_MIF2BN    
CREATE TABLESPACE TBS_MIF2BN
DATAFILE 'MIF2BN.dbf' SIZE 40M AUTOEXTEND ON ONLINE PERMANENT 
EXTEND MANAGEMENT LOCAL AUTOALLOCATE
SEGMENT SPACE MANAGEMENT AUTO;

--criar usuario
CREATE TABLE PEDRO
IDENTIFIED BY 123456
DEFAULT TABLESPACE MIF2BN
TEMPORARY TABLESPACE TEMP;

--inclui privil�gios ao usuario
GRANT CREATE SESSION, CONNECT, RESOURCE TO PEDRO;

-- permitir espa�o ilimitado ao usuario
ALTER USER PEDRO QUOTA UNLIMITED ON TBS_MIF2BN