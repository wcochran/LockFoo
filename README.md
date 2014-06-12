LockFoo
=======

Simple iOS Lock Screen Example

Demo / Expermiment app that forces the user to log in when the app starts or
after the app enters the foreground and has been in the background for over 15 seconds.
Most of the logic is handled by the root view controller (RootNavigationController class).
Username is "foo" and password is "bar".

iOS takes a snapshot of the app when it goes into the background. This snapshot is displayed
initially when the app enters the foreground and it also appears in the task switcher.
If the app contains sensitive data this is not good. So we take care to either blank the
screen or show another image just before we go into the backgroud. It would probably be
best to show the initial launch screen -- I just show a silly lock image.

Wayne O. Cochran
wcochran@vancouver.wsu.edu
