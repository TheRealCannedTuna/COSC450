// Name: Jason Press
// Date: 5 April 2024
// Assignment: CONCURRENCY 5
// File: Algorithm-3-6.cpp

#include <cstdlib>
#include <iostream>
#include <thread>
#include "Util450.cpp"
using namespace std;

bool wantp, wantq = false;
volatile int n = 0;

void pRun(int m) {
    int temp = n;
    for (int i = 0; i < m; i++) {
        while (wantq != false); // await wantq = false
        randomDelay(10);
        wantp = true;
        randomDelay(10);
        //critical section
        temp = n;
        randomDelay(10);
        n = temp + 1;
        randomDelay(10);
        wantp = false;
    }
}


void qRun(int m) {
    int temp = n;
    for (int i = 0; i < m; i++) {
        while (wantp != false); // await wantp = false
        randomDelay(10);
        wantq = true;
        randomDelay(10);
        //critical section
        temp = n;
        randomDelay(10);
        n = temp + 1;
        randomDelay(10);
        wantq = false;
    }
}


int main(int argc, char **argv) {
    int myMax = stoi(argv[1]);
    thread p(pRun, myMax);
    thread q(qRun, myMax);
    p.join();
    q.join();
    cout << "The value of n is " << n << endl;
    return EXIT_SUCCESS;
}
