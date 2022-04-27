import threading

from H2O import H2O
from order import Foo


def water():
    h2o = H2O()
    inp = "OOHHHH"
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


def main():
    # foo_order()
    water()


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
