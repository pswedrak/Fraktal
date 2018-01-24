module GeneratedPointsSpec (main, spec) where

import Test.Hspec
import GeneratePoints

main :: IO()
main = hspec spec

spec = do
  describe "generatePoints" $ do
    it "List generated from the empty list should be empty" $ do
      generatePoints (1.0, 1.0) 0 [] 1 `shouldBe` ([])
