#include <stdio.h>
#define PAGE_SIZE 1024
#define PAGE_OFFSET_BITS 10

int main() {
    unsigned int address;
    printf("Enter the address: ");
    scanf("%lu", &address);
    unsigned int page_nr = address >> PAGE_OFFSET_BITS; // right
    unsigned int page_offset = address % PAGE_SIZE;
    printf("The address %lu contains:\n", address);
    printf("page number = %lu\n", page_nr);
    printf("page offset = %lu\n", page_offset);
    return 0;
}
