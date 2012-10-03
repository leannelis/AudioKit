//
//  OCSStereoConvolution.m
//  Objective-C Sound
//
//  Created by Aurelius Prochazka on 6/27/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSStereoConvolution.h"

@interface OCSStereoConvolution () {
    OCSParameter *aOutL;
    OCSParameter *aOutR;
    OCSParameter *aIn;
    NSString *iFilCod;
}
@end

@implementation OCSStereoConvolution

@synthesize leftOutput=aOutL;
@synthesize rightOutput=aOutR;

- (id)initWithInputAudio:(OCSParameter *)inputAudio
     impulseResponseFile:(NSString *)impulseResponseFilename;
{
    self = [super init];
    if (self) {
        aOutL  = [OCSParameter parameterWithString:[NSString stringWithFormat:@"%@%@",[self operationName], @"L"]];
        aOutR  = [OCSParameter parameterWithString:[NSString stringWithFormat:@"%@%@",[self operationName], @"R"]];
        aIn     = inputAudio;
        iFilCod = impulseResponseFilename;
    }
    return self;
}

// Csound prototype: ar1 [, ar2] [, ar3] [, ar4] pconvolve ain, ifilcod [, ipartitionsize, ichannel]
- (NSString *)stringForCSD
{
    return [NSString stringWithFormat:
            @"%@, %@ pconvolve %@, \"%@\"",
            aOutL, aOutR, aIn, iFilCod];
}

@end
