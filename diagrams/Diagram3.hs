{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE TypeFamilies #-}
module Diagram3 where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

-- diagram 1: class hierarchy for gamequeue

diagScale = 0.2
textScale = diagScale * 0.21

stringWidth :: String -> Double
stringWidth s = l / (textScale * 55)
  where l = fromIntegral $ length s

boxclass :: String -> Double -> Diagram B R2
boxclass s x = text s # fontSizeN textScale # font "inconsolata" # fc blue
               <> square 1 # scaleX (stringWidth s)

uml :: Diagram B R2
uml = boxclass "GameQueueBase" 4 # named "1"
      ===
      strutY 1.4
      ===
      boxclass "GameQueueImpl" 4 # named "2"

diag :: Diagram B R2
diag = uml # connectOutside' (with & arrowHead .~ tri
                                   & headStyle %~ lw medium . lc black . fc white) "2" "1"
       # scale diagScale
