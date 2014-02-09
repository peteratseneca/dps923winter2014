//
//  main.m
//  Arr Cons 1
//
//  Created by Peter McIntyre on 1/27/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Theme - our first code example that uses an array
        
        // Three arrays in this example - one immutable, to mutable
        
        
        // Immutable array - its dimensions and pointers cannot be changed
        // (however, it may be possible to change the objects that are pointed to)
        // Static NSString objects
        // Declare using 'array literal' syntax
        NSArray *staticStrings = @[@"red", @"green", @"blue", @"yellow", @"brown", @"purple"];
        // Output to the debug console
        NSLog(@"\n%@", [staticStrings description]);
        
        
        // Mutable array - its dimensions and pointers CAN be changed
        // Array elements MUST be objects
        // So, must wrap - box - primitive/scalar C values (int, float, etc.)
        // Do this with NSNumber class methods
        // And, must unwrap - unbox - back if you need to do that
        // First, declare and initialize the mutable array
        NSMutableArray *boxingDemo = [[NSMutableArray alloc] init];
        // Then, add objects... first, a static NSString object
        [boxingDemo addObject:@"hello"];
        // Next, wrap/box some primitive/scalar C values
        [boxingDemo addObject:[NSNumber numberWithInt:23]];
        [boxingDemo addObject:[NSNumber numberWithDouble:23.45]];
        [boxingDemo addObject:[NSNumber numberWithFloat:23.45f]];
        // Hey - include the static strings array from above
        [boxingDemo addObject:staticStrings];
        // Output to the debug console
        NSLog(@"\n%@", [boxingDemo description]);

        
        // Unwrap / unbox values - int, double, float
        int box1 = [[boxingDemo objectAtIndex:1] intValue];
        double box2 = [[boxingDemo objectAtIndex:2] doubleValue];
        float box3 = [[boxingDemo objectAtIndex:3] floatValue];
        // Output to the debug console
        NSLog(@"\nint %d, double %1.2f, float %1.2f", box1, box2, box3);
        
        
        // Generate objects for an array based on a calculation
        // Then the resulting value will be wrapped/boxed implicitly by using NSString stringWithFormat:
        // So... create a totally made up calculated value
        double calculatedValue = (double)box1 * 6 / 8.43;
        // Declare and initialize another mutable array
        NSMutableArray *dynamicContent = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            [dynamicContent addObject:[NSString stringWithFormat:@"Blurt value is %1.2f", ((2 * i) + calculatedValue)]];
        }
        // Output to the debug console
        NSLog(@"\n%@", [dynamicContent description]);
        
    }
    return 0;
}

