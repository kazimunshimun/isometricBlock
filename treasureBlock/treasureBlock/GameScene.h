//
//  GameScene.h
//  treasureBlock
//

//  Copyright (c) 2016 Anik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene{
    CGPoint lastTouchLocation;
}

@property (assign, nonatomic) CGPoint mapOffset;

@end
