module Demo.Lib where

import GHC.Generics

{-@ type Pos = {v:Int | 0 < v} @-}

{-@ incr :: Pos -> Pos @-}
incr :: Int -> Int
incr x = x + 1

class Foo a where
  bar :: (a p -> b) -> a p -> b

instance Foo f => Foo (M1 i c f) where
  bar f = bar (f . M1) . unM1
