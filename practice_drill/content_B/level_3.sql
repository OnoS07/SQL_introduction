--25
SELECT 商品コード, 商品名 FROM 商品
	WHERE 商品区分 = 1
	ORDER BY 商品コード DESC

--26
SELECT * FROM 注文
	WHERE 注文日 >= '2018-03-01'
	ORDER BY 注文日, 注文番号, 注文枝番

--27
SELECT DISTINCT 商品コード FROM 注文
	ORDER BY 商品コード

--28
SELECT 注文日 FROM 注文
ORDER BY 注文日 DESC
LIMIT 10

--29
SELECT * FROM 商品
ORDER BY 単価, 商品区分, 商品コード
OFFSET 5 FETCH FIRST 15 ROWS ONLY

--30
SELECT * FROM 廃番商品
	WHERE (廃番日 BETWEEN '2016-12-1' AND '2016-12-31')
	OR 売上個数 >= 100
	ORDER BY 売上個数 DESC

--31
SELECT 商品コード FROM 商品
	EXCEPT
	SELECT 商品コード FROM 注文
ORDER BY 1

--32
SELECT 商品コード FROM 商品
	INTERSECT
	SELECT 商品コード FROM 注文
ORDER BY 1 DESC

--33
SELECT 商品コード, 商品名, 単価 FROM 商品
	WHERE 商品区分 = 9 AND 単価 <= 1000
UNION
	SELECT 商品コード, 商品名, 単価 FROM 商品
		WHERE 商品区分 = 9 AND 単価 >= 10000
ORDER BY 単価, 商品コード 