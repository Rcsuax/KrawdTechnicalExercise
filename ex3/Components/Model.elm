module Components.Model exposing (..)

import Http


type Msg
    = Search String
    | GetPlayers (Result Http.Error (List Player))
    | SetFilter String


type alias Model =
    { players : List Player
    , visiblePlayers : List Player
    , filterType : String
    }


type alias Player =
    { game_id : Maybe Int
    , score : Maybe Int
    , id : Maybe Int
    , name : String
    , created_at : Maybe String
    , updated_at : Maybe String
    , location : Maybe String
    , latitude : Maybe Float
    , longitude : Maybe Float
    , country : Maybe String
    , state : Maybe String
    , sub_state : Maybe String
    , city : Maybe String
    , slug : Maybe String
    , twitter : Maybe String
    , youtube : Maybe String
    , wiki : Maybe String
    , characters_index : String
    , teams_index : Maybe String
    , rank : Int
    , character1_slug : Maybe String
    , character1_img : Maybe String
    , character2_slug : Maybe String
    , character2_img : Maybe String
    , character3_slug : Maybe String
    , character3_img : Maybe String
    , team1_slug : Maybe String
    , team1_name : Maybe String
    , country_code : Maybe String
    , game_slug : String
    }


transformMaybe : Maybe String -> String
transformMaybe input =
    if input /= Nothing then
        String.dropLeft 6 (toString input) |> String.dropRight 1
    else
        "n/a"
