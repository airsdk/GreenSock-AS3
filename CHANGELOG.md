CHANGE LOG : GREENSOCK TWEENING PLATFORM
----------------------------------------

2025-06-30
---------------------------------------------
v12.2.0
	- Added DataStreamLoader and FileStreamLoader to use a URLStream to progressively download data from a URL
	- AIR Package release for apm
	- Add asdocs to version control

2012-11-26
---------------------------------------------
	- Removed requirement that the target of a Physics2DPlugin tween be a DisplayObject (so Starling can work)
	- Fixed minor bugs in TimelineLite and TimelineMax 

2012-10-26
---------------------------------------------
	- Added functionality to append() and all convenience methods of TimelineLite/Max so that the "offset" parameter can now be a string to indicate a label. If the label isn't found, one will be created and appended to the timeline for convenience. 

2012-09-17
---------------------------------------------
	- Fixed issue that caused TweenMax.killAll() to kill the tweens in the reverse order that they were created.

2012-08-31
---------------------------------------------
	- Fixed issue that caused "{self}" references in a TimelineLite.staggerTo() or staggerFrom() or staggerFromTo() to always point at the first tween instead of each individual one.

2012-08-29
---------------------------------------------
	- Fixed issue in RoundPropsPlugin that could cause an error in rare situations
	- Added OnCompleteRenderPlugin and the associated method in TweenMaxVars and TweenLiteVars

2012-08-24
---------------------------------------------
	- Fixed issue that could throw an error if a relative tween is used that begins with "+=-" or "-=-" (very rare, but could be caused if you dynamically populate a variable like TweenLite.to(mc, 1, {x:"+=" + myVariable}) and myVariable is a negative number.

2012-07-28
---------------------------------------------
TintPlugin		12.01
	- Fixed issue that could cause an alpha tween to be ignored if it is running concurrently with a tint tween.

2012-07-21
---------------------------------------------
BezierPlugin		12.1
	- Completely revamped BezierPlugin and added many features like support for quadratic, cubic, soft, thru, and thruFast types plus a completely new algorithm for plotting Beziers through supplied values, speed improvements, more accurate autoRotation, a new timeResolution feature that eliminates varying speed along the Bezier, and lots more. 

2012-06-30
---------------------------------------------
TimelineLite		beta 5.7
	- Added logic to TimelineLite/Max so that if you insert/append a child that extends the duration and the timeline had already finished, it will adjust its startTime and resume playback (as long as it wasn't paused of course)

2012-06-19
----------------------------------------------
TweenLite		beta 5.6
VisiblePlugin	12.1
	- Fixed issue that could cause zero-duration tweens not to render correctly initially and/or be removed from their timeline prematurely. This affected startAt as well.
	- Fixed issue with VisiblePlugin that could cause zero-duration tweens not to render correctly.

2012-05-29
----------------------------------------------
TweenLite		beta 5.5
BezierPlugin		12.0
	- Fixed issue that could cause an error if you used onCompleteListener, onStartListener, onRepeatListener, onReverseCompleteListener in AS3.
	- Removed trace() from BezierPlugin

2012-05-24
----------------------------------------------
TweenLite		beta 5.4
	- - Fixed issue that could cause a tween to be overwritten if it is nested inside a TimelineLite/Max that's nested inside another and both are back-to-back and tween the identical value (very rare).

2012-05-10
----------------------------------------------
TweenLite		beta 5.3
TweenMax		beta 5.3
	- Added static "ticker" property to TweenLite and TweenMax to make it easier to access rather than going through "Animation" class. 

2012-05-01
----------------------------------------------
TimelineMax		beta 5.2
TweenLite		beta 5.2
TweenMax		beta 5.2
	- Added set() method to TweenMax and TweenLite
	- Added getLabelsArray() method to TimelineMax

2012-04-10
----------------------------------------------
	- Changed TweenLite and TweenMax's behavior so that if their duration and delay are both 0, they will default to immediateRender:true.

2012-04-02
----------------------------------------------
TweenLite		beta 5.1
TweenMax		beta 5.1
TweenNano		beta 5.1
Ease			beta 1.1
SlowMo			beta 1.1
	- Added a new "endcapMode" parameter to SlowMo ease to make it much easier to sync things like alpha tweens or blur tweens with positional SlowMo tweens (see ASDocs for details)

2012-03-27
----------------------------------------------
TweenLite, TweenMax, TimelineLite, TimelineMax beta 5
	- Fixed issue that could cause a zero-duration tween not to render correctly if it was at the very beginning or end of a TimelineMax that repeats.

2012-03-23
----------------------------------------------
[all classes]
	- Changed goto() to seek() because "goto" is a reserved keyword in Javascript (for future versions). 
	- Changed name of OutIn ease to SlowMo to make it more intuitive/memorable.
	- Added Power0, Power1, Power2, Power3, and Power4 eases which are identical to their less intuitively named Linear, Quad, Cubic, Quart, and Quint/Strong counterparts.
	- Removed some redundant eases like QuadIn, QuadOut, QuadInOut, CubicIn, CubicOut, CubicInOut, etc. because it seemed wiser to keep the standard way of referencing eases like Quad.easeIn rather than QuadIn.ease. 
	- Changed some property names of the Ease class which were for internal use.

2012-03-08
----------------------------------------------
TweenLite			beta 4.1
	- Fixed issue that could cause a zero-duration tween to incorrectly overwrite a tween that starts at exactly the same time in a nested TimelineLite/Max (of the same object). Rare, but possible. 

2012-02-24
----------------------------------------------
TweenLite			beta 4
TimelineLite			beta 4
Animation			beta 4
	- Fixed issue that caused a from() tween that is initially paused not to render immediately
	- Added ability to self-reference the tween/timeline in the onCompleteParams, onUpdateParams, onStartParams, onReverseCompleteParams, and onRepeatParams array using "{self}". 

2012-02-23
----------------------------------------------
TimelineLite			beta 1.2
TweenPlugin			beta 3
[many plugins were updated too]
	- Added an extra "baseTimeOrLabel" parameter to all of the timeline convenience methods (see ASDocs for details)
	- Added a _roundProps() method and removed the _round property from TweenPlugin to improve the handling of rounding.

2012-02-21
----------------------------------------------
TimelineLite			beta 1.1
	- Changed the parameters of the TimelineLite.exportRoot() so that you can pass in extra special properties like onUpdate, onComplete, etc. See the ASDocs for details. 
