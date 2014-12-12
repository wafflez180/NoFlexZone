//
//  Gameplay.m
//  NoFlexZone
//
//  Created by Keivan Shahida on 12/11/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gameplay.h"

@implementation Gameplay{
    
    CCButton *_flexButton;
    CCTransition *_transition;
    CCLabelTTF *_pointsLabel;
    int points;
    BOOL noFlex;
    int NoFlexProbability;
    CCLabelTTF *_noFlexZoneAlert;
    int noFlexTimer;
    int noFlexTimeUp;
    
}

- (void) didLoadFromCCB{
    
    points = 0;
    noFlex = false;
    
}

- (void) flex{
    
    if (noFlex == false){
    points++;
     _pointsLabel.string = [NSString stringWithFormat:@"%d", points];
    }
    
    if (noFlex == true){
        //GAMEOVER
        //temporary load
        CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
        _transition = [CCTransition transitionCrossFadeWithDuration:.25f];
        [[CCDirector sharedDirector] replaceScene:mainScene withTransition:_transition];
    }
}


- (void) update:(CCTime)delta{
 
    if (noFlex == false){
    NoFlexProbability = arc4random()%480;
        
        //100 is an arbitrarily chosen number
        if (NoFlexProbability == 100){
            
            noFlex = true;
            noFlexTimeUp = arc4random()%240;
        }
    }
    
    if (noFlex == true){
        
        _noFlexZoneAlert.visible = true;
        noFlexTimer++;
        if (noFlexTimer == noFlexTimeUp){
            noFlexTimer = 0;
            _noFlexZoneAlert.visible = false;
            noFlex = false;
        }
    }
}

@end