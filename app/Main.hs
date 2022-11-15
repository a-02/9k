{-# LANGUAGE OverloadedStrings #-}

module Main where

import Content
import qualified Clay as CSS
import qualified Data.Text.Lazy.IO as TLIO
import Network.Wai.Handler.Warp as Warp
import Network.Wai.Middleware.RequestLogger
import Network.Wai.Middleware.Static
import Style
import Web.Scotty as S

main :: IO ()
main = do
  TLIO.writeFile "./root.css" rootStyle
  app <- S.scottyApp nkvc
  Warp.run 23457 app 

nkvc :: ScottyM ()
nkvc = do
  middleware logStdoutDev
  middleware static
  get "/"  (html rootContent)
  get "/sound" (html soundContent)
  get "/home" (html homeContent)
  -- 9999, the other webserver! who needs loadbalancing, just spread it across ports
  get "/9999" (redirect "http://9k.vc:9999")
