-- ごちうさで代数的データ型の練習

-- イメージカラーに使う
data Color = Pink | Sky | Purple | Green | Yellow deriving (Show, Eq)

-- もふもふ関数に使う（後述）
data Sister = Little | None | Big deriving (Show, Eq, Ord)

-- 本体
data Character = Character
                {name :: String,
                place :: String,
                imagecolor :: Color,
                issister :: Sister
                } deriving (Show, Eq)

-- 型シノニム（今回は使用せず）
type Name = String
type Place = String

cocoa, chino, chiya, rize, syaro :: Character
cocoa = Character {name = "Cocoa", place = "Rabbithouse", imagecolor = Pink,   issister = Big   }
chino = Character {name = "Chino", place = "Rabbithouse", imagecolor = Sky ,   issister = Little}
rize  = Character {name = "Rize" , place = "Rabbithouse", imagecolor = Purple, issister = None  }
chiya = Character {name = "Chiya", place = "Amausaan"   , imagecolor = Green,  issister = None  }
syaro = Character {name = "Syaro", place = "Fluer"      , imagecolor = Yellow, issister = None  }

-- 来店時の挨拶(パターンマッチが肝)
greet :: Character -> String
greet (Character hername herplace _ _) = "Welocome to " ++ herplace ++ "! I'm " ++ hername ++ "."

-- 二人の関係からもふもふするかどうかを判断（rize chinoの時にリゼがちゃん呼びしてしまうのは勘弁）
mohumohu :: Character -> Character -> String
mohumohu x y = if (issister x > issister y)
                then name x ++ ": " ++ name y ++ "-chan mohumohu!"
                else "Don't mohumohu please...!"
