# ArgParser
Weekly Source Code #201804

Home project for reusable argument parser class.  

ArgParser methods:
- (id) initWithArgs: (NSArray *) args;
// sets member var w/ argsArray
// not needed for C version 

- (bool) isInArgs: (NSString *) name withAValue: (bool) bWithValue;
// returns true/false.

- (NSString *) getArgValue: (NSString *) name;
// returns val for arg specified or "NOT_SET" 

- (bool) doesArg: (NSString *) name haveValue: (NSString *) value;
// returns true/false if argName has value specified.

Test cases:
isInArgs, bWithValue, test with, without, and last param with value 

Test Params    
-ANoValue -BWithValue 24 -CNoValue -DLastWithValue 42
