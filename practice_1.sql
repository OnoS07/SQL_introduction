-- 1
SELECT *
FROM 家計簿
WHERE 出金額 = 50000

-- 2
DELETE FROM 家計簿
WHERE 出金額 > 4000

-- 3
UPDATE 家計簿
SET メモ = 'カフェラテを購入'
WHERE 日付 = '2018-02-3'