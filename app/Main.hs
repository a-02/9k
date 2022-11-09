{-# LANGUAGE OverloadedStrings #-}

module Main where

import Content
import qualified Clay as CSS
import qualified Data.Text.Lazy.IO as TLIO
import Network.Wai.Middleware.RequestLogger
import Network.Wai.Middleware.Static
import Style
import Web.Scotty as S

main :: IO ()
main = do
  TLIO.writeFile "./root.css" rootStyle
  S.scotty 80 $ nkvc

nkvc :: ScottyM ()
nkvc = do
  middleware logStdoutDev
  middleware static
  get "/"  (html rootContent)
  get "/sound" (html soundContent)