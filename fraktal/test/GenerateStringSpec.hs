module GenerateStringSpec (spec) where

import Test.Hspec
import GenerateString

main :: IO()
main =  hspec $ spec

spec =  do 
  describe "generateSingle" $ do
    it "String generated from the empty strings should be empty" $ do
      generateSingle [] [] `shouldBe` ([]) 

    it "F replaced by F should be F" $ do
      generateSingle "F" "F" `shouldBe` ("F")

    it "String replaced by [] should be []" $ do
      generateSingle "F" [] `shouldBe` ([])

    it "[] replaced by String should be []" $ do
      generateSingle [] "F" `shouldBe` ([])

    it "F+F+F replaced by F-F should be F-F+F-F+F-F" $ do
      generateSingle "F+F+F" "F-F" `shouldBe` ("F-F+F-F+F-F")

    it "F--F+F replaced by F++F should be F--F+F++F--F+F" $ do
      generateSingle "F--F+F" "F++F" `shouldBe` ("F++F--F++F+F++F")
  
    it "F replaced by F--F+F+F should be F--F+F+F" $ do
      generateSingle "F" "F--F+F+F" `shouldBe` ("F--F+F+F")

    it "F+FFFF-F replaced by F should be F+FFFF-F" $ do
      generateSingle "F+FFFF-F" "F" `shouldBe` ("F+FFFF-F")

  describe "generateFull" $ do
    it "String should not change after 0 iterations" $ do
      generateFull "F++" 0 "F" `shouldBe` ("F++") 
 
    it "String should not change after 1 iterations if second String is F" $ do
      generateFull "F++" 1 "F" `shouldBe` ("F++") 
  
    it "F replaced by F+F--F after 1 iteration should be F+F--F" $ do
      generateFull "F" 1 "F+F--F" `shouldBe` ("F+F--F") 
  
    it "F replaced by F+F--F after 2 iterations should be F+F--F+F+F--F--F+F--F" $ do
      generateFull "F" 2 "F+F--F" `shouldBe` ("F+F--F+F+F--F--F+F--F") 
