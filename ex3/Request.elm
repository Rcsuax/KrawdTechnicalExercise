module Request exposing (..)

import Model exposing (..)
import Http
import Json.Decode as Json
import Json.Decode.Extra exposing ((|:))


getAllPlayers : Cmd Msg
getAllPlayers =
    Http.get "http://localhost:3000/players" decodePlayersList
        |> Http.send GetPlayers


decodePlayersList : Json.Decoder (List Player)
decodePlayersList =
    Json.list decodePlayers


decodePlayers : Json.Decoder Player
decodePlayers =
    Json.succeed Player
        |: (Json.field "name" Json.string)
        |: (Json.field "country" Json.string)
        |: (Json.field "characters_index" Json.string)
        |: (Json.field "rank" Json.int)
