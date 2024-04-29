#!/usr/local/bin/python3

# encoding: utf-8

import sys


def main(args):
    # print(args[0])
    value=args[0]
    incremented = int(value) + 1
    print(incremented)
    exit(0) 
    

if __name__ == "__main__":
    # print("Hello", sys.argv[0])
    args = sys.argv[1:]
    main(args)
    
