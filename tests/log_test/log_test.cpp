#include <iostream>
#include "utils/priv_log.h"
#include "perf.h"

int main(int argv, char* argc[]) {
    LOGE("log error");
    LOGW("log warning");
    LOGI("log info");
    LOGD("log debug");

    return 0;
}