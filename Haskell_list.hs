-- List関連の関数を再実装

-- take
mytake :: Int -> [a] -> [a]
mytake 0 _ = []
mytake _ [] = []
mytake n (x:xs) = x:(mytake (n-1) xs)

-- drop
mydrop :: Int -> [a] -> [a]
mydrop 0 xs = xs
mydrop _ [] = []
mydrop n (x:xs) = mydrop (n-1) xs

-- 基底書いて再帰

-- reverse
myreverse :: [a] -> [a]
myreverse xs = foldl (flip (:)) [] xs
-- stylishに

-- length
mylength :: [a] -> Int
mylength = sum . map (const 1)
-- stylishに
-- ここ二つは再帰とか畳み込みがオーソドックスか？

-- head
myhead :: [a] -> a
myhead (x:xs) = x
myhead [] = error "Empty List!"
-- パターンマッチ(ほかに思いつかない)
-- 以下ではからのリストに対しての処理を省きます

-- last
mylast,mylast',mylast'' :: [a] -> a

mylast (x:[]) = x
mylast (x:xs) = mylast xs
-- オーソドックスに再帰で
mylast' all@(x:xs) = head $ drop (length xs) all
-- as構文を用いて直感的に
mylast'' = head . reverse
-- 関数合成を用いて

-- tail
mytail,mytail' :: [a] -> [a]
mytail (x:xs) = xs
-- パターンマッチ
mytail' = drop 1
-- 直感的

-- init
myinit,myinit' :: [a] -> [a]
myinit (x:[]) = []
myinit (x:xs) = x : (myinit xs)
-- オーソドックスに再帰で
myinit' xs = take ((length xs) - 1) xs
-- 直感的

-- maximum
mymaximum :: (Ord a) => [a] -> a
mymaximum = foldl1 (\acc x -> if x > acc then x else acc)
-- 畳み込み、見込みあり！(minimumは不等号を<にすれば良い)

-- elem
myelem :: (Eq a) => a -> [a] -> Bool
myelem a = foldl (\acc x -> if x == a then True else acc) False
-- 畳み込み、ぐう有能

-- おまけ

-- 以下のようにフィボナッチ数列をかけるとようつべの動画で見ました
fibo = 1:1:(zipWith (+) fibo (tail fibo))
-- これに割と感動し他のでトリボナッチでも同じことをして見ました
tribo = 0:0:1:(zipWith (+) tribo $ zipWith (+) (tail tribo) (tail $ tail tribo))

-- しかし、これだと割と遅い...改善案を模索中
