//
//  Card.m
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import "Card.h"

@interface Card()
//Here go the private methods of the class...
@end

@implementation Card

//The @synthesize of the properties are hidden, example:
//
//@synthesize chosen = _chosen;
//
//-(BOOL)ischosen {
//    return _chosen;
//}
//-(void)setChosen:(BOOL)chosen {
//    _chosen = chosen;
//}

//Gives a score of "1" if ANY card in the array matches "self"
- (int)match:(NSArray *)othercards {
    int score = 0;
    
    for (Card *card in othercards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
