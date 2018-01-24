module GeneratePoints
     ( generatePoints
     )
where

-- | @generatePoints@ generates..
generatePoints :: (Double,Double) -> Double -> Double -> String -> Double -> [(Double,Double)]
generatePoints (x, y) _ _ [] n = []
generatePoints (x, y) startAngle changeAngle (head:tail) n = case head of 
    'F' -> [((n * cos (startAngle) + x), (n * sin (startAngle) + y))]++ generatePoints ((n * cos (startAngle) + x), (n * sin (startAngle) + y)) startAngle changeAngle tail n
    '+' -> generatePoints (x, y) (startAngle + changeAngle) changeAngle tail n
    '-' -> generatePoints (x, y) (startAngle - changeAngle) changeAngle tail n
   
  
