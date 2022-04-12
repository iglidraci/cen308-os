#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>

void example1();

void example2();

void example3();

void example4();

int main()
{
    // example1();
    // example2();
    // example3();
    // example4();
    return 0;
}

void example3() {
    int stat;

    // This status 1 is reported by WEXITSTATUS
    if (fork() == 0)
        exit(1);
    else
        wait(&stat);
    if (WIFEXITED(stat))
        printf("Exit status: %d\n", WEXITSTATUS(stat));
    else if (WIFSIGNALED(stat))
        psignal(WTERMSIG(stat), "Exit signal");
    // WIFSIGNALED returns a nonzero value if the child process terminated
    // because it received a signal that was not handled
    // psignal() function displays a message on stderr
}

void example4() {
    int stat;
    pid_t process_ids[5];
    for (int i=0; i<5; i++)
    {
        process_ids[i] = fork();
        if (process_ids[i] == 0)
        {
            sleep(1);
            exit(100 + i);
        }
    }
    for (int i=0; i<5; i++)
    {
        pid_t children_pid = waitpid(process_ids[i], &stat, 0);
        // This macro returns a nonzero value if the child process terminated normally with exit
        if (WIFEXITED(stat))
            printf("Child %d terminated with status: %d (%d)\n",
                   children_pid, WEXITSTATUS(stat), stat);
        // this macro (WEXITSTATUS) returns the low-order 8 bits of the exit status value from the child process
        // the actual status that we return from exit
    }
}

void example2() {
    if (fork() == 0){
        printf("Hello from child process\n");
		printf("my parent process id is: %d\n", getppid());
        exit(0);
    }
    else {
        printf("hello from parent process\n");
        int child_exit_status;
        wait(&child_exit_status);
        printf("child finished with exit status %d\n", child_exit_status);
    }
    printf("bye from process id %d\n", getpid());
}

void example1() {
    // A call to wait() blocks the calling process until one of its child
	// processes exits or a signal is received
    pid_t children_pid;
    if (fork()== 0)
        exit(0); // terminate child process
    else
        children_pid = wait(NULL);
    printf("Parent pid = %d\n", getpid());
    printf("Child pid = %d\n", children_pid);
}
