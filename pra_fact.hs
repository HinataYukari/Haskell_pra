fact,fact',fact'',fact''',fact'''',fact''''',fact'''''' :: Int -> Int

-- オーソドックスな再帰による定義
fact 0 = 1
fact n = n * (fact (n-1))

-- ガードを用いて（ガードはBool!）
fact' n  | n == 0 = 1
         | n >= 1 = n * fact' (n-1)
   
-- 配列の関数、便利だ
fact'' 0 = 1
fact'' n = product [1..n]

-- caseを用いて（caseは値のパターンマッチ）
fact''' n = case n of
    0 -> 1
    otherwise -> n * fact''' (n-1)

-- 畳み込みその１
fact'''' 0 = 1
fact'''' n = foldl (*) 1 [1..n]

-- 畳み込みその２
fact''''' 0 = 1
fact''''' n = foldl1 (*) [1..n]

-- 一行で
fact'''''' n = if n == 0 then 1 else n * fact'''''' (n-1)
