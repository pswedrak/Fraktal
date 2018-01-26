module QuickchecksSpec(spec) where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import Test.QuickCheck.Arbitrary

--additional quickcheck tests for other functions

main :: IO()
main =  hspec $ spec

not :: Bool -> Bool
not True = False
not False = True

and :: Bool -> Bool -> Bool
and False _ = False
and _ False = False
and True True = True

or :: Bool -> Bool -> Bool
or True _ = True
or _ True = True
or False False = False

spec =  do 
  describe "Propositions" $ do
    it "Addition is commutative" $ property $
	   \x y ->  ((x + y) :: Int) == ((y + x) :: Int)
	
    it "Addition is associative" $ property $
	   \x y z ->  ((x + y) + z :: Int) == (x + (y + z) :: Int)
	
    it "De Morgan's laws" $ property $
	   \x y ->  (QuickchecksSpec.not (x `QuickchecksSpec.and` y) :: Bool) == ((QuickchecksSpec.not x) `QuickchecksSpec.or` (QuickchecksSpec.not y) :: Bool)
	   
    it "De Morgan's laws" $ property $
	   \x y ->  (QuickchecksSpec.not (x `QuickchecksSpec.or` y) :: Bool) ==  ((QuickchecksSpec.not x) `QuickchecksSpec.and` (QuickchecksSpec.not y) :: Bool)

    it "Adding a number and additive inverse of another number gives their difference" $ property $
	   \x y ->  ((x + (-y)) :: Int) == ((x - y) :: Int)

    it "Distributive law" $ property $
	   \x y z ->  ((x + y) * z :: Int) == ((x*z + y*z) :: Int)
  
    it "Multiplication is commutative" $ property $
	   \x y ->  ((x * y) :: Int) == ((y * x) :: Int)
  
