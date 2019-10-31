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
                    [ viewPostMetaData content, Page.viewMarkdown content.content ]
                    []


viewTags : List String -> List (Html Never)
viewTags tags =
    let
        tagLink tag =
            "/tags/" ++ String.toLower tag

        linkify tag =
            a [ href <| tagLink tag ] [ text tag ]
    in
    List.map linkify tags


viewPostMetaData : Elmstatic.Post -> Html Never
viewPostMetaData post =
    div [ class "post-metadata" ]
        ([ span [] [ text post.date ]
         , span [] [ text "•" ]
         ]
            ++ viewTags post.tags
        )
