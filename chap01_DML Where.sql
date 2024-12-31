-- *************************** WHERE ������ : �����͸� ���͸� *****
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
-- ���������� : != , <>
WHERE sex_cd != 2
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
-- ���������� : != , <>
WHERE sex_cd <> 2
;

SELECT 
    emp_no 
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231'
;

-- ���� �����͸� ��ȸ : BETWEEN A AND B
SELECT 
    emp_no 
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

-- ���� ������ ���� : NOT BETWEEN A AND B
SELECT 
    emp_no 
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19700101' AND '19991231'
;

-- IN ������ : OR ����
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd = 100002
        OR dept_cd = 100003
        OR dept_cd = 100004;
        
-- IN ������ : OR ����
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd in (100002, 100005, 100003);

        
-- NOT IN ������ : !OR ����
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd NOT in (100002, 100005, 100003);

DESCRIBE TB_EMP;


-- LIKE ����
-- Ư�� �ܾ ���Ե� �˻�
-- ���ϵ�ī�� ���� (%: 0���� �̻�, _: �� 1����)
SELECT
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE addr LIKE '%����%'
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '��__' -- ��00 ('��0'�� ��ȸ �ȵ�)
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '%��' -- 0~0�� 
;

SELECT
    email
FROM USER
WHERE emila LIKE '_a%@%.com' -- banana@naver.com
;

-- ������ �达 + �μ��� 10003 Ȥ�� 10004 + 90���� 
-- �� ���, �̸� ����, �μ��ڵ�
SELECT
    emp_no
    , emp_nm
    , birth_de
    , dept_cd
FROM TB_EMP
WHERE 1=1
        AND emp_nm LIKE '��%'
        AND dept_cd in (100003, 100004)
        AND birth_de BETWEEN '19900101' AND '19991231'
;

-- NULL�� ��ȸ
-- NULL ��ȸ�� ������ IS NULL , IS NOT NULL!!!
SELECT 
    emp_no
    , emp_nm
    , direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS NULL
;

SELECT 
    emp_no
    , emp_nm
    , direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS NOT NULL
;

-- !! ������ �켱 ����
-- NOT > AND > OR
SELECT 
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE 1=1
    -- () �� ���� �ϻ� ���� �达 OR ������� ����� ���͵�
    AND emp_nm LIKE '��%'
    AND (addr LIKE '%�ϻ�%'
        OR addr LIKE '%����%')
ORDER BY addr DESC;
;

-- Į���� ��ȸ
SELECT COLUMN_NAME
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'TB_EMP';

