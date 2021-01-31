-- 65
SELECT 取引.口座番号, 取引.日付, 取引事由.取引事由名,
	COALESCE(取引.入金額, 取引.出金額) AS 取引金額
FROM 取引
JOIN 取引事由
ON 取引.取引事由id = 取引事由.取引事由id
	WHERE 取引.口座番号 IN ('0311240', '1234161', '2750902')
	ORDER BY 口座番号, 取引番号

-- 66
select K.口座番号, K.名義, K.残高,
	T.日付, T.入金額, T.出金額
from 口座 as K
	join 取引 as T
	on K.口座番号 = T.口座番号
where K.口座番号 = '0887132'

-- 67
SELECT 口座.口座番号, 口座.名義, 口座.残高
FROM 口座
JOIN 取引
ON 口座.口座番号 = 取引.口座番号
	WHERE 取引.日付 = '2016-03-01'

-- 68
SELECT 取引.口座番号,
       COALESCE(口座.名義, '解約済み') AS 名義,
       COALESCE(口座.残高, 0) AS 残高
  FROM 取引
  LEFT JOIN 口座
         ON 取引.口座番号 = 口座.口座番号
 WHERE 取引.日付 = '2016-03-01'

-- 69
select 取引番号,
	T.取引事由id ||':'|| coalesce(J.取引事由名, 'その他') as 取引事由,
	日付, 口座番号, 入金額, 出金額
from 取引 as T
	left join 取引事由 as J
	on T.取引事由id = J.取引事由id

--70
select distinct T.取引事由id, J.取引事由名
from 取引 as T
	full join 取引事由 as J
	on T.取引事由id = J.取引事由id
order by T.取引事由id

--71
select K.口座番号, K.名義, K.残高,
	T.日付, T.入金額, T.出金額, J.取引事由名
from 口座 as K
	join 取引 as T
	on K.口座番号 = T.口座番号
	join 取引事由 as J
	on T.取引事由id = J.取引事由id
where K.口座番号 = '0887132'
order by T.日付

--72
select K.口座番号, K.名義, K.残高,
	T.日付, T.取引事由id, T.入金額, T.出金額
from 口座 as K
	join 取引 as T
	on K.口座番号 = T.口座番号
where K.残高 >= 5000000
	and (T.出金額 >= 1000000 or T.入金額 >= 1000000)
	and T.日付 > '2018-01-01'

--73
select K.口座番号, K.名義, K.残高,
       T.日付, T.取引事由ID, T.入金額, T.出金額
from 口座 as K
	join (
		select 口座番号, 日付, 取引事由id, 入金額, 出金額
		from 取引
		where 日付 >= '2018-01-01'
			and (入金額 >= 1000000 OR 出金額 >= 1000000)
	) as T
    on K.口座番号 = T.口座番号
 where K.残高 >= 5000000

 --74
select K.口座番号, K.名義, T.回数 as 取引回数
from 口座 as K
	join (
		select 口座番号, count(*) as 回数
		from 取引
		group by 口座番号, 日付
			having count(*) >= 3
	) as T
	on T.口座番号 = K.口座番号

--75
select distinct K1.名義, K1.口座番号, K1.残高, K1.更新日
from 口座 as K1
	join 口座 as K2
	on K1.名義 = K2.名義
where K1.口座番号 != K2.口座番号
order by K1.名義, K1.口座番号