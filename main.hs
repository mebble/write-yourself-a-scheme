module Main where
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> putStrLn "Please give me a command line argument"
        cmd:xs -> case cmd of
            "greet" -> do
                putStrLn "\"Hi, I'm main.hs. What's your name?\""  -- same as >>
                name <- getLine                                    -- same as >>=
                putStrLn $ "\"Hi, " ++ name ++ "!\""
            _ | cmd == "add" || cmd == "sub" -> case xs of  -- Using guards with case pattern matching: https://stackoverflow.com/a/40836465 and https://wiki.haskell.org/Let_vs._Where
                    [] -> putStrLn "Give me two numbers"
                    x:[] -> putStrLn "One more number!"
                    x:y:ys -> putStrLn . show $ op x y where
                        op m n
                            | cmd == "add" = (read x :: Int) + (read y :: Int)
                            | cmd == "sub" = (read x :: Int) - (read y :: Int)
              | otherwise -> putStrLn "Unknown command"

