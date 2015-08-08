#include <stdio.h>

static void printEntry(char encoding, int value) {
    printf("%d, // %d=%c\n", encoding, value, encoding);
}

static void generateStandardAlphabet() {
    printf("let StandardAlphabet : [UInt8] = [\n");
    int i = 0;
    for(char c = 'A'; c <= 'Z'; ++c) {
        printEntry(c, i++);
    }
    for(char c = 'a'; c <= 'z'; ++c) {
        printEntry(c, i++);
    }
    for(char c = '0'; c <= '9'; ++c) {
        printEntry(c, i++);
    }
    printEntry('+', i++);
    printEntry('/', i++);
    printf("// PADDING FOLLOWS, not used during lookups\n");
    printEntry('=', i++);
    printf("]\n");
}

static void generateURLAndFilenameSafeAlphabet() {
    printf("let URLAndFilenameSafeAlphabet : [UInt8] = [\n");
    int i = 0;
    for(char c = 'A'; c <= 'Z'; ++c) {
        printEntry(c, i++);
    }
    for(char c = 'a'; c <= 'z'; ++c) {
        printEntry(c, i++);
    }
    for(char c = '0'; c <= '9'; ++c) {
        printEntry(c, i++);
    }
    printEntry('-', i++);
    printEntry('_', i++);
    printf("// PADDING FOLLOWS, not used during lookups\n");
    printEntry('=', i++);
    printf("]\n");
}

int main() {
    generateStandardAlphabet();
    printf("\n");
    generateURLAndFilenameSafeAlphabet();
    return 0;
}
