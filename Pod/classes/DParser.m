#import "DParser.h"
#import <objc/runtime.h>
#import "NSString+Check.h"
#import "NSObject+PropertyType.h"

@implementation DParser

+ (id) parser:(NSDictionary *)dictionary class:(Class)class {

    if (!class || !dictionary) {
        return nil;
    }

    id obj = [[class alloc] init];

    [self setProperty:obj dict:dictionary class:class];

    return obj;
}

+ (void)setProperty:(id)obj dict:(NSDictionary *)dict class:(Class) class {

    unsigned int varCount;
    Ivar *ivars = class_copyIvarList(class, &varCount);

    for (int i = 0; i < varCount; i ++) {

        Ivar var = ivars[i];

        if (var != nil) {
            const char *var_name = ivar_getName(var);
            NSString *varName = [NSString stringWithCString:var_name encoding:NSUTF8StringEncoding];

            if ([NSString isNotEmpty:varName]) {// TO DO 增加判断字符串为空的NSString类别

                NSString *varNameWithOutUnderline = [varName substringFromIndex:1];
                id value = [dict valueForKey:varNameWithOutUnderline];

                NSString *propertyClassName = [obj getPropertyClassNameByPropertyName:varNameWithOutUnderline];
                if ([NSString isNotEmpty:propertyClassName]) {

                    id childObj = [[NSClassFromString(propertyClassName) alloc] init];
                    if (childObj != nil) {
                        [self setComplexPropertyValue:var propertyValue:value propertyClassName:propertyClassName parentObj:obj];
                    }
                } else {
                    if (value) {
                        object_setIvar(obj, var, value);
                    }
                }
            }
        }
    }


    free(ivars);
}

+ (void) setComplexPropertyValue:(Ivar)var propertyValue:(id) propertyValue propertyClassName:(NSString *)propertyClassName  parentObj:(id) parentObj {

    id obj = [[NSClassFromString(propertyClassName) alloc] init];

    if (obj != nil) {

        if ([propertyValue isKindOfClass:[NSArray class]]) {

            if (propertyValue != nil) {

                NSMutableArray *objArray = [[NSMutableArray alloc] init];
                NSMutableArray *dictArray = (NSMutableArray *)propertyValue;

                for (int i = 0; i < dictArray.count; i++) {
                    NSMutableDictionary *dict = dictArray[i];
                    [self setProperty:obj dict:dict class:NSClassFromString(propertyClassName)];

                    id newObj = [obj copy];
                    [objArray addObject:newObj];
                }

                object_setIvar(parentObj, var, objArray);
            }

        }
    }
}

@end
