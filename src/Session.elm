module Session exposing (Session, fromViewer, navKey)

import Browser.Navigation as Nav



-- TYPES


type alias Session =
    { key : Nav.Key }


navKey : Session -> Nav.Key
navKey session =
    session.key



-- CHANGES


fromViewer : Nav.Key -> Session
fromViewer key =
    { key = key }
