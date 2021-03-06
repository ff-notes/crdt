{-# OPTIONS_GHC -Wno-missing-signatures #-}

{-# LANGUAGE TypeApplications #-}

module Counter where

import           CRDT.Cm.Counter (Counter)

import           Laws (cmrdtLaw)

prop_Cm = cmrdtLaw @(Counter Int)
