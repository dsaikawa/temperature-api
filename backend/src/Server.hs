module Server where

import           API.Temperature                ( TemperatureAPI )
import           Lib.Temperature                ( getTemperature
                                                , postTemperature
                                                )
import           Network.Wai                    ( Application )
import           Network.Wai.Handler.Warp       ( run )
import           Servant                        ( (:<|>)((:<|>))
                                                , Proxy(Proxy)
                                                , Server
                                                , serve
                                                )

type API = TemperatureAPI

server :: Server API
server = postTemperature :<|> getTemperature


temperatureAPI :: Proxy API
temperatureAPI = Proxy

app :: Application
app = serve temperatureAPI server

startApp :: IO ()
startApp = do
  print "server is running..."
  run 8080 app
