#!/usr/bin/env bash

SBT_VERSION="${SBT_VERSION:-1.2.8}"

sbt "++$TRAVIS_SCALA_VERSION test"                                   || travis_terminate 1
sbt +publishLocal                                                    || travis_terminate 1
sbt ";project plugin;set scriptedSbt := \"${SBT_VERSION}\";scripted" || travis_terminate 1
