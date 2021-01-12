TARGET = uoa_myocite.a
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

$(OBJECTSDIR)/cell.o: Cell/cell.c Cell/cell.h $(BASEDIR)/config.h
	@echo Building Cell...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/stimulator.o: Stimulator/stimulator.c Stimulator/stimulator.h $(BASEDIR)/config.h
	@echo Building Stimulator...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/uoa_myocite.o: uoa_myocite.c uoa_myocite.h $(BASEDIR)/config.h
	@echo Building uoa_myocite...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/cell.o $(OBJECTSDIR)/stimulator.o $(OBJECTSDIR)/uoa_myocite.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~