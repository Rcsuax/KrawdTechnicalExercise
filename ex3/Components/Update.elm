module Components.Update exposing (..)

import Components.Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetPlayers (Ok response) ->
            { model
                | players = response
                , visiblePlayers = response
            }
                ! [ Cmd.none ]

        Search input ->
            if input == "" then
                { model | visiblePlayers = model.players } ! [ Cmd.none ]
            else
                case model.filterType of
                    "Name" ->
                        let
                            visiblePlayers =
                                (filterName model.players input)
                        in
                            { model | visiblePlayers = visiblePlayers } ! [ Cmd.none ]

                    "Country" ->
                        let
                            visiblePlayers =
                                (filterCountry model.players input)
                        in
                            { model | visiblePlayers = visiblePlayers } ! [ Cmd.none ]

                    _ ->
                        model ! [ Cmd.none ]

        SetFilter type_ ->
            { model | filterType = type_ } ! [ Cmd.none ]

        GetPlayers (Err error) ->
            model ! [ Cmd.none ]


filterName : List Player -> String -> List Player
filterName players input =
    List.filter (\n -> n.name == input) players


filterCountry : List Player -> String -> List Player
filterCountry players input =
    List.filter (\n -> (Components.Model.transformMaybe n.country) == input) players
