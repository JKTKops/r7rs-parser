module Val where

import qualified Data.Vector as V
import qualified Data.Vector.Unboxed as U
import Data.Complex

import Data.Word (Word8)

data Val
  = Symbol String
  | IString String
  | Char Char
  | Bool Bool

  | Number !Number

  | Nil
  | IPair Val Val
  | IVector !(V.Vector Val)
  | IByteVector !(U.Vector Word8)
  
  | Unspecified
  deriving Show

data Number
  = Real RealNumber
  | Complex (Complex RealNumber)
  deriving Show

data RealNumber
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

mkByteVec :: [Word8] -> Val
mkByteVec = IByteVector . U.fromList
