{-# LANGUAGE DeriveGeneric #-}

module Type.Temperature where

import           Data.Aeson                     ( FromJSON
                                                , ToJSON
                                                )
import           GHC.Generics                   ( Generic )

data Temperature = Temperature
  { temperature :: String
  , date        :: Maybe String
  }
  deriving (Generic, Show)

instance ToJSON Temperature
instance FromJSON Temperature

data Temperatures = Temperatures
  { userId       :: String
  , temperatures :: [Temperature]
  }
  deriving (Generic, Show)

instance ToJSON Temperatures
instance FromJSON Temperatures
