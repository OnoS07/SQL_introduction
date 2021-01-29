--55
select 商品コード, 商品名, 単価, 
	(select sum(数量) as 販売数量
	 from 注文
	 where 商品コード = 'S0604'
	)
from 商品
where 商品コード = 'S0604'

--56
update 注文
set 商品コード = (
	select 商品コード
	from 商品
	where 商品区分 = '2'
		and 商品名 like '%ブーツ%'
		and 商品名 like '%雨%'
		and 商品名 like '%安心%'
	)
where 注文日 = '20180315'
	and 注文番号 = '201803150014'
	and 注文枝番 = '1'

--57
select 注文日, 商品コード
from 注文
where 商品コード in (
	select 商品コード
	from 商品
	where 商品名 like '%あったか%'
)
order by 注文日

--58
select 商品コード, sum(数量) as 販売数量
from 注文
group by 商品コード
	having sum(数量) > all(
		select avg(数量)
		from 注文
		group by 商品コード
	)

--59
SELECT 割引注文.販売数量 AS 割引による販売数 ,
	TRUNC(割引注文.割引料合計 / 割引注文.販売数量 , 0) AS 平均割引額
FROM (
	SELECT SUM(数量) AS 販売数量, SUM(クーポン割引料) AS 割引料合計
		FROM 注文
		WHERE 商品コード = 'W0746'
			AND クーポン割引料 IS NOT NULL) AS 割引注文

--60
INSERT INTO 注文
SELECT 注文日, 注文番号, MAX(注文枝番) + 1, 'S1003', 1, NULL
FROM 注文
WHERE 注文日 = '2018-03-21'
	AND 注文番号 = '201803210080'
	GROUP BY 注文日, 注文番号;