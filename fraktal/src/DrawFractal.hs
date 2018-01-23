module DrawFractal
     ( drawFractal
    )

where
import Graphics.Gloss

drawFractal list = display FullScreen white (Line (map (\(x,y) -> (realToFrac x, realToFrac y)) list))
   

