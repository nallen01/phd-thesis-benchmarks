TARGET = uoa_semilinear.a
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

$(OBJECTSDIR)/uoa_semilinear.o: uoa_semilinear.c uoa_semilinear.h $(BASEDIR)/config.h
	@echo Building uoa_semilinear...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/cell.o $(OBJECTSDIR)/stimulator.o $(OBJECTSDIR)/uoa_semilinear.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~