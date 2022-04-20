SRC_FILE= log.cpp

SRC_OBJS = (patsubst %.cpp,${OBJS_DIR}/%.o,$(notdir $(SRC_FILE)))

.PHONY: all clean

all: SRC_OBJS clean

SRC_OBJ: ${OBJS_DIR}/%.o : %.cpp
	${CXX} -o $@ ${OBJS_DIR}/*.o ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}
clean:
	rm -rf ${SRC_OBJ}


