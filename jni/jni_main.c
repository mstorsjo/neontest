#include <jni.h>
#include <stdio.h>

int main(int argc, char* argv[]);

JNIEXPORT void JNICALL Java_st_martin_neontest_NeonTest_doMain(JNIEnv* env, jclass clazz) {
	main(0, NULL);
}

