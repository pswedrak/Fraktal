{-|
Module      : W
Description : Short description
Copyright   : (c) Some Guy, 2013
                  Someone Else, 2014
License     : GPL-3
Maintainer  : sample@email.com
Stability   : experimental
Portability : POSIX

Here is a longer description of this module, containing some
commentary with @some markup@.
-}

module GeneratePointsSpec (spec) where

import Test.Hspec
import GeneratePoints

main :: IO()
main = hspec $ spec

spec = do
  describe "generatePoints" $ do
    it "List generated from the empty list should be empty" $ do
      generatePoints (1.0, 1.0) 0  0 [] 1 `shouldBe` ([])

    it "Generating list" $ do
      generatePoints (0.0, 0.0) 0  0 "F" 1 `shouldBe` ([(1.0,0.0)])	  
	  
    it "Generating list" $ do
      generatePoints (0.0, 0.0) 0  0 "F" 2 `shouldBe` ([(2.0,0.0)])	  
	  	  
    it "Generating list" $ do
      generatePoints (0.0, 0.0) 0  0 "FFF" 1 `shouldBe` ([(1.0,0.0),(2.0,0.0),(3.0,0.0)])	  	  
	  
    it "Generating list" $ do
      generatePoints (0.0, 0.0) 0  1.0471975511965976  "F+F" 1 `shouldBe` ([(1.0,0.0),(1.5,0.8660254037844386)])
 