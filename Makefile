ifeq ($(origin JAVA_HOME), undefined)
  JAVA_HOME=/usr
endif

ifneq (,$(findstring CYGWIN,$(shell uname -s)))
  JAVA_HOME := `cygpath -up "$(JAVA_HOME)"`
endif

JAVAC=$(JAVA_HOME)/bin/javac
SRCS=$(wildcard src/*.java)

table.jar: $(SRCS) manifest.txt NetLogoHeadless.jar Makefile
	mkdir -p classes
	$(JAVAC) -g -deprecation -Xlint:all -Xlint:-serial -Xlint:-path -encoding us-ascii -source 1.7 -target 1.7 -classpath NetLogoHeadless.jar:$(HOME)/.sbt/boot/scala-2.10.1/lib/scala-library.jar -d classes $(SRCS)
	jar cmf manifest.txt table.jar -C classes .

NetLogoHeadless.jar:
	curl -f -s -S 'http://ccl.northwestern.edu/devel/NetLogoHeadless-e2bba9de.jar' -o NetLogoHeadless.jar

table.zip: table.jar
	rm -rf table
	mkdir table
	cp -rp table.jar README.md Makefile src manifest.txt table
	zip -rv table.zip table
	rm -rf table
