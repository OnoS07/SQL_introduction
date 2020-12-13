-- 34
SELECT 口座番号, 残高 / 1000 AS 千円単位の残高
	FROM 口座
	WHERE 残高 >= 1000000

-- 35
INSERT INTO 口座
	VALUES ('0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2018-04-01' )

-- 36
UPDATE 口座
	SET 残高 = (残高 - 3000) * 1.003
	WHERE 口座番号 IN ('0652281', '1026413', '2239710')

-- 37
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日
	FROM 口座
	WHERE 更新日 < '2017-01-01'

-- 38
SELECT 口座番号, 'カ)' || 名義 AS 名義
	FROM 口座
	WHERE 種別 = '3'

-- 39
SELECT DISTINCT 種別 AS 種別コード,
	CASE
		WHEN 種別 = '1' THEN '普通'
		WHEN 種別 = '2' THEN '当座'
		WHEN 種別 = '3' THEN '別段'
	END AS 種別名
	FROM 口座

-- 40
SELECT 口座番号, 名義,
	CASE
		WHEN 残高 < 100000 THEN 'C'
		WHEN 残高 < 1000000 THEN 'B'
		ELSE 'A'
	END AS 口座ランク
FROM 口座

-- 41
SELECT LENGTH(口座番号), LENGTH(REPLACE(名義, '　', '')), LENGTH(CAST(残高 AS VARCHAR))
  FROM 口座

-- 42
SELECT 名義 FROM 口座
	WHERE SUBSTR(名義, 1, 5) LIKE '%カワ%'

-- 43
SELECT * FROM 口座
 WHERE LENGTH(CAST(残高 AS VARCHAR)) >= 4
   AND SUBSTRING(CAST(残高 AS VARCHAR), LENGTH(CAST(残高 AS VARCHAR))-2, 3) = '000'

-- 44
SELECT 口座番号, 残高, ROUND(残高 * 1.002, -1) AS 残高別利息
FROM 口座
	ORDER BY 残高 DESC

-- 45
SELECT 口座番号, 残高,
	CASE
		WHEN 残高 <= 500000 THEN ROUND(残高 * 1.001, -1)
		WHEN 500000 < 残高 AND 残高 < 2000000 THEN ROUND(残高 * 1.002, -1)
		WHEN 残高 > 2000000 THEN ROUND(残高 * 1.003, -1)
	END AS 残高別利息
FROM 口座
	ORDER BY 残高別利息 DESC, 口座番号

-- 46
INSERT INTO 口座
	VALUES('0351262', 'イトカワ　ダイ', '2', 635110, CURRENT_DATE)

-- 47
SELECT 口座番号, 名義, 種別, 残高,
	SUBSTR(CAST(更新日 AS VARCHAR), 1, 4) || '年' ||
	SUBSTR(CAST(更新日 AS VARCHAR), 6, 2) || '月' ||
	SUBSTR(CAST(更新日 AS VARCHAR), 9, 2) || '日'
	AS 更新日
FROM 口座
	WHERE 更新日 >= '2018-01-01'

-- 48
SELECT COALESCE (CAST(更新日 AS VARCHAR), '設定なし')
FROM 口座