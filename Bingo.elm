module Bingo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL
{-
   NOTE the records can be accesed as expected using dot notation - `initialModel.name`.
   BUT they can also be accessed like `.name initialModel`. This latter way creates an
   anonymous function from the field key that accepts the record. This comes in useful
   later on.
-}


intialModel =
    { name = "Dan"
    , gameNumber = 1
    , entries = intialEntries
    }


intialEntries =
    [ { id = 1, phrase = "Future-Proof", points = 100, marked = False }
    , { id = 2, phrase = "Doing Agile", points = 200, marked = False }
    ]



-- VIEW


playerInfo : String -> Int -> String
playerInfo name gameNumber =
    name ++ " - Game #" ++ (toString gameNumber)


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



-- view : Html msg


view model =
    main_ [ class "content" ]
        [ viewHeader "Buzzword Bingo"
        , viewPlayer model.name model.gameNumber
        , section [ class "debug" ] [ text (toString model) ]
        , viewFooter
        ]


main : Html msg
main =
    view intialModel
