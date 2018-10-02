module Page.Home exposing (Model, Msg(..), init, subscriptions, toSession, update, view)

import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Route)
import Session exposing (Session)



-- MODEL


type alias Model =
    { session : Session
    , message : String
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , message = "Welcome to the Home Page!"
      }
    , Cmd.none
    )



-- VIEW


view model =
    { title = "Home"
    , content =
        div [ class "container-fluid" ]
            [ div [ class "container" ]
                [ div [ class "jumbotron mt-5" ]
                    [ text model.message
                    , br [] []
                    , a [ Route.href Route.Login ] [ text "Go to the Login Page" ]
                    ]
                ]
            ]
    }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- EXPORT


toSession : Model -> Session
toSession model =
    model.session
