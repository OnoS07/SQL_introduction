-- 12-2

-- 部署テーブルの作成
CREATE TABLE DEPT (
  DEPTNO   CHAR(2)     PRIMARY KEY,
  DEPTNAME VARCHAR(40) UNIQUE NOT NULL
);
-- 役職テーブルの作成
CREATE TABLE POS (
  POSCODE  CHAR(1)     PRIMARY KEY,
  POSNAME  VARCHAR(20) UNIQUE NOT NULL
);