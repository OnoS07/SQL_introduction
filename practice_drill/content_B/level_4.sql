--34
SELECT 商品コード, 単価, 単価 * 0.95 AS キャンペーン価格 
FROM 商品
	WHERE 商品区分 = '9'
	ORDER BY 商品コード

--35
UPDATE 注文
SET クーポン割引料 = クーポン割引料 - 300
WHERE 注文日 BETWEEN '2018-03-12' AND '2018-03-14' 
	AND 数量 >= 2
	AND クーポン割引料 IS NOT NULL

--36
UPDATE 注文
SET 数量 = 数量 -1
WHERE 注文番号 = '201802250126'
AND 商品コード = 'W0156'

--37
SELECT 注文番号 || '-' || CAST(注文枝番 AS VARCHAR)
FROM 注文
WHERE 注文番号>= '201710010001' AND 注文番号 <= '201710319999'

--38
SELECT DISTINCT 商品区分 AS 区分 ,
	CASE 商品区分 
		WHEN '1' THEN ' 衣類 '
		WHEN'2' THEN '靴' 
		WHEN '3' THEN '雑貨' 
		WHEN '9' THEN '未分類' 
	END AS 区分名
FROM 商品

--39
SELECT 商品コード, 商品名, 単価, 
	CASE
		WHEN 単価 < 3000 THEN 'S'
		WHEN 単価 >= 3000 AND 単価 < 10000 THEN 'M'
		ELSE 'L'
	END AS 販売価格ランク,
	商品区分 || ':' ||
	CASE 商品区分
		WHEN '1' THEN ' 衣類 '
		WHEN '2' THEN '靴' 
		WHEN '3' THEN '雑貨' 
		WHEN '9' THEN '未分類' 
	END AS 商品区分
FROM 商品
ORDER BY 単価

--40
select 商品名, length(商品名) as 文字数
from 商品
where length(商品名) > 10
order by length(商品名)

--41
select 注文日, substring(注文番号, 9, 4) AS 注文番号
from 注文

--42
update 商品
set 商品コード = 'E' || substring(商品コード, 2, 4)
where 'M' = substring(商品コード, 1 ,1)

--43
select substring(注文番号, 9, 4) as 注文番号
from 注文
where substring(注文番号, 9, 4) >= '1000'
	and substring(注文番号, 9, 4) <= '2000'
order by 注文番号

--44
update 廃番商品
set 廃番日 = current_date
where 商品コード = 'S1990'

--45
select 商品コード, 商品名, 単価, trunc(単価 * 0.7, 0) AS 値下げした単価
from 商品
where 単価 >= 10000
