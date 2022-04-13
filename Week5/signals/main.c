#include<stdio.h>
#include<signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>

int a = 10;

// signal handler function must have return type void and have one int parameter.
void handle_sigint(int);

void handle_sigterm(int);

void handle_sigchld(int);

void example1();

void example2();

void example3();

int main()
{
    //example1();
    // example2(); // kill
    example3();
    return 0;
}

void example3() {
    pid_t pid;
    signal(SIGCHLD, handle_sigchld); // to parent on child stop or exit
    if ((pid = fork()) == 0)
    {
        a -= 5;
        exit(0);
    }
    waitpid(pid, NULL, 0);
    printf("a = %d\n", a);
    exit(0);
}

void example2() {
    // kill() is used to send a signal to the process
    // kill(pid_t process_id, int signal)
    int status;
    pid_t process_id;
    process_id = fork();
    if (process_id == 0)
        while(true);
    else
    {
        kill(process_id, SIGABRT);
        wait(&status);
        if (WIFSIGNALED(status)) // terminated because it received a signal
            psignal(WTERMSIG(status), "Child term due to"); // signal number of the signal that terminated the child process
    }
}

void example1() {
    signal(SIGINT, handle_sigint);
    signal(SIGTERM, handle_sigterm);
    while (true)
    {
        printf("hi\n");
        sleep(1);
    }
}

void handle_sigint(int signal) {
    printf(" handler: signal %d\n", signal);
    printf("exiting ...\n");
    exit(0);
}

void handle_sigterm(int signal) {
    // make sure to exit otherwise it will keep running even if you are using an IDE
    printf("handler: sigterm %d\n", signal);
    exit(0);
}

void handle_sigchld(int signal) {
    a += 10;
}
