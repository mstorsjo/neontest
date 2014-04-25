#include <stdio.h>
#ifdef ANDROID_LOG
#include <android/log.h>
#define printf(...) __android_log_print(ANDROID_LOG_INFO, "neontest", __VA_ARGS__)
#endif

void transpose(const uint8_t *in, int stride, uint8_t *out);

int do_test() {
    int x, y, fail = 0;
    uint8_t in[16*8], out[16*8];
    for (y = 0; y < 16; y++)
        for (x = 0; x < 8; x++)
            in[8*y + x] = 8*y + x;
    transpose(in, 8, out);
    for (y = 0; y < 16; y++) {
        for (x = 0; x < 8; x++) {
            if (out[16*x + y] != in[8*y + x]) {
                fail = 1;
                printf("failed\n");
            }
        }
    }
    return fail;
}

int main(int argc, char* argv[]) {
    int i, fail = 0, n = 100000;

    for (i = 0; i < n; i++)
        fail += do_test();
    printf("done, %d failures/%d\n", fail, n);
    return 0;
}


