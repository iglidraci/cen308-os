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
    int fd[2], n_bytes;
    pid_t pid;
    if (pipe(fd) < 0)
        exit(1);
    pid = fork();
    if (pid > 0) {
        // parent will write
        write(fd[1], msg1, MESSAGE_SIZE);
        write(fd[1], msg2, MESSAGE_SIZE);
        write(fd[1], msg3, MESSAGE_SIZE);
    }

    else {
        close(fd[1]);
        while ((n_bytes = read(fd[0], buffer, MESSAGE_SIZE)) > 0)
            printf("%s\n", "a");
        printf("Finished reading\n");
    }
    return 0;
}
