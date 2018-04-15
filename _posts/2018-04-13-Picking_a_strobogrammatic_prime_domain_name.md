---
layout: post
title: Picking a strobogrammatic prime number domain name
published: true
fullview: false
description: Picking a domain name can be stresful, or you can just pick a pseudo-random number.
tags:
- python
---
# Why...
After several sessions of scratching my chin thinking about a text based domain name and coming up with no good ideas, or finding out that the best ones where already taken, I decided to simplify the whole thing and just pick a number.
If you can pick any number, why not picking a cool number...

## What is a strobogrammatic prime number?
From [Wikipedia]
{% highlight text %}
A strobogrammatic number is a number whose numeral is rotationally symmetric, so that it appears the same when rotated 180 degrees. In other words, the numeral looks the same right-side up and upside down (e.g., 69, 96, 1001). A strobogrammatic prime is a strobogrammatic number that is also a prime number, i.e., a number that is only divisible by one and itself.
{% endhighlight %}

## Finding a strobogrammatic prime number
I put together a simple script to find the numbers

{% highlight python %}
#!/bin/env python3
# Find strobogrammatic prime numbers

# Implementation of the AKS algorith
# Source https://stackoverflow.com/a/1801446
def isPrime(n):
    '''Returns True if n is a prime number'''
    if (n == 2) or (n == 3):
        return True
    if (n % 2 == 0) or (n % 3 == 0):
        return False

    i = 5
    w = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += w
        w = 6 - w
    return True

# Source https://github.com/kamyu104/LeetCode/blob/master/Python/strobogrammatic-number.py
def isStrobogrammatic(num):
    '''Returns True if n is a strobogrammatic string'''
    lookup = {'0':'0', '1':'1', '6':'9', '8':'8', '9':'6'}

    n = len(num)
    for i in range(round((n+1) / 2)):
        if num[n-1-i] not in lookup or \
           num[i] != lookup[num[n-1-i]]:
            return False
    return True

# I only want numbers of 5 and 6 digits
x = 10001
while x <= 999999:
    if isStrobogrammatic(str(x)):
      if isPrime(x):
        print("strobogrammatic prime: ",x)
    x+=2
{% endhighlight %}

{% highlight shell %}
$ time python3 ./strobogrammatic_prime_number_finder.py
strobogrammatic prime:  16091
strobogrammatic prime:  18181
strobogrammatic prime:  19861
strobogrammatic prime:  61819
strobogrammatic prime:  116911
strobogrammatic prime:  119611
strobogrammatic prime:  160091
strobogrammatic prime:  169691
strobogrammatic prime:  191161
strobogrammatic prime:  196961
strobogrammatic prime:  686989
strobogrammatic prime:  688889
python3 ./strobogrammatic_prime_number_finder.py  0.83s user 0.01s system 98% cpu 0.852 total
{% endhighlight %}

# And the winner is... 191161.xyz
Because I want my dns to support DNSSEC ([reasons...]) I needed to pick a [TLD which root zone has been signed]. I choose some of the prime numbers and a couple cheap TLD, and after reviewing my options, I locked in with 191161.xyz for $5 a year.


[Wikipedia]: https://en.wikipedia.org/wiki/Strobogrammatic_number
[reasons...]: https://webmasters.stackexchange.com/questions/35597/how-to-find-domain-registrar-and-dns-hosting-with-good-dnssec-support
[TLD which root zone has been signed]: https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains
