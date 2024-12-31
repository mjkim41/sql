CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    -- (Constraint) DEFAULT : �⺻��    
    price NUMBER(10) DEFAULT 1000,
    -- (Data Type) DATE
    created_at DATE
);


-- ************ ������ ���� : INSERTO INTO ���̺��
--             ( column name )
--             VALUES (��(���ڿ��� '' ���̿�) *************************
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (1, '��ǳ��', 120000, SYSDATE); -- SYSDATE ���� �ý��� ��¥�� �ð��� ��ȯ
                                   -- ���� -> ȯ�漳�� -> ������ ���̽� -> nls -> YYYY/MM/DD HH24:MI:SS
                             
                                   
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (2, '��Ź��', 220000, SYSDATE);
    
-- PRICE DEFAULT �־ ���� ����
INSERT INTO GOODS
    (id, goods_name, created_at)
VALUES
    (3, '�ް�', SYSDATE);
    
--  NOT NULL  ������������ ���� ���� �Ұ���              
INSERT INTO GOODS
    (id, price, created_at)
VALUES
    (4, 200000, SYSDATE);
    
        
-- ! ���� ���ǿ� NOT NULL ���� ������ ���� ����(�� NULL�� ������)
INSERT INTO GOODS
    (id, goods_name)
VALUES
    (5, '���');
    
-- COLUMN ������� �Է����� �ʾƵ� ��
INSERT INTO GOODS
    (goods_name, id, created_at)
VALUES
    ('������', 6, SYSDATE);
    
-- VALUES �տ� Į���� �����Ϸ��� ��� COLUMN�� �����͸� �������� �ʰ� �� �־�� �� 
INSERT INTO GOODS
VALUES 
    (7, '������', 30000, SYSDATE);
    
-- ****************** ������ ���� : UPDATE ************
-- UPDATE ���̺�
-- SET
--   Į����='�ٲ� ��', Į����=�ٲܰ�
-- WHERE id = 1;
UPDATE GOODS
SET goods_name = '������'
WHERE id = 1;

-- COMMIT : SAVE
COMMIT;

UPDATE GOODS
SET
    goods_name = '¥���', price = 8000
WHERE id = 3;

-- WHERE �������� ���� UPDATE :  ��ü �࿡ ���� �����
UPDATE GOODS
SET price = 9999;

-- ROLLBACK : ����
ROLLBACK;

-- PRIMARY KEY �� �����ϸ� �ٲٸ� �� ��
UPDATE GOODS
SET id = 11
WHERE id = 2;

-- null�� ���� ����
UPDATE GOODS
SET price = null
WHERE id = 6;

-- *************************** ������ ���� : DELETE *******
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

-- DELETE FROM ���̺���� WHERE ���� ��� �� : ���� �� ���� (TRUNCATE�� �޸� ���� ����)
DELETE FROM GOODS;
ROLLBACK;

TRUNCATE TABLE GOODS;

-- **************** ������ ��ȸ : SELECT ********
SELECT * FROM GOODS;

-- ����
SELECT 
    certi_cd
    , certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

-- ���� �ٲٸ� ������ Į�� ������ �ٲ�
SELECT 
    certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

-- SELECT DISTINCT : �ߺ� ���� 
SELECT DISTINCT 
   issue_insti_nm
FROM TB_CERTI
;

-- SELECT DISTINCT : "��� ���� ��"�� ������ ��(row)�� �� �ߺ��� ���� ���ŵ�
SELECT DISTINCT
    certi_cd
    , certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

-- * : ��� Į�� ��ȸ
SELECT
   *
FROM TB_CERTI
;

-- ! group by 
SELECT 
    certi_cd,
    certi_nm,
    MIN(issue_insti_nm) AS issue_insti_nm
FROM TB_CERTI
GROUP BY 
    certi_cd,
    certi_nm;

    
SELECT 
    emp_nm
    , addr
FROM TB_EMP
;

-- �÷� ��Ī ����( alias) : column name AS ""
--                      column name ""
--                       column name ����ǥ ���� ����(���� ���� ����) 
                        
SELECT
    emp_nm AS "�����"
    , ADDR "�ּ�"
FROM TB_EMP
;

-- ���ڿ� ���� : || 
SELECT 
    '�ڰ��� ����: ' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT 
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;