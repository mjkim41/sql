CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    -- (Constraint) DEFAULT : 기본값    
    price NUMBER(10) DEFAULT 1000,
    -- (Data Type) DATE
    created_at DATE
);


-- ************ 데이터 생성 : INSERTO INTO 테이블명
--             ( column name )
--             VALUES (값(문자열은 '' 사이에) *************************
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (1, '선풍기', 120000, SYSDATE); -- SYSDATE 현재 시스템 날짜와 시간이 반환
                                   -- 도구 -> 환경설정 -> 데이터 베이스 -> nls -> YYYY/MM/DD HH24:MI:SS
                             
                                   
INSERT INTO GOODS
    (id, goods_name, price, created_at)
VALUES
    (2, '세탁기', 220000, SYSDATE);
    
-- PRICE DEFAULT 있어서 생략 가능
INSERT INTO GOODS
    (id, goods_name, created_at)
VALUES
    (3, '달고나', SYSDATE);
    
--  NOT NULL  제약조건으로 인해 생성 불가능              
INSERT INTO GOODS
    (id, price, created_at)
VALUES
    (4, 200000, SYSDATE);
    
        
-- ! 제약 조건에 NOT NULL 걸지 않으면 생략 가능(값 NULL도 지정됨)
INSERT INTO GOODS
    (id, goods_name)
VALUES
    (5, '계란');
    
-- COLUMN 순서대로 입력하지 않아도 됨
INSERT INTO GOODS
    (goods_name, id, created_at)
VALUES
    ('건조기', 6, SYSDATE);
    
-- VALUES 앞에 칼럼을 생략하려면 모든 COLUMN의 데이터를 생략하지 않고 다 넣어야 함 
INSERT INTO GOODS
VALUES 
    (7, '탕수육', 30000, SYSDATE);
    
-- ****************** 데이터 수정 : UPDATE ************
-- UPDATE 테이블
-- SET
--   칼럼명='바꿀 값', 칼럼명=바꿀값
-- WHERE id = 1;
UPDATE GOODS
SET goods_name = '에어컨'
WHERE id = 1;

-- COMMIT : SAVE
COMMIT;

UPDATE GOODS
SET
    goods_name = '짜장면', price = 8000
WHERE id = 3;

-- WHERE 조건절이 없는 UPDATE :  전체 행에 대해 적용됨
UPDATE GOODS
SET price = 9999;

-- ROLLBACK : 복구
ROLLBACK;

-- PRIMARY KEY 는 웬만하면 바꾸면 안 됨
UPDATE GOODS
SET id = 11
WHERE id = 2;

-- null로 설정 가능
UPDATE GOODS
SET price = null
WHERE id = 6;

-- *************************** 데이터 삭제 : DELETE *******
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

-- DELETE FROM 테이블명을 WHERE 없이 사용 시 : 내용 다 날라감 (TRUNCATE과 달리 복구 가능)
DELETE FROM GOODS;
ROLLBACK;

TRUNCATE TABLE GOODS;

-- **************** 데이터 조회 : SELECT ********
SELECT * FROM GOODS;

-- 구조
SELECT 
    certi_cd
    , certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

-- 순서 바꾸면 나오는 칼럼 순서도 바뀜
SELECT 
    certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

-- SELECT DISTINCT : 중복 제거 
SELECT DISTINCT 
   issue_insti_nm
FROM TB_CERTI
;

-- SELECT DISTINCT : "모든 열의 값"이 동일한 행(row)들 중 중복된 행이 제거됨
SELECT DISTINCT
    certi_cd
    , certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

-- * : 모든 칼럼 조회
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

-- 컬럼 별칭 지정( alias) : column name AS ""
--                      column name ""
--                       column name 따옴표 생략 가능(띄어쓰기 없을 때만) 
                        
SELECT
    emp_nm AS "사원명"
    , ADDR "주소"
FROM TB_EMP
;

-- 문자열 결합 : || 
SELECT 
    '자격증 정보: ' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT 
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;