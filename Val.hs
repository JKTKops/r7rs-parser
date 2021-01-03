module Val where

import qualified Data.Vector as V

data Val
  = Symbol String
  | IString String
  | Char Char
  | Bool Bool

    -- ideally we'd unpack these, but GHC still doesn't support
    -- unpacking sum type constructors into a bigger type.
    -- That's unfortunate but understandable :/
  | Number !Number
  | Complex !Number !Number

  | Nil
  | IPair Val Val
  | IVector !(V.Vector Val)
  
  | Unspecified
  deriving Show

data Number
  = Bignum {-# UNPACK #-}!Integer
  | Flonum {-# UNPACK #-}!Double
  | Ratnum {-# UNPACK #-}!Rational
  deriving Show

mkList :: [Val] -> Val
mkList = flip mkImpropList Nil

mkImpropList :: [Val] -> Val -> Val
mkImpropList = flip $ foldr IPair

mkVec :: [Val] -> Val
mkVec = IVector . V.fromList