{-|
Module      : DrawFractal
Description : Drawing fractal
Copyright   : (c) Joanna Chyży, 2018
                  Piotr Swędrak, 2018
License     : GPL-3
Maintainer  : piotrekswedrak@gmail.com
Stability   : experimental
-}

module DrawFractal
     ( drawFractal
    )

where
import Graphics.Gloss

-- | Function 'drawFractal' takes list of points and generates picture by using 'Line' function from
-- Graphics.Gloss and displays the result
drawFractal list = display FullScreen white (Line (map (\(x,y) -> (realToFrac x, realToFrac y)) list))
   

