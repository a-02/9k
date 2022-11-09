{-# LANGUAGE OverloadedStrings #-}
module Style where

import Clay
import Clay.Geometry
import Clay.Stylesheet

rootStyle = render $ do
  body ? do
    margin nil nil nil nil
    height $ pct 100
  img ? do
    display block
    height $ pct 100
    width $ pct 100
  star # byClass "planetary" ? do
    position relative
  star # byClass "intergalactic" ? do
    position absolute
    top $ px 200
    left $ px 300
    borderRadius (px 100) (px 100) (px 100) (px 100)
    height $ px 100
    opacity $ 50
