{-# LANGUAGE OverloadedStrings #-}

module Web.Blog.Routes.About (
    routeAbout
  ) where

import Control.Monad.IO.Class
import Web.Blog.Database
import Web.Blog.Models.Types
import Web.Blog.Models.Util
import Web.Blog.Render
import Web.Blog.Types
import Web.Blog.Views.About

routeAbout :: RouteEither
routeAbout = do
  let
    view = viewAbout

  return $ Right (view,pageData)

