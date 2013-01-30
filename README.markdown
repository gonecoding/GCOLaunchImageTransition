## GCOLaunchImageTransition

Animates the transition from the launch image to the app's initial view controller on iOS. Includes customized animation delay and duration, triggering the transition via notification and display of an activity indicator.

If you're using this pod or found it somehow useful, I'd be happy if you'd [let me know](mailto:michael@gonecoding.com).


## Installation via CocoaPods

Adding this pod to your project using [CocoaPods](http://cocoapods.org) is a one-liner in your Podfile:

``` ruby
pod 'GCOLaunchImageTransition'
```

Now run `pod install` to have CocoaPods handle everything for you. Never heard of CocoaPods? Do yourself a favor and [check it out now](http://cocoapods.org).


## Usage

Add this code to your app's initial (root) view controller:

```objective-c
#import <GCOLaunchImageTransition/GCOLaunchImageTransitionView.h>

- (void)viewDidLoad
{
   [super viewDidLoad];

   [...]

   // Add transition from launch image to this controller's view
   GCOLaunchImageTransitionView* launchTransitionView = [[GCOLaunchImageTransitionView alloc] initWithAnimationDelay:3.0 animationDuration:1.0 animationOptions:UIViewAnimationOptionCurveEaseInOut];
   [self.view addSubview:launchTransitionView];
}
```

Make sure that adding these lines are *the last thing you do* in your controller's `-viewDidLoad` method.


## ARC Compatibility

This pod is compatible with ARC enabled projects by default. CocoaPods will handle the ARC settings for you.


## Contributing 

I absolutely appreciate any suggestions or improvements you may have in mind for this pod. That being said the most welcomed form of contribution would be a pull request from [your own fork of this repository](https://help.github.com/articles/fork-a-repo) on GitHub. If you only have a minor problem or suggestion consider opening an [issue](https://github.com/gonecoding/GCOLaunchImageTransition/issues).


## Contact

I'm [Michael Sedlaczek](mailto:michael@gonecoding.com), [Gone Coding](http://gonecoding.com). Find me on Twitter: [@gonecoding](https://twitter.com/gonecoding)

[!](https://dl.dropbox.com/u/46058288/Assets/gonecoding.com/logo_200px.png)

## License

GCOLaunchImageTransition is released under the [New BSD License](http://en.wikipedia.org/wiki/BSD_licenses#3-clause_license_.28.22Revised_BSD_License.22.2C_.22New_BSD_License.22.2C_or_.22Modified_BSD_License.22.29). This license requires attribution when redistributing the component as source code or in binary form.

For details see [LICENSE](https://github.com/gonecoding/GCOLaunchImageTransition/blob/master/LICENSE).
