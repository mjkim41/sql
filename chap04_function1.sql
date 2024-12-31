-- # 문자열 비교

-- CHAR타입끼리의 비교
DROP TABLE CHAR_COMPARE;

CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');
INSERT INTO char_compare VALUES ('103', 'SQLD', '  SQLD');

SELECT * FROM char_compare;

SELECT *
FROM char_compare
WHERE sn = '101'
    -- CHAR(4)인 'SQLD' 와 CHAR(6) 'SQLD'을 같다고 봄
    -- 길이가 서로 다르면, 작은 쪽에 공백을 추가하여 길이를 같게 함
    
    -- 반면 CHAR(4)인 'SQLD'와 CHAR(6)인 '  SQLD'는 다르게 봄
    AND char_4 = char_6
;


----------------------------------------------------

-- 한쪽이 VARCHAR타입일 경우의 비교
DROP TABLE VARCHAR_COMPARE;

CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
INSERT INTO varchar_compare VALUES ('103', 'SQLD', 'SQLD');

SELECT * FROM varchar_compare;

SELECT *
FROM varchar_compare
WHERE sn = '103'
    -- 한 쪽이 VARCHAR 인 경우 : 길이가 다르면 다름 
    -- CHAR(4)인 'SQLD'와 VARCHAR(6) 'SQLD    '은 다름
    -- CHAR(4)인 'SQLD'와 VARCHAR(6) 'SQLD'은 같음
    AND char_4 = varchar_6
;

----------------------------------------------
-- 상수 문자열 비교

SELECT * FROM varchar_compare;

SELECT 
    *
FROM varchar_compare
WHERE sn = '101'
    -- CHAR(4)인 'SQLD'가 'SQLD  '이랑 동일한지 물어봤을 때 : true
    AND char_4 = 'SQLD  ' -- true
;

SELECT 
    *
FROM varchar_compare
WHERE sn = '101'
    -- VARCHAR(6) 'SQLD  '와 'SQLD'가 동일한지 물어봤을 때 : FALSE
    AND varchar_6 = 'SQLD' -- false
;
