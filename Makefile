export CC:=gcc
export CXX:=g++

export STUDY_LDLIB := -L./
export CURRENT_DIR := $(shell pwd)
export OBJS_DIR := ${CURRENT_DIR}/build
export STUDY_OUTPUT := ${CURRENT_DIR}/output
export STUDY_INCLUDE += -I${CURRENT_DIR} -I${CURRENT_DIR}/include -I${CURRENT_DIR}/utils -I./


BUILD_MODE?=release
ifeq (${BUILD_MODE}, release)
  export STUDY_FLAGS += -O3 -std=c++11 -fPIC
else
  export STUDY_FLAGS += -g -std=c++11 -fPIC
endif


#TEST_SRC := log_test.cpp
#CPP_SRC += ${TEST_SRC}
#VPATH := ${CURRENT_DIR}/utils ${CURRENT_DIR}/tests ${CURRENT_DIR}/tests/log_test

#OBJS = $(addprefix $(OBJS_DIR)/,$(patsubst %.cpp,%.o,$(notdir $(CPP_SRC))))

.PHONY: all create_dir utils tests clean

all: create_dir utils tests

utils:
	echo "build utils"
	${MAKE} -C $@

tests:utils
	echo "build tests"
	${MAKE} -C $@

# log_test: create_dir ${BUILD_UTILS} ${OBJS}
# 	@echo "build log test"
# 	${CXX} -o $@ ${OBJS_DIR}/*.o ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}

create_dir:
	@echo "mkdir dir"
	mkdir -p ${OBJS_DIR}
	mkdir -p ${STUDY_OUTPUT}

#${OBJS}: ${OBJS_DIR}/%.o: %.cpp
#	@echo "build objs"
#	$(CXX) -o $@ -c $< ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}
#	#$(CXX) ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS} -c -o $(OBJS_DIR)/$(notdir $@) $<

clean:
	echo "OBJS_DIR ${OBJS_DIR}"
	rm -rf ${OBJS_DIR}
	rm -rf ${STUDY_OUTPUT}
	${MAKE} -C utils clean
	${MAKE} -C tests clean
