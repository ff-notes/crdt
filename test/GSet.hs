{-# OPTIONS_GHC -Wno-orphans #-}

{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module GSet
    ( gSet
    ) where

import           Test.Tasty (TestTree, testGroup)
import           Test.Tasty.QuickCheck (testProperty)

import qualified CRDT.GSet.Cv as Cv
import qualified CRDT.GSet.Cv.Internal as Cv

import           Laws (cvrdtLaws)

gSet :: TestTree
gSet = testGroup "GSet"
    [ testGroup "Cv"
        [ cvrdtLaws @(Cv.GSet Int)
        , testProperty "increment" $
            \(set :: Cv.GSet Int) i ->
                Cv.query i (Cv.add i set)
        ]
    ]