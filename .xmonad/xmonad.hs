import XMonad
import System.Exit

import qualified Graphics.X11.ExtraTypes.XF86 as XF86
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Layout.Reflect 
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing

-- Hooks --
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "urxvt"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = True

-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#1f1f1c"
myFocusedBorderColor = "#8fab4a"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.

-- Extra Binding
myAddKeys :: [(String, X ())]
myAddKeys = 
    [ 
         ("<XF86AudioMute>", spawn "pamixer -t")
        ,("<XF86AudioLowerVolume>", spawn "pamixer -d5")
        ,("<XF86AudioRaiseVolume>", spawn "pamixer -i5")
        ,("<XF86MonBrightnessUp>", spawn "xbacklight -inc 2.5")
        ,("<XF86MonBrightnessDown>", spawn "xbacklight -dec 2.5")
        ,("<Print>", spawn "flameshot full")
        ,("M-<Print>", spawn "flameshot gui")
    ]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
    , ((modm,               xK_d     ), spawn "dmenu_run -i -nf '#ffffff' -sb '#8fab4a' -sf '#1f1f1c'")
    -- close focused window 
    , ((modm,               xK_w     ), kill)
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    -- Push window back into tiling
    , ((modm                , xK_t     ), withFocused $ windows . W.sink)
    -- Increment the number of windows in the master area
    , ((modm                , xK_comma ), sendMessage (IncMasterN 1))
    -- Deincrement the number of windows in the master area
    , ((modm                , xK_period), sendMessage (IncMasterN (-1)))
    -- toggle the status bar gap (used with avoidStruts from Hooks.ManageDocks)
    --, ((modm             , xK_b ), sendMessage ToggleStruts)
    -- Quit xmonad
    --, ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    -- Restart xmonad
    , ((modm                , xK_r     ), restart "xmonad" True)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
--    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
--    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
--        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
--        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> mouseResizeWindow w))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (tiled ||| Mirror tiled ||| simpleTabbed )
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = spacingWithEdge 5 $ Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 2/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
-- Set bg if gif
-- spawnOnce "gifview --animate --window root $HOME/Pictures/.wallpaper/wallpaper10.gif &"
-- Backend choice : colorz schemer2 haishoku colorthief wal
    spawnOnce "chameleon.py -i $HOME/Pictures/.wallpaper/wallpaper14.jpg --backend colorz"
--    spawnOnce "pywal-discord"
--    spawnOnce "pywalfox update"
    spawnOnce "dunst &"
    spawnOnce "flameshot &"
    spawn "killall picom ; picom --experimental-backend &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
-- Run xmonad with the settings you specify. No need to modify this.

main = do
    xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
    xmonad $ docks $ def {
          -- simple stuff
            terminal           = myTerminal,
            focusFollowsMouse  = myFocusFollowsMouse,
            borderWidth        = myBorderWidth,
            modMask            = myModMask,
            workspaces         = myWorkspaces,
            normalBorderColor  = myNormalBorderColor,
            focusedBorderColor = myFocusedBorderColor,

          -- key bindings
            keys               = myKeys,
            mouseBindings      = myMouseBindings,

          -- hooks, layouts
            layoutHook         = reflectHoriz $ myLayout,
            manageHook         = myManageHook,
            logHook            = myLogHook <+> dynamicLogWithPP xmobarPP {
                ppOutput = \x -> hPutStrLn xmproc x,
                ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]" ,-- Current workspace in xmobar
                ppVisible = xmobarColor "#98be65" ""                ,-- Visible but not current workspace
                ppHidden = xmobarColor "#82AAFF" "" . wrap "" ""    ,-- Hidden workspaces in xmobar
                ppHiddenNoWindows = xmobarColor "#c792ea" ""        ,-- Hidden workspaces (no windows)
                ppTitle = xmobarColor "#b3afc2" "" . shorten 60     ,-- Title of active window in xmobar
                ppSep =  "<fc=#666666> <fn=1>|</fn> </fc>"          ,-- Separators in xmobar
                ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  ,-- Urgent workspace
                ppExtras  = [windowCount]                           ,-- # of windows current workspace
                ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
            },
            startupHook        = myStartupHook
    }`additionalKeysP` myAddKeys
