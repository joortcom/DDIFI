// Disclosure: This work is patent pending, as already stated in the https://github.com/joortcom/DDIFI/blob/main/ddifi.pdf.

#include "date.h"
#include <chrono>
#include <iostream>
#include <cstdint>

int get_week_day() {
     auto now = std::chrono::system_clock::now();
     date::sys_days t { std::chrono::time_point_cast<date::days>(now) };
     date::weekday wd{t};
     int weekday_index = wd.c_encoding();
     return weekday_index;
}
