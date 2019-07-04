module Main where

import Util
import System.Environment (getArgs)

-- Add your own command line flags and options here.
data Flag
  = ShowVersion
  | ShowUsage
  | BadArgs
  deriving (Eq)


main :: IO ()
main = 
    getArgs >>= parse >>= handleArgs


{-
 The command line options are given as an array of strings.
 
 Parse them here and hand down other information the
 user passes by extending the types&data wrapped 
 in brackets to tuples. 
 
     Example:
 
         parse :: [String] -> IO (Maybe String, Flag)
         parse args =
             case args of
                  ["-user", userName] -> return (Just userName, Greet)
-}
parse :: [String] -> IO (Flag)
parse args =
    case args of
        [_, "-v", _] -> return (ShowVersion)
        []           -> return (ShowUsage)
        _            -> return (BadArgs)

{-
 The parsed data then get's consumed by this function which
 calls the appropiate top level function with the correct data.
 
 The type of the argument should match the return type
 of 'parse'. 

     Example:

         handleArgs :: (Flag) -> IO ()
         handleArgs :: (Maybe String, Flag)
         handleArgs args =
             case args of
                  [Just userName, Greet] -> greetTheUserWith userName
-}
handleArgs :: (Flag) -> IO ()
handleArgs args = 
    case args of
        (ShowVersion) -> version >> exit
        (ShowUsage)   -> usage   >> exit
        (BadArgs)     -> badArgs >> exitOhNo
