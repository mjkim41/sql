-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
-- default : ASC
ORDER BY emp_no
;



--ORDER BY 칼럼1, 칼럼2 :
-- 첫 번째 컬럼을 기준으로 정렬하고, 첫 번째 컬럼의 값이 같으면 두 번째 컬럼을 기준으로 정렬
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
    -- 별칭 지정
    , emp_nm AS 이름
    , addr 주소
    , dept_cd 부서코드
FROM tb_emp
-- ORDER BY 별칭, ORDER BY 원래 칼럼명 둘 다 가능
--                              칼럼 순서로도 지정가능(3번 칼럼 : 주소)
ORDER BY dept_cd ASC, 이름 DESC, 3
;

-- Oracle 에서는 정렬 시 null을 가장 큰 값으로 취급
SELECT
    emp_nm
    , direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no DESC
;