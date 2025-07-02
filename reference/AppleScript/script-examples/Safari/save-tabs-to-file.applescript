-- NAME OF REPORT TITLE
property report_Title : "URL List from Safari"

-- PREPARE THE LIST
set url_list to {}
set the date_stamp to ((the current date) as string)
set NoteTitle to "# " & the date_stamp

-- GET TABS FROM SAFARI
set window_count to 1
tell application "Safari"
	activate
	set safariWindow to windows
	repeat with w in safariWindow
		try
			if (tabs of w) is not {} then
				copy ("## Window " & window_count & ":" & return) to the end of url_list
			end if
			repeat with t in (tabs of w)
				set TabTitle to ("1. [" & name of t & "]")
				set TabURL to ("(" & URL of t & ")")
				set TabInfo to (TabTitle & TabURL & return)
				copy TabInfo to the end of url_list
			end repeat
		end try
		set window_count to window_count + 1
	end repeat
end tell

-- CONVERT URL_LIST TO TEXT
set old_delim to AppleScript's text item delimiters
set AppleScript's text item delimiters to return
set url_list to (NoteTitle & return & return & return & url_list) as text
set AppleScript's text item delimiters to old_delim

-- CHOOSE FILE NAME FOR EXPORT 
tell application "Finder"
	activate
	set save_File to choose file name with prompt "Name this file:" default name report_Title default location (path to downloads folder)
end tell

--WRITE THE FILE
tell application "System Events"
	set save_File to open for access (save_File & ".md" as string) with write permission
	try
		write url_list to save_File as «class utf8»
	end try
	close access save_File
end tell
