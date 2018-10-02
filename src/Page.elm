module Page exposing (Page(..), view, viewFooter, viewHeader)

import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Route)


type Page
    = Other
    | Login
    | Home
    | AboutUs


view : Page -> { title : String, content : Html msg } -> Document msg
view page { title, content } =
    { title = title ++ " - Elements"
    , body = viewHeader :: content :: [ viewFooter ]
    }


viewHeader : Html msg
viewHeader =
    header []
        [ nav [ class "navbar navbar-expand-lg navbar-dark bg-dark" ]
            [ div [ class "container" ]
                [ a [ Route.href Route.Home, class "navbar-brand" ] [ text "Elm App" ]
                , button
                    [ class "navbar-toggler"
                    , type_ "button"
                    , attribute "data-toggle" "collapse"
                    , attribute "data-target" "headerNavBar"
                    ]
                    [ span [ class "navbar-toggler-icon" ] [] ]
                , div
                    [ class "collapse navbar-collapse", id "headerNavBar" ]
                    [ div [ class "navbar-nav" ]
                        [ a [ Route.href Route.Home, class "nav-item nav-link active" ] [ text "Home" ]
                        , a [ Route.href Route.AboutUs, class "nav-item nav-link" ] [ text "About Us" ]
                        ]
                    ]
                , div [] [ a [ Route.href Route.Login, class "nav-item nav-link" ] [ text "Login" ] ]
                ]
            ]
        ]


viewFooter : Html msg
viewFooter =
    footer
        [ class "container-fluid" ]
        [ div [ class "container" ]
            [ text "This is the footer." ]
        ]
