module Util where

import System.Exit (ExitCode (..), exitWith, exitSuccess)

{-
 Print information about the program to the screen.

 Fill in your own text below.
-}
usage, complain, version, badArgs :: IO ()
usage    = putStrLn "My cool usage description"
complain = putStrLn "My cool error message\n"
version  = putStrLn "my cool version number\n"
badArgs  = usage >> complain

-- | Give back a meaningful status to host OS.
exit, exitOhNo :: IO a
exit      = exitSuccess
exitOhNo  = exitWith $ ExitFailure 1
