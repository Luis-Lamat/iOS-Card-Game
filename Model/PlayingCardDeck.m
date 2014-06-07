//
//  PlayingCardDeck.m
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/20/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


//Instance type returns an object of the same type of object the message was sent to
//Always use instancetype as return value for init methods.
- (instancetype)init {
    
    //Checking if the super class can initialize itself, then make the object...
    //We only assign things to self in init methods!!!
    //Super is like sending a message to ourselves through the superclass
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                
                //Creating a new card each time (rank is a numeric value!)
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                
                //We inherited this from "Deck.h"
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
