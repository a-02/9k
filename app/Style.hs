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
