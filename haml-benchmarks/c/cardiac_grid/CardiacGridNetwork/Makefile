TARGET = cardiac_grid.a
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

$(OBJECTSDIR)/cell0.o: Cell/cell0.c Cell/cell0.h $(BASEDIR)/config.h
	@echo Building Cell0...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell1.o: Cell/cell1.c Cell/cell1.h $(BASEDIR)/config.h
	@echo Building Cell1...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell10.o: Cell/cell10.c Cell/cell10.h $(BASEDIR)/config.h
	@echo Building Cell10...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell11.o: Cell/cell11.c Cell/cell11.h $(BASEDIR)/config.h
	@echo Building Cell11...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell12.o: Cell/cell12.c Cell/cell12.h $(BASEDIR)/config.h
	@echo Building Cell12...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell13.o: Cell/cell13.c Cell/cell13.h $(BASEDIR)/config.h
	@echo Building Cell13...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell14.o: Cell/cell14.c Cell/cell14.h $(BASEDIR)/config.h
	@echo Building Cell14...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell15.o: Cell/cell15.c Cell/cell15.h $(BASEDIR)/config.h
	@echo Building Cell15...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell16.o: Cell/cell16.c Cell/cell16.h $(BASEDIR)/config.h
	@echo Building Cell16...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell17.o: Cell/cell17.c Cell/cell17.h $(BASEDIR)/config.h
	@echo Building Cell17...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell18.o: Cell/cell18.c Cell/cell18.h $(BASEDIR)/config.h
	@echo Building Cell18...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell19.o: Cell/cell19.c Cell/cell19.h $(BASEDIR)/config.h
	@echo Building Cell19...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell2.o: Cell/cell2.c Cell/cell2.h $(BASEDIR)/config.h
	@echo Building Cell2...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell20.o: Cell/cell20.c Cell/cell20.h $(BASEDIR)/config.h
	@echo Building Cell20...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell21.o: Cell/cell21.c Cell/cell21.h $(BASEDIR)/config.h
	@echo Building Cell21...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell22.o: Cell/cell22.c Cell/cell22.h $(BASEDIR)/config.h
	@echo Building Cell22...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell23.o: Cell/cell23.c Cell/cell23.h $(BASEDIR)/config.h
	@echo Building Cell23...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell24.o: Cell/cell24.c Cell/cell24.h $(BASEDIR)/config.h
	@echo Building Cell24...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell3.o: Cell/cell3.c Cell/cell3.h $(BASEDIR)/config.h
	@echo Building Cell3...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell4.o: Cell/cell4.c Cell/cell4.h $(BASEDIR)/config.h
	@echo Building Cell4...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell5.o: Cell/cell5.c Cell/cell5.h $(BASEDIR)/config.h
	@echo Building Cell5...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell6.o: Cell/cell6.c Cell/cell6.h $(BASEDIR)/config.h
	@echo Building Cell6...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell7.o: Cell/cell7.c Cell/cell7.h $(BASEDIR)/config.h
	@echo Building Cell7...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell8.o: Cell/cell8.c Cell/cell8.h $(BASEDIR)/config.h
	@echo Building Cell8...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cell9.o: Cell/cell9.c Cell/cell9.h $(BASEDIR)/config.h
	@echo Building Cell9...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/stimulator.o: Stimulator/stimulator.c Stimulator/stimulator.h $(BASEDIR)/config.h
	@echo Building Stimulator...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(OBJECTSDIR)/cardiac_grid.o: cardiac_grid.c cardiac_grid.h $(BASEDIR)/config.h
	@echo Building cardiac_grid...
	@mkdir -p $(OBJECTSDIR)
	@$(CC) $(CFLAGS) $< -o $@

$(TARGET): $(OBJECTSDIR)/cell0.o $(OBJECTSDIR)/cell1.o $(OBJECTSDIR)/cell10.o $(OBJECTSDIR)/cell11.o $(OBJECTSDIR)/cell12.o $(OBJECTSDIR)/cell13.o $(OBJECTSDIR)/cell14.o $(OBJECTSDIR)/cell15.o $(OBJECTSDIR)/cell16.o $(OBJECTSDIR)/cell17.o $(OBJECTSDIR)/cell18.o $(OBJECTSDIR)/cell19.o $(OBJECTSDIR)/cell2.o $(OBJECTSDIR)/cell20.o $(OBJECTSDIR)/cell21.o $(OBJECTSDIR)/cell22.o $(OBJECTSDIR)/cell23.o $(OBJECTSDIR)/cell24.o $(OBJECTSDIR)/cell3.o $(OBJECTSDIR)/cell4.o $(OBJECTSDIR)/cell5.o $(OBJECTSDIR)/cell6.o $(OBJECTSDIR)/cell7.o $(OBJECTSDIR)/cell8.o $(OBJECTSDIR)/cell9.o $(OBJECTSDIR)/stimulator.o $(OBJECTSDIR)/cardiac_grid.o
	@echo Building $(TARGET)...
	@rm -f $(TARGET)
	@$(AR) $(ARFLAGS) $(TARGET) $(OBJECTSDIR)/*.o

.PHONY: clean
clean:
	@echo Removing compiled binaries...
	@rm -rf $(TARGET) $(OBJECTSDIR)/* *~