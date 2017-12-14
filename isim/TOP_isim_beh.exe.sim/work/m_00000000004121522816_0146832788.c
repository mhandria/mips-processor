/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//Mac/Home/Documents/MIPS STACK/integer_datapath.v";
static unsigned int ng1[] = {0U, 0U, 0U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1020U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {31, 0};
static unsigned int ng7[] = {3U, 0U};
static int ng8[] = {29, 0};
static unsigned int ng9[] = {4U, 0U};



static void Cont_91_0(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 9728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 5528U);
    t4 = *((char **)t2);
    t2 = (t0 + 5368U);
    t5 = *((char **)t2);
    xsi_vlogtype_concat(t3, 64, 64, 2U, t5, 32, t4, 32);
    t2 = (t0 + 11712);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t3, 0, 64);
    xsi_driver_vfirst_trans(t2, 0, 63);
    t10 = (t0 + 11536);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_92_1(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 9976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3928U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t22, 8);

LAB16:    t16 = (t0 + 11776);
    t23 = (t16 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t3, 8);
    xsi_driver_vfirst_trans(t16, 0, 31);
    t27 = (t0 + 11552);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 3768U);
    t17 = *((char **)t16);
    goto LAB9;

LAB10:    t16 = (t0 + 4888U);
    t22 = *((char **)t16);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t17, 32, t22, 32);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

}

static void Cont_118_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;

LAB0:    t1 = (t0 + 10224U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 8808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t0 + 8488);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t0 + 8648);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t0 + 8328);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    xsi_vlogtype_concat(t3, 4, 4, 4U, t14, 1, t11, 1, t8, 1, t5, 1);
    t15 = (t0 + 12032);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memset(t19, 0, 8);
    t20 = 1U;
    t21 = t20;
    t22 = (t3 + 4);
    t23 = *((unsigned int *)t3);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = (t19 + 4);
    t26 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t26 | t20);
    t27 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t27 | t21);
    xsi_driver_vfirst_trans(t15, 0, 0);
    t28 = (t0 + 11968);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memset(t32, 0, 8);
    t33 = 2U;
    t34 = t33;
    t35 = (t3 + 4);
    t36 = *((unsigned int *)t3);
    t33 = (t33 & t36);
    t37 = *((unsigned int *)t35);
    t34 = (t34 & t37);
    t33 = (t33 >> 1);
    t34 = (t34 >> 1);
    t38 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t39 | t33);
    t40 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t40 | t34);
    xsi_driver_vfirst_trans(t28, 0, 0);
    t41 = (t0 + 11904);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 4U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t46 = (t46 >> 2);
    t47 = (t47 >> 2);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 11840);
    t55 = (t54 + 56U);
    t56 = *((char **)t55);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    memset(t58, 0, 8);
    t59 = 8U;
    t60 = t59;
    t61 = (t3 + 4);
    t62 = *((unsigned int *)t3);
    t59 = (t59 & t62);
    t63 = *((unsigned int *)t61);
    t60 = (t60 & t63);
    t59 = (t59 >> 3);
    t60 = (t60 >> 3);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t65 | t59);
    t66 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t66 | t60);
    xsi_driver_vfirst_trans(t54, 0, 0);
    t67 = (t0 + 11568);
    *((int *)t67) = 1;

LAB1:    return;
}

static void Always_121_3(char *t0)
{
    char t14[8];
    char t30[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 10472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 11584);
    *((int *)t2) = 1;
    t3 = (t0 + 10504);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(121, ng0);

LAB5:    xsi_set_current_line(123, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(132, ng0);

LAB10:    xsi_set_current_line(133, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 8808);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8488);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t0 + 8648);
    t21 = (t13 + 56U);
    t22 = *((char **)t21);
    t23 = (t0 + 8328);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlogtype_concat(t14, 4, 4, 4U, t25, 1, t22, 1, t12, 1, t4, 1);
    t26 = (t0 + 8808);
    xsi_vlogvar_wait_assign_value(t26, t14, 0, 0, 1, 0LL);
    t27 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t27, t14, 1, 0, 1, 0LL);
    t28 = (t0 + 8648);
    xsi_vlogvar_wait_assign_value(t28, t14, 2, 0, 1, 0LL);
    t29 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t29, t14, 3, 0, 1, 0LL);

LAB16:
LAB13:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 7688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7528);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t30, 64, 64, 2U, t12, 32, t4, 32);
    t13 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t13, t30, 0, 0, 32, 0LL);
    t21 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t21, t30, 32, 0, 32, 0LL);

LAB19:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 5368U);
    t3 = *((char **)t2);
    t2 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 5688U);
    t3 = *((char **)t2);
    t2 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 6168U);
    t3 = *((char **)t2);
    t2 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 3448U);
    t3 = *((char **)t2);
    t2 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(124, ng0);

LAB9:    xsi_set_current_line(125, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    t13 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t13, t11, 32, 0, 32, 0LL);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 7848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(134, ng0);
    t4 = (t0 + 3448U);
    t5 = *((char **)t4);
    memset(t14, 0, 8);
    t4 = (t14 + 4);
    t11 = (t5 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (t15 >> 0);
    *((unsigned int *)t14) = t16;
    t17 = *((unsigned int *)t11);
    t18 = (t17 >> 0);
    *((unsigned int *)t4) = t18;
    t19 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t19 & 15U);
    t20 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t20 & 15U);
    t12 = (t0 + 8808);
    xsi_vlogvar_wait_assign_value(t12, t14, 0, 0, 1, 0LL);
    t13 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t13, t14, 1, 0, 1, 0LL);
    t21 = (t0 + 8648);
    xsi_vlogvar_wait_assign_value(t21, t14, 2, 0, 1, 0LL);
    t22 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t22, t14, 3, 0, 1, 0LL);
    goto LAB13;

LAB14:    xsi_set_current_line(136, ng0);
    t4 = (t0 + 6968U);
    t5 = *((char **)t4);
    t4 = (t0 + 6648U);
    t11 = *((char **)t4);
    t4 = (t0 + 6808U);
    t12 = *((char **)t4);
    t4 = (t0 + 6488U);
    t13 = *((char **)t4);
    xsi_vlogtype_concat(t14, 4, 4, 4U, t13, 1, t12, 1, t11, 1, t5, 1);
    t4 = (t0 + 8808);
    xsi_vlogvar_wait_assign_value(t4, t14, 0, 0, 1, 0LL);
    t21 = (t0 + 8488);
    xsi_vlogvar_wait_assign_value(t21, t14, 1, 0, 1, 0LL);
    t22 = (t0 + 8648);
    xsi_vlogvar_wait_assign_value(t22, t14, 2, 0, 1, 0LL);
    t23 = (t0 + 8328);
    xsi_vlogvar_wait_assign_value(t23, t14, 3, 0, 1, 0LL);
    goto LAB16;

LAB17:    xsi_set_current_line(142, ng0);
    t4 = (t0 + 6168U);
    t5 = *((char **)t4);
    t4 = (t0 + 6008U);
    t11 = *((char **)t4);
    xsi_vlogtype_concat(t30, 64, 64, 2U, t11, 32, t5, 32);
    t4 = (t0 + 7688);
    xsi_vlogvar_wait_assign_value(t4, t30, 0, 0, 32, 0LL);
    t12 = (t0 + 7528);
    xsi_vlogvar_wait_assign_value(t12, t30, 32, 0, 32, 0LL);
    goto LAB19;

}

static void Cont_157_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t16[8];
    char t34[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;

LAB0:    t1 = (t0 + 10720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 2488U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t30 = *((unsigned int *)t4);
    t31 = (~(t30));
    t32 = *((unsigned int *)t12);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t34, 8);

LAB16:    t48 = (t0 + 12096);
    t55 = (t48 + 56U);
    t56 = *((char **)t55);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    memcpy(t58, t3, 8);
    xsi_driver_vfirst_trans(t48, 0, 31);
    t59 = (t0 + 11600);
    *((int *)t59) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 8808);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t0 + 8488);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t0 + 8648);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t0 + 8328);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = ((char*)((ng2)));
    xsi_vlogtype_concat(t16, 32, 32, 5U, t29, 28, t28, 1, t25, 1, t22, 1, t19, 1);
    goto LAB9;

LAB10:    t36 = (t0 + 2328U);
    t37 = *((char **)t36);
    memset(t35, 0, 8);
    t36 = (t37 + 4);
    t38 = *((unsigned int *)t36);
    t39 = (~(t38));
    t40 = *((unsigned int *)t37);
    t41 = (t40 & t39);
    t42 = (t41 & 1U);
    if (t42 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t36) != 0)
        goto LAB19;

LAB20:    t44 = (t35 + 4);
    t45 = *((unsigned int *)t35);
    t46 = *((unsigned int *)t44);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB21;

LAB22:    t50 = *((unsigned int *)t35);
    t51 = (~(t50));
    t52 = *((unsigned int *)t44);
    t53 = (t51 || t52);
    if (t53 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t44) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t35) > 0)
        goto LAB27;

LAB28:    memcpy(t34, t54, 8);

LAB29:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t16, 32, t34, 32);
    goto LAB16;

LAB14:    memcpy(t3, t16, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t35) = 1;
    goto LAB20;

LAB19:    t43 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t43) = 1;
    goto LAB20;

LAB21:    t48 = (t0 + 3288U);
    t49 = *((char **)t48);
    goto LAB22;

LAB23:    t48 = (t0 + 5528U);
    t54 = *((char **)t48);
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t34, 32, t49, 32, t54, 32);
    goto LAB29;

LAB27:    memcpy(t34, t49, 8);
    goto LAB29;

}

static void Cont_162_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t35[8];
    char t40[8];
    char t41[8];
    char t43[8];
    char t72[8];
    char t77[8];
    char t78[8];
    char t80[8];
    char t112[8];
    char t113[8];
    char t116[8];
    char t150[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t42;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t79;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t114;
    char *t115;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    char *t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    char *t148;
    char *t149;
    char *t151;
    char *t152;
    char *t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    char *t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    unsigned int t161;
    unsigned int t162;
    char *t163;

LAB0:    t1 = (t0 + 10968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 3128U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t29);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t148 = (t0 + 12160);
    t151 = (t148 + 56U);
    t152 = *((char **)t151);
    t153 = (t152 + 56U);
    t154 = *((char **)t153);
    memset(t154, 0, 8);
    t155 = 31U;
    t156 = t155;
    t157 = (t3 + 4);
    t158 = *((unsigned int *)t3);
    t155 = (t155 & t158);
    t159 = *((unsigned int *)t157);
    t156 = (t156 & t159);
    t160 = (t154 + 4);
    t161 = *((unsigned int *)t154);
    *((unsigned int *)t154) = (t161 | t155);
    t162 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t162 | t156);
    xsi_driver_vfirst_trans(t148, 0, 4);
    t163 = (t0 + 11616);
    *((int *)t163) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 1688U);
    t34 = *((char **)t33);
    memcpy(t35, t34, 8);
    goto LAB13;

LAB14:    t33 = (t0 + 3128U);
    t42 = *((char **)t33);
    t33 = ((char*)((ng2)));
    memset(t43, 0, 8);
    t44 = (t42 + 4);
    t45 = (t33 + 4);
    t46 = *((unsigned int *)t42);
    t47 = *((unsigned int *)t33);
    t48 = (t46 ^ t47);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = (t48 | t51);
    t53 = *((unsigned int *)t44);
    t54 = *((unsigned int *)t45);
    t55 = (t53 | t54);
    t56 = (~(t55));
    t57 = (t52 & t56);
    if (t57 != 0)
        goto LAB24;

LAB21:    if (t55 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t43) = 1;

LAB24:    memset(t41, 0, 8);
    t59 = (t43 + 4);
    t60 = *((unsigned int *)t59);
    t61 = (~(t60));
    t62 = *((unsigned int *)t43);
    t63 = (t62 & t61);
    t64 = (t63 & 1U);
    if (t64 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t59) != 0)
        goto LAB27;

LAB28:    t66 = (t41 + 4);
    t67 = *((unsigned int *)t41);
    t68 = *((unsigned int *)t66);
    t69 = (t67 || t68);
    if (t69 > 0)
        goto LAB29;

LAB30:    t73 = *((unsigned int *)t41);
    t74 = (~(t73));
    t75 = *((unsigned int *)t66);
    t76 = (t74 || t75);
    if (t76 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t66) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t77, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB23:    t58 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t65 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t65) = 1;
    goto LAB28;

LAB29:    t70 = (t0 + 1528U);
    t71 = *((char **)t70);
    memcpy(t72, t71, 8);
    goto LAB30;

LAB31:    t70 = (t0 + 3128U);
    t79 = *((char **)t70);
    t70 = ((char*)((ng5)));
    memset(t80, 0, 8);
    t81 = (t79 + 4);
    t82 = (t70 + 4);
    t83 = *((unsigned int *)t79);
    t84 = *((unsigned int *)t70);
    t85 = (t83 ^ t84);
    t86 = *((unsigned int *)t81);
    t87 = *((unsigned int *)t82);
    t88 = (t86 ^ t87);
    t89 = (t85 | t88);
    t90 = *((unsigned int *)t81);
    t91 = *((unsigned int *)t82);
    t92 = (t90 | t91);
    t93 = (~(t92));
    t94 = (t89 & t93);
    if (t94 != 0)
        goto LAB41;

LAB38:    if (t92 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t80) = 1;

LAB41:    memset(t78, 0, 8);
    t96 = (t80 + 4);
    t97 = *((unsigned int *)t96);
    t98 = (~(t97));
    t99 = *((unsigned int *)t80);
    t100 = (t99 & t98);
    t101 = (t100 & 1U);
    if (t101 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t96) != 0)
        goto LAB44;

LAB45:    t103 = (t78 + 4);
    t104 = *((unsigned int *)t78);
    t105 = *((unsigned int *)t103);
    t106 = (t104 || t105);
    if (t106 > 0)
        goto LAB46;

LAB47:    t108 = *((unsigned int *)t78);
    t109 = (~(t108));
    t110 = *((unsigned int *)t103);
    t111 = (t109 || t110);
    if (t111 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t103) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t78) > 0)
        goto LAB52;

LAB53:    memcpy(t77, t112, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 32, t72, 32, t77, 32);
    goto LAB37;

LAB35:    memcpy(t40, t72, 8);
    goto LAB37;

LAB40:    t95 = (t80 + 4);
    *((unsigned int *)t80) = 1;
    *((unsigned int *)t95) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t78) = 1;
    goto LAB45;

LAB44:    t102 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t102) = 1;
    goto LAB45;

LAB46:    t107 = ((char*)((ng6)));
    goto LAB47;

LAB48:    t114 = (t0 + 3128U);
    t115 = *((char **)t114);
    t114 = ((char*)((ng7)));
    memset(t116, 0, 8);
    t117 = (t115 + 4);
    t118 = (t114 + 4);
    t119 = *((unsigned int *)t115);
    t120 = *((unsigned int *)t114);
    t121 = (t119 ^ t120);
    t122 = *((unsigned int *)t117);
    t123 = *((unsigned int *)t118);
    t124 = (t122 ^ t123);
    t125 = (t121 | t124);
    t126 = *((unsigned int *)t117);
    t127 = *((unsigned int *)t118);
    t128 = (t126 | t127);
    t129 = (~(t128));
    t130 = (t125 & t129);
    if (t130 != 0)
        goto LAB58;

LAB55:    if (t128 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t116) = 1;

LAB58:    memset(t113, 0, 8);
    t132 = (t116 + 4);
    t133 = *((unsigned int *)t132);
    t134 = (~(t133));
    t135 = *((unsigned int *)t116);
    t136 = (t135 & t134);
    t137 = (t136 & 1U);
    if (t137 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t132) != 0)
        goto LAB61;

LAB62:    t139 = (t113 + 4);
    t140 = *((unsigned int *)t113);
    t141 = *((unsigned int *)t139);
    t142 = (t140 || t141);
    if (t142 > 0)
        goto LAB63;

LAB64:    t144 = *((unsigned int *)t113);
    t145 = (~(t144));
    t146 = *((unsigned int *)t139);
    t147 = (t145 || t146);
    if (t147 > 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t139) > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t113) > 0)
        goto LAB69;

LAB70:    memcpy(t112, t150, 8);

LAB71:    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t77, 32, t107, 32, t112, 32);
    goto LAB54;

LAB52:    memcpy(t77, t107, 8);
    goto LAB54;

LAB57:    t131 = (t116 + 4);
    *((unsigned int *)t116) = 1;
    *((unsigned int *)t131) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t113) = 1;
    goto LAB62;

LAB61:    t138 = (t113 + 4);
    *((unsigned int *)t113) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB62;

LAB63:    t143 = ((char*)((ng8)));
    goto LAB64;

LAB65:    t148 = (t0 + 1528U);
    t149 = *((char **)t148);
    memcpy(t150, t149, 8);
    goto LAB66;

LAB67:    xsi_vlog_unsigned_bit_combine(t112, 32, t143, 32, t150, 32);
    goto LAB71;

LAB69:    memcpy(t112, t143, 8);
    goto LAB71;

}

static void Cont_175_6(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t40[8];
    char t41[8];
    char t44[8];
    char t78[8];
    char t79[8];
    char t82[8];
    char t116[8];
    char t117[8];
    char t120[8];
    char t154[8];
    char t155[8];
    char t158[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t80;
    char *t81;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    char *t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    char *t118;
    char *t119;
    char *t121;
    char *t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    char *t135;
    char *t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    char *t142;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    char *t147;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    char *t156;
    char *t157;
    char *t159;
    char *t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    char *t173;
    char *t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    char *t180;
    char *t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    char *t185;
    char *t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    char *t191;
    char *t192;
    char *t193;
    char *t194;
    char *t195;
    char *t196;
    char *t197;
    char *t198;

LAB0:    t1 = (t0 + 11216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 4088U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t29);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t193 = (t0 + 12224);
    t194 = (t193 + 56U);
    t195 = *((char **)t194);
    t196 = (t195 + 56U);
    t197 = *((char **)t196);
    memcpy(t197, t3, 8);
    xsi_driver_vfirst_trans(t193, 0, 31);
    t198 = (t0 + 11632);
    *((int *)t198) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 7848);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    goto LAB13;

LAB14:    t42 = (t0 + 4088U);
    t43 = *((char **)t42);
    t42 = ((char*)((ng4)));
    memset(t44, 0, 8);
    t45 = (t43 + 4);
    t46 = (t42 + 4);
    t47 = *((unsigned int *)t43);
    t48 = *((unsigned int *)t42);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t45);
    t51 = *((unsigned int *)t46);
    t52 = (t50 ^ t51);
    t53 = (t49 | t52);
    t54 = *((unsigned int *)t45);
    t55 = *((unsigned int *)t46);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t53 & t57);
    if (t58 != 0)
        goto LAB24;

LAB21:    if (t56 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t44) = 1;

LAB24:    memset(t41, 0, 8);
    t60 = (t44 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t44);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t60) != 0)
        goto LAB27;

LAB28:    t67 = (t41 + 4);
    t68 = *((unsigned int *)t41);
    t69 = *((unsigned int *)t67);
    t70 = (t68 || t69);
    if (t70 > 0)
        goto LAB29;

LAB30:    t74 = *((unsigned int *)t41);
    t75 = (~(t74));
    t76 = *((unsigned int *)t67);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t67) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t78, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB23:    t59 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t66 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t66) = 1;
    goto LAB28;

LAB29:    t71 = (t0 + 7688);
    t72 = (t71 + 56U);
    t73 = *((char **)t72);
    goto LAB30;

LAB31:    t80 = (t0 + 4088U);
    t81 = *((char **)t80);
    t80 = ((char*)((ng5)));
    memset(t82, 0, 8);
    t83 = (t81 + 4);
    t84 = (t80 + 4);
    t85 = *((unsigned int *)t81);
    t86 = *((unsigned int *)t80);
    t87 = (t85 ^ t86);
    t88 = *((unsigned int *)t83);
    t89 = *((unsigned int *)t84);
    t90 = (t88 ^ t89);
    t91 = (t87 | t90);
    t92 = *((unsigned int *)t83);
    t93 = *((unsigned int *)t84);
    t94 = (t92 | t93);
    t95 = (~(t94));
    t96 = (t91 & t95);
    if (t96 != 0)
        goto LAB41;

LAB38:    if (t94 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t82) = 1;

LAB41:    memset(t79, 0, 8);
    t98 = (t82 + 4);
    t99 = *((unsigned int *)t98);
    t100 = (~(t99));
    t101 = *((unsigned int *)t82);
    t102 = (t101 & t100);
    t103 = (t102 & 1U);
    if (t103 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t98) != 0)
        goto LAB44;

LAB45:    t105 = (t79 + 4);
    t106 = *((unsigned int *)t79);
    t107 = *((unsigned int *)t105);
    t108 = (t106 || t107);
    if (t108 > 0)
        goto LAB46;

LAB47:    t112 = *((unsigned int *)t79);
    t113 = (~(t112));
    t114 = *((unsigned int *)t105);
    t115 = (t113 || t114);
    if (t115 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t105) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t79) > 0)
        goto LAB52;

LAB53:    memcpy(t78, t116, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 32, t73, 32, t78, 32);
    goto LAB37;

LAB35:    memcpy(t40, t73, 8);
    goto LAB37;

LAB40:    t97 = (t82 + 4);
    *((unsigned int *)t82) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t79) = 1;
    goto LAB45;

LAB44:    t104 = (t79 + 4);
    *((unsigned int *)t79) = 1;
    *((unsigned int *)t104) = 1;
    goto LAB45;

LAB46:    t109 = (t0 + 7528);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    goto LAB47;

LAB48:    t118 = (t0 + 4088U);
    t119 = *((char **)t118);
    t118 = ((char*)((ng7)));
    memset(t120, 0, 8);
    t121 = (t119 + 4);
    t122 = (t118 + 4);
    t123 = *((unsigned int *)t119);
    t124 = *((unsigned int *)t118);
    t125 = (t123 ^ t124);
    t126 = *((unsigned int *)t121);
    t127 = *((unsigned int *)t122);
    t128 = (t126 ^ t127);
    t129 = (t125 | t128);
    t130 = *((unsigned int *)t121);
    t131 = *((unsigned int *)t122);
    t132 = (t130 | t131);
    t133 = (~(t132));
    t134 = (t129 & t133);
    if (t134 != 0)
        goto LAB58;

LAB55:    if (t132 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t120) = 1;

LAB58:    memset(t117, 0, 8);
    t136 = (t120 + 4);
    t137 = *((unsigned int *)t136);
    t138 = (~(t137));
    t139 = *((unsigned int *)t120);
    t140 = (t139 & t138);
    t141 = (t140 & 1U);
    if (t141 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t136) != 0)
        goto LAB61;

LAB62:    t143 = (t117 + 4);
    t144 = *((unsigned int *)t117);
    t145 = *((unsigned int *)t143);
    t146 = (t144 || t145);
    if (t146 > 0)
        goto LAB63;

LAB64:    t150 = *((unsigned int *)t117);
    t151 = (~(t150));
    t152 = *((unsigned int *)t143);
    t153 = (t151 || t152);
    if (t153 > 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t143) > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t117) > 0)
        goto LAB69;

LAB70:    memcpy(t116, t154, 8);

LAB71:    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t78, 32, t111, 32, t116, 32);
    goto LAB54;

LAB52:    memcpy(t78, t111, 8);
    goto LAB54;

LAB57:    t135 = (t120 + 4);
    *((unsigned int *)t120) = 1;
    *((unsigned int *)t135) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t117) = 1;
    goto LAB62;

LAB61:    t142 = (t117 + 4);
    *((unsigned int *)t117) = 1;
    *((unsigned int *)t142) = 1;
    goto LAB62;

LAB63:    t147 = (t0 + 8008);
    t148 = (t147 + 56U);
    t149 = *((char **)t148);
    goto LAB64;

LAB65:    t156 = (t0 + 4088U);
    t157 = *((char **)t156);
    t156 = ((char*)((ng9)));
    memset(t158, 0, 8);
    t159 = (t157 + 4);
    t160 = (t156 + 4);
    t161 = *((unsigned int *)t157);
    t162 = *((unsigned int *)t156);
    t163 = (t161 ^ t162);
    t164 = *((unsigned int *)t159);
    t165 = *((unsigned int *)t160);
    t166 = (t164 ^ t165);
    t167 = (t163 | t166);
    t168 = *((unsigned int *)t159);
    t169 = *((unsigned int *)t160);
    t170 = (t168 | t169);
    t171 = (~(t170));
    t172 = (t167 & t171);
    if (t172 != 0)
        goto LAB75;

LAB72:    if (t170 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t158) = 1;

LAB75:    memset(t155, 0, 8);
    t174 = (t158 + 4);
    t175 = *((unsigned int *)t174);
    t176 = (~(t175));
    t177 = *((unsigned int *)t158);
    t178 = (t177 & t176);
    t179 = (t178 & 1U);
    if (t179 != 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t174) != 0)
        goto LAB78;

LAB79:    t181 = (t155 + 4);
    t182 = *((unsigned int *)t155);
    t183 = *((unsigned int *)t181);
    t184 = (t182 || t183);
    if (t184 > 0)
        goto LAB80;

LAB81:    t187 = *((unsigned int *)t155);
    t188 = (~(t187));
    t189 = *((unsigned int *)t181);
    t190 = (t188 || t189);
    if (t190 > 0)
        goto LAB82;

LAB83:    if (*((unsigned int *)t181) > 0)
        goto LAB84;

LAB85:    if (*((unsigned int *)t155) > 0)
        goto LAB86;

LAB87:    memcpy(t154, t192, 8);

LAB88:    goto LAB66;

LAB67:    xsi_vlog_unsigned_bit_combine(t116, 32, t149, 32, t154, 32);
    goto LAB71;

LAB69:    memcpy(t116, t149, 8);
    goto LAB71;

LAB74:    t173 = (t158 + 4);
    *((unsigned int *)t158) = 1;
    *((unsigned int *)t173) = 1;
    goto LAB75;

LAB76:    *((unsigned int *)t155) = 1;
    goto LAB79;

LAB78:    t180 = (t155 + 4);
    *((unsigned int *)t155) = 1;
    *((unsigned int *)t180) = 1;
    goto LAB79;

LAB80:    t185 = (t0 + 3608U);
    t186 = *((char **)t185);
    goto LAB81;

LAB82:    t185 = (t0 + 7848);
    t191 = (t185 + 56U);
    t192 = *((char **)t191);
    goto LAB83;

LAB84:    xsi_vlog_unsigned_bit_combine(t154, 32, t186, 32, t192, 32);
    goto LAB88;

LAB86:    memcpy(t154, t186, 8);
    goto LAB88;

}


extern void work_m_00000000004121522816_0146832788_init()
{
	static char *pe[] = {(void *)Cont_91_0,(void *)Cont_92_1,(void *)Cont_118_2,(void *)Always_121_3,(void *)Cont_157_4,(void *)Cont_162_5,(void *)Cont_175_6};
	xsi_register_didat("work_m_00000000004121522816_0146832788", "isim/TOP_isim_beh.exe.sim/work/m_00000000004121522816_0146832788.didat");
	xsi_register_executes(pe);
}
