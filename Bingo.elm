module Bingo exposing (..)

import Html

{- All Elm apps must have a `main` function - this is
   the entry point to the application. -}
main =
    Html.text "Hello, World!"

{- This can be ran and recompiled etc using the `elm reactor`
   CLI program. This is great for quick feedback, but breaks
   down with apps dependent on external CSS/JS etc. -}