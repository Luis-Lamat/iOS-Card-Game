//
//  CardGameViewController.m
//  Matchismo-2
//
//  Created by Luis Alberto Lamadrid on 12/19/13.
//  Copyright (c) 2013 Luis Alberto Lamadrid. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchType;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController
- (CardMatchingGame *)game{
    if (!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}
- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)dealNewDeck:(UIButton *)sender {
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                              usingDeck:[self createDeck]];
    [self updateUI];
    _matchType.enabled = YES;
}

- (IBAction)matchTypeChanged:(UISegmentedControl *)sender {
    NSLog(@"Type: %d", [sender selectedSegmentIndex]);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    _matchType.enabled = NO;
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"cardBack"];
}

@end
