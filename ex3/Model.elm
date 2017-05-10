module Model exposing (..)

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
    { name : String
    , country : String
    , characters_index : String
    , rank : Int
    }
