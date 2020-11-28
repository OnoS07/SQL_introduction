-- 8-2
SELECT 社員番号, 社員.名前 AS 名前, 部署.名前 AS 部署名
  FROM 社員
  JOIN 部署
    ON 社員.部署ID = 部署.部署ID

SELECT 社員.社員番号, 社員.名前 AS 名前, 上司.名前 AS 上司名
  FROM 社員
  LEFT JOIN 社員 AS 上司
         ON 社員.上司ID = 上司.社員番号

SELECT 社員.社員番号, 社員.名前 AS 名前, 部署.名前 AS 部署名, 支店.名前 AS 勤務地
  FROM 社員
  JOIN 部署
  	ON 社員.部署ID = 部署.部署ID
  JOIN 支店
  	ON 社員.勤務地ID = 支店.支店ID

SELECT 支店ID AS 支店コード, 支店.名前 AS 支店名,
       社員.名前 AS 支店長名, 社員数. 社員数
  FROM 支店
  JOIN 社員
    ON 支店.支店長ID = 社員.社員番号
  JOIN (SELECT COUNT(*) AS 社員数, 勤務地ID
          FROM 社員 GROUP BY 勤務地ID) AS 社員数
    ON 支店.支店ID = 社員数.勤務地ID

SELECT 社員.社員番号 AS 社員番号, 社員.名前 AS 名前,
       支店.名前 AS 本人勤務地, 上司支店.名前 AS 上司勤務地
  FROM 社員
  JOIN 社員 AS 上司
    ON 社員.上司ID = 上司.社員番号
   AND 社員.勤務地ID <> 上司.勤務地ID
  JOIN 支店
    ON 社員.勤務地ID = 支店.支店ID
  JOIN 支店 AS 上司支店