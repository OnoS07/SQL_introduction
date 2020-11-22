-- 6-1
SELECT SUM(降水量) AS 年間降水量, AVG(最高気温) AS 最高気温の平均, AVG(最低気温) 
  FROM 都市別気象観測

SELECT SUM(降水量), AVG(最高気温), AVG(最低気温)
  FROM 都市別気象観測
 WHERE 都市名 = '東京'

SELECT 都市名, AVG(降水量), MIN(最高気温), MAX(最低気温)
  FROM 都市別気象観測
  GROUP BY 都市名

SELECT 月 AS 月, AVG(降水量), AVG(最高気温), AVG(最低気温)
  FROM 都市別気象観測
  GROUP BY 月
  ORDER BY 月

SELECT 都市名 AS 都市名, MAX (最高気温) AS 最高気温
  FROM 都市別気象観測
  GROUP BY 都市名
  HAVING MAX(最高気温) >= 38

SELECT 都市名 AS 都市名, MAX (最低気温) AS 最低気温
  FROM 都市別気象観測
  GROUP BY 都市名
  HAVING MIN(最低気温) <= -10

-- 6-2
SELECT COUNT(*) AS 社員数
  FROM 入退室管理
 WHERE 退室 IS NULL

SELECT 社員名 AS 社員名 , COUNT(社員名) AS 入室回数
  FROM 入退室管理
  GROUP BY 社員名
  ORDER BY 入室回数 DESC

SELECT 社員名 AS 社員名 , COUNT(社員名) AS 入室回数
  FROM 入退室管理
  GROUP BY 社員名
  HAVING COUNT(社員名) > 10

SELECT 日付 AS 日付 , COUNT(社員名) AS 対応社員数
  FROM 入退室管理
  WHERE 事由区分 = '3'
  GROUP BY 日付





