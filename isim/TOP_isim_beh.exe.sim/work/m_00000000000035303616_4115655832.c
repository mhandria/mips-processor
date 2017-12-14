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
static const char *ng0 = "//Mac/Home/Documents/MIPS STACK/EXTERNAL_IO.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {3, 0};
static int ng3[] = {2, 0};
static int ng4[] = {1, 0};
static int ng5[] = {0, 0};
static unsigned int ng6[] = {0U, 4294967294U, 0U, 1U};
static int ng7[] = {6, 0};
static unsigned int ng8[] = {0U, 0U};



static void Cont_70_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 4448U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 4095U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 4095U);
    t12 = (t0 + 5640);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 4095U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 11);
    t25 = (t0 + 5512);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_74_1(char *t0)
{
    char t3[16];
    char t4[8];
    char t7[8];
    char t49[16];
    char t54[8];
    char t63[8];
    char t67[8];
    char t76[8];
    char t80[8];
    char t89[8];
    char t93[8];
    char t102[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t64;
    char *t65;
    char *t66;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t77;
    char *t78;
    char *t79;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    char *t90;
    char *t91;
    char *t92;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    char *t101;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;
    char *t116;
    char *t117;
    char *t118;

LAB0:    t1 = (t0 + 4696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = (t0 + 1528U);
    t6 = *((char **)t2);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t2 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t2);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    memset(t4, 0, 8);
    t38 = (t7 + 4);
    t39 = *((unsigned int *)t38);
    t40 = (~(t39));
    t41 = *((unsigned int *)t7);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB7;

LAB8:    if (*((unsigned int *)t38) != 0)
        goto LAB9;

LAB10:    t45 = (t4 + 4);
    t46 = *((unsigned int *)t4);
    t47 = *((unsigned int *)t45);
    t48 = (t46 || t47);
    if (t48 > 0)
        goto LAB11;

LAB12:    t103 = *((unsigned int *)t4);
    t104 = (~(t103));
    t105 = *((unsigned int *)t45);
    t106 = (t104 || t105);
    if (t106 > 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t45) > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t4) > 0)
        goto LAB17;

LAB18:    memcpy(t3, t107, 16);

LAB19:    t108 = (t0 + 5768);
    t109 = (t108 + 56U);
    t110 = *((char **)t109);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    xsi_vlog_bit_copy(t112, 0, t3, 0, 1);
    xsi_driver_vfirst_trans(t108, 0, 0);
    t113 = (t0 + 5704);
    t114 = (t113 + 56U);
    t115 = *((char **)t114);
    t116 = (t115 + 56U);
    t117 = *((char **)t116);
    xsi_vlog_bit_copy(t117, 0, t3, 1, 32);
    xsi_driver_vfirst_trans(t113, 0, 31);
    t118 = (t0 + 5528);
    *((int *)t118) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t5);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB6;

LAB7:    *((unsigned int *)t4) = 1;
    goto LAB10;

LAB9:    t44 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB10;

LAB11:    t50 = ((char*)((ng1)));
    t51 = (t0 + 3208);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    t55 = (t0 + 3208);
    t56 = (t55 + 72U);
    t57 = *((char **)t56);
    t58 = (t0 + 3208);
    t59 = (t58 + 64U);
    t60 = *((char **)t59);
    t61 = (t0 + 2808U);
    t62 = *((char **)t61);
    t61 = ((char*)((ng2)));
    memset(t63, 0, 8);
    xsi_vlog_unsigned_add(t63, 32, t62, 12, t61, 32);
    xsi_vlog_generic_get_array_select_value(t54, 8, t53, t57, t60, 2, 1, t63, 32, 2);
    t64 = (t0 + 3208);
    t65 = (t64 + 56U);
    t66 = *((char **)t65);
    t68 = (t0 + 3208);
    t69 = (t68 + 72U);
    t70 = *((char **)t69);
    t71 = (t0 + 3208);
    t72 = (t71 + 64U);
    t73 = *((char **)t72);
    t74 = (t0 + 2808U);
    t75 = *((char **)t74);
    t74 = ((char*)((ng3)));
    memset(t76, 0, 8);
    xsi_vlog_unsigned_add(t76, 32, t75, 12, t74, 32);
    xsi_vlog_generic_get_array_select_value(t67, 8, t66, t70, t73, 2, 1, t76, 32, 2);
    t77 = (t0 + 3208);
    t78 = (t77 + 56U);
    t79 = *((char **)t78);
    t81 = (t0 + 3208);
    t82 = (t81 + 72U);
    t83 = *((char **)t82);
    t84 = (t0 + 3208);
    t85 = (t84 + 64U);
    t86 = *((char **)t85);
    t87 = (t0 + 2808U);
    t88 = *((char **)t87);
    t87 = ((char*)((ng4)));
    memset(t89, 0, 8);
    xsi_vlog_unsigned_add(t89, 32, t88, 12, t87, 32);
    xsi_vlog_generic_get_array_select_value(t80, 8, t79, t83, t86, 2, 1, t89, 32, 2);
    t90 = (t0 + 3208);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    t94 = (t0 + 3208);
    t95 = (t94 + 72U);
    t96 = *((char **)t95);
    t97 = (t0 + 3208);
    t98 = (t97 + 64U);
    t99 = *((char **)t98);
    t100 = (t0 + 2808U);
    t101 = *((char **)t100);
    t100 = ((char*)((ng5)));
    memset(t102, 0, 8);
    xsi_vlog_unsigned_add(t102, 32, t101, 12, t100, 32);
    xsi_vlog_generic_get_array_select_value(t93, 8, t92, t96, t99, 2, 1, t102, 32, 2);
    xsi_vlogtype_concat(t49, 33, 33, 5U, t93, 8, t80, 8, t67, 8, t54, 8, t50, 1);
    goto LAB12;

LAB13:    t107 = ((char*)((ng6)));
    goto LAB14;

LAB15:    xsi_vlog_unsigned_bit_combine(t3, 33, t49, 33, t107, 33);
    goto LAB19;

LAB17:    memcpy(t3, t49, 16);
    goto LAB19;

}

static void Cont_81_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t37[8];
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
    char *t36;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;

LAB0:    t1 = (t0 + 4944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2168U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng5)));
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

LAB13:    t38 = *((unsigned int *)t4);
    t39 = (~(t38));
    t40 = *((unsigned int *)t29);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t42, 8);

LAB20:    t43 = (t0 + 5832);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memset(t47, 0, 8);
    t48 = 1U;
    t49 = t48;
    t50 = (t3 + 4);
    t51 = *((unsigned int *)t3);
    t48 = (t48 & t51);
    t52 = *((unsigned int *)t50);
    t49 = (t49 & t52);
    t53 = (t47 + 4);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t54 | t48);
    t55 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t55 | t49);
    xsi_driver_vfirst_trans(t43, 0, 0);
    t56 = (t0 + 5544);
    *((int *)t56) = 1;

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

LAB12:    t33 = (t0 + 3528);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    t36 = ((char*)((ng7)));
    memset(t37, 0, 8);
    xsi_vlog_signed_equal(t37, 32, t35, 32, t36, 32);
    goto LAB13;

LAB14:    t42 = ((char*)((ng8)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t37, 1, t42, 1);
    goto LAB20;

LAB18:    memcpy(t3, t37, 8);
    goto LAB20;

}

static void Always_84_3(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t24[8];
    char t63[8];
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
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    int t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
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
    char *t60;
    char *t61;
    char *t62;
    char *t64;
    unsigned int t65;
    int t66;
    char *t67;
    unsigned int t68;
    int t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    int t73;
    int t74;

LAB0:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 5560);
    *((int *)t2) = 1;
    t3 = (t0 + 5224);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(90, ng0);

LAB8:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3528);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t15, 0, 8);
    xsi_vlog_signed_less(t15, 32, t4, 32, t5, 32);
    memset(t14, 0, 8);
    t11 = (t15 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t11) != 0)
        goto LAB11;

LAB12:    t16 = (t14 + 4);
    t17 = *((unsigned int *)t14);
    t18 = *((unsigned int *)t16);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB13;

LAB14:    t25 = *((unsigned int *)t14);
    t26 = (~(t25));
    t27 = *((unsigned int *)t16);
    t28 = (t26 || t27);
    if (t28 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t16) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t14) > 0)
        goto LAB19;

LAB20:    memcpy(t13, t31, 8);

LAB21:    t32 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t32, t13, 0, 0, 32, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB22;

LAB23:
LAB24:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t4);
    t8 = (t6 & t7);
    *((unsigned int *)t13) = t8;
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t11 = (t13 + 4);
    t9 = *((unsigned int *)t2);
    t10 = *((unsigned int *)t5);
    t17 = (t9 | t10);
    *((unsigned int *)t11) = t17;
    t18 = *((unsigned int *)t11);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB25;

LAB26:
LAB27:    t20 = (t13 + 4);
    t47 = *((unsigned int *)t20);
    t48 = (~(t47));
    t49 = *((unsigned int *)t13);
    t50 = (t49 & t48);
    t51 = (t50 != 0);
    if (t51 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(112, ng0);

LAB40:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 3208);
    t20 = (t16 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 2808U);
    t23 = *((char **)t22);
    t22 = ((char*)((ng2)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t23, 12, t22, 32);
    xsi_vlog_generic_get_array_select_value(t13, 8, t4, t12, t21, 2, 1, t14, 32, 2);
    t29 = (t0 + 3208);
    t30 = (t0 + 3208);
    t31 = (t30 + 72U);
    t32 = *((char **)t31);
    t58 = (t0 + 3208);
    t59 = (t58 + 64U);
    t60 = *((char **)t59);
    t61 = (t0 + 2808U);
    t62 = *((char **)t61);
    t61 = ((char*)((ng2)));
    memset(t63, 0, 8);
    xsi_vlog_unsigned_add(t63, 32, t62, 12, t61, 32);
    xsi_vlog_generic_convert_array_indices(t15, t24, t32, t60, 2, 1, t63, 32, 2);
    t64 = (t15 + 4);
    t6 = *((unsigned int *)t64);
    t39 = (!(t6));
    t67 = (t24 + 4);
    t7 = *((unsigned int *)t67);
    t40 = (!(t7));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB41;

LAB42:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 3208);
    t20 = (t16 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 2808U);
    t23 = *((char **)t22);
    t22 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t23, 12, t22, 32);
    xsi_vlog_generic_get_array_select_value(t13, 8, t4, t12, t21, 2, 1, t14, 32, 2);
    t29 = (t0 + 3208);
    t30 = (t0 + 3208);
    t31 = (t30 + 72U);
    t32 = *((char **)t31);
    t58 = (t0 + 3208);
    t59 = (t58 + 64U);
    t60 = *((char **)t59);
    t61 = (t0 + 2808U);
    t62 = *((char **)t61);
    t61 = ((char*)((ng3)));
    memset(t63, 0, 8);
    xsi_vlog_unsigned_add(t63, 32, t62, 12, t61, 32);
    xsi_vlog_generic_convert_array_indices(t15, t24, t32, t60, 2, 1, t63, 32, 2);
    t64 = (t15 + 4);
    t6 = *((unsigned int *)t64);
    t39 = (!(t6));
    t67 = (t24 + 4);
    t7 = *((unsigned int *)t67);
    t40 = (!(t7));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB43;

LAB44:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 3208);
    t20 = (t16 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 2808U);
    t23 = *((char **)t22);
    t22 = ((char*)((ng4)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t23, 12, t22, 32);
    xsi_vlog_generic_get_array_select_value(t13, 8, t4, t12, t21, 2, 1, t14, 32, 2);
    t29 = (t0 + 3208);
    t30 = (t0 + 3208);
    t31 = (t30 + 72U);
    t32 = *((char **)t31);
    t58 = (t0 + 3208);
    t59 = (t58 + 64U);
    t60 = *((char **)t59);
    t61 = (t0 + 2808U);
    t62 = *((char **)t61);
    t61 = ((char*)((ng4)));
    memset(t63, 0, 8);
    xsi_vlog_unsigned_add(t63, 32, t62, 12, t61, 32);
    xsi_vlog_generic_convert_array_indices(t15, t24, t32, t60, 2, 1, t63, 32, 2);
    t64 = (t15 + 4);
    t6 = *((unsigned int *)t64);
    t39 = (!(t6));
    t67 = (t24 + 4);
    t7 = *((unsigned int *)t67);
    t40 = (!(t7));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB45;

LAB46:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3208);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 3208);
    t20 = (t16 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 2808U);
    t23 = *((char **)t22);
    xsi_vlog_generic_get_array_select_value(t13, 8, t4, t12, t21, 2, 1, t23, 12, 2);
    t22 = (t0 + 3208);
    t29 = (t0 + 3208);
    t30 = (t29 + 72U);
    t31 = *((char **)t30);
    t32 = (t0 + 3208);
    t58 = (t32 + 64U);
    t59 = *((char **)t58);
    t60 = (t0 + 2808U);
    t61 = *((char **)t60);
    xsi_vlog_generic_convert_array_indices(t14, t15, t31, t59, 2, 1, t61, 12, 2);
    t60 = (t14 + 4);
    t6 = *((unsigned int *)t60);
    t39 = (!(t6));
    t62 = (t15 + 4);
    t7 = *((unsigned int *)t62);
    t40 = (!(t7));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB47;

LAB48:
LAB30:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(88, ng0);
    t11 = ((char*)((ng5)));
    t12 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    goto LAB7;

LAB9:    *((unsigned int *)t14) = 1;
    goto LAB12;

LAB11:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB12;

LAB13:    t20 = (t0 + 3528);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = ((char*)((ng4)));
    memset(t24, 0, 8);
    xsi_vlog_signed_add(t24, 32, t22, 32, t23, 32);
    goto LAB14;

LAB15:    t29 = (t0 + 3528);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t13, 32, t24, 32, t31, 32);
    goto LAB21;

LAB19:    memcpy(t13, t24, 8);
    goto LAB21;

LAB22:    xsi_set_current_line(97, ng0);
    t4 = (t0 + 3528);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng4)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t11, 32, t12, 32);
    t16 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t16, t13, 0, 0, 32, 0LL);
    goto LAB24;

LAB25:    t25 = *((unsigned int *)t13);
    t26 = *((unsigned int *)t11);
    *((unsigned int *)t13) = (t25 | t26);
    t12 = (t3 + 4);
    t16 = (t4 + 4);
    t27 = *((unsigned int *)t3);
    t28 = (~(t27));
    t33 = *((unsigned int *)t12);
    t34 = (~(t33));
    t35 = *((unsigned int *)t4);
    t36 = (~(t35));
    t37 = *((unsigned int *)t16);
    t38 = (~(t37));
    t39 = (t28 & t34);
    t40 = (t36 & t38);
    t41 = (~(t39));
    t42 = (~(t40));
    t43 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t43 & t41);
    t44 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t44 & t42);
    t45 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t45 & t41);
    t46 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t46 & t42);
    goto LAB27;

LAB28:    xsi_set_current_line(105, ng0);

LAB31:    xsi_set_current_line(106, ng0);
    t21 = (t0 + 2008U);
    t22 = *((char **)t21);
    memset(t14, 0, 8);
    t21 = (t14 + 4);
    t23 = (t22 + 4);
    t52 = *((unsigned int *)t22);
    t53 = (t52 >> 0);
    *((unsigned int *)t14) = t53;
    t54 = *((unsigned int *)t23);
    t55 = (t54 >> 0);
    *((unsigned int *)t21) = t55;
    t56 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t56 & 255U);
    t57 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t57 & 255U);
    t29 = (t0 + 3208);
    t30 = (t0 + 3208);
    t31 = (t30 + 72U);
    t32 = *((char **)t31);
    t58 = (t0 + 3208);
    t59 = (t58 + 64U);
    t60 = *((char **)t59);
    t61 = (t0 + 2808U);
    t62 = *((char **)t61);
    t61 = ((char*)((ng2)));
    memset(t63, 0, 8);
    xsi_vlog_unsigned_add(t63, 32, t62, 12, t61, 32);
    xsi_vlog_generic_convert_array_indices(t15, t24, t32, t60, 2, 1, t63, 32, 2);
    t64 = (t15 + 4);
    t65 = *((unsigned int *)t64);
    t66 = (!(t65));
    t67 = (t24 + 4);
    t68 = *((unsigned int *)t67);
    t69 = (!(t68));
    t70 = (t66 && t69);
    if (t70 == 1)
        goto LAB32;

LAB33:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 8);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 8);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 255U);
    t17 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t17 & 255U);
    t5 = (t0 + 3208);
    t11 = (t0 + 3208);
    t12 = (t11 + 72U);
    t16 = *((char **)t12);
    t20 = (t0 + 3208);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2808U);
    t29 = *((char **)t23);
    t23 = ((char*)((ng3)));
    memset(t24, 0, 8);
    xsi_vlog_unsigned_add(t24, 32, t29, 12, t23, 32);
    xsi_vlog_generic_convert_array_indices(t14, t15, t16, t22, 2, 1, t24, 32, 2);
    t30 = (t14 + 4);
    t18 = *((unsigned int *)t30);
    t39 = (!(t18));
    t31 = (t15 + 4);
    t19 = *((unsigned int *)t31);
    t40 = (!(t19));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB34;

LAB35:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 16);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 16);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 255U);
    t17 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t17 & 255U);
    t5 = (t0 + 3208);
    t11 = (t0 + 3208);
    t12 = (t11 + 72U);
    t16 = *((char **)t12);
    t20 = (t0 + 3208);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2808U);
    t29 = *((char **)t23);
    t23 = ((char*)((ng4)));
    memset(t24, 0, 8);
    xsi_vlog_unsigned_add(t24, 32, t29, 12, t23, 32);
    xsi_vlog_generic_convert_array_indices(t14, t15, t16, t22, 2, 1, t24, 32, 2);
    t30 = (t14 + 4);
    t18 = *((unsigned int *)t30);
    t39 = (!(t18));
    t31 = (t15 + 4);
    t19 = *((unsigned int *)t31);
    t40 = (!(t19));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 24);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 24);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 255U);
    t17 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t17 & 255U);
    t5 = (t0 + 3208);
    t11 = (t0 + 3208);
    t12 = (t11 + 72U);
    t16 = *((char **)t12);
    t20 = (t0 + 3208);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2808U);
    t29 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t16, t22, 2, 1, t29, 12, 2);
    t23 = (t14 + 4);
    t18 = *((unsigned int *)t23);
    t39 = (!(t18));
    t30 = (t15 + 4);
    t19 = *((unsigned int *)t30);
    t40 = (!(t19));
    t66 = (t39 && t40);
    if (t66 == 1)
        goto LAB38;

LAB39:    goto LAB30;

LAB32:    t71 = *((unsigned int *)t15);
    t72 = *((unsigned int *)t24);
    t73 = (t71 - t72);
    t74 = (t73 + 1);
    xsi_vlogvar_wait_assign_value(t29, t14, 0, *((unsigned int *)t24), t74, 0LL);
    goto LAB33;

LAB34:    t25 = *((unsigned int *)t14);
    t26 = *((unsigned int *)t15);
    t69 = (t25 - t26);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t5, t13, 0, *((unsigned int *)t15), t70, 0LL);
    goto LAB35;

LAB36:    t25 = *((unsigned int *)t14);
    t26 = *((unsigned int *)t15);
    t69 = (t25 - t26);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t5, t13, 0, *((unsigned int *)t15), t70, 0LL);
    goto LAB37;

LAB38:    t25 = *((unsigned int *)t14);
    t26 = *((unsigned int *)t15);
    t69 = (t25 - t26);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t5, t13, 0, *((unsigned int *)t15), t70, 0LL);
    goto LAB39;

LAB41:    t8 = *((unsigned int *)t15);
    t9 = *((unsigned int *)t24);
    t69 = (t8 - t9);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t29, t13, 0, *((unsigned int *)t24), t70, 0LL);
    goto LAB42;

LAB43:    t8 = *((unsigned int *)t15);
    t9 = *((unsigned int *)t24);
    t69 = (t8 - t9);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t29, t13, 0, *((unsigned int *)t24), t70, 0LL);
    goto LAB44;

LAB45:    t8 = *((unsigned int *)t15);
    t9 = *((unsigned int *)t24);
    t69 = (t8 - t9);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t29, t13, 0, *((unsigned int *)t24), t70, 0LL);
    goto LAB46;

LAB47:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t69 = (t8 - t9);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t22, t13, 0, *((unsigned int *)t15), t70, 0LL);
    goto LAB48;

}


extern void work_m_00000000000035303616_4115655832_init()
{
	static char *pe[] = {(void *)Cont_70_0,(void *)Cont_74_1,(void *)Cont_81_2,(void *)Always_84_3};
	xsi_register_didat("work_m_00000000000035303616_4115655832", "isim/TOP_isim_beh.exe.sim/work/m_00000000000035303616_4115655832.didat");
	xsi_register_executes(pe);
}
