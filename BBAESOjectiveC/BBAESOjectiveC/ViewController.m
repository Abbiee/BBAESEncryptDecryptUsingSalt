//
//  ViewController.m
//  BBAESOjectiveC
//
//  Created by Abbie on 05/11/20.
//

#import "ViewController.h"
#import "BBAES.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *mySecretKey = @"9336365521W5F092BB5909E8E033BC69";
    NSString *dataTobeEncrypted = @"Do any additional setup after loading the view.";
    NSData *saltedKey = [BBAES keyBySaltingPassword:mySecretKey salt:[BBAES randomIV] keySize:BBAESKeySize128 numberOfIterations:10000];
    NSData* encryptedData = [BBAES encryptedDataFromData:[dataTobeEncrypted dataUsingEncoding:NSUTF8StringEncoding] IV:[BBAES randomIV] key:[mySecretKey dataUsingEncoding:NSUTF8StringEncoding] options:BBAESEncryptionOptionsIncludeIV];
    NSLog(@"EncriptedWithDynamicIV: %@", [encryptedData base64EncodedStringWithOptions:0]);
   // NSString *mySecretKey = @"9336365521W5F092BB5909E8E033BC69";
//    NSString *base64Encoded = @"xY8JYrjR4HSSinxerbcH7FQOiU6DM/vf8PG4liusC8MPX/6vGGVP4vW2N7YM70ISPwKa6z5HX/h5wPgHGcTHV0NBpsCp+ipb2+CWhOZLiFE=";
//         NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
        NSData* decryptedData = [BBAES decryptedDataFromData:encryptedData IV:nil key:[mySecretKey dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"decryptedWithDynamicIV: %@", [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]);
}


@end
