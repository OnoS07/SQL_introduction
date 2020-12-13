-- 1
SELECT 口座番号, 名義, 種別, 残高, 更新日
	FROM 口座

-- 2
SELECT 口座番号
	FROM 口座

-- 3
SELECT 口座番号, 残高
	FROM 口座

-- 4
SELECT *
	FROM 口座

-- 5
UPDATE 口座
   SET 名義 = 'ＸＸＸＸＸ'

-- 6
UPDATE 口座
   SET 残高 = 99999999, 更新日 = '2018-03-01'

-- 7
INSERT INTO 口座
	VALUES ('0642191', 'アオキ ハルカ', '1', '3640551', '2018-03-01')

-- 8
DELETE
	FROM 口座