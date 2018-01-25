{-|
Module      : GenerateString
Description : Generating string describing fractal
Copyright   : (c) Joanna Chyży, 2018
                  Piotr Swędrak, 2018
License     : GPL-3
Maintainer  : piotrekswedrak@gmail.com
Stability   : experimental
-}


module GenerateString
    ( generateSingle,
      generateFull,
    )
where

-- | Function 'generateSingle' generates String by replacing every 'F' character in first argument @firstString@
-- by @secondString@.
generateSingle :: String -> String -> String
generateSingle [] _ = []
generateSingle (head:tail) secondString = case head of
   'F' -> secondString ++ (generateSingle tail secondString)
   '+' -> '+' : (generateSingle tail secondString)
   '-' -> '-' : (generateSingle tail secondString)
   _   -> error "Illegal character"
   
-- | Function 'generateFull' generates String by replacing every 'F' character in @firstString@
-- by @secondString@ @n@ times (iterations), which means that in each iteration @firstString@
-- is a String generated from previous iteration.
generateFull :: String -> Integer -> String -> String
generateFull firstString 0 _ = firstString
generateFull firstString n secondString = generateFull (generateSingle firstString secondString) (n-1) secondString