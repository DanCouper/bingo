module Bingo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- MODEL


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
    , Entry 3 "In The Cloud" 300 False
    , Entry 4 "Rockstar Ninja" 400 False
    ]



-- UPDATE


type Msg
    = NewGame


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewGame ->
            { model | gameNumber = model.gameNumber + 1 }



-- VIEW


playerInfo : String -> Int -> String
playerInfo name gameNumber =
    name ++ " - Game #" ++ (toString gameNumber)


viewPlayer : String -> Int -> Html Msg
viewPlayer name gameNumber =
    let
        playerInfoText =
            playerInfo name gameNumber
                |> String.toUpper
                |> text
    in
        h2 [ id "info", class "classy" ] [ playerInfoText ]


viewHeader : String -> Html Msg
viewHeader title =
    header []
        [ h1 [] [ text title ] ]


viewEntryItem : Entry -> Html Msg
viewEntryItem entry =
    li []
        [ span [ class "phrase" ] [ text entry.phrase ]
        , span [ class "points" ] [ text (toString entry.points) ]
        ]


viewEntryList : List Entry -> Html Msg
viewEntryList entries =
    let
        listEntries =
            List.map viewEntryItem entries
    in
        ul [] listEntries


viewFooter : Html Msg
viewFooter =
    footer []
        [ a [ href "https://elm-lang.org" ] [ text "Powered by Elm" ] ]


view : Model -> Html Msg
view model =
    main_ [ class "content" ]
        [ viewHeader "Buzzword Bingo"
        , viewPlayer model.name model.gameNumber
        , viewEntryList model.entries
        , div [ class "button-group" ]
            [ button [ onClick NewGame ] [ text "New Game" ] ]
        , section [ class "debug" ] [ text (toString model) ]
        , viewFooter
        ]



-- This won't work, it's static. It needs to be wired up...
-- main : Html Msg
-- main =
--     view intialModel
-- ...SO:


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = intialModel
        , view = view
        , update = update
        }
