//
//  Deck.h
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card; //Like "overloading"

- (Card *)drawRandomCard;

@end
