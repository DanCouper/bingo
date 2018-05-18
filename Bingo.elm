module Bingo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


playerInfo : String -> a -> String
playerInfo name gameNumber =
    name ++ " - Game #" ++ (toString gameNumber)


viewPlayer : String -> a -> Html msg
viewPlayer name gameNumber =
    let
        playerInfoText =
            playerInfo name gameNumber
                |> String.toUpper
                |> text
    in
        h2 [ id "info", class "classy" ] [ playerInfoText ]


viewHeader : String -> Html msg
viewHeader title =
    header []
        [ h1 [] [ text title ] ]



{-
   Technically, this and `view` aren't functions, they're
   definitions, just values. But as values are immutable in
   Elm, and functions are stateless, the distinction doesn't
   really matter in practice
-}


viewFooter : Html msg
viewFooter =
    footer []
        [ a [ href "https://elm-lang.org" ] [ text "Powered by Elm" ] ]


view : Html msg
view =
    main_ [ class "content" ]
        [ viewHeader "Buzzword Bingo"
        , viewPlayer "Dan" 1
        , viewFooter
        ]


main : Html msg
main =
    view
