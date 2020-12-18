
CC = gcc
CLIBS = -lcrypto -L/usr/src/openssl-1.1.1i
CFLAGS = -Wall -O3
SOURCES= cpor-gen-keys.c cpor-tag-file.c cpor-gen-challenge.c cpor-calc-response.c cpor-verify-response.c
TARGETS= cpor-gen-keys cpor-tag-file cpor-gen-challenge cpor-calc-response cpor-verify-response

all: $(TARGETS)

cpor-gen-keys: cpor-gen-keys.o
	$(CC) $< -o $@ $(CLIBS)

cpor-tag-file: cpor-tag-file.o
	$(CC) $< -o $@ $(CLIBS)

cpor-gen-challenge: cpor-gen-challenge.o
	$(CC) $< -o $@ $(CLIBS)

cpor-calc-response: cpor-calc-response.o
	$(CC) $< -o $@ $(CLIBS)

cpor-verify-response: cpor-verify-response.o
	$(CC) $< -o $@ $(CLIBS)

%.o: %.c cpor.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f *.o $(TARGETS)
	@rm -f master_keys *.metadata *.tag *.challenge *.response
