SRC_FILE= log_test.cpp

SRC_OBJS = $(patsubst %.cpp,${OBJS_DIR}/%.o,$(notdir $(SRC_FILE)))

.PHONY: all clean

all: ${SRC_OBJS} log_test clean

log_test:${SRC_OBJS}
	${CXX} -o ${STUDY_OUTPUT}/$@ ${OBJS_DIR}/*.o ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}

${SRC_OBJS}: ${OBJS_DIR}/%.o : %.cpp
	$(CXX) -o $@ -c $< ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}

clean:
	rm -rf ${SRC_OBJ}