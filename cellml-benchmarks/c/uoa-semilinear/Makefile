TARGET = uoa_semilinear
CC ?= gcc
BASEDIR ?= $(shell (pwd | sed 's/ /\\ /g'))
CFLAGS ?= -c -O2 -Wall -I$(BASEDIR)
LDFLAGS ?= -g -Wall
LDLIBS ?= -lm
AR ?= ar
ARFLAGS ?= cr
AREXTRACT ?= x
OBJECTSDIR ?= Objects

export

build: $(TARGET)

$(OBJECTSDIR)/runnable.o: runnable.c $(BASEDIR)/config.h
	@echo Building runnable...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

.PHONY: UoaSemilinearNetwork/uoa_semilinear.a
UoaSemilinearNetwork/uoa_semilinear.a:
	@$(MAKE) -C UoaSemilinearNetwork/ uoa_semilinear.a

$(TARGET): $(OBJECTSDIR)/runnable.o UoaSemilinearNetwork/uoa_semilinear.a
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@cd \$(OBJECTSDIR) && \$(AR) \$(AREXTRACT) ../UoaSemilinearNetwork/uoa_semilinear.a
	@$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~
	@$(MAKE) -C UoaSemilinearNetwork/ clean