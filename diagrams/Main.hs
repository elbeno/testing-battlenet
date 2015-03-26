{-# LANGUAGE NoMonomorphismRestriction, TypeFamilies #-}

import Diagrams.Prelude
import Diagrams.Backend.Cairo.CmdLine

import qualified Diagram1 as D1
import qualified Diagram2 as D2
import qualified Diagram3 as D3
import qualified Diagram4 as D4

page :: Diagram B R2
page = square 1 # scaleX (14.0/9.0) # fc white # lcA transparent

page' :: Double -> Diagram B R2
page' h = square 1 # scaleX (14.0/h) # fc white # lcA transparent

main :: IO ()
main = multiMain [("D1", D1.diag # centerXY <> page' 8.0)
                 , ("D2", D2.diag # centerXY <> page' 8.0)
                 , ("D3", D3.diag # centerXY <> page' 8.0)
                 , ("D4", D4.diag # centerXY <> page' 8.0)
                 ]
