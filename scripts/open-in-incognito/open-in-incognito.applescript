on BrowserDeputyScript(input, link, title)
    tell application id "com.google.Chrome"
        make new window with properties {mode:"incognito"}
        open location link
    end tell
end BrowserDeputyScript
