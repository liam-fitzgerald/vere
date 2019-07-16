module Noun
    ( module Noun.Core
    , module Noun.Convert
    , module Noun.Conversions
    , module Noun.Atom
    , module Noun.Jam
    , module Noun.Cue
    , module Noun.TH
    , _Cue
    , loadFile
    ) where

import ClassyPrelude
import Control.Lens

import Noun.Atom
import Noun.Conversions
import Noun.Convert
import Noun.Core
import Noun.Cue
import Noun.Jam
import Noun.TH

--------------------------------------------------------------------------------

_Cue :: Prism' ByteString Noun
_Cue = prism' jamBS (eitherToMaybe . cueBS)
  where
    eitherToMaybe (Left _)  = Nothing
    eitherToMaybe (Right x) = Just x

data LoadErr = CueErr DecodeErr
             | ParseErr Text
  deriving (Eq, Ord, Show)

loadFile :: ∀a. FromNoun a => FilePath -> IO (Either LoadErr a)
loadFile pax = do
    bs <- readFile pax
    case cueBS bs of
      Left e  -> pure $ Left (CueErr e)
      Right n -> case fromNounErr n of
                   Left e  -> pure $ Left (ParseErr e)
                   Right x -> pure $ Right x
