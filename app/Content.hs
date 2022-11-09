{-# LANGUAGE OverloadedStrings #-}

module Content where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Text

rootContent = renderHtml $ do
  docType
  link ! rel "stylesheet" ! href "/root.css"
  img ! src "1.png"

soundContent = renderHtml $ do
  docType
  link ! rel "stylesheet" ! href "/sound.css"
  p "help"
