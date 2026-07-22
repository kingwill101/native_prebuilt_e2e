#include <stdint.h>

#if defined(_WIN32)
#define NATIVE_PREBUILT_E2E_API __declspec(dllexport)
#else
#define NATIVE_PREBUILT_E2E_API __attribute__((visibility("default")))
#endif

NATIVE_PREBUILT_E2E_API int32_t native_prebuilt_e2e_answer(void);
