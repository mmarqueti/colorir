//
//  Scene01.m
//  TheSeasons
//
//  Created by Tammy Coron on 9/13/13.
//  Copyright (c) 2013 Tammy Coron. All rights reserved.
//

// Screen of selection the draw

#import "Scene01.h"
#import "Scene00.h"
#import "Scene02.h"
#import "SKTUtils.h"

#define MIN_DIST_SQ 10.0f

@import AVFoundation;

@interface Scene01 ()
@property (nonatomic) CGPoint prev;
@property (nonatomic) SKShapeNode *line;
@property (nonatomic) SKSpriteNode *color_1;
@property (nonatomic) SKSpriteNode *color_2;
@property (nonatomic) SKSpriteNode *color_3;
@property (nonatomic) SKSpriteNode *color_4;
@property (nonatomic) SKSpriteNode *color_5;
@property (nonatomic) SKSpriteNode *color_6;
@property (nonatomic) SKSpriteNode *color_7;
@property (nonatomic) SKSpriteNode *color_8;
@property (nonatomic) SKSpriteNode *color_9;
@property (nonatomic) SKSpriteNode *color_10;
@property (nonatomic) SKSpriteNode *color_11;

@end

static inline float DIST_SQ(const CGPoint a, const CGPoint b) {
    return ((a.x-b.x) * (a.x-b.x) + (a.y-b.y) * (a.y-b.y));
}

@implementation Scene01
{
    AVAudioPlayer *_backgroundMusicPlayer;
    SKSpriteNode *_btnSound;
    BOOL _soundOff;
  
    SKSpriteNode *_footer;
    SKSpriteNode *_btnLeft;
    SKSpriteNode *_btnRight;

    SKSpriteNode *_option_1;
    SKSpriteNode *_option_2;
    
    SKSpriteNode *_kid;
    SKSpriteNode *_hat;

    BOOL _touchingHat;
    CGPoint _touchPoint;
}

#pragma mark -
#pragma mark Scene Setup and Initialize

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* set up your scene here */
        
        /* set up Sound */
        
        _soundOff = [[NSUserDefaults standardUserDefaults] boolForKey:@"pref_sound"];
        [self playBackgroundMusic:@"off-to-play.mp3"];
        
        /* add background image */
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bg_pg01"];
        background.anchorPoint = CGPointZero;
        background.position = CGPointZero;
        
        [self addChild:background];
        
        /* additional setup */

//        [self setUpText];
//        [self setUpFooter];
//        [self setUpMainScene];
       
        [self setUpTheOptions];
    }
    return self;
}

- (void)willMoveFromView:(SKView *)view
{
    
}

- (void)setupColors
{
    _color_1 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_black"];
    _color_1.position = CGPointMake(55 , 635);
    [self addChild:_color_1];
    
    _color_2 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_blue_dark"];
    _color_2.position = CGPointMake(125 , 585);
    [self addChild:_color_2];
    
    _color_3 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_blue"];
    _color_3.position = CGPointMake(55 , 535);
    [self addChild:_color_3];
    
    _color_4 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_brown"];
    _color_4.position = CGPointMake(125 , 485);
    [self addChild:_color_4];
    
    _color_5 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_green_light"];
    _color_5.position = CGPointMake(55 , 435);
    [self addChild:_color_5];
    
    _color_6 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_green"];
    _color_6.position = CGPointMake(125 , 385);
    [self addChild:_color_6];
    
    _color_7 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_grey"];
    _color_7.position = CGPointMake(55 , 335);
    [self addChild:_color_7];
    
    _color_8 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_orange"];
    _color_8.position = CGPointMake(125 , 285);
    [self addChild:_color_8];
    
    _color_9 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_red"];
    _color_9.position = CGPointMake(55 , 235);
    [self addChild:_color_9];
    
    _color_10 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_violet"];
    _color_10.position = CGPointMake(125 , 185);
    [self addChild:_color_10];
    
    _color_11 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_yellow"];
    _color_11.position = CGPointMake(55 , 135);
    [self addChild:_color_11];
}


- (void)refreshColors
{

    
    
    SKAction* btn_pencil_black = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_black"]]];
    [_color_1 runAction:btn_pencil_black];

    SKAction* btn_pencil_blue_dark = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_blue_dark"]]];
    [_color_2 runAction:btn_pencil_blue_dark];
    
    SKAction* btn_pencil_blue = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_blue"]]];
    [_color_3 runAction:btn_pencil_blue];

    SKAction* btn_pencil_brown = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_brown"]]];
    [_color_4 runAction:btn_pencil_brown];
    
    SKAction* btn_pencil_green_light = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_green_light"]]];
    [_color_5 runAction:btn_pencil_green_light];
    
    SKAction* btn_pencil_green = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_green"]]];
    [_color_6 runAction:btn_pencil_green];
    
    SKAction* btn_pencil_grey = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_grey"]]];
    [_color_7 runAction:btn_pencil_grey];
    
    SKAction* btn_pencil_orange = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_orange"]]];
    [_color_8 runAction:btn_pencil_orange];
    
    SKAction* btn_pencil_red = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_red"]]];
    [_color_9 runAction:btn_pencil_red];

    SKAction* btn_pencil_violet = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_violet"]]];
    [_color_10 runAction:btn_pencil_violet];
    
    SKAction* btn_pencil_yellow = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_yellow"]]];
    [_color_11 runAction:btn_pencil_yellow];
    
}

#pragma mark -
#pragma mark Standard Scene Setup

- (void)setUpTheOptions
{
    _option_1 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_back"];
    _option_1.position = CGPointMake(45, 710);
    [self addChild:_option_1];
    
    _option_2 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_save"];
    _option_2.position = CGPointMake(125, 710);
    [self addChild:_option_2];
    
    SKSpriteNode *pencil = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil"];
    pencil.position = CGPointMake(125, 55);
    [self addChild:pencil];

    SKSpriteNode *erase = [SKSpriteNode spriteNodeWithImageNamed:@"btn_erase"];
    erase.position = CGPointMake(55, 55);
    [self addChild:erase];

    [self setupColors];

}

- (void)setUpText
{
  SKSpriteNode *text = [SKSpriteNode spriteNodeWithImageNamed:@"pg01_text"];
  text.position = CGPointMake(300 , 530);
  
  [self addChild:text];
  
  [self readText];
}

- (void)readText
{
  if (![self actionForKey:@"readText"])
  {
    SKAction *readPause = [SKAction waitForDuration:0.25];
    SKAction *readText = [SKAction playSoundFileNamed:@"pg01.wav" waitForCompletion:YES];
    
    SKAction *readSequence = [SKAction sequence:@[readPause, readText]];
    
    [self runAction:readSequence withKey:@"readText"];
  }
  else
  {
    [self removeActionForKey:@"readText"];
  }
}

- (void)setUpFooter
{
  /* add the footer */
  
  _footer = [SKSpriteNode spriteNodeWithImageNamed:@"footer"];
  _footer.position = CGPointMake(self.size.width/2, 38);
  
  [self addChild:_footer];

  self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:_footer.frame];
  
  /* add the right button */
  
  _btnRight = [SKSpriteNode spriteNodeWithImageNamed:@"button_right"];
  _btnRight.position = CGPointMake(self.size.width/2 + 470, 38);
  
  [self addChild:_btnRight];
  
  /* add the left button */
  
  _btnLeft = [SKSpriteNode spriteNodeWithImageNamed:@"button_left"];
  _btnLeft.position = CGPointMake(self.size.width/2 + 400, 38);
  
  [self addChild:_btnLeft];
  
  /* add the sound button */
  
  if (_soundOff)
  {
    // NSLog(@"_soundOff");
    
    [_btnSound removeFromParent];
    
    _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"button_sound_off"];
    _btnSound.position = CGPointMake(self.size.width/2 + 330, 38);
    
    [self addChild:_btnSound];
    [_backgroundMusicPlayer stop];
  }
  else
  {
    // NSLog(@"_soundOn");
    
    [_btnSound removeFromParent];
    
    _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"button_sound_on"];
    _btnSound.position = CGPointMake(self.size.width/2 + 330, 38);
    
    [self addChild:_btnSound];
    
    [_backgroundMusicPlayer play];
  }
}

#pragma mark -
#pragma mark Additional Scene Setup (sprites and such)

- (void)setUpMainScene
{
  [self setUpMainCharacter];
  [self setUpHat];
}

- (void)setUpMainCharacter
{
  _kid = [SKSpriteNode spriteNodeWithImageNamed:@"pg01_kid"];
  _kid.anchorPoint = CGPointZero;
  _kid.position = CGPointMake(self.size.width/2 - 245, 45);
  
  [self addChild:_kid];
  [self setUpMainCharacterAnimation];
}

- (void)setUpMainCharacterAnimation
{
  NSMutableArray *textures = [NSMutableArray arrayWithCapacity:2];
  
  for (int i = 0; i <= 2; i++)
  {
    NSString *textureName = [NSString stringWithFormat:@"pg01_kid0%d", i];
    SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
    [textures addObject:texture];
  }
  
  CGFloat duration = RandomFloatRange(3, 6);
  
  SKAction *blink = [SKAction animateWithTextures:textures timePerFrame:0.25];
  SKAction *wait = [SKAction waitForDuration:duration];
  
  SKAction *mainCharacterAnimation = [SKAction sequence:@[blink, wait, blink, blink, wait , blink, blink]];
  [_kid runAction: [SKAction repeatActionForever:mainCharacterAnimation]];
}

- (void)setUpHat
{
  SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
  label.text = @"Help Mikey put on his hat!";
  label.fontSize = 20.0;
  label.fontColor = [UIColor yellowColor];
  label.position = CGPointMake(160, 180);
  
  [self addChild:label];
  
  _hat = [SKSpriteNode spriteNodeWithImageNamed:@"pg01_kid_hat"];
  _hat.position = CGPointMake(150, 290);
  _hat.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_hat.size];
  _hat.physicsBody.restitution = 0.5;
  
  [self addChild:_hat];
}

#pragma mark -
#pragma mark Code For Sound & Ambiance

- (void)playBackgroundMusic:(NSString *)filename
{
    NSError *error;
    NSURL *backgroundMusicURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    _backgroundMusicPlayer.numberOfLoops = -1;
    _backgroundMusicPlayer.volume = .50;
    [_backgroundMusicPlayer prepareToPlay];
}

- (void)showSoundButtonForTogglePosition:(BOOL )togglePosition
{
    // NSLog(@"togglePosition: %i", togglePosition);
    
    if (togglePosition)
    {
        _btnSound.texture = [SKTexture textureWithImageNamed:@"button_sound_on"];
        
        _soundOff = NO;
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"pref_sound"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [_backgroundMusicPlayer play];
    }
    else
    {
        _btnSound.texture = [SKTexture textureWithImageNamed:@"button_sound_off"];
        
        _soundOff = YES;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"pref_sound"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [_backgroundMusicPlayer stop];
    }
}

#pragma mark -
#pragma mark Touch Events

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInNode:self];
        
        
        NSLog(@"** TOUCH LOCATION ** \nx: %f / y: %f", location.x, location.y);
    
        // Check if the touch is in the white board.
        
        
        UITouch *touch = [touches anyObject];
        CGPoint loc = [touch locationInNode:self];
        _prev = loc;
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, loc.x, loc.y);
        
        _line = [SKShapeNode node];
        _line.strokeColor = [SKColor redColor];
        _line.fillColor = [SKColor clearColor];
        _line.lineWidth = 7.0;
        _line.glowWidth = 5.0;
        _line.path = path;
        CGPathRelease(path);
        [self addChild:_line];
        
        
        
        if([_hat containsPoint:location])
        {
            // NSLog(@"xxxxxxxxxxxxxxxxxxx touched hat");
            _touchingHat = YES;
            _touchPoint = location;
        
            /* change the physics or the hat is too 'heavy' */
        
            _hat.physicsBody.velocity = CGVectorMake(0, 0);
            _hat.physicsBody.angularVelocity = 0;
            _hat.physicsBody.affectedByGravity = NO;
        }
        else if([_btnSound containsPoint:location])
        {
            // NSLog(@"xxxxxxxxxxxxxxxxxxx sound toggle");
      
            [self showSoundButtonForTogglePosition:_soundOff];
        }
        else if ([_btnRight containsPoint:location])
        {
            // NSLog(@">>>>>>>>>>>>>>>>> page forward");
          
            if (![self actionForKey:@"readText"]) // do not turn page if reading
            {
                [_backgroundMusicPlayer stop];
            
                SKScene *scene = [[Scene02 alloc] initWithSize:self.size];
                SKTransition *sceneTransition = [SKTransition fadeWithColor:[UIColor darkGrayColor] duration:1];
                [self.view presentScene:scene transition:sceneTransition];
            }
        }
        else if ([_btnLeft containsPoint:location])
        {
            // NSLog(@"<<<<<<<<<<<<<<<<<< page backward");
          
            if (![self actionForKey:@"readText"]) // do not turn page if reading
            {
                [_backgroundMusicPlayer stop];
            
                SKScene *scene = [[Scene00 alloc] initWithSize:self.size];
                SKTransition *sceneTransition = [SKTransition fadeWithColor:[UIColor darkGrayColor] duration:1];
                [self.view presentScene:scene transition:sceneTransition];
            }
        }
        else if ([_option_1 containsPoint:location])
        {
            // NSLog(@">>>>>>>>>>>>>>>>> page forward");
            
            if (![self actionForKey:@"readText"]) // do not turn page if reading
            {
                [_backgroundMusicPlayer stop];
                
                SKScene *scene = [[Scene00 alloc] initWithSize:self.size];
                SKTransition *sceneTransition = [SKTransition fadeWithColor:[UIColor darkGrayColor] duration:1];
                [self.view presentScene:scene transition:sceneTransition];
            }
        }
        
        
//        SKSpriteNode *color_1 = [SKSpriteNode spriteNodeWithImageNamed:@"btn_pencil_black"];
//        color_1.position = CGPointMake(45 , 635);
//        [self addChild:color_1];
        
        else if ([_color_1 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_black_1"]]];
            [_color_1 runAction:changeFace];
        }
        else if ([_color_2 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_blue_dark_1"]]];
            [_color_2 runAction:changeFace];
        }
        else if ([_color_3 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_blue_1"]]];
            [_color_3 runAction:changeFace];
        }
        else if ([_color_4 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_brown_1"]]];
            [_color_4 runAction:changeFace];
        }
        else if ([_color_5 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_green_light_1"]]];
            [_color_5 runAction:changeFace];
        }
        else if ([_color_6 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_green_1"]]];
            [_color_6 runAction:changeFace];
        }
        else if ([_color_7 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_grey_1"]]];
            [_color_7 runAction:changeFace];
        }
        else if ([_color_8 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_orange_1"]]];
            [_color_8 runAction:changeFace];
        }
        else if ([_color_9 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_red_1"]]];
            [_color_9 runAction:changeFace];
        }
        else if ([_color_10 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_violet_1"]]];
            [_color_10 runAction:changeFace];
        }
        else if ([_color_11 containsPoint:location])
        {
            [self refreshColors];
            SKAction* changeFace = [SKAction setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"btn_pencil_yellow_1"]]];
            [_color_11 runAction:changeFace];
        }
        
        else if ( location.x >= 29 && location.x <= 285 && location.y >= 6 && location.y <= 68 )
        {
            // NSLog(@">>>>>>>>>>>>>>>>> page title");
          
            if (![self actionForKey:@"readText"]) // do not turn page if reading
            {
                [_backgroundMusicPlayer stop];
            
                SKScene *scene = [[Scene00 alloc] initWithSize:self.size];
                SKTransition *sceneTransition = [SKTransition fadeWithColor:[UIColor darkGrayColor] duration:1];
                [self.view presentScene:scene transition:sceneTransition];
            }
        }
        
    }
}

//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//  _touchPoint = [[touches anyObject] locationInNode:self];
//}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint loc = [touch locationInNode:self];
    
    if (DIST_SQ(loc, _prev) > MIN_DIST_SQ) {
        _prev = loc;
        
        CGMutablePathRef path = CGPathCreateMutableCopy(_line.path);
        CGPathAddLineToPoint(path, NULL, loc.x, loc.y);
        
        _line.path = path;
        CGPathRelease(path);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  if (_touchingHat)
  {
    CGPoint currentPoint = [[touches anyObject] locationInNode:self];
    
    if ( currentPoint.x >= 300 && currentPoint.x <= 550 &&
        currentPoint.y >= 250 && currentPoint.y <= 400 )
    {
      // NSLog(@"Close Enough! Let me do it for you");
      
      currentPoint.x = 420;
      currentPoint.y = 330;
      
      _hat.position = currentPoint;
      
      SKAction *popSound = [SKAction playSoundFileNamed:@"thompsonman_pop.wav" waitForCompletion:NO];
      [_hat runAction:popSound];
    }
    else
      _hat.physicsBody.affectedByGravity = YES;
    
    _touchingHat = NO;
  }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
  _touchingHat = NO;
  _hat.physicsBody.affectedByGravity = YES;
}

#pragma mark -
#pragma mark Game Loop

-(void)update:(CFTimeInterval)currentTime
{
  if (_touchingHat)
  {
    _touchPoint.x = Clamp(_touchPoint.x, _hat.size.width / 2, self.size.width - _hat.size.width / 2);
    _touchPoint.y = Clamp(_touchPoint.y,
                          _footer.size.height +  _hat.size.height / 2,
                          self.size.height - _hat.size.height / 2);
    
    _hat.position = _touchPoint;
  }
}

@end
