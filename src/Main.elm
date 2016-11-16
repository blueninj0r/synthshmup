import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main : Program Never
main = 
    Html.program 
        { init = init 
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
    
{- 
    MODEL
    * Model type 
    * Initialize model with empty values
-}

type alias Model =
    { message : String 
    }
    
init : (Model, Cmd Msg)
init =
    ( Model "", Cmd.none )

{-
    UPDATE
    * Messages
    * Update case
-}

type Msg = NewMessage

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NewMessage ->
            ( { model | message = model.message ++ "A quote! " }, Cmd.none )
            
{-
    VIEW
-}

view : Model -> Html Msg
view model =
    div [ class "container" ] [
        h2 [ class "text-center" ] [ text "Hello World" ]
        , p [ class "text-center" ] [
            button [ class "btn btn-success", onClick NewMessage ] [ text "Get a new message!" ]
        ]
        -- Blockquote with quote
        , blockquote [] [ 
            p [] [text model.message] 
        ]
    ]