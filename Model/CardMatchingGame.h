//
//  CardMatchingGame.h
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 1/8/14.
//  Copyright (c) 2014 Luis Alberto Lamadrid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSUInteger score; //readonly = no public setter
@end
