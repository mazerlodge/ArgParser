//
//  main.m
//  ArgParserTest
//
//  Created bymazerlodge on 6/9/18.
//  Copyright © 2018 mazerlodge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArgParser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Copy params in argv into an NSArray object
        NSMutableArray *paramsArray = [[NSMutableArray alloc] initWithCapacity:argc];
        for (int x=0; x<argc; x++) {
            NSString *aParam = [[NSString alloc] initWithCString:argv[x] encoding:NSASCIIStringEncoding];
            [paramsArray addObject:aParam];
        }
        
        // Dump params
        for (int x=0; x< [paramsArray count]; x++)
            NSLog(@"Param [%d] = [%@]\n", x, paramsArray[x]);

        // Run arg parser tests
        ArgParser *argParser = [[ArgParser alloc] initWithArgs: paramsArray];
        
        // Test params -ANoValue -BWithValue 24 -CNoValue -DLastWithValue 42
        
        // Test param present
        NSString *testResult = @"FAILED";
        if ([argParser isInArgs:@"-ANoValue" withAValue:false])
            testResult = @"PASSED";
        NSLog(@"%@ detected -ANoValue without a value required\n", testResult);
        
        if ([argParser isInArgs:@"-BWithValue" withAValue:true])
            testResult = @"PASSED";
        else
            testResult = @"FAILED";
        NSLog(@"%@ detected -BWithValue with a value required\n", testResult);

        if ([argParser isInArgs:@"-CNoValue" withAValue:false])
            testResult = @"PASSED";
        else
            testResult = @"FALSE";
        NSLog(@"%@ detected -CNoValue without a value required\n", testResult);

        if ([argParser isInArgs:@"-DLastWithValue" withAValue:true])
            testResult = @"PASSED";
        else
            testResult = @"FAILED";
        NSLog(@"%@ detected -DLastWithValue with a value required\n", testResult);

        NSInteger paramValue = [[argParser getArgValue:@"-BWithValue"] integerValue];
        if (paramValue == 24)
            testResult = @"PASSED";
        else 
            testResult = @"FALSE";
        NSLog(@"%@ parsed middle arg value as integer\n", testResult);

        paramValue = [[argParser getArgValue:@"-DLastWithValue"] integerValue];
        if (paramValue == 42)
            testResult = @"PASSED";
        else
            testResult = @"FALSE";
        NSLog(@"%@ parsed last arg value as integer\n", testResult);

    }
    return 0;
}
