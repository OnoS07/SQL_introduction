-- 49
SELECT SUM(残高) AS 合計, MAX(残高) AS 最大, MIN(残高) AS 最小,　AVG(残高) AS 平均, COUNT(*) AS 件数
	FROM 口座

-- 50
SELECT COUNT(*) AS データ件数
FROM 口座
	WHERE 種別 != '2'
		AND 残高 >= 1000000
		AND 更新日 < '2018-01-01'

-- 51
SELECT COUNT(*) - COUNT(更新日) AS データ件数
FROM 口座

-- 52
SELECT MAX(名義) AS 最大値, MIN(名義) AS 最小値
FROM 口座

-- 53
SELECT MAX(更新日) AS 最大値, MIN(更新日) AS 最小値
FROM 口座

-- 54
SELECT 種別, SUM(残高), MAX(残高), MIN(残高), AVG(残高), COUNT(残高)
FROM 口座
	GROUP BY 種別

-- 55
SELECT SUBSTR(口座番号, 6, 1) AS 番号, COUNT(*) AS 件数 FROM 口座
	GROUP BY
		SUBSTR(口座番号, 6, 1)
	ORDER BY 件数 DESC

-- 56
SELECT SUBSTRING(COALESCE(CAST(更新日 AS VARCHAR), 'XXXX'), 1, 4) AS 更新年,
       SUM(残高) AS 合計, MAX(残高) AS 最大, MIN(残高) AS 最小,
       AVG(残高) AS 平均, COUNT(*) AS 件数
  FROM 口座
 GROUP BY SUBSTRING(COALESCE(CAST(更新日 AS VARCHAR), 'XXXX'), 1, 4)

-- 57
SELECT 種別, SUM(残高), COUNT(*)
FROM 口座
	GROUP BY 種別
	HAVING SUM(残高) >= 3000000

-- 58
SELECT SUBSTR(名義, 1, 1) AS 名義, COUNT(名義) AS 件数,
	AVG(LENGTH(REPLACE(名義,'　',''))) AS 平均
FROM 口座
	GROUP BY
		SUBSTR(名義, 1, 1)
			HAVING COUNT(*) >= 10
				OR AVG(LENGTH(REPLACE(名義,'　',''))) >= 5
