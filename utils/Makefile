SRC_FILE= perf.cpp

SRC_OBJS := $(patsubst %.cpp, ${OBJS_DIR}/%.o, $(notdir $(SRC_FILE)))

.PHONY: all clean

all: print ${SRC_OBJS}

${SRC_OBJS} : ${OBJS_DIR}/%.o : %.cpp
	echo "build utils objs"
	${CXX} -o $@  -c $< ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}

print:
	echo "SRC_OBJS:${SRC_OBJS}"
	echo "OBJS_DIR ${OBJS_DIR}"

clean:
	rm -rf ${SRC_OBJ}


