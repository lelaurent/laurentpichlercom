module HomePage exposing (main)

import Elmstatic
import Html exposing (Html, div, img, p, text)
import Html.Attributes exposing (alt, class, src)
import Json.Decode as Decode
import Page


type alias HomePage =
    { content : String
    , siteTitle : String
    , title : String
    , heroText : String
    }


decodeHomePage : Decode.Decoder HomePage
decodeHomePage =
    Decode.map4 HomePage
        Elmstatic.decodeContent
        (Decode.field "siteTitle" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "heroText" Decode.string)


main : Elmstatic.Layout
main =
    Elmstatic.layout decodeHomePage <|
        \content ->
            Ok <|
                Page.view
                    content.title
                    [ Page.viewMarkdown content.content ]
                    (viewHero content.heroText)


viewHero : String -> List (Html Never)
viewHero heroText =
    [ div
        [ class "mt-4 w-40 m-auto sm:w-48 md:w-64 md:mt-12" ]
        [ img [ src "/img/logo.svg", class "w-full", alt "logo" ] []
        ]
    , div
        [ class "text-block" ]
        [ p [ class "py-4 rounded text-base text-white sm:rounded-none sm:rounded-r" ]
            [ text heroText ]
        ]
    ]
