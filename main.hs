module Main where
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> putStrLn ("Please give me a command line argument")
        _ -> putStrLn ("Hello, " ++ args !! 0)
