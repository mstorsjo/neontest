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

    vld4.8  {d16[0],d17[0],d18[0],d19[0]}, [r3], r1
    vld4.8  {d24[0],d25[0],d26[0],d27[0]}, [r0], r1
    vld4.8  {d16[1],d17[1],d18[1],d19[1]}, [r3], r1
    vld4.8  {d24[1],d25[1],d26[1],d27[1]}, [r0], r1
    vld4.8  {d16[2],d17[2],d18[2],d19[2]}, [r3], r1
    vld4.8  {d24[2],d25[2],d26[2],d27[2]}, [r0], r1
    vld4.8  {d16[3],d17[3],d18[3],d19[3]}, [r3], r1
    vld4.8  {d24[3],d25[3],d26[3],d27[3]}, [r0], r1
    vld4.8  {d16[4],d17[4],d18[4],d19[4]}, [r3], r1
    vld4.8  {d24[4],d25[4],d26[4],d27[4]}, [r0], r1
    vld4.8  {d16[5],d17[5],d18[5],d19[5]}, [r3], r1
    vld4.8  {d24[5],d25[5],d26[5],d27[5]}, [r0], r1
    vld4.8  {d16[6],d17[6],d18[6],d19[6]}, [r3], r1
    vld4.8  {d24[6],d25[6],d26[6],d27[6]}, [r0], r1
    vld4.8  {d16[7],d17[7],d18[7],d19[7]}, [r3], r1
    vld4.8  {d24[7],d25[7],d26[7],d27[7]}, [r0], r1

    vld4.8  {d20[0],d21[0],d22[0],d23[0]}, [r3], r1
    vld4.8  {d28[0],d29[0],d30[0],d31[0]}, [r0], r1
    vld4.8  {d20[1],d21[1],d22[1],d23[1]}, [r3], r1
    vld4.8  {d28[1],d29[1],d30[1],d31[1]}, [r0], r1
    vld4.8  {d20[2],d21[2],d22[2],d23[2]}, [r3], r1
    vld4.8  {d28[2],d29[2],d30[2],d31[2]}, [r0], r1
    vld4.8  {d20[3],d21[3],d22[3],d23[3]}, [r3], r1
    vld4.8  {d28[3],d29[3],d30[3],d31[3]}, [r0], r1
    vld4.8  {d20[4],d21[4],d22[4],d23[4]}, [r3], r1
    vld4.8  {d28[4],d29[4],d30[4],d31[4]}, [r0], r1
    vld4.8  {d20[5],d21[5],d22[5],d23[5]}, [r3], r1
    vld4.8  {d28[5],d29[5],d30[5],d31[5]}, [r0], r1
    vld4.8  {d20[6],d21[6],d22[6],d23[6]}, [r3], r1
    vld4.8  {d28[6],d29[6],d30[6],d31[6]}, [r0], r1
    vld4.8  {d20[7],d21[7],d22[7],d23[7]}, [r3], r1
    vld4.8  {d28[7],d29[7],d30[7],d31[7]}, [r0], r1

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

