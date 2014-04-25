/*!
* \copy
*     Copyright (c)  2013, Cisco Systems
*     All rights reserved.
*     Redistribution and use in source and binary forms, with or without
*     modification, are permitted provided that the following conditions
*     are met:
*        * Redistributions of source code must retain the above copyright
*          notice, this list of conditions and the following disclaimer.
*        * Redistributions in binary form must reproduce the above copyright
*          notice, this list of conditions and the following disclaimer in
*          the documentation and/or other materials provided with the
*          distribution.
*     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*     "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*     FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*     COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*     INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*     BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*     CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*     LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*     ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*     POSSIBILITY OF SUCH DAMAGE.
*/


.macro	LOAD_LUMA_DATA_4 arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8
    vld4.u8	{\arg0[\arg8],\arg1[\arg8],\arg2[\arg8],\arg3[\arg8]}, [r3], r1
    vld4.u8	{\arg4[\arg8],\arg5[\arg8],\arg6[\arg8],\arg7[\arg8]}, [r0], r1
.endm

    .arch armv7-a
    .fpu neon

    .text
    .align 2
    .global transpose
    .type transpose, %function
    .func transpose
transpose:

    mov  r3, r0
    add  r0, #4
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,0
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,1
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,2
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,3
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,4
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,5
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,6
    LOAD_LUMA_DATA_4    d16,d17,d18,d19,d24,d25,d26,d27,7

    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,0
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,1
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,2
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,3
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,4
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,5
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,6
    LOAD_LUMA_DATA_4    d20,d21,d22,d23,d28,d29,d30,d31,7

    //  q8,  q9,  q12, q13
    // q10, q11,  q14, q15

    vswp        q9, q10
    vswp       d17, d18
    vswp       d21, d22
    vswp       q13, q14
    vswp       d25, d26
    vswp       d29, d30

    // q8, q9, q10, q11,  q12, q13, q14, q15

    vst1.u8    {q8,  q9},  [r2]!
    vst1.u8    {q10, q11}, [r2]!
    vst1.u8    {q12, q13}, [r2]!
    vst1.u8    {q14, q15}, [r2]!

    bx lr
    .endfunc

