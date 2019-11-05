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
    Ok <| Page.view postList.title (viewPostListContent <| sortPosts postList.posts) []


viewPostListContent : List Elmstatic.Post -> List (Html Never)
viewPostListContent posts =
    if List.isEmpty posts then
        [ text "No posts yet!" ]

    else
        List.map viewPostItem posts


viewPostItem : Elmstatic.Post -> Html Never
viewPostItem post =
    div [ class "post-item" ]
        [ div
            [ class "w-1/4" ]
            [ img [ src "/img/post-default.jpg", class "w-full h-full object-cover object-center", alt post.title ] []
            ]
        , div
            [ class "w-3/4 ml-6 pr-10 py-5" ]
            (Post.viewPostMetaData post)
        ]


sortPosts : List Elmstatic.Post -> List Elmstatic.Post
sortPosts posts =
    List.sortBy .date posts
        |> List.reverse
