CC=gcc
CXX=g++

export STUDY_LDLIB := -L./
export STUDY_INCLUDE += -I./ -I./include


BUILD_MODE?=release
ifeq (${BUILD_MODE}, release)
  STUDY_FLAGS += -O3 -std=c++11
else
  STUDY_FLAGS += -g -std=c++11
endif

export CURRENT_DIR := $(shell pwd)
export OBJS_DIR := ${CURRENT_DIR}/build

TEST_SRC := log_test.cpp 
CPP_SRC += ${TEST_SRC}
VPATH := ${CURRENT_DIR}/utils ${CURRENT_DIR}/tests ${CURRENT_DIR}/tests/log_test


OBJS = $(addprefix $(OBJS_DIR)/,$(patsubst %.cpp,%.o,$(notdir $(CPP_SRC))))

all: log_test

BUILD_UTILS:utils
	ehco "build utils"
	${MAKE} -C $@

log_test: create_dir ${BUILD_UTILS} ${OBJS}
	@echo "build log test"
	@echo "current path: ${CURRENT_DIR}"
	@echo "OBJS ${OBJS}"
	${CXX} -o $@ ${OBJS_DIR}/*.o ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}

create_dir:
	@echo "mkdir dir"
	mkdir -p ${OBJS_DIR}
	@echo "OBJS: ${OBJS}"

${OBJS}: ${OBJS_DIR}/%.o: %.cpp
	@echo "${CURRENT_DIR}"
	@echo "${CPP_SRC}"
	@echo "build objs cpp_src:${CPP_SRC} objs:${OBJS}"
	$(CXX) -o $@ -c $< ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS}
	#$(CXX) ${STUDY_INCLUDE} ${STUDY_LDLIB} ${STUDY_FLAGS} -c -o $(OBJS_DIR)/$(notdir $@) $<

clean:
	rm -rf ${BJ_DIR}
