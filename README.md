# OBS-Mouse-Position
When the recording in OBS is stopped or paused, the mouse position is saved. When the recording is started or resumed, the mouse is moved back to the saved position

This [AutoHotkey V2](https://autohotkey.com) script provides a simple utility to control [OBS](https://obsproject.com/) screen recording using predefined hotkeys.

`Ctrl + Numpad0` key, which is preset in OBS to start and stop recording, is used to toggle recording.\
You can set this shortcut key in the OBS program.

`Pause` key pauses and resumes the recording, with tooltips indicating the current state. Tooltips display for 3 seconds and automatically hide. The script also saves the mouse position when pausing and restores it when resuming, ensuring seamless control over the recording process.
