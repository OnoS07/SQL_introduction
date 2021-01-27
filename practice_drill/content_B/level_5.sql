--46
select sum(数量) as 数量合計
from 注文

--47
select 注文日, sum(数量) as 合計数量
from 注文
group by 注文日
order by 注文日

--48
select 商品区分, max(単価) as 最高額, min(単価) as 最小額
from 商品
group by 商品区分
order by 商品区分

--49
select 商品コード, sum(数量) as 注文合計
from 注文
group by 商品コード
order by 商品コード

--50
select 商品コード, sum(数量) as 販売数量
from 注文
group by 商品コード
order by 販売数量 desc, 商品コード limit 10

--51
select 商品コード, sum(数量) as 販売数量
from 注文
group by 商品コード
	having sum(数量) <= 5

--52
select count(クーポン割引料) as 割引件数, sum(クーポン割引料) as 割引金額
from 注文

--53
select substring(注文番号, 1, 6) as 年月, count(*) as 注文件数
from 注文
where 注文枝番 = 1
group by substring(注文番号, 1, 6)
order by substring(注文番号, 1, 6)

--54
select 商品コード, sum(数量) as 販売数量
from 注文
where 商品コード like 'Z%'
group by 商品コード
	having sum(数量) >= 100

