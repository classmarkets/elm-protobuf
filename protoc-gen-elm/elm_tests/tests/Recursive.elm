module Recursive exposing (..)

-- DO NOT EDIT
-- AUTOGENERATED BY THE ELM PROTOCOL BUFFER COMPILER
-- https://github.com/tiziano88/elm-protobuf
-- source file: recursive.proto

import Protobuf exposing (..)

import Json.Decode as JD
import Json.Encode as JE


type alias Rec =
    { int32Field : Int -- 1
    , stringField : String -- 4
    , r : R
    }


type R
    = RUnspecified
    | RecField Rec


rDecoder : JD.Decoder R
rDecoder =
    JD.lazy <| \_ -> JD.oneOf
        [ JD.map RecField (JD.field "recField" recDecoder)
        , JD.succeed RUnspecified
        ]


rEncoder : R -> Maybe ( String, JE.Value )
rEncoder v =
    case v of
        RUnspecified ->
            Nothing
        RecField x ->
            Just ( "recField", recEncoder x )


recDecoder : JD.Decoder Rec
recDecoder =
    JD.lazy <| \_ -> decode Rec
        |> required "int32Field" intDecoder 0
        |> required "stringField" JD.string ""
        |> field rDecoder


recEncoder : Rec -> JE.Value
recEncoder v =
    JE.object <| List.filterMap identity <|
        [ (requiredFieldEncoder "int32Field" JE.int 0 v.int32Field)
        , (requiredFieldEncoder "stringField" JE.string "" v.stringField)
        , (rEncoder v.r)
        ]