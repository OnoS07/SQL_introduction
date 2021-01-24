--6
SELECT * FROM 商品
WHERE 商品コード = 'W1252';

--7
UPDATE 商品
SET 単価 = 500
	WHERE 商品コード = 'S0023';

--8
SELECT * FROM 商品
WHERE 単価 <= 1000

--9
SELECT * FROM 商品
WHERE 単価 >= 50000

--10
SELECT * FROM 注文
WHERE 注文日 >= '2018-01-01'

--11
SELECT * FROM 注文
WHERE 注文日 < '2017-12-01'

--12
SELECT * FROM 商品
WHERE NOT 商品区分 = 1

--13
SELECT * FROM 注文
WHERE クーポン割引料 IS NULL

--14
DELETE FROM  商品
WHERE 商品コード LIKE 'N%' 

--15
