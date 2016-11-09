//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    UIView *purpleBox = [[UIView alloc]init];
    purpleBox.frame = CGRectZero;
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;    // in code, have to add to make view visible
    purpleBox.backgroundColor = [UIColor purpleColor];
    [framingView addSubview:purpleBox];
    
    NSLayoutConstraint *purpleBoxViewHeight = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [purpleBox addConstraint:purpleBoxViewHeight];


    NSLayoutConstraint *purpleBoxWidthRatio = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeWidth multiplier:305.0/500.0 constant:0];
    [framingView addConstraint:purpleBoxWidthRatio];

    NSLayoutConstraint *purpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [framingView addConstraint:purpleBoxRightMargin];

    NSLayoutConstraint *purpleBoxBottomMargin = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [framingView addConstraint:purpleBoxBottomMargin];
    
    
    UIView *blueBox1 = [[UIView alloc]init];
    blueBox1.frame = CGRectZero;
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox1];
    
    NSLayoutConstraint *blueBoxHeight1 = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:blueBoxHeight1];
    
    
    NSLayoutConstraint *blueBoxWidth1 = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:blueBoxWidth1];
    
    NSLayoutConstraint *blueBoxCentreX1 = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [framingView addConstraint:blueBoxCentreX1];
   
    NSLayoutConstraint *blueBoxCentreY1 = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [framingView addConstraint:blueBoxCentreY1];
    
    
    UIView *blueBox2 = [[UIView alloc]init];
    blueBox2.frame = CGRectZero;
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox2];
    
    NSLayoutConstraint *blueBoxHeight2 = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:blueBoxHeight2];
    
    NSLayoutConstraint *blueBoxWidth2 = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:blueBoxWidth2];
    
    NSLayoutConstraint *blueBoxCentreX2 = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [framingView addConstraint:blueBoxCentreX2];
    
    NSLayoutConstraint *blueBoxCentreY2 = [NSLayoutConstraint constraintWithItem:blueBox2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0];
    [framingView addConstraint:blueBoxCentreY2];
    
    UIView *blueBox3 = [[UIView alloc]init];
    blueBox3.frame = CGRectZero;
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox3];
    
    NSLayoutConstraint *blueBoxHeight3 = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:blueBoxHeight3];
    
    NSLayoutConstraint *blueBoxWidth3 = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:blueBoxWidth3];
    
    NSLayoutConstraint *blueBoxCentreX3 = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [framingView addConstraint:blueBoxCentreX3];
    
     NSLayoutConstraint *blueBoxCentreY3 = [NSLayoutConstraint constraintWithItem:blueBox3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0];
    [framingView addConstraint:blueBoxCentreY3];
    
    UIView *redBox = [[UIView alloc]init];
    redBox.frame = CGRectZero;
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [framingView addSubview:redBox];
    
    NSLayoutConstraint *redBoxHeight = [NSLayoutConstraint constraintWithItem: redBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:redBoxHeight];
    
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150.0];
    [framingView addConstraint:redBoxWidth];
    
    NSLayoutConstraint *redBoxRightMargin = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    [framingView addConstraint:redBoxRightMargin];
    
    NSLayoutConstraint *redBoxTopMargin = [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
    [framingView addConstraint:redBoxTopMargin];

    
    UIView *orangeBox1 = [[UIView alloc]init];
    orangeBox1.frame = CGRectZero;
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [framingView addSubview:orangeBox1];
    
    NSLayoutConstraint *orangeBoxHeight1 = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    [framingView addConstraint:orangeBoxHeight1];
    
    NSLayoutConstraint *orangeBoxWidth1 = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    [framingView addConstraint:orangeBoxWidth1];
    
    NSLayoutConstraint *orangeBoxRightMargin1 = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [framingView addConstraint:orangeBoxRightMargin1];
    
    NSLayoutConstraint *orangeBoxTopMargin1 = [NSLayoutConstraint constraintWithItem:orangeBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [framingView addConstraint:orangeBoxTopMargin1];

    UIView *orangeBox2 = [[UIView alloc]init];
    orangeBox2.frame = CGRectZero;
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [framingView addSubview:orangeBox2];
    
    NSLayoutConstraint *orangeBoxHeight2 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    [framingView addConstraint:orangeBoxHeight2];
    
    NSLayoutConstraint *orangeBoxWidth2 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];
    [framingView addConstraint:orangeBoxWidth2];
    
    NSLayoutConstraint *orangeBoxRightMargin2 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-80];
    [framingView addConstraint:orangeBoxRightMargin2];
    
    NSLayoutConstraint *orangeBoxTopMargin2 = [NSLayoutConstraint constraintWithItem:orangeBox2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [framingView addConstraint:orangeBoxTopMargin2];

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    NSLayoutConstraint *blueBoxTopMargin1 = [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:2.0/3.0 constant:0];
//    [framingView addConstraint:blueBoxTopMargin1];

    
    
};




- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
