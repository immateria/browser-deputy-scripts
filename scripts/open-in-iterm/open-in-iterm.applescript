on BrowserDeputyScript(input, link, title)
   tell application "Finder"
       set dir_path to quoted form of (POSIX path of (folder of the front window as alias))
       tell application "iTerm"
           launch "iTerm"
           delay 1
           set newWindow to (create window with default profile)
           tell current session of newWindow
               write text "cd " & dir_path
           end tell
       end tell
   end tell
end BrowserDeputyScript
