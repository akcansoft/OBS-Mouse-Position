; When the recording in OBS is stopped or paused,
; the mouse position is saved.
; When the recording is started or resumed,
; the mouse is moved back to the saved position.

; Mesut Akcan
; https://youtube.com/mesutakcan
#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode("Event")
CoordMode("Mouse")
SetTimer(HandleTooltip)

m := "OBS Screen recording "
recording := false
paused := false
tooltipDuration := 3000 ; Duration in milliseconds for how long the tooltip should be displayed

; Hotkey to pause/resume recording when the Pause key is pressed
~Pause:: {
  global t, paused, recording
  static x, y
  if recording { ; Check if recording is active
    paused := !paused ; Toggle the paused state
    if paused {
      MouseGetPos(&x, &y) ; Save the current mouse position
      HandleTooltip("paused") ; Display tooltip indicating recording is paused
    }
    else {
      if IsSet(x) ; Check if the mouse position was previously saved
        MouseMove(x, y, 5) ; Restore the mouse position with a slight movement delay
      HandleTooltip("resumed") ; Display tooltip indicating recording is resumed
    }
  }
}

; Hotkey to start/stop recording when Ctrl + Numpad0 is pressed
~^Numpad0:: {
  global t, paused, recording
  static x, y
  recording := !recording ; Toggle the recording state
  if recording {
    if IsSet(x) ; Check if the mouse position was previously saved
      MouseMove(x, y, 5) ; Restore the mouse position with a slight movement delay
    HandleTooltip("started") ; Display tooltip indicating recording has started
  }
  else {
    MouseGetPos(&x, &y) ; Save the current mouse position
    HandleTooltip("stopped") ; Display tooltip indicating recording has stopped
    paused := false ; Reset the paused state when stopping recording
  }
}

; Function to handle showing and hiding tooltips
HandleTooltip(status := "") {
  global
  if status {
    t := A_TickCount ; Record the current tick count when showing the tooltip
    ToolTip(m status) ; Display the tooltip with the given status message
  }
  else {
    ; Hide the tooltip if the set duration has passed
    if IsSet(t) && A_TickCount - t > tooltipDuration
      ToolTip() ; Close the tooltip
  }
}
