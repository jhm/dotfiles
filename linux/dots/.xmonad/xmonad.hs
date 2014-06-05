------------------------------------------------------------------------------
import           System.IO
import           XMonad
import           XMonad.Layout.NoBorders
import           XMonad.Layout.ResizableTile
import           XMonad.Layout.Spacing
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.SetWMName
import           XMonad.Util.Run (spawnPipe)
import           XMonad.Util.EZConfig (additionalKeys)

import qualified Data.Map as M
import qualified XMonad.Util.CustomKeys as C
------------------------------------------------------------------------------

main :: IO ()
main = do
  h <- spawnPipe workspaceBar
  c <- spawnPipe statsBar
  spawn trayerCmd
  xmonad $ defaultConfig
    { borderWidth        = 2
    , focusedBorderColor = "#CCCCCC"
    , keys               = C.customKeys delkeys inskeys
    , layoutHook         = myLayoutHook
    , logHook            = myLogHook h
    , manageHook         = myManageHook <+> manageHook defaultConfig
    , modMask            = mod4Mask
    , normalBorderColor  = "#000000"
    , startupHook        = setWMName "LG3D" -- Workaround for Java Swing issues.
    , terminal           = "urxvtc"
    , workspaces         = myWorkspaces
    }
  where
    delkeys XConfig {modMask = modm} = [(modm, xK_b)]
    inskeys = myKeys

------------------------------------------------------------------------------
-- dzen2 workspace bar.
workspaceBar = "dzen2 -bg '#000000' -ta l -h 20 -w 1920 -fn '-*-terminus-*-r-normal-*-12-*-*-*-*-*-*-*' -e '' "

------------------------------------------------------------------------------
-- conky statistics bar.
--
-- conky's output is piped into a second instance of dzen2 which sits
-- on the right side of the workspace bar.
statsBar = "conky -c /home/john/.xmonad/conky_dzen | dzen2 -x '1500' -w '420' -h '20' -ta 'r' -bg '#000000' -fg '#F0F0F0' -y '0'  -fn '-*-terminus-*-r-normal-*-12-*-*-*-*-*-*-*'"

------------------------------------------------------------------------------
-- trayer startup command.
trayerCmd = "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --height 18 --transparent true --tint 0x000000 --alpha 0"

------------------------------------------------------------------------------
myManageHook = composeAll
  [ className =? "Mplayer"     --> doFloat
  , className =? "Gimp"        --> doFloat
  , className =? "vlc"         --> doFloat
  , className =? "Empathy"     --> doFloat
  , className =? "trayer"      --> doIgnore
  , resource  =? "stalonetray" --> doIgnore
  , resource  =? "wicd-gtk"    --> doFloat
  ]

------------------------------------------------------------------------------
myLogHook h = dynamicLogWithPP $ defaultPP
  { ppCurrent         = dzenColor "#000000" "#f0f0f0" . pad . pad
  , ppVisible         = dzenColor "#7C7A7B" "#000000" . pad . pad
  , ppHidden          = dzenColor "#b8bcb8" "#000000" . pad . pad
  , ppHiddenNoWindows = dzenColor "#444444" "#000000" . pad . pad
  , ppLayout          = dzenColor "#dadada" "#000000" . pad . pad
  , ppUrgent          = dzenColor "#FF0000" "#000000" . pad . pad
  , ppTitle           = dzenColor "#444444" "#000000"
  , ppOutput          = hPutStrLn h
  }

------------------------------------------------------------------------------
myWorkspaces = map (\icon -> "^i(/home/john/.xmonad/icons/sm4tik/" ++ icon ++ ")")
  [ "diskette.xbm"
  , "ac.xbm"
  , "fox.xbm"
  , "info_01.xbm"
  , "cpu.xbm"
  , "shroom.xbm"
  , "note.xbm"
  , "phones.xbm"
  ]

------------------------------------------------------------------------------
myLayoutHook = spacing 14 $ avoidStruts $ tiled ||| Mirror tiled ||| noBorders Full
    where
      tiled = Tall nmaster delta ratio
      -- Default number of windows in the master pane.
      nmaster = 1
      -- Default proportion of the screen occupied by the master pane.
      ratio = 1/2
      -- Percent of screen to increment when resizing panes.
      delta = 3/100

------------------------------------------------------------------------------
myKeys conf@(XConfig {modMask = modm}) =
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm, xK_p),	  spawn "dmenu_run")
    , ((modm, xK_b),      sendMessage ToggleStruts)
    ]
