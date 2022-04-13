#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>

void handle_sighup();
void handle_sigill();
void handle_quit();

void foo();

int main()
{
    int pid;
    pid = fork();
    // check if it failed forking
    if (pid < 0) {
        perror("fork failed");
        exit(1);
    }

    if (pid == 0) {
        printf("child handling SIGHUP\n");
        signal(SIGHUP, handle_sighup);
        printf("child handling SIGILL\n");
        signal(SIGILL, handle_sigill);
        printf("child handling SIGQUIT\n");
        signal(SIGQUIT, handle_quit);
        while (true);
    }

    else
    {
//        sleep(1);
        signal(SIGUSR1, foo);
        kill(getpid(), SIGUSR1);
        sleep(1);
        printf("parent process sending SIGHUP\n\n");
        kill(pid, SIGHUP);

        sleep(1);
        printf("parent process sending SIGILL\n\n");
        kill(pid, SIGILL);

        sleep(1);
        printf("parent process sending SIGQUIT\n\n");
        kill(pid, SIGQUIT);
    }
}

void foo() {
    printf("received user signal\n");
}

void handle_sighup()
{
    printf("child process received a signal hung up\n\n");
}

void handle_sigill()
{
    printf("child process received a signal illegal instruction\n\n");
}

void handle_quit()
{
    printf("child process received a signal to quit\n\n");
    exit(0);
}