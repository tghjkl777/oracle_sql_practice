create user testuser identified by testpw;
grant connect,resource to testuser;

select table_name
from user_tables;

SELECT DISTINCT object_type FROM  user_objects ;


SELECT * FROM user_catalog ;