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
static const char *ng0 = "//Mac/Home/Documents/MIPS STACK/ALU.v";
static unsigned int ng1[] = {31U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {0U, 1U};
static unsigned int ng4[] = {0U, 0U, 0U, 0U};
static unsigned int ng5[] = {1U, 1U};
static unsigned int ng6[] = {30U, 0U};



static void Always_74_0(char *t0)
{
    char t6[8];
    char t28[16];
    char t33[8];
    char t34[8];
    char t46[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;

LAB0:    t1 = (t0 + 5888U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 6208);
    *((int *)t2) = 1;
    t3 = (t0 + 5920);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(74, ng0);

LAB5:    xsi_set_current_line(76, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
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
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB37;

LAB34:    if (t18 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t6) = 1;

LAB37:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(96, ng0);

LAB46:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    xsi_vlogtype_concat(t28, 64, 64, 2U, t2, 32, t3, 32);
    t4 = (t0 + 4328);
    xsi_vlogvar_assign_value(t4, t28, 0, 0, 32);
    t5 = (t0 + 4168);
    xsi_vlogvar_assign_value(t5, t28, 32, 0, 32);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3128U);
    t3 = *((char **)t2);
    t2 = (t0 + 4968);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2808U);
    t3 = *((char **)t2);
    t2 = (t0 + 4648);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2968U);
    t3 = *((char **)t2);
    t2 = (t0 + 4808);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 4488);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 1);

LAB40:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(77, ng0);

LAB13:    xsi_set_current_line(78, ng0);
    t29 = (t0 + 2168U);
    t30 = *((char **)t29);
    t29 = (t0 + 2008U);
    t31 = *((char **)t29);
    xsi_vlogtype_concat(t28, 64, 64, 2U, t31, 32, t30, 32);
    t29 = (t0 + 4328);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 32);
    t32 = (t0 + 4168);
    xsi_vlogvar_assign_value(t32, t28, 32, 0, 32);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t9 = *((unsigned int *)t3);
    t10 = (t9 >> 31);
    t11 = (t10 & 1);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t2) = t14;
    t5 = (t0 + 1208U);
    t7 = *((char **)t5);
    memset(t33, 0, 8);
    t5 = (t33 + 4);
    t8 = (t7 + 4);
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t33) = t17;
    t18 = *((unsigned int *)t8);
    t19 = (t18 >> 31);
    t20 = (t19 & 1);
    *((unsigned int *)t5) = t20;
    t23 = *((unsigned int *)t6);
    t24 = *((unsigned int *)t33);
    t25 = (t23 ^ t24);
    *((unsigned int *)t34) = t25;
    t21 = (t6 + 4);
    t22 = (t33 + 4);
    t29 = (t34 + 4);
    t26 = *((unsigned int *)t21);
    t27 = *((unsigned int *)t22);
    t35 = (t26 | t27);
    *((unsigned int *)t29) = t35;
    t36 = *((unsigned int *)t29);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB14;

LAB15:
LAB16:    t30 = (t0 + 4488);
    xsi_vlogvar_assign_value(t30, t34, 0, 0, 1);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t34, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB20;

LAB17:    if (t18 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t34) = 1;

LAB20:    memset(t33, 0, 8);
    t8 = (t34 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t34);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t8) != 0)
        goto LAB23;

LAB24:    t22 = (t33 + 4);
    t35 = *((unsigned int *)t33);
    t36 = *((unsigned int *)t22);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB25;

LAB26:    t38 = *((unsigned int *)t33);
    t39 = (~(t38));
    t40 = *((unsigned int *)t22);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t22) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t33) > 0)
        goto LAB31;

LAB32:    memcpy(t6, t46, 8);

LAB33:    t47 = (t0 + 4648);
    xsi_vlogvar_assign_value(t47, t6, 0, 0, 1);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB12;

LAB14:    t38 = *((unsigned int *)t34);
    t39 = *((unsigned int *)t29);
    *((unsigned int *)t34) = (t38 | t39);
    goto LAB16;

LAB19:    t7 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t33) = 1;
    goto LAB24;

LAB23:    t21 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB24;

LAB25:    t29 = ((char*)((ng3)));
    goto LAB26;

LAB27:    t30 = (t0 + 4328);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t42 = (t0 + 4168);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    xsi_vlogtype_concat(t28, 64, 64, 2U, t44, 32, t32, 32);
    t45 = ((char*)((ng4)));
    xsi_vlog_unsigned_equal(t46, 64, t28, 64, t45, 64);
    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t6, 1, t29, 1, t46, 1);
    goto LAB33;

LAB31:    memcpy(t6, t29, 8);
    goto LAB33;

LAB36:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(87, ng0);

LAB41:    xsi_set_current_line(88, ng0);
    t21 = (t0 + 1848U);
    t22 = *((char **)t21);
    t21 = (t0 + 1688U);
    t29 = *((char **)t21);
    xsi_vlogtype_concat(t28, 64, 64, 2U, t29, 32, t22, 32);
    t21 = (t0 + 4328);
    xsi_vlogvar_assign_value(t21, t28, 0, 0, 32);
    t30 = (t0 + 4168);
    xsi_vlogvar_assign_value(t30, t28, 32, 0, 32);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t7 = (t4 + 4);
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 31);
    t11 = (t10 & 1);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t5) = t14;
    t8 = (t0 + 4488);
    xsi_vlogvar_assign_value(t8, t6, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
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
        goto LAB45;

LAB42:    if (t18 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t6) = 1;

LAB45:    t22 = (t0 + 4648);
    xsi_vlogvar_assign_value(t22, t6, 0, 0, 1);
    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB40;

LAB44:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB45;

}


extern void work_m_00000000002684012018_0886308060_init()
{
	static char *pe[] = {(void *)Always_74_0};
	xsi_register_didat("work_m_00000000002684012018_0886308060", "isim/TOP_isim_beh.exe.sim/work/m_00000000002684012018_0886308060.didat");
	xsi_register_executes(pe);
}
