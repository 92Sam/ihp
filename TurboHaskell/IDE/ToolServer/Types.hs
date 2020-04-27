module TurboHaskell.IDE.ToolServer.Types where

import TurboHaskell.Prelude
import qualified TurboHaskell.Controller.Session as Session
import qualified TurboHaskell.ControllerSupport as ControllerSupport
import qualified TurboHaskell.ViewSupport as ViewSupport
import TurboHaskell.FrameworkConfig
import TurboHaskell.Environment

data ViewContext = ViewContext
    { requestContext :: ControllerSupport.RequestContext
    , flashMessages :: [Session.FlashMessage]
    , layout :: ViewSupport.Layout
    , controllerContext :: ControllerSupport.ControllerContext
    }


data ToolServerApplication = ToolServerApplication deriving (Eq, Show)

data SchemaDesignerController
    = TablesAction
    | ShowTableAction { tableName :: Text }
    | NewColumnAction { tableName :: Text }
    | CreateColumnAction
    | PushToDbAction
    deriving (Eq, Show, Data)

data WebReplController
    = ReplAction
    deriving (Eq, Show, Data)

instance FrameworkConfig where 
    environment = Development
    baseUrl = "http://localhost:8001"
