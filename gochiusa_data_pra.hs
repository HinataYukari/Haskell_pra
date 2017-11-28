-- ごちうさで代数的データ型の練習

-- イメージカラーに使う
data Color = Pink | Sky | Purple | Green | Yellow deriving (Show, Eq)

-- もふもふ関数に使う（後述）
data Sister = Little | None | Big deriving (Show, Eq, Ord)

-- 型シノニム
type Name       = String
type Place      = String
type Imagedrink = String

-- 本体
data Character = Character
                {name       :: Name,
                 place      :: Place,
                 imagecolor :: Color,
                 imagedrink :: Imagedrink,
                 issister   :: Sister
                } deriving (Show, Eq)


cocoa, chino, chiya, rize, syaro :: Character
cocoa = Character {name = "Cocoa", place = "Rabbithouse", imagedrink = "Hot Cocoa"     , imagecolor = Pink,   issister = Big   }
chino = Character {name = "Chino", place = "Rabbithouse", imagedrink = "Cappuccino"    , imagecolor = Sky ,   issister = Little}
rize  = Character {name = "Rize" , place = "Rabbithouse", imagedrink = "Thé des Alizés", imagecolor = Purple, issister = None  }
chiya = Character {name = "Chiya", place = "Amausaan"   , imagedrink = "Uji Matcha"    , imagecolor = Green,  issister = None  }
syaro = Character {name = "Syaro", place = "Fluer"      , imagedrink = "Kilimanjaro"   , imagecolor = Yellow, issister = None  }

-- 来店時の挨拶(パターンマッチが肝)
greet :: Character -> String
greet (Character hername herplace _ herdrink _) = "Welocome to " ++ herplace ++ "! I'm " ++ hername ++ ". I recommend " ++ herdrink ++ "."

-- 二人の関係からもふもふするかどうかを判断（rize chinoの時にリゼがちゃん呼びしてしまうのは勘弁）
mohumohu :: Character -> Character -> String
mohumohu x y = if (issister x > issister y)
                then name x ++ ": " ++ name y ++ "-chan mohumohu!"
                else "Don't mohumohu please...!"
