-- �ǽ� 1 
-- 1. employees���̺��� first_name, last_name, salary�� ��ȸ�ϼ���.
SELECT 
    first_name
    , last_name
    , salary
FROM employees;


-- 2. departments���̺��� department_id, department_name, manager_id, location_id�� ��ȸ�ϼ���.
SELECT 
    department_id
    , department_name
    , manager_id
    , location_id
FROM departments
;

-- 3. employees���̺��� first_name�� ��Ī�� '�̸�', salary�� ��Ī�� '�޿�'�� ��ȸ�ϼ���.
SELECT 
    first_name AS "�̸�"
    , salary AS �޿�
FROM employees
;



-- 4. employees���̺��� ��������� first_name + last_name + '�� �޿��� $' + salary + '�Դϴ�.' 
--    �� ���·� �����Ͽ� '�������' ��� ��Ī�� �ο��Ͽ� �ϳ��� �÷����� ��ȸ�ϼ���.
SELECT 
    first_name || ' ' || last_name || '�� �޿��� $' || TO_CHAR(salary, 'FM999G999G999G999' ) || '�Դϴ�.'
FROM EMPLOYEES
;


-- 5. employees���̺��� department_id�� �ߺ��� �����Ͽ� ��ȸ�ϼ���.
SELECT DISTINCT
    department_id
FROM EMPLOYEES
;

-- �ǽ� 2
-- 1. employees���̺��� job_id�� 'IT_PROG'�� ����� first_name, job_id, department_id�� ��ȸ�ϼ���.
SELECT
    first_name
    , job_id
    , department_id
FROM EMPLOYEES
WHERE job_id = 'IT_PROG'
;

-- 2. employees���̺��� last_name�� 'King'�� ����� first_name, last_name, hire_date�� ��ȸ�ϼ���.
SELECT
    first_name
    , last_name
    , hire_date
FROM EMPLOYEES
WHERE last_name = 'King'
;


-- 3. employees���̺��� salary�� 15000���� ũ�ų� ���� ����� first_name, salary, hire_date�� ��ȸ�ϼ���.
SELECT
    first_name
    , salary
    , hire_date
FROM EMPLOYEES
WHERE salary >= 15000
;


-- 4. employees���̺��� salary�� 10000�� 12000 ���̿� �ִ� ����� first_name, salary�� ��ȸ�ϼ���.
SELECT
    first_name
    , salary
FROM EMPLOYEES
WHERE salary between 10000 AND 12000
;


-- 5. employees���̺��� manager_id�� 101, 102, 103�߿� ���ϴ� ����� first_name, salary, manager_id�� ��ȸ�ϼ���.
SELECT
    first_name
    , salary
    , manager_Id
FROM EMPLOYEES
WHERE manager_id in (101, 102, 103)
;


-- !!!! 6. employees���̺��� job_id�� 'IT_PROG', 'FI_MGR'�߿� ���Ե��� �ʴ� ����� first_name, job_id�� ��ȸ�ϼ���.
SELECT
    first_name
    , job_Id
FROM EMPLOYEES
--WHERE job_id NOT IN ('IT_PROG', 'FI_MGR')  <- �� �� !! 
--WHERE job_id != 'IT_PROG' AND job_id != 'FI_MGR';
WHERE job_id != ('IT_PROG' OR 'FI_MGR')
;


-- !!! 7. employees���̺��� job_id�� 'IT'�� �����ϴ� ����� first_name, last_name, job_id�� ��ȸ�ϼ���.
SELECT
    first_name
    , last_name
    , job_id
FROM EMPLOYEES
WHERE job_id LIKE 'IT%'
;


-- 8. employees���̺��� email�� �ι�° ���ڰ� A�� ����� first_name, email�� ��ȸ�ϼ���.
SELECT
    
FROM EMPLOYEES
;


-- 9. employees���̺��� manager_id�� null�� ����� first_name, manager_id�� ��ȸ�ϼ���.
SELECT
    
FROM EMPLOYEES
;


-- 10. employees���̺��� commission_pct�� null�� �ƴ� ����� first_name, job_id, commission_pct�� ��ȸ�ϼ���.
SELECT
    
FROM EMPLOYEES
;


-- 11. employees���̺��� job_id�� 'IT_PROG'�̰� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT
    
FROM EMPLOYEES
;


-- 12. employees���̺��� job_id�� 'IT_PROG'�̰ų� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT
    
FROM EMPLOYEES
;


-- 13. employees���̺��� job_id�� 'IT_PROG'�̰ų� 'FI_MGR'�̸鼭 salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.
SELECT
    
FROM EMPLOYEES
;
