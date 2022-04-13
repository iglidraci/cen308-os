/*
 * pipes are a conduit allowing two processes to communicate
 * unidirectional => two pipes
 * standard output from one process becomes the standard input of the other
 * fd[] file descriptors array
 * fd[0] is the read end of the pipe and fd[1] is for the write end of the pipe
 * pipes are accessed using ordinary read() and write() syscall
 * */
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define MESSAGE_SIZE 16
char* msg1 = "hello, world #1";
char* msg2 = "hello, world #2";
char* msg3 = "hello, world #3";

int main()
{
    char buffer[MESSAGE_SIZE];
    int fd[2], i;

    if (pipe(fd) < 0)
        exit(1);

    /* write pipe */

    write(fd[1], msg1, MESSAGE_SIZE);
    write(fd[1], msg2, MESSAGE_SIZE);
    write(fd[1], msg3, MESSAGE_SIZE);

    // read the pipe

    read(fd[0], buffer, MESSAGE_SIZE);
    printf("%s\n", buffer);

    read(fd[0], buffer, MESSAGE_SIZE);
    printf("%s\n", buffer);

    read(fd[0], buffer, MESSAGE_SIZE);
    printf("%s\n", buffer);
    return 0;
}