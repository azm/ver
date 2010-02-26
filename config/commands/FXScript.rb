# Encoding: UTF-8

[{beforeRunningCommand: "saveActiveFile",
  command: 
   "# this takes the current selection in a TextMate document and runs it in FXBuilder. Anything in the existing FXBuilder window will be overwritten.\n\n# The keystroke command-K matches FXBuilder's Run keystroke in FCP, differing from TextMate's run = command-R convention\n\n\necho \"Sending current document to FXBuilder...\"\n\n\n# create a temp file for getting the source into an AppleScript variable. This is such a hack...\n# Store the name for later cleanup:\nTEMPFILE=`date \"+preview-temp%y%m%d-%H%M%S.fxscript\"`\t\n\n# send stdin (the contents of the TextMate window) to $TEMPFILE in /tmp\ncat <&0 >/tmp/$TEMPFILE \n\n\n\n\n\n\nosascript << END\nproperty loopcount : 0\n\non FCPdismissStartupWindows()\n\tlog \"FCPdismissStartupWindows()\"\n\t--\tset loopcount to loopcount + 1\n\t-- this checks for every startup window I can find, closes one then calls itself again until it returns true\n\t-- check for window \"Offline Files\"\n\ttell application \"Final Cut Pro\" to activate -- bring FCP to front\n\t\n\ttell application \"System Events\"\n\t\ttell process \"Final Cut Pro\"\n\t\t\t\n\t\t\ttry\n\t\t\t\twith timeout of 300 seconds\n\t\t\t\t\tset windowList to name of every window\n\t\t\t\t\t(* FCP will occasionally fail to respond to System Events during launch and restoration of exising projects. I've never had a 5 minute wait, but who knows... *)\n\t\t\t\tend timeout\n\t\t\t\t\n\t\t\t\tif windowList contains \"External A/V\" then\n\t\t\t\t\t(key code 53) -- press escape\n\t\t\t\t\tmy FCPdismissStartupWindows()\n\t\t\t\tend if\n\t\t\t\t\n\t\t\t\tif windowList contains \"Offline Files\" then\n\t\t\t\t\tclick button \"Continue\" of window \"Offline Files\"\n\t\t\t\t\tmy FCPdismissStartupWindows()\n\t\t\t\tend if\n\t\t\t\t\n\t\t\ton error the error_message number the error_number\n\t\t\t\t-- i don't think is is ever getting called...\n\t\t\t\tlog \"FAILED on: \" & loopcount & \", \" & error_number & \" (\" & error_number & \") retrying...\"\n\t\t\t\t\n\t\t\t\tif loopcount < 100 then my FCPdismissStartupWindows() -- loopcount is a check to prevent runaway loops\n\t\t\t\t\n\t\t\tend try\n\t\t\t\n\t\tend tell\n\tend tell\n\treturn true\n\t\nend FCPdismissStartupWindows\n\n\non FXBuilderBringToFront() -- makes sure frontmost window is FXBuilder\n\tlog \"FXBuilderBringToFront()\"\n\ttell application \"System Events\"\n\t\tlog \"*** GETTING PROCESSES ***\"\n\t\tlog name of every process as list\n\t\tlog \"FCP EXISTS? \" & (exists process \"Final Cut Pro\")\n\t\t\n\t\tif not (exists process \"Final Cut Pro\") then\n\t\t\tlog \"Restarting FCP\"\n\t\tend if\n\tend tell\n\t\n\tFCPdismissStartupWindows()\n\t\n\ttell application \"System Events\"\n\t\ttell process \"Final Cut Pro\"\n\t\t\tset windowList to name of every window\n\t\t\tset windowList to name of every window\n\t\t\tif windowList contains \"FXBuilder\" then\n\t\t\t\tset FXBcount to 0\n\t\t\t\trepeat with theWindow from 1 to (count windowList)\n\t\t\t\t\t\n\t\t\t\t\tif name of window theWindow as string is \"FXBuilder\" then\n\t\t\t\t\t\tif scroll bar 1 of window theWindow exists then -- this is a text entry window\n\t\t\t\t\t\t\tperform action \"AXRaise\" of window theWindow -- bring window to front\n\t\t\t\t\t\t\treturn true -- end, we found a workable window\n\t\t\t\t\t\tend if\n\t\t\t\t\tend if\n\t\t\t\t\t\n\t\t\t\tend repeat\n\t\t\tend if\n\t\t\t\n\t\t\tif value of attribute \"AXEnabled\" of menu item \"FXBuilder\" of menu \"Tools\" of menu bar 1 is false then\n\t\t\t\tlog \"FXBuilder menu disabled. loopcount: \" & loopcount\n\t\t\t\tlog \"loopcount: \" & loopcount\n\t\t\t\tif loopcount < 200 then my FCPdismissStartupWindows()\n\t\t\tend if\n\t\t\tclick menu item \"FXBuilder\" of menu \"Tools\" of menu bar 1\n\t\tend tell\n\tend tell\n\t\nend FXBuilderBringToFront\n\n\non FXBuilderPasteText(sourceText) -- places sourceText into an FXBuilder window\n\t\n\tFXBuilderBringToFront()\n\tset the clipboard to sourceText as text\n\t\n\ttell application \"System Events\"\n\t\ttell process \"Final Cut Pro\"\n\t\t\ttell application \"Final Cut Pro\" to activate\n\t\t\tkeystroke \"a\" using command down -- select all\n\t\t\tkey code 51 -- (delete key) delete current selected text\n\t\t\tkeystroke \"v\" using command down -- paste and select all\t\t\t\n\t\tend tell\n\tend tell\nend FXBuilderPasteText\n\n\non FXBuilderRunScript(sourceText)\n\tFXBuilderPasteText(sourceText)\n\ttell application \"System Events\"\n\t\ttell process \"Final Cut Pro\"\n\t\t\tclick menu item \"Stop\" of menu \"FXBuilder\" of menu bar 1\n\t\t\tclick menu item \"Run\" of menu \"FXBuilder\" of menu bar 1\n\t\tend tell\n\tend tell\nend FXBuilderRunScript\n\ntell application \"System Events\" to set UI elements enabled to true -- just do this gracelessly rather than gunking up the script with dialogs etc\n\nset theSource to do shell script \"cat /tmp/$TEMPFILE\"\nFXBuilderRunScript(theSource)\n\nEND\n\n\n\nrm /tmp/$TEMPFILE  #cleanup the temp file\n",
  input: "document",
  keyEquivalent: "@k",
  name: "Run in FXBuilder",
  output: "showAsTooltip",
  scope: "source.fxscript",
  uuid: "F23D244D-E15F-4EC8-8DC0-FA196437C8C3"}]