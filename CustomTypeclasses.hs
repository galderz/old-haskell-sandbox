-- class Eq a where -- class is for defining new typeclasses
--    (==) :: a -> a -> Bool  
--    (/=) :: a -> a -> Bool  
--    x == y = not (x /= y)  
--    x /= y = not (x == y)  

-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses

data TrafficLight = Red | Yellow | Green  

instance Eq TrafficLight where  -- instance is for making our types instances of typeclasses
    Red == Red = True  
    Green == Green = True  
    Yellow == Yellow = True  
    _ == _ = False  

instance Show TrafficLight where  
    show Red = "Red light"  
    show Yellow = "Yellow light"  
    show Green = "Green light"  

class YesNo a where  
    yesno :: a -> Bool  

instance YesNo Int where  
    yesno 0 = False  
    yesno _ = True 

instance YesNo [a] where  
    yesno [] = False  
    yesno _ = True 

instance YesNo Bool where  
    yesno = id  

instance YesNo (Maybe a) where  
    yesno (Just _) = True  
    yesno Nothing = False

instance YesNo TrafficLight where  
    yesno Red = False  
    yesno _ = True  

yesnoIf :: (YesNo y) => y -> a -> a -> a  
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult  