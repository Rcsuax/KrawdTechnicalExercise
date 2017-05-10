module Components.Request exposing (..)

import Components.Model exposing (..)
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
        |: (Json.field "game_id" (Json.maybe Json.int))
        |: (Json.field "score" (Json.maybe Json.int))
        |: (Json.field "id" (Json.maybe Json.int))
        |: (Json.field "name" Json.string)
        |: (Json.field "created_at" (Json.maybe Json.string))
        |: (Json.field "updated_at" (Json.maybe Json.string))
        |: (Json.field "location" (Json.maybe Json.string))
        |: (Json.field "latitude" (Json.maybe Json.float))
        |: (Json.field "longitude" (Json.maybe Json.float))
        |: (Json.field "country" (Json.maybe Json.string))
        |: (Json.field "state" (Json.maybe Json.string))
        |: (Json.field "sub_state" (Json.maybe Json.string))
        |: (Json.field "city" (Json.maybe Json.string))
        |: (Json.field "slug" (Json.maybe Json.string))
        |: (Json.field "twitter" (Json.maybe Json.string))
        |: (Json.field "youtube" (Json.maybe Json.string))
        |: (Json.field "wiki" (Json.maybe Json.string))
        |: (Json.field "characters_index" Json.string)
        |: (Json.field "teams_index" (Json.maybe Json.string))
        |: (Json.field "rank" Json.int)
        |: (Json.field "character1_slug" (Json.maybe Json.string))
        |: (Json.field "character1_img" (Json.maybe Json.string))
        |: (Json.field "character2_slug" (Json.maybe Json.string))
        |: (Json.field "character2_img" (Json.maybe Json.string))
        |: (Json.field "character3_slug" (Json.maybe Json.string))
        |: (Json.field "character3_img" (Json.maybe Json.string))
        |: (Json.field "team1_slug" (Json.maybe Json.string))
        |: (Json.field "team1_name" (Json.maybe Json.string))
        |: (Json.field "country_code" (Json.maybe Json.string))
        |: (Json.field "game_slug" Json.string)
