{-# LANGUAGE UnicodeSyntax, NoImplicitPrelude #-}

-------------------------------------------------------------------------------
-- |
-- Module      :  Data.Text.Lazy.IO.ExplicitIOModes
-- Copyright   :  (c) 2010 Bas van Dijk
-- License     :  BSD3 (see the file LICENSE)
-- Maintainer  :  Bas van Dijk <v.dijk.bas@gmail.com>
--
-- This module lifts the lazy 'Text' IO operations to handles with explicit
-- IOModes.
--
-------------------------------------------------------------------------------

module Data.Text.Lazy.IO.ExplicitIOModes
    ( hGetLine
    , hGetContents

    , hPutStr
    , hPutStrLn
    ) where


-------------------------------------------------------------------------------
-- Imports
-------------------------------------------------------------------------------

-- from base:
import System.IO ( IO )

-- from text:
import Data.Text.Lazy ( Text )

import qualified Data.Text.Lazy.IO as T ( hGetLine
                                        , hGetContents

                                        , hPutStr
                                        , hPutStrLn
                                        )

-- from explicit-iomodes:
import System.IO.ExplicitIOModes ( Handle
                                 , ReadModes, WriteModes
                                 )
import System.IO.ExplicitIOModes.Unsafe ( wrap, wrap2 )


-------------------------------------------------------------------------------
-- Text I/O with file handles with explicit IOModes
-------------------------------------------------------------------------------

-- | Wraps @Data.Text.IO.'T.hGetLine'@.
hGetLine ∷ ReadModes ioMode ⇒ Handle ioMode → IO Text
hGetLine = wrap T.hGetLine

-- | Wraps @Data.Text.IO.'T.hGetContents'@.
hGetContents ∷ ReadModes ioMode ⇒ Handle ioMode → IO Text
hGetContents = wrap T.hGetContents


-- | Wraps @Data.Text.IO.'T.hPutStr'@.
hPutStr ∷ WriteModes ioMode ⇒ Handle ioMode → Text → IO ()
hPutStr = wrap2 T.hPutStr

-- | Wraps @Data.Text.IO.'T.hPutStrLn'@.
hPutStrLn ∷ WriteModes ioMode ⇒ Handle ioMode → Text → IO ()
hPutStrLn = wrap2 T.hPutStrLn


-- The End ---------------------------------------------------------------------
