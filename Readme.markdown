= RubyMotion Popovers on the iPhone

[Popovers](http://developer.apple.com/library/ios/#documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/Popovers.html)
are a useful way to present a list of options or actions in a non-modal setting. Apple provides a
[UIPopoverController](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIPopoverController_class/Reference/Reference.html)
on the iPad to show a view with an arrow pointed to a specific location.

However, the UIPopoverController only works on the iPad. To work around this limitation, developers have created their
own popover libraries for the iPhone. Here is an example on how to use one of the simplest ones:
[PopoverView](https://github.com/runway20/PopoverView) in RubyMotion.