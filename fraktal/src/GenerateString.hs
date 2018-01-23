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
generateFull desc 0 _ = desc
generateFull desc n secondString = generateFull (generateSingle desc secondString) (n-1) secondString

