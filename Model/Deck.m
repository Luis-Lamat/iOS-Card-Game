//
//  Deck.m
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import "Deck.h"

@interface Deck()
//This is private because we don't want it to be public...
//Each deck has an "attribute" that is a Mutable Array!
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@end

@implementation Deck


//Lazy instansiation becuase there would be no array otherwise...
//This way the addCard methods will allways have an array to work with
- (NSMutableArray *)cards {
    //if _cards is nil...
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}
//implementation in terms of the previous function...
- (void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard {
    
    //Initializing the card
    Card *randomCard = nil;
    
    //We have this "if" so that if the card array has nothing on it it returns
    //the variable randomCard as "nil" meaning it has zero items in it
    
    if ([self.cards count]) {
        
        //Assigning the "index" variable a value between 0 - #of cards
        unsigned index = arc4random() % [self.cards count];
        
        //Assigning "randomCard" the card at the random index above
        randomCard = self.cards[index];
        
        //Removing that card form that index so it can't be chosen again
        [self.cards removeObjectAtIndex:index];
    }

    
    return randomCard;
}




@end
