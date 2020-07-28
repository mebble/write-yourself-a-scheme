module Main where
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> putStrLn "Please give me a command line argument"
        cmd:xs -> case cmd of
            "add" -> case xs of
                x:y:ys -> putStrLn . show $ (read x :: Int) + (read y :: Int)
                x:[] -> putStrLn "One more number!"
                [] -> putStrLn "Give me two numbers"
            "sub" -> case xs of
                x:y:ys -> putStrLn . show $ (read x :: Int) - (read y :: Int)
                x:[] -> putStrLn "One more number!"
                [] -> putStrLn "Give me two numbers"
            "greet" -> do
                putStrLn "\"Hi, I'm main.hs. What's your name?\""  -- same as >>
                name <- getLine                                    -- same as >>=
                putStrLn $ "\"Hi, " ++ name ++ "!\""
            _ -> putStrLn "Unknown command"

