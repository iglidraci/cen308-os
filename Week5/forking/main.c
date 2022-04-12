#include <stdio.h>
#include <unistd.h> // provides access to the POSIX OS API
void hello();

void multiple_processes(int);

void example1();

void example2();

void example3();

void example4();

int main()
{
    // hello();
    // multiple_processes(3);
    // example1();
    // example2();
    // example3();
    example4();
    return 0;
}

void example4() {
    fork();
    fork() && fork();
    printf("hello\n");
}

void example3() {
    int a = 10;
    if (fork() == 0) {
        a += 5;
        printf("%d, %p\n", a, &a);
    }
    else {
        a -= 5;
        printf("%d, %p\n", a, &a);
    }
}

void example2() {
    int nr = 0;
    if (fork() == 0) {
        printf("Child nr = %d\n", ++nr);
    } else {
        printf("parent nr = %d\n", --nr);
    }
    printf("Nr = %d\n", ++nr);
}

void example1() {
    if (fork() == 0)
        printf("hello from child process\n");
    else
        printf("hello from parent process\n");
}

void multiple_processes(int nr) {
    // arg nr will signify how many times we will call fork()
    // create multiple processes (how many?)
    for (int i = 0; i < nr; ++i) {
        fork();
    }
    printf("fork\n");
}

void hello() {
    // make two process which run the same program after this instruction
    fork();
    printf("Hello universe!\n");
}
