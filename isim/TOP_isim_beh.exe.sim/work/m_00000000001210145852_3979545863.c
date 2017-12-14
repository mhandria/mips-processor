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
static const char *ng0 = "//Mac/Home/Documents/MIPS STACK/regfile32.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {1020U, 0U};
static int ng4[] = {29, 0};
static unsigned int ng5[] = {1U, 0U};



static void Cont_41_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2728);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2728);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1688U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 4576);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 4464);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_42_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2728);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2728);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1848U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 4640);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 4480);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_45_2(char *t0)
{
    char t13[8];
    char t14[8];
    char t44[8];
    char t57[8];
    char t63[8];
    char t101[8];
    char t102[8];
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
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
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
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
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
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    char *t107;
    char *t108;
    char *t109;
    char *t110;
    unsigned int t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    int t116;
    int t117;

LAB0:    t1 = (t0 + 4144U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 4496);
    *((int *)t2) = 1;
    t3 = (t0 + 4176);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);
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

LAB6:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t23 = (t9 ^ t10);
    t26 = (t8 | t23);
    t29 = *((unsigned int *)t4);
    t30 = *((unsigned int *)t5);
    t33 = (t29 | t30);
    t34 = (~(t33));
    t35 = (t26 & t34);
    if (t35 != 0)
        goto LAB16;

LAB13:    if (t33 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t13) = 1;

LAB16:    memset(t14, 0, 8);
    t12 = (t13 + 4);
    t36 = *((unsigned int *)t12);
    t37 = (~(t36));
    t38 = *((unsigned int *)t13);
    t39 = (t38 & t37);
    t40 = (t39 & 1U);
    if (t40 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t12) != 0)
        goto LAB19;

LAB20:    t16 = (t14 + 4);
    t41 = *((unsigned int *)t14);
    t42 = *((unsigned int *)t16);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB21;

LAB22:    memcpy(t63, t14, 8);

LAB23:    t93 = (t63 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t63);
    t97 = (t96 & t95);
    t98 = (t97 != 0);
    if (t98 > 0)
        goto LAB35;

LAB36:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2728);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t15 = (t0 + 2728);
    t16 = (t15 + 64U);
    t17 = *((char **)t16);
    t18 = (t0 + 1528U);
    t19 = *((char **)t18);
    xsi_vlog_generic_get_array_select_value(t13, 32, t4, t12, t17, 2, 1, t19, 5, 2);
    t18 = (t0 + 2728);
    t20 = (t0 + 2728);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t25 = (t0 + 2728);
    t67 = (t25 + 64U);
    t68 = *((char **)t67);
    t69 = (t0 + 1528U);
    t77 = *((char **)t69);
    xsi_vlog_generic_convert_array_indices(t14, t44, t22, t68, 2, 1, t77, 5, 2);
    t69 = (t14 + 4);
    t6 = *((unsigned int *)t69);
    t24 = (!(t6));
    t78 = (t44 + 4);
    t7 = *((unsigned int *)t78);
    t27 = (!(t7));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB40;

LAB41:
LAB37:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(48, ng0);

LAB8:    xsi_set_current_line(49, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2728);
    t15 = (t0 + 2728);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 2728);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t13, t14, t17, t20, 2, 1, t21, 32, 1);
    t22 = (t13 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2728);
    t4 = (t0 + 2728);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2728);
    t15 = (t12 + 64U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng4)));
    xsi_vlog_generic_convert_array_indices(t13, t14, t11, t16, 2, 1, t17, 32, 1);
    t18 = (t13 + 4);
    t6 = *((unsigned int *)t18);
    t24 = (!(t6));
    t19 = (t14 + 4);
    t7 = *((unsigned int *)t19);
    t27 = (!(t7));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB11;

LAB12:    goto LAB7;

LAB9:    t29 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t14);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, *((unsigned int *)t14), t32, 0LL);
    goto LAB10;

LAB11:    t8 = *((unsigned int *)t13);
    t9 = *((unsigned int *)t14);
    t31 = (t8 - t9);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t14), t32, 0LL);
    goto LAB12;

LAB15:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB16;

LAB17:    *((unsigned int *)t14) = 1;
    goto LAB20;

LAB19:    t15 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB20;

LAB21:    t17 = (t0 + 1528U);
    t18 = *((char **)t17);
    t17 = ((char*)((ng1)));
    memset(t44, 0, 8);
    t19 = (t18 + 4);
    t20 = (t17 + 4);
    t45 = *((unsigned int *)t18);
    t46 = *((unsigned int *)t17);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t19);
    t49 = *((unsigned int *)t20);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t19);
    t53 = *((unsigned int *)t20);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB25;

LAB24:    if (t54 != 0)
        goto LAB26;

LAB27:    memset(t57, 0, 8);
    t22 = (t44 + 4);
    t58 = *((unsigned int *)t22);
    t59 = (~(t58));
    t60 = *((unsigned int *)t44);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t22) != 0)
        goto LAB30;

LAB31:    t64 = *((unsigned int *)t14);
    t65 = *((unsigned int *)t57);
    t66 = (t64 & t65);
    *((unsigned int *)t63) = t66;
    t67 = (t14 + 4);
    t68 = (t57 + 4);
    t69 = (t63 + 4);
    t70 = *((unsigned int *)t67);
    t71 = *((unsigned int *)t68);
    t72 = (t70 | t71);
    *((unsigned int *)t69) = t72;
    t73 = *((unsigned int *)t69);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB32;

LAB33:
LAB34:    goto LAB23;

LAB25:    *((unsigned int *)t44) = 1;
    goto LAB27;

LAB26:    t21 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB27;

LAB28:    *((unsigned int *)t57) = 1;
    goto LAB31;

LAB30:    t25 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB31;

LAB32:    t75 = *((unsigned int *)t63);
    t76 = *((unsigned int *)t69);
    *((unsigned int *)t63) = (t75 | t76);
    t77 = (t14 + 4);
    t78 = (t57 + 4);
    t79 = *((unsigned int *)t14);
    t80 = (~(t79));
    t81 = *((unsigned int *)t77);
    t82 = (~(t81));
    t83 = *((unsigned int *)t57);
    t84 = (~(t83));
    t85 = *((unsigned int *)t78);
    t86 = (~(t85));
    t24 = (t80 & t82);
    t27 = (t84 & t86);
    t87 = (~(t24));
    t88 = (~(t27));
    t89 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t89 & t87);
    t90 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t90 & t88);
    t91 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t91 & t87);
    t92 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t92 & t88);
    goto LAB34;

LAB35:    xsi_set_current_line(55, ng0);
    t99 = (t0 + 2008U);
    t100 = *((char **)t99);
    t99 = (t0 + 2728);
    t103 = (t0 + 2728);
    t104 = (t103 + 72U);
    t105 = *((char **)t104);
    t106 = (t0 + 2728);
    t107 = (t106 + 64U);
    t108 = *((char **)t107);
    t109 = (t0 + 1528U);
    t110 = *((char **)t109);
    xsi_vlog_generic_convert_array_indices(t101, t102, t105, t108, 2, 1, t110, 5, 2);
    t109 = (t101 + 4);
    t111 = *((unsigned int *)t109);
    t28 = (!(t111));
    t112 = (t102 + 4);
    t113 = *((unsigned int *)t112);
    t31 = (!(t113));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB38;

LAB39:    goto LAB37;

LAB38:    t114 = *((unsigned int *)t101);
    t115 = *((unsigned int *)t102);
    t116 = (t114 - t115);
    t117 = (t116 + 1);
    xsi_vlogvar_wait_assign_value(t99, t100, 0, *((unsigned int *)t102), t117, 0LL);
    goto LAB39;

LAB40:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t44);
    t31 = (t8 - t9);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t18, t13, 0, *((unsigned int *)t44), t32, 0LL);
    goto LAB41;

}


extern void work_m_00000000001210145852_3979545863_init()
{
	static char *pe[] = {(void *)Cont_41_0,(void *)Cont_42_1,(void *)Always_45_2};
	xsi_register_didat("work_m_00000000001210145852_3979545863", "isim/TOP_isim_beh.exe.sim/work/m_00000000001210145852_3979545863.didat");
	xsi_register_executes(pe);
}
