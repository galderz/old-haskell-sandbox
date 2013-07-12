module Paths_haskell_sandbox (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/g/Go/demos/haskell-sandbox/cabal-dev//bin"
libdir     = "/Users/g/Go/demos/haskell-sandbox/cabal-dev//lib/haskell-sandbox-0.1.0.0/ghc-7.4.2"
datadir    = "/Users/g/Go/demos/haskell-sandbox/cabal-dev//share"
libexecdir = "/Users/g/Go/demos/haskell-sandbox/cabal-dev//libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_sandbox_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_sandbox_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_sandbox_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_sandbox_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
