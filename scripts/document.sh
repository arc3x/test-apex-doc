#!/usr/bin/env bash
java -jar apexdoc.jar -s 'src/classes' -t 'documentation' -p 'global;public;private;testmethod;webService' -g "https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}/tree/master/src/classes/"
ls
mv documentation/ApexDocumentation/* *
ls
