#!/usr/bin/env bash

(set -x; brew update;)

(set -x; brew cleanup;)

(set -x; brew upgrade;)

(set -x; brew  cu -a;)

(set -x; brew doctor;)
