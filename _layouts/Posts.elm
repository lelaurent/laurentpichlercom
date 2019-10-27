module Posts exposing (main)

import Elmstatic
import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, href, src)
import Page
import Post


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePostList viewPostList


viewPostList : Elmstatic.PostList -> Result String (List (Html Never))
viewPostList postList =
    Ok <|
        Page.layout postList.title <|
            viewPostListContent <|
                sortPosts postList.posts


viewPostListContent : List Elmstatic.Post -> List (Html Never)
viewPostListContent posts =
    if List.isEmpty posts then
        [ text "No posts yet!" ]

    else
        List.map viewPostItem posts


viewPostItem : Elmstatic.Post -> Html Never
viewPostItem post =
    div []
        [ a [ href ("/" ++ post.link) ] [ h2 [] [ text post.title ] ]
        , Post.metadataHtml post
        ]


sortPosts : List Elmstatic.Post -> List Elmstatic.Post
sortPosts posts =
    List.sortBy .date posts
        |> List.reverse
