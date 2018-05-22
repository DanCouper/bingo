module Bingo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL
{-
   Type aliases also act as record constructors: for example, the signature of
   Model is going to be `<function> : String -> Int -> List Entry -> Model`,
   Entry is going to be `<function> : Int -> String -> Int -> Bool -> Entry`,
   so can be called like `Entry 1 "Hello, World!" 500, False`.
-}


type alias Model =
    { name : String
    , gameNumber : Int
    , entries : List Entry
    }


type alias Entry =
    { id : Int
    , phrase : String
    , points : Int
    , marked : Bool
    }


intialModel : Model
intialModel =
    { name = "Dan"
    , gameNumber = 1
    , entries = intialEntries
    }


intialEntries : List Entry
intialEntries =
    [ Entry 1 "Future-Proof" 100 False
    , Entry 2 "Doing Agile" 200 False
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


view : Model -> Html msg
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
