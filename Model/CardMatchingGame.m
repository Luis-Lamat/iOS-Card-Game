//
//  CardMatchingGame.m
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 1/8/14.
//  Copyright (c) 2014 Luis Alberto Lamadrid. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite)NSUInteger score; //We can modifiy it privately
@property (nonatomic, strong)NSMutableArray *cards; // of Cards
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init]; //Init is the designated initializer of NSObject
    
    if (self) {
        for (int i = 0; i < count; i++) {
            
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else { //if the deck runs out of cards do this:
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    //if the index is larger than the amount possible, return nil.
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        
        if (card.isChosen) {
            card.chosen = NO;
            
        } else {
            //match against another card
            for (Card *otherCard in self.cards) {
                
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


@end
