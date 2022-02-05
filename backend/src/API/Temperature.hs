{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}

module API.Temperature where

import           Servant                        ( (:<|>)((:<|>))
                                                , type (:>)
                                                , Capture
                                                , Get
                                                , JSON
                                                , Post
                                                , ReqBody
                                                , Server
                                                , serve
                                                )
import           Type.Temperature               ( Temperature
                                                , Temperatures
                                                )


type PostTemperature
  = "user" :> Capture "userId" String :> "temperature" :> ReqBody '[JSON] Temperature :> Post '[JSON] Temperature

type GetTemperatures
  = "user" :> Capture "userId" String :> "temperature" :> Get '[JSON] [Temperature]

type TemperatureAPI = PostTemperature :<|> GetTemperatures
