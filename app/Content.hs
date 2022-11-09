{-# LANGUAGE OverloadedStrings #-}

module Content where

import Prelude hiding (div)
import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Text

rootContent = renderHtml $ do
  docType
  link ! rel "stylesheet" ! href "/root.css"
  script ! src "/root.js" $ ""
  div ! class_ "planetary" $ do
    img ! src "1.png" 
    div ! class_ "intergalactic" $ ""

soundContent = renderHtml $ do
  docType
  link ! rel "stylesheet" ! href "/sound.css"
  p "help"
