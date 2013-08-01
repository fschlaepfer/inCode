{-# LANGUAGE OverloadedStrings #-}

module Web.Blog.Views.Entry (viewEntry) where

-- import Data.Maybe
import Control.Monad.Reader
import Data.Monoid
import Text.Blaze.Html5 ((!))
import Text.Pandoc
import Web.Blog.Models
import Web.Blog.Render
import qualified Data.Text as T
import qualified Data.Text.Lazy as L
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

viewEntry :: Entry -> SiteRender H.Html
viewEntry entry =
  return $ do

    H.article $ do
      
      H.header $ do

        H.h1 $ H.toHtml $ entryTitle entry

        H.h4 $ H.toHtml $ entryDescription entry

      H.div ! A.class_ "main-content" $ do

        H.preEscapedToHtml $ writeHtmlString (def WriterOptions) $
          readMarkdown (def ReaderOptions) $ T.unpack $ entryContent entry

      H.footer $
        mempty

      H.div ! A.class_ "post-entry" $
        mempty
