module Page exposing (main, view, viewFooter, viewHeader, viewMarkdown)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, classList, href, src)
import Markdown


type alias NavItem =
    { name : String
    , href : String
    }


navItems : List NavItem
navItems =
    [ NavItem "Posts" "/posts"
    , NavItem "About" "/about"
    , NavItem "Contact" "/contact"
    ]


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePage <|
        \content ->
            Ok <|
                view
                    content.title
                    [ viewMarkdown content.content ]
                    []


view : String -> List (Html Never) -> List (Html Never) -> List (Html Never)
view title contentChilds headerChilds =
    [ viewHeader headerChilds
    , viewMainSection title (List.append contentChilds [ viewFooter ])
    , Elmstatic.stylesheet "/styles.css"
    ]


viewMainSection : String -> List (Html Never) -> Html Never
viewMainSection title content =
    div
        [ class "content" ]
        (h1 [ class "text-center" ] [ text title ] :: content)


viewMarkdown : String -> Html Never
viewMarkdown s =
    let
        mdOptions : Markdown.Options
        mdOptions =
            { defaultHighlighting = Just "elm"
            , githubFlavored = Just { tables = False, breaks = False }
            , sanitize = False
            , smartypants = True
            }
    in
    Markdown.toHtmlWith mdOptions [ attribute "class" "markdown text-block" ] s


viewHeader : List (Html Never) -> Html Never
viewHeader children =
    let
        showMinimalHero =
            List.isEmpty children
    in
    div [ class "hero", classList [ ( "hero-minimal", showMinimalHero ) ] ]
        [ div
            [ class "content" ]
            (nav
                [ class "text-center text-gray-400 px-8 py-4 text-xl" ]
                [ ul
                    [ class "flex" ]
                    (viewHeaderNavLogoItem :: List.map viewHeaderNavItem navItems)
                ]
                :: children
            )
        ]


viewHeaderNavLogoItem : Html Never
viewHeaderNavLogoItem =
    li
        []
        [ a [ href "/" ]
            [ img [ src "/img/logo-small.svg", alt "logo", class "w-12 md:w-16" ] [] ]
        ]


viewHeaderNavItem : NavItem -> Html Never
viewHeaderNavItem navItem =
    li [ class "inline-block w-1/3" ]
        [ a
            [ href navItem.href ]
            [ text navItem.name ]
        ]


viewFooter : Html Never
viewFooter =
    div [ class "viewFooter" ]
        []
