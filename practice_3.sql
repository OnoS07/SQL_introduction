-- 3-1
SELECT * FROM 気象観測
WHERE 月 = 6

SELECT * FROM 気象観測
WHERE NOT 月 = 6

SELECT * FROM 気象観測
WHERE 降水量 < 100

SELECT * FROM 気象観測
WHERE 降水量 < 200

SELECT * FROM 気象観測
WHERE 最高気温 >= 30

SELECT * FROM 気象観測
WHERE 最高気温 <= 0

SELECT * FROM 気象観測
WHERE 月 = 3 OR 月 = 5 OR 月 = 7

SELECT * FROM 気象観測
WHERE 月 IN(3, 5, 7)

SELECT * FROM 気象観測
WHERE 降水量 < 100 AND 湿度 < 50

SELECT * FROM 気象観測
WHERE 最低気温 < 5 OR 最高気温 > 35

SELECT * FROM 気象観測
WHERE 60 < 湿度 AND 湿度 < 79

SELECT * FROM 気象観測
WHERE 湿度 BETWEEN 60 AND 79

SELECT * FROM 気象観測
WHERE 降水量 IS NULL OR 最高気温 IS NULL OR 最低気温 IS NULL OR 湿度 IS NULL

-- 3-2
SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '%川'

SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '%島%'

SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '愛%'

SELECT * FROM 都道府県
WHERE 都道府県名 = 県庁所在地

SELECT * FROM 都道府県
WHERE NOT 都道府県名 = 県庁所在地

-- 3-3
SELECT * FROM 成績表


-- 3-4
INSERT INTO 成績表
	VALUES ('S001', '織田 信長', 77, 55, 80, 75, 93, NULL);
INSERT INTO 成績表
	VALUES ('A002', '豊臣 秀吉', 64, 69, 70, 0, 59, NULL);
INSERT INTO 成績表
	VALUES ('E003', '徳川 家康', 80, 83, 85, 90, 79, NULL);

UPDATE 成績表
	SET 法学 = 85, 哲学 = 67
	WHERE 学籍番号 = 'A002'

UPDATE 成績表
	SET 外国語 = 81
	WHERE 学籍番号 IN('A002', 'E003')

UPDATE 成績表
	SET 総合成績 = 'A'
	WHERE 法学 >= 80 AND 経済学 >= 80 AND 哲学 >= 80 AND 情報理論 >= 80 AND 外国語 >= 80;

UPDATE 成績表
	SET 総合成績 = 'B'
	WHERE (法学 >= 80 OR 外国語 >= 80) AND (経済学 >= 80 OR 哲学 >= 80);

UPDATE 成績表
	SET 総合成績 = 'D'
	WHERE 法学 > 50 AND 経済学 > 50 AND 哲学 > 50 AND 情報理論 > 50 AND 外国語 > 50;

UPDATE 成績表
	SET 総合成績 = 'C'
	WHERE 総合成績 IS NULL;

DELETE FROM 成績表
	WHERE 法学 = 0 OR 経済学 = 0 OR 哲学 = 0 OR情報理論 = 0 OR 外国語 = 0;