#!/usr/bin/env python
# encoding: utf-8
"""
Description of script
Created by Niall Kavanagh <> on mm/dd/yyyy
"""

from __future__ import print_function
import argparse
import sys

def main():
    # command line args
    parser = argparse.ArgumentParser(description='Description of script')
    parser.add_argument('position', help='describe position')
    parser.add_argument('--named', default='value',
                        help='described named arg')

    args = parser.parse_args()

    sys.exit(0)

if __name__ == '__main__':
    main()
