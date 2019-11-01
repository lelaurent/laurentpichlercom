module Post exposing (main, viewPostMetaData)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, href, src)
import Page


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePost <|
        \content ->
            Ok <|
                Page.view
                    content.title
                    (viewPostMetaData content ++ [ Page.viewMarkdown content.content ])
                    []


viewTags : List String -> List (Html Never)
viewTags tags =
    let
        tagLink tag =
            "/tags/" ++ String.toLower tag

        linkify tag =
            a [ href <| tagLink tag, class "ml-2" ] [ text tag ]
    in
    List.map linkify tags


viewPostMetaData : Elmstatic.Post -> List (Html Never)
viewPostMetaData post =
    [ div
        [ class "text-gray-500 text-xs" ]
        (span [] [ text post.date ] :: viewTags post.tags)
    , a
        [ href <| "/" ++ post.link ]
        [ h3 [] [ text post.title ] ]
    ]
