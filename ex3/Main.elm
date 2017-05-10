module Main exposing (..)

import Html exposing (program)
import Components.View exposing (..)
import Components.Model exposing (..)
import Components.Update exposing (..)
import Components.Request exposing (..)


main : Program Never Model Msg
main =
    program
        { init = ( { players = [], visiblePlayers = [], filterType = "None" }, getAllPlayers )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
