module Page.NotFound exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view : { title : String, content : Html msg }
view =
    { title = "Page Not Found"
    , content =
        main_ [ id "content", class "container", tabindex -1 ]
            [ h1 [] [ text "Error 404 - Page Not Found" ]
            ]
    }
