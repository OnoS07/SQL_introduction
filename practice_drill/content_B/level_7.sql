--61
select 注文T.注文番号, 注文T.注文枝番, 注文T.商品コード, 商品T.商品名, 注文T.数量
from 注文 as 注文T
join 商品 as 商品T
	on 注文T.商品コード = 商品T.商品コード
where 注文T.注文番号 = '201801130115'
order by 注文T.注文番号, 注文T.注文枝番

--62
select 注文T.注文日, 注文T.注文番号, 注文T.注文枝番, 注文T.数量 , 廃番T.単価 * 注文T.数量 as 注文金額 
from 注文 as 注文T
join 廃番商品 as 廃番T
	on 注文T.商品コード = 廃番T.商品コード
where 注文T.商品コード = 'A0009'
	and 注文T.注文日 > 廃番T.廃番日

--63
select S.商品コード, S.商品名, S.単価,
	T.注文日, T.注文番号, T.数量,
	S.単価 * T.数量 as 売上金額
from 商品 as S
join 注文 as T
	on S.商品コード = T.商品コード
where S.商品コード = 'S0604'
order by T.注文日

--64
select S.商品コード, S.商品名, T.注文日
from 商品 as S
join 注文 as T
	on S.商品コード = T.商品コード
where T.注文日 between '2016-08-01' and '2016-08-31'

--65
select coalesce(S.商品名, '廃番') as 商品名, T.商品コード
from 注文 as T
	left join 商品 as S
	on T.商品コード = S.商品コード
where T.注文日 between '2016-08-01' and '2016-08-31'

--66
select T.注文日, S.商品コード,
	S.商品コード || ':' || S.商品名 as 商品名,
	coalesce(T.数量, 0) as 数量
from 商品 as S
	left join 注文 as T
	on S.商品コード = T.商品コード
where S.商品区分 = '3'

--67
select T.注文日,
	coalesce(S.商品コード || ':' || S.商品名, T.商品コード || '(:廃番済み)') AS 商品,
	coalesce(T.数量 , 0) AS 数量
from 注文 as T
	full join 商品 as S
	on T. 商品コード = S. 商品コード
where S. 商品区分 = '3'

--68
select T.注文日, T.注文番号, T.注文枝番, T.商品コード,
	coalesce(S.商品名, H.商品名) as 商品名, 
	coalesce(S.単価, H.単価) as 単価, 
	T.数量,
	coalesce(S.単価, H.単価) * T.数量 - 
		coalesce(T.クーポン割引料, 0) as 注文金額
from 注文 as T
	left join 商品 as S
	on T.商品コード = S.商品コード
		left join 廃番商品 as H
		on T.商品コード = H.商品コード
where 注文番号 = '201704030010'

--69
select S.商品コード, S.商品名, S.単価, coalesce(T.数量, 0) as 売上数量,
	S.単価 * coalesce(T.数量, 0) as 販売金額
from 商品 as S
	left join (
		select 商品コード, sum(数量) as 数量
		from 注文
		where 商品コード like 'B%'
		group by 商品コード
	) as T
	on S.商品コード = T.商品コード
where S.商品コード like 'B%'
order by S.商品コード

--70
select S1.商品コード, S1.商品名, S1.関連商品コード,
	S2.商品名 as 関連商品名
from 商品 as S1
	join 商品 as S2
	on S1.関連商品コード = S2.商品コード