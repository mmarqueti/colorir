//
//  Scene01.m
//  Colorir
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

@property (nonatomic) SKSpriteNode *draw_1;
@property (nonatomic) SKSpriteNode *draw_2;
@property (nonatomic) SKSpriteNode *draw_3;
@property (nonatomic) SKSpriteNode *draw_4;
@property (nonatomic) SKSpriteNode *draw_5;
@property (nonatomic) SKSpriteNode *draw_6;
@property (nonatomic) SKSpriteNode *draw_7;
@property (nonatomic) SKSpriteNode *draw_8;
@property (nonatomic) SKSpriteNode *draw_9;
@property (nonatomic) SKSpriteNode *draw_10;
@property (nonatomic) SKSpriteNode *draw_11;
@property (nonatomic) SKSpriteNode *draw_12;
@property (nonatomic) SKSpriteNode *draw_13;
@property (nonatomic) SKSpriteNode *draw_14;
@property (nonatomic) SKSpriteNode *draw_15;

@property (nonatomic) SKTransition *sceneTransition;


@end


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
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"bg_select_draw"];
        background.anchorPoint = CGPointZero;
        background.position = CGPointZero;
        
        _sceneTransition = [SKTransition fadeWithColor:[UIColor darkGrayColor] duration:0.5];

        
        [self addChild:background];
        
        /* additional setup */
        [self setUpSoundButton];
        [self setUpIconDraws];


    }
    return self;
}

- (void)willMoveFromView:(SKView *)view
{
    
}

- (void)setUpIconDraws
{
    _draw_1 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_01"];
    _draw_1.position = CGPointMake(520 , 635);
    [self addChild:_draw_1];
    
    _draw_2 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_02"];
    _draw_2.position = CGPointMake(715 , 635);
    [self addChild:_draw_2];
    
    _draw_3 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_03"];
    _draw_3.position = CGPointMake(910 , 635);
    [self addChild:_draw_3];
    
    // linha 2
    
    _draw_4 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_04"];
    _draw_4.position = CGPointMake(325 , 460);
    [self addChild:_draw_4];
    
    _draw_5 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_05"];
    _draw_5.position = CGPointMake(520 , 460);
    [self addChild:_draw_5];
    
    _draw_6 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_06"];
    _draw_6.position = CGPointMake(715 , 460);
    [self addChild:_draw_6];
    
    _draw_7 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_07"];
    _draw_7.position = CGPointMake(910 , 460);
    [self addChild:_draw_7];
    
    // linha 3
    
    _draw_8 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_08"];
    _draw_8.position = CGPointMake(325 , 280);
    [self addChild:_draw_8];
    
    _draw_9 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_09"];
    _draw_9.position = CGPointMake(520 , 280);
    [self addChild:_draw_9];
    
    _draw_10 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_10"];
    _draw_10.position = CGPointMake(715 , 280);
    [self addChild:_draw_10];
    
    _draw_11 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_11"];
    _draw_11.position = CGPointMake(910 , 280);
    [self addChild:_draw_11];
    
    // linha 4
    
    _draw_12 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_12"];
    _draw_12.position = CGPointMake(325 , 100);
    [self addChild:_draw_12];
    
    _draw_13 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_13"];
    _draw_13.position = CGPointMake(520 , 100);
    [self addChild:_draw_13];
    
    _draw_14 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_14"];
    _draw_14.position = CGPointMake(715 , 100);
    [self addChild:_draw_14];
    
    _draw_15 = [SKSpriteNode spriteNodeWithImageNamed:@"icon_draw_15"];
    _draw_15.position = CGPointMake(910 , 100);
    [self addChild:_draw_15];
    
}

- (void)setUpSoundButton
{
    if (_soundOff)
    {
        // NSLog(@"_soundOff");
        
        [_btnSound removeFromParent];
        
        _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"button_sound_off"];
        _btnSound.position = CGPointMake(38, 38);
        
        [self addChild:_btnSound];
        [_backgroundMusicPlayer stop];
    }
    else
    {
        // NSLog(@"_soundOn");
        
        [_btnSound removeFromParent];
        
        _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"button_sound_on"];
        _btnSound.position = CGPointMake(38, 38);
        
        [self addChild:_btnSound];
        [_backgroundMusicPlayer play];
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
        
        if([_btnSound containsPoint:location])
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
        else if([_draw_1 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"" forKey:@"bg_draw"];
            // Example
            // [newScene.userData setObject:[currentScene.userData objectForKey:@"score"] forKey:@"score"];

            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_2 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_02" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_3 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_03" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_4 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_04" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_5 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_05" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_6 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_06" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_7 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_07" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_8 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_08" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_9 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_09" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_10 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_10" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_11 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_11" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_12 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_12" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_13 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_13" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_14 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_14" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        else if([_draw_15 containsPoint:location])
        {
            [_backgroundMusicPlayer stop];
            Scene02 *scene = [[Scene02 alloc] initWithSize:self.size];
            scene.userData = [NSMutableDictionary dictionary];
            [scene.userData setValue:@"draw_15" forKey:@"bg_draw"];
            [self.view presentScene:scene transition:_sceneTransition];
        }
        
        
        
        
        else if ( location.x >= 29 && location.x <= 285 && location.y >= 6 && location.y <= 68 )
        {
            // NSLog(@">>>>>>>>>>>>>>>>> page title");
          
            if (![self actionForKey:@"readText"]) // do not turn page if reading
            {
                [_backgroundMusicPlayer stop];
                SKScene *scene = [[Scene00 alloc] initWithSize:self.size];
                [self.view presentScene:scene transition:_sceneTransition];
            }
        }
        
    }
}

//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//  _touchPoint = [[touches anyObject] locationInNode:self];
//}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

#pragma mark -
#pragma mark Game Loop

-(void)update:(CFTimeInterval)currentTime
{
}

@end
