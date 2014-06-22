BigFan
======

Tiny Xcode 6 sample project demonstrating Live Views and View Debugging.

First of all, open the project in Xcode 6.

Then, go to the Main.storyboard file and you'll be able to see the BigFanView with its code-supplied subview visible, and with its layer properties also visible (cornerRadius). It will *not* show the animation that the view also has; that's only visible in the Simulator or on the device.

Launch the app with the Debugger, and in the Debugger area's toolbar, click the Debug View Hierarchy button (discoverable via its tooltip). Drag in a blank area of the canvas, and you'll be able to see the views in a 3D fashion. Manipulate the sliders to see the views spread apart, or filtered to specific views.
