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
            _ | cmd == "add" || cmd == "sub" -> case xs of  -- Using guards in case pattern matching: https://stackoverflow.com/a/40836465 ("Guards are simply constraints for patterns") and https://wiki.haskell.org/Let_vs._Where
                    [] -> putStrLn "Give me two numbers"
                    x:[] -> putStrLn "One more number!"
                    x:y:ys -> putStrLn . show $ op x y where  -- Function with guards inside a where: https://stackoverflow.com/questions/13327374/haskell-defining-a-function-with-guards-inside-a-where
                        op m n
                            | cmd == "add" = (read x :: Int) + (read y :: Int)
                            | cmd == "sub" = (read x :: Int) - (read y :: Int)
              | otherwise -> putStrLn "Unknown command"

-- Guard in "let expression": https://stackoverflow.com/a/59778615
