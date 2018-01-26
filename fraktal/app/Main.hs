module Main where

import Graphics.Gloss
import GenerateString
import GeneratePoints
import DrawFractal

-- | Function 'main' puts on the screen instructions for the user and takes values:
-- two Strings describing a fractal, number of iterations, length of the line, and change angle.
-- It calls functions from other modules and finally 'drawFractal' function which displays generated fractal.
main :: IO ()
main = do
  putStrLn "Input two strings describing a fractal using 'F', '+', '-' "
  putStrLn "First string: "
  first <- getLine
  putStrLn "Second string: "
  second <- getLine
  putStrLn "Number of iterations:  "
  n <- getLine
  let iterations = (read n :: Integer)
  putStrLn "Length: "
  n2 <- getLine
  let length = (read n2 :: Double)
  putStrLn "Change angle [DEG]: "
  n3 <- getLine
  let changeAngle = (read n3 :: Double)
  let string = generateFull first iterations second 
  let points = [(0,0)] ++ generatePoints (0,0) 0 (changeAngle * pi / 180) string length
  
  drawFractal points
 
  
  
  
  
