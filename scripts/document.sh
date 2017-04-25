#!/usr/bin/env bash
pwd && java -jar apexdoc.jar -s 'src/classes' -t 'documentation' -p 'global;public;private;testmethod;webService' -g 'https://github.com/arc3x/test-apex-doc/tree/master/src/classes'   
