//
//  EffectHelmet.m
//  WizardWar
//
//  Created by Sean Hess on 6/11/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import "PEHelmet.h"
#import "SpellEffectService.h"
#import "Spell.h"

@implementation PEHelmet

// Hmm, intercept needs to be able to allow it to pass through!
-(BOOL)interceptSpell:(Spell *)spell onWizard:(Wizard *)wizard interval:(NSTimeInterval)interval currentTick:(NSInteger)currentTick {
    // make everything pass through me except for fist
    if ([spell.type isEqualToString:Fist]) {
        wizard.effect = nil;                // the helmet is broken!
        // it wasn't fun that way. Better that it lasts longer. You're immune to fists
        // It's sort of trick question
        // NEVERMIND: decided to try having it cancel
        spell.strength = 0;
        return YES;
    }

    // Hmm, maybe this is a bad idea. Grom is already kind of OP
    // But not for advanced guys, might as well just leave the helmet on (I think that's what advanced players are doing)
    // It doesn't make a lot of sense though
//    else if ([spell isKindOfClass:[SpellLightningOrb class]]) {
//        wizard.effect = nil;
//    }
    
    return NO;
}

@end
