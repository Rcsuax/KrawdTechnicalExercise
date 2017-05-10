module Main exposing (..)

import Html exposing (program)
import View exposing (..)
import Model exposing (..)
import Update exposing (..)
import Request exposing (..)


main : Program Never Model Msg
main =
    program
        { init = ( { players = [], visiblePlayers = [], filterType = "None" }, getAllPlayers )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
