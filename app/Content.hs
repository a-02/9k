{-# LANGUAGE OverloadedStrings #-}

module Content where

import Prelude hiding (div, id)
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

homeContent = renderHtml $ do
  docType
  link ! rel "stylesheet" ! href "/home.css"
  -- todo: make this a sequence_
  div ! class_ "planetary" $ do
    div ! class_ "1" ! id "1" $ "show"
    div ! class_ "2" ! id "2" $ "me"
    div ! class_ "3" ! id "3" $ "what"
    div ! class_ "4" ! id "4" $ "youre"
    div ! class_ "5" ! id "5" $ "good"
    div ! class_ "6" ! id "6" $ "for"
    

