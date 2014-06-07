//
//  PlayingCard.m
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//overwriting the "match" from card.h
- (int)match:(NSArray *)othercards{
    int score = 0;
    
    if ([othercards count] == 1) {
        PlayingCard *othercard = [othercards firstObject];
        if (othercard.rank == self.rank) {
            score = 4;
        } else if ([othercard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    
    return score;
}

- (NSString *)contents {
    
    //Calling class method and assigning value to " *rankStrings"
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //because we provide setter AND getter below...

//Class Method, used for storage of constants, etc...
+ (NSArray *)validSuits {
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit{
    //if "_suit" (attribute) is nil, then diplay "?"
    return _suit ? _suit : @"?";
}

//Leaving this private because the public API for the rank is purely numeric.
+ (NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    //Why [self rankStrings] if that's a class method?
    return [[self rankStrings] count]-1;
}

//Redefining rank setter so it won't be an invalid number...
- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
