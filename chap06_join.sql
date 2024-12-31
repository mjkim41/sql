-- ���� ���� �׽�Ʈ ������
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);


INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- ������ �⺻ ������ ������ ( ��ø�ݺ��� ���� ) 
-- ī�׽þ� �� (Cartesian production)
-- ������ ��� ����� ���� ��Ī�Ͽ� ��ȸ
SELECT *
FROM test_a, test_b
;


ALTER TABLE tset_b
RENAME COLUMN a_id TO id  
;

SELECT * 
FROM test_a, test_b
WHERE test_a.id = test_b.a_id
;

-- inner join
-- �� ���̺� ���� �������� ��Ī �÷��� �̿뤾��
-- ���谡 �ִ� �����͸� ��Ī�Ͽ� ���͸� �Ͽ� ��ȸ
SELECT 
    tb_emp.emp_no
    , tb_emp.emp_nm
    , tb_emp.dept_cd
    , tb_dept.dept_cd
    , tb_dept.dept_nm
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;

SELECT 
    E.emp_no
    , E.emp_nm
    , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;

-- ����� �����ȣ�� ������ ġ���� �ڰ������� ��ȸ
SELECT 
    E.emp_no
    , E.emp_nm
FROM tb_emp E
;

SELECT
    ec.emp_no
    , ec.certi_cd
    , ec.acqu_de
FROM tb_emp_certi EC
;




SELECT 
    E.emp_no
    , E.emp_nm
    , EC.acqu_de
    , EC.certi_cd
    , C.certi_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C
WHERE E.emp_no = EC.emp_no
      AND EC.certi_cd = C.certi_cd
;