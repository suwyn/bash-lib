#!/usr/bin/env bash

Assert.true "Is.eq 'foobar' 'foobar'" \
  <<< 'Is.eq is true when two strings match'

Assert.false "Is.eq 'foobar' 'Foobar'" \
  <<< 'Is.eq is false when two strings differ in case'
