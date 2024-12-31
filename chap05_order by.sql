-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
-- default : ASC
ORDER BY emp_no
;



--ORDER BY Į��1, Į��2 :
-- ù ��° �÷��� �������� �����ϰ�, ù ��° �÷��� ���� ������ �� ��° �÷��� �������� ����
SELECT 
    emp_no
    , emp_nm
    , addr
    , dept_cd
FROM tb_emp
-- default : ASC
ORDER BY dept_cd ASC, emp_nm DESC
;

SELECT 
    emp_no 
    -- ��Ī ����
    , emp_nm AS �̸�
    , addr �ּ�
    , dept_cd �μ��ڵ�
FROM tb_emp
-- ORDER BY ��Ī, ORDER BY ���� Į���� �� �� ����
--                              Į�� �����ε� ��������(3�� Į�� : �ּ�)
ORDER BY dept_cd ASC, �̸� DESC, 3
;

-- Oracle ������ ���� �� null�� ���� ū ������ ���
SELECT
    emp_nm
    , direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no DESC
;