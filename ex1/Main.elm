module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (Time, millisecond, second)
import Task


type Status
    = Running
    | Expired


type Msg
    = CurrentTime Time


type alias Model =
    { status : Status
    , time : Int
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CurrentTime now ->
            let
                status =
                    if model.time == 1 then
                        Expired
                    else
                        Running
            in
                { model
                    | time = model.time - 1
                    , status = status
                }
                    ! [ Cmd.none ]


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.status of
        Running ->
            Time.every second CurrentTime

        Expired ->
            Sub.none


currentTime : Cmd Msg
currentTime =
    Task.perform CurrentTime Time.now


css : Html msg
css =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "style.css"
            ]

        children =
            []
    in
        node tag attrs children


view : Model -> Html Msg
view model =
    div []
        [ css
        , case model.status of
            Running ->
                div [ class "center-div" ] [ text (toString model.time) ]

            Expired ->
                div [ class "center-div" ] [ h3 [] [ text "Welcome to Krawd!" ] ]
        ]


main : Program Never Model Msg
main =
    program
        { init = ( { status = Running, time = 4 }, currentTime )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
