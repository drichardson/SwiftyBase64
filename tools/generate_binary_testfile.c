#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
    if (argc != 3) {
        fprintf(stderr, "Missing arguments.\nUsage: generate_binary_testfile <start_byte_value> <end_byte_value>\n");
        exit(1);
    }

    int start = atoi(argv[1]);
    int end = atoi(argv[2]);

    if (start < 0 || start > end || end < 0) {
        fprintf(stderr, "Illegal start (%d) or end (%d) values.\n", start, end);
        exit(1);
    }
    
    for(int i = start; i <= end; ++i) {
        putc(i, stdout);
    }
    return 0;
}

