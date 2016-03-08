//
//  GameScene.m
//  treasureBlock
//
//  Created by Anik on 2/29/16.
//  Copyright (c) 2016 Anik. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.anchorPoint = CGPointMake(0.5, 0.5);
    [self placeTreasureFieldNode];
    [self placeSideFieldNode];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    CGPoint location = [[touches anyObject] locationInNode:self];
    lastTouchLocation = location;
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        CGPoint location = [touch locationInNode:self];
        CGPoint delta = CGPointMake(lastTouchLocation.x-location.x, lastTouchLocation.y-location.y);
        self.mapOffset = CGPointMake(self.mapOffset.x+delta.x, self.mapOffset.y+delta.y);
        if (fabs(delta.x) > 1 || fabs(delta.y) > 1) {
            for (SKNode* node in self.children) {
                node.position = CGPointMake(node.position.x-delta.x, node.position.y-delta.y);
            }
            
        }
        lastTouchLocation = location;
    }
}

-(void) placeTreasureFieldNode{
    CGPoint point = CGPointMake(0, 0);
  //  SKSpriteNode *treasureNode = [[SKSpriteNode alloc] init];
    SKSpriteNode *treasureNode = [[SKSpriteNode alloc] initWithImageNamed:@"iso_ground_side"];
    treasureNode.size = CGSizeMake(640, 640);
    treasureNode.color = [UIColor colorWithRed:102/255.0 green:204/255.0 blue:0/255.0 alpha:1.0];
    treasureNode.position = point;
    
  //  treasureNode.zRotation = M_PI/6;
    [self addChild:treasureNode];
}

-(void) placeSideFieldNode{
    CGPoint point = CGPointMake(320, 160);
    //  SKSpriteNode *treasureNode = [[SKSpriteNode alloc] init];
    SKSpriteNode *sideNode = [[SKSpriteNode alloc] initWithImageNamed:@"iso_ground"];
    sideNode.size = CGSizeMake(640, 640);
    sideNode.color = [UIColor colorWithRed:102/255.0 green:204/255.0 blue:0/255.0 alpha:1.0];
    sideNode.position = point;
    [self addChild:sideNode];
    
    CGPoint point2 = CGPointMake(-320, -160);
    //  SKSpriteNode *treasureNode = [[SKSpriteNode alloc] init];
    SKSpriteNode *sideNode2 = [[SKSpriteNode alloc] initWithImageNamed:@"iso_ground"];
    sideNode2.size = CGSizeMake(640, 640);
    sideNode2.color = [UIColor colorWithRed:102/255.0 green:204/255.0 blue:0/255.0 alpha:1.0];
    sideNode2.position = point2;
    [self addChild:sideNode2];
    
    CGPoint point3 = CGPointMake(310, -150);
    //  SKSpriteNode *treasureNode = [[SKSpriteNode alloc] init];
    SKSpriteNode *sideNode3 = [[SKSpriteNode alloc] initWithImageNamed:@"iso_ground"];
    sideNode3.size = CGSizeMake(640, 640);
    sideNode3.color = [UIColor colorWithRed:102/255.0 green:204/255.0 blue:0/255.0 alpha:1.0];
    sideNode3.position = point3;
    [self addChild:sideNode3];
}

-(CGPoint) PointsPlus:(CGPoint)left andRight:(CGPoint) right {
    return CGPointMake(left.x + right.x, left.y + right.y);
}

-(CGPoint) PointsMinus:(CGPoint)left andRight:(CGPoint)right {
    return CGPointMake( left.x - right.x, left.y - right.y);
}

-(CGPoint) PointsMultiple:(CGPoint)point andScalar:(CGPoint)scalar {
    return CGPointMake( point.x * scalar.x, point.y * scalar.y);
}

-(CGPoint) PointsDivide:(CGPoint)point andScalar:(CGPoint)scalar {
    return CGPointMake(point.x / scalar.x, point.y / scalar.y);
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
