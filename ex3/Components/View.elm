module Components.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Components.Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ searchType
        , search model
        , renderPlayers model
        ]


search : Model -> Html Msg
search model =
    if model.filterType == "None" then
        input [ type_ "text", placeholder "Search", onInput Search, disabled True ] []
    else
        input [ type_ "text", placeholder "Search", onInput Search ] []


searchType : Html Msg
searchType =
    select [ onInput SetFilter ]
        [ option [ value "None" ] [ text "None" ]
        , option [ value "Country" ] [ text "Country" ]
        , option [ value "Name" ] [ text "Name" ]
        ]


renderPlayers : Model -> Html Msg
renderPlayers model =
    List.map renderPlayer model.visiblePlayers |> table []


renderPlayer : Player -> Html Msg
renderPlayer player =
    tr []
        [ td [] [ text (toString (player.rank)) ]
        , td [] [ text player.name ]
        , td [] [ text (Components.Model.transformMaybe player.country) ]
        , td [] [ text player.characters_index ]
        ]


sortPlayers : List Player -> List Player
sortPlayers players =
    List.sortBy .rank players
