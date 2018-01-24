module Main where

import Graphics.Gloss
import GenerateString
import GeneratePoints
import DrawFractal

main :: IO ()

main = do
  putStrLn "First string: "
  first <- getLine
  putStrLn "Second string: "
  second <- getLine
  putStrLn "Iterations : "
  n <- getLine
  let iterations = (read n :: Integer)
  putStrLn "Length: "
  n2 <- getLine
  let length = (read n2 :: Double)
  putStrLn "Change angle: "
  n3 <- getLine
  let changeAngle = (read n3 :: Double)
  let string = generateFull first iterations second --string opisujący obliczanie liczby punktow
  let points = generatePoints (0,0) 0 changeAngle string length
  drawFractal points
 
  
  
  
  
