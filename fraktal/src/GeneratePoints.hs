module GeneratePoints
	( generatePoints
	)
where

generatePoints :: (Double,Double) -> Double -> String -> Double -> [(Double,Double)]
generatePoints (x, y) _ [] n = []
generatePoints (x, y) angle (head:tail) n = case head of 
    'F' -> [((n * cos (angle) + x), (n * sin (angle) + y))]++ generatePoints ((n * cos (angle) + x), (n * sin (angle) + y)) angle tail n
    '+' -> generatePoints (x, y) (angle+(pi/3)) tail n
    '-' -> generatePoints (x, y) (angle-(pi/3)) tail n
   
  
