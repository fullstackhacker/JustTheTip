# Pre-work - Just the Tip

Just the Tip is a tip calculator application for iOS.

Submitted by: Mushaheed Kapadia

Time spent: 6 hours spent in total


## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [x] Shaking clears the bill amount
* [x] Clear textfield button when not editting

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![](https://i.imgur.com/17FfIGH.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

### Question 1:

#### "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

Just like the video said, coming from a web app developer background, the whole drag and drop for the UI felt a little dirty.
xCode seems difficult to manage on a smaller screen, but I'm sure as I understand the UI better, it'll get easier.
Swift is seems like a mix of Java and Python.

An outlet is how the view controller reads and writes to the view UI.
Updating a label's text through the view controller is an example of using an outlet.
Reading a value from a sliderbar is another.
An action is how the view tells the view controller something happened.
Recalculating a tip whenever a text field updates is an action. 



### Question 2: 

#### "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

Closures are great for passing around values without passing around explicit references to them. This makes sure that the caller doesn't mutate/change anything that the callee didn't expect. It's essentially a blackbox. If we don't assign a reference to the closure, the internal references will disappear with closure. When we reference the closure in a property, but the closure doesn't reference any of the instances properties, the closure and instance will be deallocated when there aren't any more references ot teh instance.

The problem exists when the closure make a reference to the instance or one of its properties/methods. Since that reference is "locked away" in the closure, we can't unreference it. The closure can't be deallocated since a reference to it exists in that instance.


## License

Copyright 2017 - Mushaheed Kapadia

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
