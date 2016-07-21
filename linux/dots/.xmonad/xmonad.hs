------------------------------------------------------------------------------
import           System.IO
import           XMonad
import           XMonad.Layout.Gaps
import           XMonad.Layout.NoBorders
import           XMonad.Layout.ResizableTile
import           XMonad.Layout.SimpleFloat
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
--  spawn trayerCmd
  xmonad $ defaultConfig
    { borderWidth        = 4
    , focusedBorderColor = "#709080"
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
workspaceBar = "dzen2 -bg '#000000' -ta l -h 24 -w 1800 -fn '-*-terminus-*-r-normal-*-12-*-*-*-*-*-*-*' -e '' "

------------------------------------------------------------------------------
-- conky statistics bar.
--
-- conky's output is piped into a second instance of dzen2 which sits
-- on the right side of the workspace bar.
statsBar = "conky -c /home/john/.xmonad/conky_dzen | dzen2 -x '1800' -w '120' -h '24' -ta 'r' -bg '#000000' -fg '#777777' -y '0'  -fn '-*-terminus-*-r-normal-*-12-*-*-*-*-*-*-*'"

------------------------------------------------------------------------------
-- Trayer startup command.
--trayerCmd = "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 120 --height 24 --transparent true --tint 0x000000 --alpha 0"

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
  { ppCurrent         = dzenColor "#000000" "#709080" . pad . pad
  , ppVisible         = dzenColor "#7C7A7B" "#000000" . pad . pad
  , ppHidden          = dzenColor "#b8bcb8" "#000000" . pad . pad
  , ppHiddenNoWindows = dzenColor "#444444" "#000000" . pad . pad
  , ppLayout          = dzenColor "#dadada" "#000000" . pad . pad
  , ppUrgent          = dzenColor "#FF0000" "#000000" . pad . pad
  , ppTitle           = dzenColor "#777777" "#000000"
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
gapWidth = 6

-- myTiled = avoidStruts $ tiled

myTiled = spacing gapWidth $ avoidStruts $ gaps [(U, gapWidth), (D, gapWidth), (L, gapWidth), (R, gapWidth)] $ tiled
  where
    tiled = Tall nmaster delta ratio
    -- Default number of windows in the master pane.
    nmaster = 1
    -- Default proportion of the screen occupied by the master pane.
    ratio = 1/2
    -- Percent of screen to increment when resizing panes.
    delta = 3/100

myFull = avoidStruts $ noBorders Full

myLayoutHook = myTiled ||| myFull ||| simpleFloat

------------------------------------------------------------------------------
myKeys conf@(XConfig {modMask = modm}) =
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm, xK_p),	  spawn "dmenu_run")
    , ((modm, xK_b),      sendMessage ToggleStruts)
    ]
