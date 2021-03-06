port module Form exposing (..)

import Html.App
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (id, href, target, placeholder, type', for, value, class, disabled, classList)
import Bootstrap.Html exposing (containerFluid_, row_, colLg_, colLgOffset_, colSm_, colSmOffset_, colXsOffset_)


view model =
    containerFluid_
        [ row_
            [ div [ id "contact" ]
                [ colLgOffset_ 12
                    0
                    8
                    2
                    6
                    3
                    4
                    4
                    [ form
                        [ id "form"
                        , classList
                            [ ( "hidden", model.status == "chatting" )
                            ]
                        ]
                        [ h1 [] [ text "contact" ]
                        , label [ for "name" ] [ text "name: " ]
                        , input
                            [ id "name-field"
                            , type' "name"
                            , value model.name
                            , onInput (\str -> { msgType = "name", payload = str })
                            ]
                            []
                        , label [ for "email-field" ] [ text "email: " ]
                        , input
                            [ id "email-field"
                            , type' "text"
                            , value model.email
                            , onInput (\str -> { msgType = "email", payload = str })
                            ]
                            []
                        , div [ onClick ({ msgType = "start", payload = "" }), class "button" ] [ text "start chat" ]
                        ]
                    , div
                        [ id "chat-window"
                        , classList
                            [ ( "hidden", model.status == "none" )
                            ]
                        ]
                        [ div [ id "messages" ] []
                        , input
                            [ id "chat-input"
                            , type' "text"
                            , placeholder "type message here..."
                            , value model.input
                            , disabled True
                            , onInput (\str -> { msgType = "input", payload = str })
                            ]
                            []
                        ]
                    ]
                ]
            ]
        , row_
            [ div [ class "references__container row" ]
                [ h1 [ class "references__header" ]
                    [ text "built with" ]
                , div [ class "references" ]
                    [ colXsOffset_ 2
                        0
                        [ a
                            [ class "reference__link"
                            , href "https://www.twilio.com/"
                            , target "_blank"
                            ]
                            [ div [ class "reference reference--twilio" ]
                                [ div [ class "reference__logo" ]
                                    []
                                , div [ class "reference__name" ]
                                    [ text "twilio" ]
                                ]
                            ]
                        ]
                    , colXsOffset_ 2
                        1
                        [ a
                            [ class "reference__link"
                            , href "https://api.slack.com/"
                            , target "_blank"
                            ]
                            [ div [ class "reference reference--slack" ]
                                [ div [ class "reference__logo" ]
                                    []
                                , div [ class "reference__name" ]
                                    [ text "slack" ]
                                ]
                            ]
                        ]
                    , colXsOffset_ 2
                        1
                        [ a
                            [ class "reference__link"
                            , href "http://elm-lang.org/"
                            , target "_blank"
                            ]
                            [ div [ class "reference reference--elm" ]
                                [ div [ class "reference__logo" ]
                                    []
                                , div [ class "reference__name" ]
                                    [ text "elm" ]
                                ]
                            ]
                        ]
                    , colXsOffset_ 2
                        1
                        [ a
                            [ class "reference__link"
                            , href "https://github.com/TylerAckerson/contact_bot"
                            , target "_blank"
                            ]
                            [ div [ class "reference reference--github" ]
                                [ div [ class "reference__logo" ]
                                    []
                                , div [ class "reference__name" ]
                                    [ text "source" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


port start : String -> Cmd msg


initialModel =
    { name = "", email = "", input = "", status = "none" }


main =
    Html.App.program
        { init = ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


update msg model =
    if msg.msgType == "start" then
        ( { model | status = "chatting" }, start model.name )
    else if msg.msgType == "name" then
        ( { model | name = msg.payload }, Cmd.none )
    else if msg.msgType == "email" then
        ( { model | email = msg.payload }, Cmd.none )
    else if msg.msgType == "input" then
        ( { model | input = msg.payload }, Cmd.none )
    else
        ( model, Cmd.none )
