import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.GroupNavigation

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot /home/gcg/Dropbox/Screenshots/xmndss-%Y-%m-%d-%H-%M-%S_$wx$h.png -s")
        , ((0, xK_Print), spawn "scrot /home/gcg/Dropbox/Screenshots/xmndss-%Y-%m-%d-%H-%M-%S_$wx$h.png ") 
        , ((modm , xK_Tab), nextMatch Backward (return True))
        ]

