-- Display a message indicating the script is hiding all applications
display dialog "Hiding all applications and showing the desktop" buttons {"OK"} default button 1 giving up after 5

--Hide all applications and show the desktop on Mac
--Source: https://gist.github.com/Teraflopst/e1863cfff5f0deb46ec2cabe9984305b
tell application "System Events"
	set visible of every process whose visible is true and name is not "Finder" to false
	tell application "Safari" to set visible of every window to false
end tell

--Launch a specific app using Applescript
--Source: https://gist.github.com/Teraflopst/e1863cfff5f0deb46ec2cabe9984305b
set appName to "Day One"
set startIt to false
tell application "System Events"
	if not (exists process appName) then
		set startIt to true
	else if frontmost of process appName then
		set visible of process appName to false
	else
		set frontmost of process appName to true
	end if
end tell
if startIt then
	tell application appName to activate
end if
