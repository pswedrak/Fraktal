module GenerateString
    ( generateSingle,
      generateFull,
    )
where

generateSingle :: String -> String -> String
generateSingle [] _ = []
generateSingle (head:tail) secondString = case head of
   'F' -> secondString ++ (generateSingle tail secondString)
   '+' -> '+' : (generateSingle tail secondString)
   '-' -> '-' : (generateSingle tail secondString)
   _   -> error "Illegal character"
   
      
generateFull :: String -> Integer -> String -> String
generateFull firstString 0 _ = firstString
generateFull firstString n secondString = generateFull (generateSingle firstString secondString) (n-1) secondString