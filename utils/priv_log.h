#ifndef UTILS_LOG_H_
#define UTILS_LOG_H_
#include <stdarg.h>
#include <stdio.h>

#include <cstdint>
#include <cstdio>
#include <string>

typedef enum {
  LOG_LEVEL_FATEL = 0,
  LOG_LEVEL_ERROR = 1,
  LOG_LEVEL_WARNING = 2,
  LOG_LEVEL_INFO = 3,
  LOG_LEVEL_DEBUG = 4,
  LOG_LEVEL_TRACE = 5,
  LOG_LEVEL_MAX,
} LogLevel;

static LogLevel g_log_lvl = LOG_LEVEL_INFO;

static const char *g_log_lvl_str[] = {"[F]", "[E]", "[W]", "[I]", "[D]", "[T]"};

static inline void Log(LogLevel lvl, const char *fmt, ...) {
  char buffer[1024];
  va_list arg;

  if (lvl > g_log_lvl) {
    return;
  }

  va_start(arg, fmt);
  vsnprintf(buffer, sizeof(buffer), fmt, arg);
  va_end(arg);
  fprintf(stderr, "%s\n", buffer);
}

#define LOGF(fmt, ...) \
  Log(LOG_LEVEL_FATEL, "%s[%s:%d] " fmt, g_log_lvl_str[LOG_LEVEL_FATEL], __FUNCTION__, __LINE__,  ##__VA_ARGS__);

#define LOGE(fmt, ...) \
  Log(LOG_LEVEL_ERROR, "%s[%s:%d] " fmt, g_log_lvl_str[LOG_LEVEL_ERROR], __FUNCTION__, __LINE__,  ##__VA_ARGS__);

#define LOGW(fmt, ...) \
  Log(LOG_LEVEL_WARNING, "%s[%s:%d] " fmt, g_log_lvl_str[LOG_LEVEL_WARNING], __FUNCTION__, __LINE__,  ##__VA_ARGS__);

#define LOGI(fmt, ...) \
  Log(LOG_LEVEL_INFO, "%s[%s:%d] " fmt, g_log_lvl_str[LOG_LEVEL_INFO], __FUNCTION__, __LINE__,  ##__VA_ARGS__);

#define LOGD(fmt, ...) \
  Log(LOG_LEVEL_DEBUG, "%s[%s:%d] " fmt, g_log_lvl_str[LOG_LEVEL_DEBUG], __FUNCTION__, __LINE__,  ##__VA_ARGS__);

#define LOGT(fmt, ...) \
  Log(LOG_LEVEL_TRACE, "%s[%s:%d] " fmt, g_log_lvl_str[LOG_LEVEL_TRACE], __FUNCTION__, __LINE__,  ##__VA_ARGS__);

#endif  //  UTILS_LOG_H_