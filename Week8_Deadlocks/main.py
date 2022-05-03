from threading import Thread
from philosophers import DPBad, DP1, DP2

def start_join_threads(threads):
    for t in threads:
        t.start()
    for t in threads:
        t.join()

def main():
    dp = DP1()
    n = 5
    threads = [Thread(target=dp.eat, args=(i%5, )) for i in range(5*n)]
    start_join_threads(threads)
    print("Philosophers are done eating now")


if __name__ == '__main__':
    main()
    