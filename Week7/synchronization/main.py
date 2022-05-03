import threading

from H2O import H2O
from order import Foo
from philosophers import DP1, DP2, DPBad


def water():
    h2o = H2O()
    inp = "OOHHHHOOHHHHHHO"
    threads = []
    for i in range(len(inp)):
        if inp[i] == 'H':
            threads.append(threading.Thread(target=h2o.hydrogen))
        else:
            threads.append(threading.Thread(target=h2o.oxygen))
    for t in threads:
        t.start()
    for t in threads:
        t.join()


def dining_philosophers():
    philosophers = ["Descartes", "Socrates", "Aurelius", "Machiavelli", "Thales"]
    dp = DP1(philosophers)
    n = 5
    # n is the number of times each philosopher will call the function
    threads = [threading.Thread(target=dp.eat, args=(i % 5,)) for i in range(5*n)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    print("Done")


def main():
    # foo_order()
    # water()
    dining_philosophers()


def foo_order():
    foo = Foo()
    t1 = threading.Thread(target=foo.first)
    t2 = threading.Thread(target=foo.second)
    t3 = threading.Thread(target=foo.third)
    # starting threads
    t3.start()
    t2.start()
    t1.start()
    t3.join()
    t2.join()
    t1.join()
    print("Finished")


if __name__ == '__main__':
    main()
