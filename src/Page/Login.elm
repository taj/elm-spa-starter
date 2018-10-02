module Page.Login exposing (Form, Model, Msg(..), init, subscriptions, toSession, update, updateForm, view, viewForm)

import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Route exposing (Route)
import Session exposing (Session)



-- MODEL


type alias Model =
    { session : Session
    , form : Form
    }


type alias Form =
    { email : String
    , password : String
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , form = { email = "", password = "" }
      }
    , Cmd.none
    )



-- VIEW


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Login"
    , content =
        div [ class "container-fluid" ]
            [ div [ class "container" ]
                [ div [ class "jumbotron mt-5" ]
                    [ h1 [] [ text "Login" ]
                    , viewForm model.form
                    , a [ Route.href Route.Home ] [ text "or go back to the Home Page" ]
                    ]
                ]
            ]
    }


viewForm : Form -> Html Msg
viewForm form =
    Html.form []
        [ div [ class "form-group" ]
            [ input
                [ class "form-control"
                , placeholder "Email"
                , onInput EnteredEmail
                , value form.email
                ]
                []
            ]
        , div [ class "form-group" ]
            [ input
                [ class "form-control"
                , type_ "password"
                , placeholder "Password"
                , onInput EnteredPassword
                , value form.password
                ]
                []
            ]
        , button [ type_ "submit", class "btn btn-primary" ] [ text "Login" ]
        ]



-- UPDATE


type Msg
    = EnteredEmail String
    | EnteredPassword String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EnteredEmail email ->
            updateForm (\form -> { form | email = email }) model

        EnteredPassword password ->
            updateForm (\form -> { form | password = password }) model


updateForm : (Form -> Form) -> Model -> ( Model, Cmd Msg )
updateForm transform model =
    ( { model | form = transform model.form }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- EXPORT


toSession : Model -> Session
toSession model =
    model.session
