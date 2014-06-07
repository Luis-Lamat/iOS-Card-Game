//
//  Card.h
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

//Objects such as string objects DO need strong or weak
@property (strong, nonatomic) NSString *contents;

//Primitive types (int, bool, etc) don't need strong or weak
//Renaming the getters so it reads better
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

//This method returns a score value and receives an array of cards
- (int)match:(NSArray *)othercards;

@end
