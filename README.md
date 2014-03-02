## SPDebugMenu

SPDebugMenu is a library for iOS developers to show debug menus in their apps with fully customizable actions.

It supports:

* Different ways to trigger it: shaking the device, multiple taps or long press on the screen.
* Customized debug actions.
* Send a report via e-mail with a screenshot and some useful information.
* Simulate a memory warning notification in your device

## Install

1. **Using CocoaPods**

  Add SPDebugMenu to your Podfile:

  ```
  platform :ios, "6.0"
  pod 'SPDebugMenu'
  ```

  Run the following command:

  ```
  pod install
  ```

2. **Static Library**

    Clone the project or add it as a submodule. Drag *SPDebugMenu.xcodeproj* to your project, add it as a target dependency and link *libSPDebugMenu.a*.
    Then, you can simply do:

    ```
    #import <SPDebugMenu/SPDebugMenu.h>
    ```

3. **Manually**

  Clone the project or add it as a submodule. Drag the whole SPDebugMenu folder to your project.

## Usage

To enable your debug menu, you only have to instance it associated to a window and then register some triggers and actions. You can do this in your ```application:didFinishLaunchingWithOptions:``` method in your ```UIApplicationDelegate```:


```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ...
    self.window = ...;
    ...
    // Configure the debug menu
    self.debugMenu = [[SPDebugMenu alloc] initWithWindow:self.window];
    [self.debugMenu registerTrigger:...];
    [self.debugMenu registerAction:...];
    ...
}
```

### Triggers

SPDebugMenu provides some useful triggers so that you won't need to write your own except for specific cases.

* ```SPDebugMenuTapTrigger``` will trigger the debug menu after detecting a specific number of taps with a specific number of touches on a view:
```objective-c
    SPDebugMenuTapTrigger *tapTrigger = [[SPDebugMenuTapTrigger alloc] init];
    tapTrigger.view = self.window;            // Detect taps in the whole window
    tapTrigger.numberOfTouchesRequired = 2;   // Two fingers required
    tapTrigger.numberOfTapsRequired = 5;      // Five taps required
```

* ```SPDebugMenuLongPressTrigger``` will trigger the debug menu after detecting a long press gesture with a specific number of touches on a view:
```objective-c
    SPDebugMenuLongPressTrigger *longPressTrigger = [[SPDebugMenuLongPressTrigger alloc] init];
    longPressTrigger.view = self.window;            // Detect taps in the whole window
    longPressTrigger.numberOfTouchesRequired = 2;   // Two fingers required
```

* ```SPDebugMenuShakeTrigger``` will trigger the debug menu after shaking de device. This trigger requires a more sophisticated configuration with some entity (typically the window) that informs it about the shake. To make this easier, SPDebugMenu includes a ```UIWindow``` subclass called ```SPShakeTriggerWindow``` which can store a reference to a ```SPDebugMenuShakeTrigger``` and notify motion events to it. This way, you can make your ```UIWindow``` a subclass of ```SPShakeTriggerWindow``` in debug builds and not in release builds. The following is an example of how you could prepare your app to show a debug menu with a shake trigger:
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SPShakeTriggerWindow *shakeTriggerWindow = [[SPShakeTriggerWindow alloc]
                                                initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = shakeTriggerWindow;
    ...
    // Configure the debug menu
    self.debugMenu = [[SPDebugMenu alloc] initWithWindow:self.window];
    ...
    // Configure a shake trigger (requires a ShakeTriggerWindow)
    SPDebugMenuShakeTrigger *shakeTrigger = [[SPDebugMenuShakeTrigger alloc] init];

    // Here is where we wire the window and the trigger to be notified about motion events
    shakeTriggerWindow.shakeTrigger = shakeTrigger;

    // Finally we register the trigger
    [self.debugMenu registerTrigger:shakeTrigger];
}
```

If none of these triggers suits you, you can always write your own trigger. You only have to write a class implementing the ```SPDebugMenuTriggering``` protocol, put your triggering logic inside and call the ```debugMenuWasTriggered:``` method of its delegate to show the debug menu.

### Actions

The actions are shown in a simple menu and will allow the user to change some settings or perform some actions useful to developers in debug builds.

#### Send report

The most typical action you would use is sending an e-mail to a developer or an issue tracking system with a screenshot and some information when you find a bug. SPDebugMenu includes the ```SPSendReportAction``` action which already allows you all of this. It will show a mail composer screen with some data already filled in (including a screenshot of the current state of the app). The data filled in is gathered through a class implementing the ```SPSendReportStatusComposing``` protocol with three methods:
* ```currentStatus```: a ```NSString``` with the text to be sent (gathering some info like the current user, connection state, etc.).
* ```subject```: subject of the e-mail to be sent.
* ```defaultRecipients```: ```NSArray``` with the default recipients (e-mail addresses) where the report will be sent to.

```objective-c
// Configure a "Send report" action
SPExampleStatusComposer *statusComposer = [[SPExampleStatusComposer alloc] init];

SPSendReportAction *sendReportAction = [[SPSendReportAction alloc] init];
sendReportAction.statusComposer = statusComposer;
[self.debugMenu registerAction:sendReportAction];
```

#### Simulate memory warning

If you want to simulate a memory warning in your device, there is an action called ```SPSimulateMemoryWarningAction``` that you can include in your debug menu for that purpose.

```objective-c
// Configure a "Simulate memory warning" action
SPSimulateMemoryWarningAction *simulateMemoryWarningAction = [[SPSimulateMemoryWarningAction alloc] init];
[self.debugMenu registerAction:simulateMemoryWarningAction];
```

#### Custom actions

For customized actions, you can create a class implementing the ```SPDebugMenuAction``` protocol with the following methods:

* ```prepare```: this method will be called when the debug menu is about to be shown. If your action requires some work before the menu is actually shown, this is the place to do it. Example: taking a screenshot of the app.
* ```performActionWithNavigationController:```: this is where the action does its actual work. It can show new view controllers through the navigation controller where the actions take place.
* ```dispose```: this method is called right before dismissing the debug menu. Its purpose is doing any "disposing work" (like freeing that screenshot you took in the 'prepare' method).
* ```shouldDismissDebugMenuAfterFinish```: flag indicating wether or not the debug menu should be dismissed after this action finishes.
* ```shouldReloadDebugMenuAfterFinish```: flag indicating wether or not the debug menu should be refreshed after this action finishes.

This class should also call the methods ```debugMenuActionDidStart:``` and ```debugMenuActionDidEnd:``` of its delegate whenever the action starts and ends, respectively.

## Requirements

SPDebugMenu requires both iOS 6.0 and ARC.

You can still use SPDebugMenu in your non-arc project. Just set ```-fobjc-arc``` compiler flag in every source file.

## Example

Aside from the code included in this README, you can see a full example with several triggers and actions in [SPDebugMenuExample](https://github.com/sergiou87/SPDebugMenu/blob/master/Example).

## Contact

SPDebugMenu was created by Sergio Padrino: [@sergiou87](https://twitter.com/sergiou87).

## Contributing

If you want to contribute to the project just follow this steps:

1. Fork the repository.
2. Clone your fork to your local machine.
3. Create your feature branch.
4. Commit your changes, push to your fork and submit a pull request.

## License

SPDebugMenu is available under the MIT license. See the [LICENSE file](https://github.com/sergiou87/SPDebugMenu/blob/master/LICENSE) for more info.
