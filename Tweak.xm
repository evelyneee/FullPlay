#import <UIKit/UIKit.h>

@interface UIViewController (Private)
@property(nonatomic, getter=isModalInPresentation) BOOL modalInPresentation;
@end

%group main

%hook UIViewController

- (void)setModalPresentationStyle:(UIModalPresentationStyle)arg1 {

if ([NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"MusicApplication.NowPlayingViewController"] || [NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"Music.NowPlayingViewController"]) {
self.modalInPresentation = NO;
arg1 = UIModalPresentationOverFullScreen;

UISwipeGestureRecognizer *gestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerDown:)];
    [gestureRecognizerDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self.view addGestureRecognizer:gestureRecognizerDown];

}

%orig;

}

%new
-(void)swipeHandlerDown:(id)sender {
if ([NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"MusicApplication.NowPlayingViewController"] || [NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"Music.NowPlayingViewController"]) {

[self dismissViewControllerAnimated:YES completion:nil];
}
}

%end

%end

%ctor {

%init(main);
}
