module Spa.Types exposing
    ( Page
    , Recipe
    , Init
    , Update
    , Bundle
    , Layout, Upgrade
    , LayoutContext, PageContext
    )

{-|


## types so spooky, they got their own module! 👻

This module is all about exposing the types that `ryannhg/elm-app` uses
under the hood.

At a glance, there are a **lot of generic types**.

In practice, we can handle this with a single
[`Utils/Spa.elm`](https://github.com/ryannhg/elm-spa/blob/master/example/src/Utils/Spa.elm) file that
makes your types easier to understand!

`elm-spa init` generates that file for you, but I've added examples below if you're
doing things by hand.


# page

@docs Page


# recipe

@docs Recipe


# init

@docs Init


# update

@docs Update


# bundle

@docs Bundle


# layouts and recipes

@docs Layout, Upgrade

-}

import Internals.Page as Page


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    -- if using mdgriffith/elm-ui

    import Spa.Types
    import Element exposing (Element)

    type alias Page params model msg layoutModel layoutMsg appMsg =
        Spa.Types.Page params model msg (Element msg) layoutModel layoutMsg (Element layoutMsg) Global.Model Global.Msg appMsg (Element appMsg)

    -- if using elm/html

    import Spa.Types
    import Html exposing (Html)

    type alias Page params model msg layoutModel layoutMsg appMsg =
        Spa.Types.Page params model msg (Html msg) layoutModel layoutMsg (Html layoutMsg) Global.Model Global.Msg appMsg (Html appMsg)


## using your alias

**`src/Pages/Example.elm`**

    import Utils.Spa as Spa

    page : Spa.Page Params.Example Model Msg model msg appMsg
    page =
        Spa.Page.static { ... }

-}
type alias Page route params pageModel pageMsg ui_pageMsg layoutModel layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg =
    Page.Page route params pageModel pageMsg ui_pageMsg layoutModel layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    -- if using mdgriffith/elm-ui

    import Spa.Types
    import Element exposing (Element)

    type alias Recipe params model msg layoutModel layoutMsg appMsg =
        Spa.Types.Recipe params model msg layoutModel layoutMsg (Element layoutMsg) Global.Model Global.Msg appMsg (Element appMsg)

    -- if using elm/html

    import Spa.Types
    import Html exposing (Html)

    type alias Recipe params model msg layoutModel layoutMsg appMsg =
        Spa.Types.Recipe params model msg layoutModel layoutMsg (Html layoutMsg) Global.Model Global.Msg appMsg (Html appMsg)


## using your alias

**`.elm-spa/Generated/Pages.elm`**

    import Utils.Spa as Spa

    type alias Recipes appMsg =
        { top : Spa.Recipe Params.Top Top.Model Top.Msg Model Msg appMsg
        , example : Spa.Recipe Params.Example Example.Model Example.Msg Model Msg appMsg
        , notFound : Spa.Recipe Params.NotFound NotFound.Model NotFound.Msg Model Msg appMsg
        }

-}
type alias Recipe route params pageModel pageMsg layoutModel layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg =
    Page.Recipe route params pageModel pageMsg layoutModel layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    type alias Init model msg =
        Spa.Types.Init model msg Global.Model Global.Msg


## using your alias

**`.elm-spa/Generated/Pages.elm`**

    import Utils.Spa as Spa

    init : Route -> Spa.Init Model Msg
    init route_ =
        case route_ of
            -- ...

-}
type alias Init route layoutModel layoutMsg globalModel globalMsg =
    Page.Init route layoutModel layoutMsg globalModel globalMsg


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    type alias Update model msg =
        Spa.Types.Update model msg Global.Model Global.Msg


## using your alias

**`.elm-spa/Generated/Pages.elm`**

    import Utils.Spa as Spa

    update : Msg -> Model -> Spa.Update Model Msg
    update msg_ model_ =
        case ( msg_, model_ ) of
            -- ...

-}
type alias Update route layoutModel layoutMsg globalModel globalMsg =
    Page.Update route layoutModel layoutMsg globalModel globalMsg


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    -- if using mdgriffith/elm-ui

    import Spa.Types
    import Element exposing (Element)

    type alias Bundle msg appMsg =
        Spa.Types.Bundle msg (Element msg) Global.Model Global.Msg appMsg (Element appMsg)

    -- if using elm/html

    import Spa.Types
    import Html exposing (Html)

    type alias Bundle msg appMsg =
        Spa.Types.Bundle msg (Html msg) Global.Model Global.Msg appMsg (Html appMsg)


## using your alias

**`.elm-spa/Generated/Pages.elm`**

    import Utils.Spa as Spa

    bundle : Model -> Spa.Bundle Msg msg
    bundle model_ =
        case model_ of
            -- ...

-}
type alias Bundle route layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg =
    Page.Bundle route layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    -- if using mdgriffith/elm-ui

    import Spa.Types
    import Element exposing (Element)

    type alias Bundle msg appMsg =
        Spa.Types.Bundle msg (Element msg) Global.Model Global.Msg appMsg (Element appMsg)

    -- if using elm/html

    import Spa.Types
    import Html exposing (Html)

    type alias Bundle msg appMsg =
        Spa.Types.Bundle msg (Html msg) Global.Model Global.Msg appMsg (Html appMsg)


## using your alias

**`.elm-spa/Generated/Pages.elm`**

    import Utils.Spa as Spa

    bundle : Model -> Spa.Bundle Msg msg
    bundle model_ =
        case model_ of
            -- ...

-}
type alias Layout route pageParams pageModel pageMsg ui_pageMsg globalModel globalMsg msg ui_msg =
    Page.Layout route pageParams pageModel pageMsg ui_pageMsg globalModel globalMsg msg ui_msg


{-| TODO: PageContext docs
-}
type alias PageContext route globalModel =
    Page.PageContext route globalModel


{-| TODO: LayoutContext docs
-}
type alias LayoutContext route msg ui_msg globalModel globalMsg =
    Page.LayoutContext route msg ui_msg globalModel globalMsg


{-|


## creating your alias

**`src/Utils/Spa.elm`**

    -- if using mdgriffith/elm-ui

    import Spa.Types
    import Element exposing (Element)

    type alias Bundle msg appMsg =
        Spa.Types.Bundle msg (Element msg) Global.Model Global.Msg appMsg (Element appMsg)

    -- if using elm/html

    import Spa.Types
    import Html exposing (Html)

    type alias Bundle msg appMsg =
        Spa.Types.Bundle msg (Html msg) Global.Model Global.Msg appMsg (Html appMsg)


## using your alias

**`.elm-spa/Generated/Pages.elm`**

    import Utils.Spa as Spa

    bundle : Model -> Spa.Bundle Msg msg
    bundle model_ =
        case model_ of
            -- ...

-}
type alias Upgrade route pageParams pageModel pageMsg ui_pageMsg layoutModel layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg =
    Page.Upgrade route pageParams pageModel pageMsg ui_pageMsg layoutModel layoutMsg ui_layoutMsg globalModel globalMsg msg ui_msg