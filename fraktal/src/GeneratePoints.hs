{-|
Module      : GeneratePoints
Description : Generating list of fractal's points
Copyright   : (c) Joanna Chyży, 2018
                  Piotr Swędrak, 2018
License     : GPL-3
Maintainer  : piotrekswedrak@gmail.com
Stability   : experimental
-}

module GeneratePoints
     ( generatePoints
     )
where

-- | Function 'generatePoints' generates list of points based on String argument where
-- first argument is initial position (point), 
-- the second is @startAngle@ in radians,
-- the third is @changeAngle@ in radians which refers to '+' and '-' characters in String argument,
-- the fourth is String which contains only 'F', '+' and '-' characters, 
-- the fifth is @n@ which is the length of the line (distance between two points in list)
generatePoints :: (Double,Double) -> Double -> Double -> String -> Double -> [(Double,Double)]
generatePoints (x, y) _ _ [] n = []
generatePoints (x, y) startAngle changeAngle (head:tail) n = case head of 
    'F' -> [((n * cos (startAngle) + x), (n * sin (startAngle) + y))]++ generatePoints ((n * cos (startAngle) + x), (n * sin (startAngle) + y)) startAngle changeAngle tail n
    '+' -> generatePoints (x, y) (startAngle + changeAngle) changeAngle tail n
    '-' -> generatePoints (x, y) (startAngle - changeAngle) changeAngle tail n
   
  
