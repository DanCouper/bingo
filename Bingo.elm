module Bingo exposing (..)

import Html


{-
   Note the toString. The type inference will detect
   that the two args must be strings, and without toString,
   if a number is passed, the function will fail to type check.


   Note as well that named functions are just sugar for
   named anonymous functions. So the following is identical to:

       playerInfo = \name gameNumber -> name ++ " - Game #" ++ (toString gameNumber)
-}


playerInfo : String -> a -> String
playerInfo name gameNumber =
    name ++ " - Game #" ++ (toString gameNumber)


playerInfoText : String -> a -> Html.Html msg
playerInfoText name gameNumber =
    playerInfo name gameNumber
        |> String.toUpper
        |> Html.text


main : Html.Html msg
main =
    playerInfoText "Dan" 1
