//
//  PlayingCard.h
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

//Suit (e.g. "spades", nil= "suit not set") is a string object, thus the pointer
@property (strong, nonatomic) NSString *suit;

//Rank (#'s from 0[rank not set] - 13 [king]) is not an object..."typedef" for unsigned int
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
