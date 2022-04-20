#ifndef PERF_H_
#define PERF_H_

#include <iostream>
#include "priv_log.h"
#include <chrono>
#include <thread>

//using time_point = std::chrono::system_clock::time_point;

namespace study {

class PerfUtil {
 public:
  PerfUtil() = default;
  ~PerfUtil() = default;

  void Begin() noexcept;
  void End() noexcept;
 private:
  //time_point start_;
};

}

#endif //  PERF_H_