#import <Header.h>

%group main

%hook otherPlayingController

- (void)setModalPresentationStyle:(UIModalPresentationStyle)arg1 {

%orig(UIModalPresentationOverFullScreen);

}

%end

%hook twelvePlayingController

- (void)setModalPresentationStyle:(UIModalPresentationStyle)arg1 {

%orig(UIModalPresentationOverFullScreen);

}

%end

%end

%ctor {

	%init(main, otherPlayingController=objc_getClass("MusicApplication.NowPlayingViewController"), twelvePlayingController=objc_getClass("Music.NowPlayingViewController"));
}