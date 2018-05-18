module Bingo exposing (..)

import Html


{- All Elm apps must have a `main` function - this is
   the entry point to the application.
-}
-- main =
--     Html.text (String.repeat 3 (String.toUpper "Bingo!"))
-- Instead of the above, can use pipe operator as expected:
-- main =
--     "Bingo!"
--         |> String.toUpper
--         |> String.repeat 3
--         |> Html.text


main =
    "Bingo"
        |> String.toUpper
        |> Html.text
