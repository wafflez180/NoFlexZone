#import "MainScene.h"

@implementation MainScene{
    
    CCButton *_enter;
    CCTransition *_transition;
    OALSimpleAudio *audio;
    
}

- (void) didLoadFromCCB{
//    // access audio object
//    audio = [OALSimpleAudio sharedInstance];
//    // play sound effect in a loop
//    [audio playBg:@"noFlexZone.mp3" loop:TRUE];
}

- (void) startGame{
    
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    _transition = [CCTransition transitionCrossFadeWithDuration:.25f];
    [[CCDirector sharedDirector] replaceScene:gameplayScene withTransition:_transition];
}



@end
