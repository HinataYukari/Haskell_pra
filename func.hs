fact,fact',fact'',fact''',fact'''',fact''''',fact'''''' :: Int -> Int

fact 0 = 1
fact n = n * (fact (n-1))

fact' n  | n == 0 = 1
         | n >= 1 = n * fact' (n-1)

fact'' 0 = 1
fact'' n = product [1..n]

fact''' n = case n of
    0 -> 1
    otherwise -> n * fact''' (n-1)

fact'''' 0 = 1
fact'''' n = foldl (*) 1 [1..n]

fact''''' 0 = 1
fact''''' n = foldl1 (*) [1..n]

fact'''''' n = if n == 0 then 1 else n * fact'''''' (n-1)
