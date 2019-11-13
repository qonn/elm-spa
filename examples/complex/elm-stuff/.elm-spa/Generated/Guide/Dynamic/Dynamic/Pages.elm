module Generated.Guide.Dynamic.Dynamic.Pages exposing
    ( Model
    , Msg
    , page
    )

import App.Page
import Generated.Guide.Dynamic.Dynamic.Params as Params
import Generated.Guide.Dynamic.Dynamic.Route as Route exposing (Route)
import Layouts.Guide.Dynamic.Dynamic as Layout
import Pages.Guide.Dynamic.Dynamic.Top
import Utils.Spa as Spa exposing (Page)


type Model
    = TopModel Pages.Guide.Dynamic.Dynamic.Top.Model


type Msg
    = TopMsg Pages.Guide.Dynamic.Dynamic.Top.Msg


page : Page Route Model Msg layoutModel layoutMsg appMsg
page =
    Spa.layout
        { view = Layout.view
        , recipe =
            { init = init
            , update = update
            , bundle = bundle
            }
        }



-- RECIPES


type alias Recipe flags model msg appMsg =
    Spa.Recipe flags model msg Model Msg appMsg


type alias Recipes msg =
    { top : Recipe Params.Top Pages.Guide.Dynamic.Dynamic.Top.Model Pages.Guide.Dynamic.Dynamic.Top.Msg msg
    }


recipes : Recipes msg
recipes =
    { top =
        Spa.recipe
            { page = Pages.Guide.Dynamic.Dynamic.Top.page
            , toModel = TopModel
            , toMsg = TopMsg
            }
    }



-- INIT


init : Route -> Spa.Init Model Msg
init route =
    case route of
        Route.Top flags ->
            recipes.top.init flags



-- UPDATE


update : Msg -> Model -> Spa.Update Model Msg
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( TopMsg msg, TopModel model ) ->
            recipes.top.update msg model



-- BUNDLE


bundle : Model -> Spa.Bundle Msg msg
bundle bigModel =
    case bigModel of
        TopModel model ->
            recipes.top.bundle model