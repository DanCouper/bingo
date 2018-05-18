module Bingo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


playerInfo : String -> Int -> String
playerInfo name gameNumber =
    name ++ " - Game #" ++ (toString gameNumber)



{-
   Note that msg is a specific kind of type that the HTML
   can send in response to events (onClick etc).
-}


viewPlayer : String -> Int -> Html msg
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
