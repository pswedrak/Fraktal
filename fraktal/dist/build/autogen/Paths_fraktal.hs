{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_fraktal (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\piotr\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\piotr\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.2\\fraktal-0.1.0.0-3plMYxoFJci1KH4K9WraDY"
dynlibdir  = "C:\\Users\\piotr\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Users\\piotr\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.2\\fraktal-0.1.0.0"
libexecdir = "C:\\Users\\piotr\\AppData\\Roaming\\cabal\\fraktal-0.1.0.0-3plMYxoFJci1KH4K9WraDY\\x86_64-windows-ghc-8.2.2\\fraktal-0.1.0.0"
sysconfdir = "C:\\Users\\piotr\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fraktal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fraktal_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "fraktal_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "fraktal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fraktal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fraktal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
