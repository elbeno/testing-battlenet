{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE TypeFamilies #-}
module Diagram2 where

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

-- diagram 2: composition for DI

diagScale = 0.2
textScale = diagScale * 0.21

stringWidth :: String -> Double
stringWidth s = l / (textScale * 55)
  where l = fromIntegral $ length s

boxclass :: String -> Double -> Diagram B R2
boxclass s x = text s # fontSizeN textScale # font "inconsolata" # fc blue
               <> square 1 # scaleX (stringWidth s)

uml :: Diagram B R2
uml = boxclass "Logic" 2 # named "1"
      ===
      ((strutX 0.3) ||| (strutY 0.2 === text "*" # fontSizeN 0.03))
      ===
      vrule 1
      ===
      ((strutX 0.3) ||| (text "1" # fontSizeN 0.02 === strutY 0.2))
      ===
      boxclass "Interactions" 4 # named "2"

diag :: Diagram B R2
diag = uml # connectOutside' (with & arrowHead .~ noHead) "2" "1"
       # scale diagScale
