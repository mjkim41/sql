-- *************************** WHERE 조건절 : 데이터를 필터링 *****
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
-- 부정연산자 : != , <>
WHERE sex_cd != 2
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
-- 부정연산자 : != , <>
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

-- 사이 데이터를 조회 : BETWEEN A AND B
SELECT 
    emp_no 
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

-- 사이 데이터 제외 : NOT BETWEEN A AND B
SELECT 
    emp_no 
    , emp_nm
    , addr
    , birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19700101' AND '19991231'
;

-- IN 연산자 : OR 연산
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd = 100002
        OR dept_cd = 100003
        OR dept_cd = 100004;
        
-- IN 연산자 : OR 연산
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd in (100002, 100005, 100003);

        
-- NOT IN 연산자 : !OR 연산
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM TB_EMP
WHERE dept_cd NOT in (100002, 100005, 100003);

DESCRIBE TB_EMP;


-- LIKE 연산
-- 특정 단어가 포함된 검색
-- 와일드카드 매핑 (%: 0글자 이상, _: 딱 1글자)
SELECT
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE addr LIKE '%용인%'
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '이__' -- 이00 ('이0'는 조회 안됨)
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE emp_nm LIKE '%심' -- 0~0심 
;

SELECT
    email
FROM USER
WHERE emila LIKE '_a%@%.com' -- banana@naver.com
;

-- 성씨가 김씨 + 부서가 10003 혹은 10004 + 90년대생 
-- 의 사번, 이름 생일, 부서코드
SELECT
    emp_no
    , emp_nm
    , birth_de
    , dept_cd
FROM TB_EMP
WHERE 1=1
        AND emp_nm LIKE '김%'
        AND dept_cd in (100003, 100004)
        AND birth_de BETWEEN '19900101' AND '19991231'
;

-- NULL값 조회
-- NULL 조회는 무조건 IS NULL , IS NOT NULL!!!
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

-- !! 연산자 우선 순위
-- NOT > AND > OR
SELECT 
    emp_no
    , emp_nm
    , addr
FROM TB_EMP
WHERE 1=1
    -- () 안 쓰면 일산 거주 김씨 OR 수원사는 사람이 필터됨
    AND emp_nm LIKE '김%'
    AND (addr LIKE '%일산%'
        OR addr LIKE '%수원%')
ORDER BY addr DESC;
;

-- 칼럼명 조회
SELECT COLUMN_NAME
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'TB_EMP';

