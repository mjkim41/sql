-- 조인 기초 테스트 데이터
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

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- 조인의 기본 원리는 곱연산 ( 중첩반복문 개념 ) 
-- 카테시안 곱 (Cartesian production)
-- 가능한 모든 경우의 수를 매칭하여 조회
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
-- 두 테이블 간에 연관관계 매칭 컬럼을 이용ㅎ여
-- 관계가 있는 데이터를 매칭하여 필터링 하여 조회
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

-- 사원의 사원번호와 사원명과 치득한 자격증명을 조회
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