main = do   
    line <- getLine  
    if null line  
        then return ()  -- not like a normal return, creates an action that doesn't do anything. Ends program here (http://learnyouahaskell.com/input-and-output)
        else do  
            putStrLn $ reverseWords line  
            main  
  
reverseWords :: String -> String  
reverseWords = unwords . map reverse . words 