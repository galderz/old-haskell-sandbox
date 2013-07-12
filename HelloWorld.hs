import Data.Char  
  
main = do  
    putStrLn "What's your first name?"  
    firstName <- getLine  -- `<-` when you want to bind results of I/O actions to names
    putStrLn "What's your last name?"  
    lastName <- getLine  
    let bigFirstName = map toUpper firstName -- let bindings to bind pure expressions to names
        bigLastName = map toUpper lastName  
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"  