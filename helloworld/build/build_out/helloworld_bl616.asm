
D:/anxinke/AiPi-Open-Kits/helloworld/build/build_out/helloworld_bl616.elf:     file format elf32-littleriscv


Disassembly of section .init:

a0000000 <__start>:
    .globl  __start
    .type   __start, %function
__start:
.option push
.option norelax
    la      gp, __global_pointer$
a0000000:	c2fca197          	auipc	gp,0xc2fca
a0000004:	80018193          	addi	gp,gp,-2048 # 62fc9800 <__global_pointer$>
.option pop
    csrci   mstatus, 8
a0000008:	30047073          	csrci	mstatus,8

    /* mtvec: for all exceptions and non-vector mode IRQs */
    la      a0, default_trap_handler
a000000c:	00006517          	auipc	a0,0x6
a0000010:	6f450513          	addi	a0,a0,1780 # a0006700 <trap>
    ori     a0, a0, 3
a0000014:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
a0000018:	30551073          	csrw	mtvec,a0
    la      a0, __Vectors
    csrw    mtvt, a0
#endif
#if defined(__riscv_flen)
    /* FP: initial state */
    csrr    t0, mstatus
a000001c:	300022f3          	csrr	t0,mstatus
    li      t1, ~0x6000
a0000020:	7369                	lui	t1,0xffffa
a0000022:	137d                	addi	t1,t1,-1
    and     t0, t0, t1
a0000024:	0062f2b3          	and	t0,t0,t1
    li      t1, 0x2000
a0000028:	6309                	lui	t1,0x2
    or      t0, t0, t1
a000002a:	0062e2b3          	or	t0,t0,t1
    csrw    mstatus, t0
a000002e:	30029073          	csrw	mstatus,t0
    /* csrwi   fcsr, 0 */
#endif

    .weak __StackTop
    la      sp, __StackTop
a0000032:	c2fc4117          	auipc	sp,0xc2fc4
a0000036:	fce10113          	addi	sp,sp,-50 # 62fc4000 <__StackTop>
    csrw    mscratch, sp
a000003a:	34011073          	csrw	mscratch,sp

    /* Load data section removed */

    /* Clear bss section removed */

    jal     SystemInit
a000003e:	123060ef          	jal	ra,a0006960 <SystemInit>

    /* start load code to itcm like. */
    jal     start_load
a0000042:	7fe060ef          	jal	ra,a0006840 <start_load>

    jal     System_Post_Init
a0000046:	233060ef          	jal	ra,a0006a78 <System_Post_Init>

    jal     main
a000004a:	02e040ef          	jal	ra,a0004078 <main>

a000004e <__exit>:

    .size   __start, . - __start

__exit:
    j      __exit
a000004e:	a001                	j	a000004e <__exit>
	...

Disassembly of section .text:

a0000c00 <__clzsi2>:
a0000c00:	67c1                	lui	a5,0x10
a0000c02:	02f57663          	bgeu	a0,a5,a0000c2e <__clzsi2+0x2e>
a0000c06:	0ff00793          	li	a5,255
a0000c0a:	00a7b7b3          	sltu	a5,a5,a0
a0000c0e:	078e                	slli	a5,a5,0x3
a0000c10:	02000713          	li	a4,32
a0000c14:	8f1d                	sub	a4,a4,a5
a0000c16:	00f55533          	srl	a0,a0,a5
a0000c1a:	0000c797          	auipc	a5,0xc
a0000c1e:	8de78793          	addi	a5,a5,-1826 # a000c4f8 <__clz_tab>
a0000c22:	953e                	add	a0,a0,a5
a0000c24:	00054503          	lbu	a0,0(a0)
a0000c28:	40a70533          	sub	a0,a4,a0
a0000c2c:	8082                	ret
a0000c2e:	01000737          	lui	a4,0x1000
a0000c32:	47c1                	li	a5,16
a0000c34:	fce56ee3          	bltu	a0,a4,a0000c10 <__clzsi2+0x10>
a0000c38:	47e1                	li	a5,24
a0000c3a:	bfd9                	j	a0000c10 <__clzsi2+0x10>

a0000c3c <__divdi3>:
a0000c3c:	8eaa                	mv	t4,a0
a0000c3e:	4801                	li	a6,0
a0000c40:	0005da63          	bgez	a1,a0000c54 <__divdi3+0x18>
a0000c44:	00a037b3          	snez	a5,a0
a0000c48:	40b005b3          	neg	a1,a1
a0000c4c:	8d9d                	sub	a1,a1,a5
a0000c4e:	40a00eb3          	neg	t4,a0
a0000c52:	587d                	li	a6,-1
a0000c54:	0006db63          	bgez	a3,a0000c6a <__divdi3+0x2e>
a0000c58:	00c037b3          	snez	a5,a2
a0000c5c:	40d006b3          	neg	a3,a3
a0000c60:	fff84813          	not	a6,a6
a0000c64:	8e9d                	sub	a3,a3,a5
a0000c66:	40c00633          	neg	a2,a2
a0000c6a:	88b2                	mv	a7,a2
a0000c6c:	8736                	mv	a4,a3
a0000c6e:	8e76                	mv	t3,t4
a0000c70:	852e                	mv	a0,a1
a0000c72:	22069363          	bnez	a3,a0000e98 <__divdi3+0x25c>
a0000c76:	0000c697          	auipc	a3,0xc
a0000c7a:	88268693          	addi	a3,a3,-1918 # a000c4f8 <__clz_tab>
a0000c7e:	0cc5f163          	bgeu	a1,a2,a0000d40 <__divdi3+0x104>
a0000c82:	67c1                	lui	a5,0x10
a0000c84:	0af67763          	bgeu	a2,a5,a0000d32 <__divdi3+0xf6>
a0000c88:	0ff00793          	li	a5,255
a0000c8c:	00c7b7b3          	sltu	a5,a5,a2
a0000c90:	078e                	slli	a5,a5,0x3
a0000c92:	00f65733          	srl	a4,a2,a5
a0000c96:	96ba                	add	a3,a3,a4
a0000c98:	0006c683          	lbu	a3,0(a3)
a0000c9c:	97b6                	add	a5,a5,a3
a0000c9e:	02000693          	li	a3,32
a0000ca2:	40f68733          	sub	a4,a3,a5
a0000ca6:	00f68c63          	beq	a3,a5,a0000cbe <__divdi3+0x82>
a0000caa:	00e595b3          	sll	a1,a1,a4
a0000cae:	00fed7b3          	srl	a5,t4,a5
a0000cb2:	00e618b3          	sll	a7,a2,a4
a0000cb6:	00b7e533          	or	a0,a5,a1
a0000cba:	00ee9e33          	sll	t3,t4,a4
a0000cbe:	0108d313          	srli	t1,a7,0x10
a0000cc2:	026556b3          	divu	a3,a0,t1
a0000cc6:	01089593          	slli	a1,a7,0x10
a0000cca:	81c1                	srli	a1,a1,0x10
a0000ccc:	010e5793          	srli	a5,t3,0x10
a0000cd0:	02657733          	remu	a4,a0,t1
a0000cd4:	8636                	mv	a2,a3
a0000cd6:	02d58533          	mul	a0,a1,a3
a0000cda:	0742                	slli	a4,a4,0x10
a0000cdc:	8fd9                	or	a5,a5,a4
a0000cde:	00a7fc63          	bgeu	a5,a0,a0000cf6 <__divdi3+0xba>
a0000ce2:	97c6                	add	a5,a5,a7
a0000ce4:	fff68613          	addi	a2,a3,-1
a0000ce8:	0117e763          	bltu	a5,a7,a0000cf6 <__divdi3+0xba>
a0000cec:	00a7f563          	bgeu	a5,a0,a0000cf6 <__divdi3+0xba>
a0000cf0:	ffe68613          	addi	a2,a3,-2
a0000cf4:	97c6                	add	a5,a5,a7
a0000cf6:	8f89                	sub	a5,a5,a0
a0000cf8:	0267f733          	remu	a4,a5,t1
a0000cfc:	0e42                	slli	t3,t3,0x10
a0000cfe:	010e5e13          	srli	t3,t3,0x10
a0000d02:	0267d7b3          	divu	a5,a5,t1
a0000d06:	0742                	slli	a4,a4,0x10
a0000d08:	01c76e33          	or	t3,a4,t3
a0000d0c:	02f586b3          	mul	a3,a1,a5
a0000d10:	873e                	mv	a4,a5
a0000d12:	00de7b63          	bgeu	t3,a3,a0000d28 <__divdi3+0xec>
a0000d16:	9e46                	add	t3,t3,a7
a0000d18:	fff78713          	addi	a4,a5,-1 # ffff <nocache_min_size+0xafff>
a0000d1c:	011e6663          	bltu	t3,a7,a0000d28 <__divdi3+0xec>
a0000d20:	00de7463          	bgeu	t3,a3,a0000d28 <__divdi3+0xec>
a0000d24:	ffe78713          	addi	a4,a5,-2
a0000d28:	01061513          	slli	a0,a2,0x10
a0000d2c:	8d59                	or	a0,a0,a4
a0000d2e:	4301                	li	t1,0
a0000d30:	a85d                	j	a0000de6 <__divdi3+0x1aa>
a0000d32:	01000737          	lui	a4,0x1000
a0000d36:	47c1                	li	a5,16
a0000d38:	f4e66de3          	bltu	a2,a4,a0000c92 <__divdi3+0x56>
a0000d3c:	47e1                	li	a5,24
a0000d3e:	bf91                	j	a0000c92 <__divdi3+0x56>
a0000d40:	e601                	bnez	a2,a0000d48 <__divdi3+0x10c>
a0000d42:	4885                	li	a7,1
a0000d44:	02e8d8b3          	divu	a7,a7,a4
a0000d48:	67c1                	lui	a5,0x10
a0000d4a:	0af8f963          	bgeu	a7,a5,a0000dfc <__divdi3+0x1c0>
a0000d4e:	0ff00793          	li	a5,255
a0000d52:	0117f363          	bgeu	a5,a7,a0000d58 <__divdi3+0x11c>
a0000d56:	4721                	li	a4,8
a0000d58:	00e8d7b3          	srl	a5,a7,a4
a0000d5c:	96be                	add	a3,a3,a5
a0000d5e:	0006c783          	lbu	a5,0(a3)
a0000d62:	02000693          	li	a3,32
a0000d66:	97ba                	add	a5,a5,a4
a0000d68:	40f68733          	sub	a4,a3,a5
a0000d6c:	08f69f63          	bne	a3,a5,a0000e0a <__divdi3+0x1ce>
a0000d70:	411585b3          	sub	a1,a1,a7
a0000d74:	4305                	li	t1,1
a0000d76:	0108d513          	srli	a0,a7,0x10
a0000d7a:	01089613          	slli	a2,a7,0x10
a0000d7e:	8241                	srli	a2,a2,0x10
a0000d80:	010e5713          	srli	a4,t3,0x10
a0000d84:	02a5d7b3          	divu	a5,a1,a0
a0000d88:	02a5f6b3          	remu	a3,a1,a0
a0000d8c:	02f605b3          	mul	a1,a2,a5
a0000d90:	06c2                	slli	a3,a3,0x10
a0000d92:	8f55                	or	a4,a4,a3
a0000d94:	86be                	mv	a3,a5
a0000d96:	00b77c63          	bgeu	a4,a1,a0000dae <__divdi3+0x172>
a0000d9a:	9746                	add	a4,a4,a7
a0000d9c:	fff78693          	addi	a3,a5,-1 # ffff <nocache_min_size+0xafff>
a0000da0:	01176763          	bltu	a4,a7,a0000dae <__divdi3+0x172>
a0000da4:	00b77563          	bgeu	a4,a1,a0000dae <__divdi3+0x172>
a0000da8:	ffe78693          	addi	a3,a5,-2
a0000dac:	9746                	add	a4,a4,a7
a0000dae:	8f0d                	sub	a4,a4,a1
a0000db0:	02a777b3          	remu	a5,a4,a0
a0000db4:	0e42                	slli	t3,t3,0x10
a0000db6:	010e5e13          	srli	t3,t3,0x10
a0000dba:	02a75733          	divu	a4,a4,a0
a0000dbe:	07c2                	slli	a5,a5,0x10
a0000dc0:	01c7ee33          	or	t3,a5,t3
a0000dc4:	02e60633          	mul	a2,a2,a4
a0000dc8:	87ba                	mv	a5,a4
a0000dca:	00ce7b63          	bgeu	t3,a2,a0000de0 <__divdi3+0x1a4>
a0000dce:	9e46                	add	t3,t3,a7
a0000dd0:	fff70793          	addi	a5,a4,-1 # ffffff <nocache_min_size+0xffafff>
a0000dd4:	011e6663          	bltu	t3,a7,a0000de0 <__divdi3+0x1a4>
a0000dd8:	00ce7463          	bgeu	t3,a2,a0000de0 <__divdi3+0x1a4>
a0000ddc:	ffe70793          	addi	a5,a4,-2
a0000de0:	01069513          	slli	a0,a3,0x10
a0000de4:	8d5d                	or	a0,a0,a5
a0000de6:	859a                	mv	a1,t1
a0000de8:	00080963          	beqz	a6,a0000dfa <__divdi3+0x1be>
a0000dec:	00a037b3          	snez	a5,a0
a0000df0:	406005b3          	neg	a1,t1
a0000df4:	8d9d                	sub	a1,a1,a5
a0000df6:	40a00533          	neg	a0,a0
a0000dfa:	8082                	ret
a0000dfc:	010007b7          	lui	a5,0x1000
a0000e00:	4741                	li	a4,16
a0000e02:	f4f8ebe3          	bltu	a7,a5,a0000d58 <__divdi3+0x11c>
a0000e06:	4761                	li	a4,24
a0000e08:	bf81                	j	a0000d58 <__divdi3+0x11c>
a0000e0a:	00e898b3          	sll	a7,a7,a4
a0000e0e:	00f5d533          	srl	a0,a1,a5
a0000e12:	00ee9e33          	sll	t3,t4,a4
a0000e16:	00e595b3          	sll	a1,a1,a4
a0000e1a:	00fed7b3          	srl	a5,t4,a5
a0000e1e:	0108de93          	srli	t4,a7,0x10
a0000e22:	00b7e633          	or	a2,a5,a1
a0000e26:	03d557b3          	divu	a5,a0,t4
a0000e2a:	01089593          	slli	a1,a7,0x10
a0000e2e:	81c1                	srli	a1,a1,0x10
a0000e30:	03d57733          	remu	a4,a0,t4
a0000e34:	01065513          	srli	a0,a2,0x10
a0000e38:	833e                	mv	t1,a5
a0000e3a:	02f586b3          	mul	a3,a1,a5
a0000e3e:	0742                	slli	a4,a4,0x10
a0000e40:	8f49                	or	a4,a4,a0
a0000e42:	00d77c63          	bgeu	a4,a3,a0000e5a <__divdi3+0x21e>
a0000e46:	9746                	add	a4,a4,a7
a0000e48:	fff78313          	addi	t1,a5,-1 # ffffff <nocache_min_size+0xffafff>
a0000e4c:	01176763          	bltu	a4,a7,a0000e5a <__divdi3+0x21e>
a0000e50:	00d77563          	bgeu	a4,a3,a0000e5a <__divdi3+0x21e>
a0000e54:	ffe78313          	addi	t1,a5,-2
a0000e58:	9746                	add	a4,a4,a7
a0000e5a:	40d706b3          	sub	a3,a4,a3
a0000e5e:	03d6f733          	remu	a4,a3,t4
a0000e62:	0642                	slli	a2,a2,0x10
a0000e64:	8241                	srli	a2,a2,0x10
a0000e66:	03d6d6b3          	divu	a3,a3,t4
a0000e6a:	0742                	slli	a4,a4,0x10
a0000e6c:	02d587b3          	mul	a5,a1,a3
a0000e70:	00c765b3          	or	a1,a4,a2
a0000e74:	8736                	mv	a4,a3
a0000e76:	00f5fc63          	bgeu	a1,a5,a0000e8e <__divdi3+0x252>
a0000e7a:	95c6                	add	a1,a1,a7
a0000e7c:	fff68713          	addi	a4,a3,-1
a0000e80:	0115e763          	bltu	a1,a7,a0000e8e <__divdi3+0x252>
a0000e84:	00f5f563          	bgeu	a1,a5,a0000e8e <__divdi3+0x252>
a0000e88:	ffe68713          	addi	a4,a3,-2
a0000e8c:	95c6                	add	a1,a1,a7
a0000e8e:	0342                	slli	t1,t1,0x10
a0000e90:	8d9d                	sub	a1,a1,a5
a0000e92:	00e36333          	or	t1,t1,a4
a0000e96:	b5c5                	j	a0000d76 <__divdi3+0x13a>
a0000e98:	14d5e063          	bltu	a1,a3,a0000fd8 <__divdi3+0x39c>
a0000e9c:	67c1                	lui	a5,0x10
a0000e9e:	02f6ff63          	bgeu	a3,a5,a0000edc <__divdi3+0x2a0>
a0000ea2:	0ff00713          	li	a4,255
a0000ea6:	00d737b3          	sltu	a5,a4,a3
a0000eaa:	078e                	slli	a5,a5,0x3
a0000eac:	00f6d533          	srl	a0,a3,a5
a0000eb0:	0000b717          	auipc	a4,0xb
a0000eb4:	64870713          	addi	a4,a4,1608 # a000c4f8 <__clz_tab>
a0000eb8:	972a                	add	a4,a4,a0
a0000eba:	00074703          	lbu	a4,0(a4)
a0000ebe:	973e                	add	a4,a4,a5
a0000ec0:	02000793          	li	a5,32
a0000ec4:	40e78333          	sub	t1,a5,a4
a0000ec8:	02e79163          	bne	a5,a4,a0000eea <__divdi3+0x2ae>
a0000ecc:	4505                	li	a0,1
a0000ece:	f0b6ece3          	bltu	a3,a1,a0000de6 <__divdi3+0x1aa>
a0000ed2:	00ceb533          	sltu	a0,t4,a2
a0000ed6:	00154513          	xori	a0,a0,1
a0000eda:	b731                	j	a0000de6 <__divdi3+0x1aa>
a0000edc:	01000737          	lui	a4,0x1000
a0000ee0:	47c1                	li	a5,16
a0000ee2:	fce6e5e3          	bltu	a3,a4,a0000eac <__divdi3+0x270>
a0000ee6:	47e1                	li	a5,24
a0000ee8:	b7d1                	j	a0000eac <__divdi3+0x270>
a0000eea:	00e657b3          	srl	a5,a2,a4
a0000eee:	006696b3          	sll	a3,a3,t1
a0000ef2:	8edd                	or	a3,a3,a5
a0000ef4:	00e5d533          	srl	a0,a1,a4
a0000ef8:	006597b3          	sll	a5,a1,t1
a0000efc:	00eed733          	srl	a4,t4,a4
a0000f00:	0106df13          	srli	t5,a3,0x10
a0000f04:	00f765b3          	or	a1,a4,a5
a0000f08:	03e57733          	remu	a4,a0,t5
a0000f0c:	01069893          	slli	a7,a3,0x10
a0000f10:	0108d893          	srli	a7,a7,0x10
a0000f14:	0105d793          	srli	a5,a1,0x10
a0000f18:	00661633          	sll	a2,a2,t1
a0000f1c:	03e55533          	divu	a0,a0,t5
a0000f20:	0742                	slli	a4,a4,0x10
a0000f22:	8fd9                	or	a5,a5,a4
a0000f24:	02a88fb3          	mul	t6,a7,a0
a0000f28:	8e2a                	mv	t3,a0
a0000f2a:	01f7fc63          	bgeu	a5,t6,a0000f42 <__divdi3+0x306>
a0000f2e:	97b6                	add	a5,a5,a3
a0000f30:	fff50e13          	addi	t3,a0,-1
a0000f34:	00d7e763          	bltu	a5,a3,a0000f42 <__divdi3+0x306>
a0000f38:	01f7f563          	bgeu	a5,t6,a0000f42 <__divdi3+0x306>
a0000f3c:	ffe50e13          	addi	t3,a0,-2
a0000f40:	97b6                	add	a5,a5,a3
a0000f42:	41f787b3          	sub	a5,a5,t6
a0000f46:	03e7f733          	remu	a4,a5,t5
a0000f4a:	05c2                	slli	a1,a1,0x10
a0000f4c:	81c1                	srli	a1,a1,0x10
a0000f4e:	03e7d7b3          	divu	a5,a5,t5
a0000f52:	0742                	slli	a4,a4,0x10
a0000f54:	8f4d                	or	a4,a4,a1
a0000f56:	02f888b3          	mul	a7,a7,a5
a0000f5a:	85be                	mv	a1,a5
a0000f5c:	01177c63          	bgeu	a4,a7,a0000f74 <__divdi3+0x338>
a0000f60:	9736                	add	a4,a4,a3
a0000f62:	fff78593          	addi	a1,a5,-1 # ffff <nocache_min_size+0xafff>
a0000f66:	00d76763          	bltu	a4,a3,a0000f74 <__divdi3+0x338>
a0000f6a:	01177563          	bgeu	a4,a7,a0000f74 <__divdi3+0x338>
a0000f6e:	ffe78593          	addi	a1,a5,-2
a0000f72:	9736                	add	a4,a4,a3
a0000f74:	010e1513          	slli	a0,t3,0x10
a0000f78:	6f41                	lui	t5,0x10
a0000f7a:	8d4d                	or	a0,a0,a1
a0000f7c:	ffff0693          	addi	a3,t5,-1 # ffff <nocache_min_size+0xafff>
a0000f80:	01055593          	srli	a1,a0,0x10
a0000f84:	41170733          	sub	a4,a4,a7
a0000f88:	00d578b3          	and	a7,a0,a3
a0000f8c:	8ef1                	and	a3,a3,a2
a0000f8e:	8241                	srli	a2,a2,0x10
a0000f90:	02d88e33          	mul	t3,a7,a3
a0000f94:	02d586b3          	mul	a3,a1,a3
a0000f98:	010e5793          	srli	a5,t3,0x10
a0000f9c:	02c888b3          	mul	a7,a7,a2
a0000fa0:	98b6                	add	a7,a7,a3
a0000fa2:	97c6                	add	a5,a5,a7
a0000fa4:	02c585b3          	mul	a1,a1,a2
a0000fa8:	00d7f363          	bgeu	a5,a3,a0000fae <__divdi3+0x372>
a0000fac:	95fa                	add	a1,a1,t5
a0000fae:	0107d693          	srli	a3,a5,0x10
a0000fb2:	95b6                	add	a1,a1,a3
a0000fb4:	02b76063          	bltu	a4,a1,a0000fd4 <__divdi3+0x398>
a0000fb8:	d6b71be3          	bne	a4,a1,a0000d2e <__divdi3+0xf2>
a0000fbc:	6741                	lui	a4,0x10
a0000fbe:	177d                	addi	a4,a4,-1
a0000fc0:	8ff9                	and	a5,a5,a4
a0000fc2:	07c2                	slli	a5,a5,0x10
a0000fc4:	00ee7e33          	and	t3,t3,a4
a0000fc8:	006e9eb3          	sll	t4,t4,t1
a0000fcc:	97f2                	add	a5,a5,t3
a0000fce:	4301                	li	t1,0
a0000fd0:	e0fefbe3          	bgeu	t4,a5,a0000de6 <__divdi3+0x1aa>
a0000fd4:	157d                	addi	a0,a0,-1
a0000fd6:	bba1                	j	a0000d2e <__divdi3+0xf2>
a0000fd8:	4301                	li	t1,0
a0000fda:	4501                	li	a0,0
a0000fdc:	b529                	j	a0000de6 <__divdi3+0x1aa>

a0000fde <__moddi3>:
a0000fde:	8f2a                	mv	t5,a0
a0000fe0:	4801                	li	a6,0
a0000fe2:	0005da63          	bgez	a1,a0000ff6 <__moddi3+0x18>
a0000fe6:	00a037b3          	snez	a5,a0
a0000fea:	40b005b3          	neg	a1,a1
a0000fee:	8d9d                	sub	a1,a1,a5
a0000ff0:	40a00f33          	neg	t5,a0
a0000ff4:	587d                	li	a6,-1
a0000ff6:	0006d963          	bgez	a3,a0001008 <__moddi3+0x2a>
a0000ffa:	00c037b3          	snez	a5,a2
a0000ffe:	40d006b3          	neg	a3,a3
a0001002:	8e9d                	sub	a3,a3,a5
a0001004:	40c00633          	neg	a2,a2
a0001008:	88b2                	mv	a7,a2
a000100a:	87b6                	mv	a5,a3
a000100c:	857a                	mv	a0,t5
a000100e:	872e                	mv	a4,a1
a0001010:	1c069d63          	bnez	a3,a00011ea <__moddi3+0x20c>
a0001014:	0000b697          	auipc	a3,0xb
a0001018:	4e468693          	addi	a3,a3,1252 # a000c4f8 <__clz_tab>
a000101c:	0ac5ff63          	bgeu	a1,a2,a00010da <__moddi3+0xfc>
a0001020:	6341                	lui	t1,0x10
a0001022:	0a667563          	bgeu	a2,t1,a00010cc <__moddi3+0xee>
a0001026:	0ff00313          	li	t1,255
a000102a:	00c37363          	bgeu	t1,a2,a0001030 <__moddi3+0x52>
a000102e:	47a1                	li	a5,8
a0001030:	00f65333          	srl	t1,a2,a5
a0001034:	969a                	add	a3,a3,t1
a0001036:	0006c683          	lbu	a3,0(a3)
a000103a:	96be                	add	a3,a3,a5
a000103c:	02000793          	li	a5,32
a0001040:	40d78333          	sub	t1,a5,a3
a0001044:	00d78c63          	beq	a5,a3,a000105c <__moddi3+0x7e>
a0001048:	006595b3          	sll	a1,a1,t1
a000104c:	00df56b3          	srl	a3,t5,a3
a0001050:	006618b3          	sll	a7,a2,t1
a0001054:	00b6e733          	or	a4,a3,a1
a0001058:	006f1533          	sll	a0,t5,t1
a000105c:	0108de13          	srli	t3,a7,0x10
a0001060:	03c755b3          	divu	a1,a4,t3
a0001064:	01089613          	slli	a2,a7,0x10
a0001068:	8241                	srli	a2,a2,0x10
a000106a:	01055793          	srli	a5,a0,0x10
a000106e:	03c776b3          	remu	a3,a4,t3
a0001072:	02b605b3          	mul	a1,a2,a1
a0001076:	06c2                	slli	a3,a3,0x10
a0001078:	8fd5                	or	a5,a5,a3
a000107a:	00b7f863          	bgeu	a5,a1,a000108a <__moddi3+0xac>
a000107e:	97c6                	add	a5,a5,a7
a0001080:	0117e563          	bltu	a5,a7,a000108a <__moddi3+0xac>
a0001084:	00b7f363          	bgeu	a5,a1,a000108a <__moddi3+0xac>
a0001088:	97c6                	add	a5,a5,a7
a000108a:	8f8d                	sub	a5,a5,a1
a000108c:	03c7f733          	remu	a4,a5,t3
a0001090:	0542                	slli	a0,a0,0x10
a0001092:	8141                	srli	a0,a0,0x10
a0001094:	03c7d7b3          	divu	a5,a5,t3
a0001098:	0742                	slli	a4,a4,0x10
a000109a:	8d59                	or	a0,a0,a4
a000109c:	02f607b3          	mul	a5,a2,a5
a00010a0:	00f57863          	bgeu	a0,a5,a00010b0 <__moddi3+0xd2>
a00010a4:	9546                	add	a0,a0,a7
a00010a6:	01156563          	bltu	a0,a7,a00010b0 <__moddi3+0xd2>
a00010aa:	00f57363          	bgeu	a0,a5,a00010b0 <__moddi3+0xd2>
a00010ae:	9546                	add	a0,a0,a7
a00010b0:	8d1d                	sub	a0,a0,a5
a00010b2:	00655533          	srl	a0,a0,t1
a00010b6:	4581                	li	a1,0
a00010b8:	00080963          	beqz	a6,a00010ca <__moddi3+0xec>
a00010bc:	00a037b3          	snez	a5,a0
a00010c0:	40b005b3          	neg	a1,a1
a00010c4:	8d9d                	sub	a1,a1,a5
a00010c6:	40a00533          	neg	a0,a0
a00010ca:	8082                	ret
a00010cc:	01000337          	lui	t1,0x1000
a00010d0:	47c1                	li	a5,16
a00010d2:	f4666fe3          	bltu	a2,t1,a0001030 <__moddi3+0x52>
a00010d6:	47e1                	li	a5,24
a00010d8:	bfa1                	j	a0001030 <__moddi3+0x52>
a00010da:	e601                	bnez	a2,a00010e2 <__moddi3+0x104>
a00010dc:	4885                	li	a7,1
a00010de:	02f8d8b3          	divu	a7,a7,a5
a00010e2:	6741                	lui	a4,0x10
a00010e4:	08e8f263          	bgeu	a7,a4,a0001168 <__moddi3+0x18a>
a00010e8:	0ff00713          	li	a4,255
a00010ec:	01177363          	bgeu	a4,a7,a00010f2 <__moddi3+0x114>
a00010f0:	47a1                	li	a5,8
a00010f2:	00f8d733          	srl	a4,a7,a5
a00010f6:	96ba                	add	a3,a3,a4
a00010f8:	0006c683          	lbu	a3,0(a3)
a00010fc:	96be                	add	a3,a3,a5
a00010fe:	02000793          	li	a5,32
a0001102:	40d78333          	sub	t1,a5,a3
a0001106:	06d79863          	bne	a5,a3,a0001176 <__moddi3+0x198>
a000110a:	411585b3          	sub	a1,a1,a7
a000110e:	0108d693          	srli	a3,a7,0x10
a0001112:	01089713          	slli	a4,a7,0x10
a0001116:	8341                	srli	a4,a4,0x10
a0001118:	01055613          	srli	a2,a0,0x10
a000111c:	02d5f7b3          	remu	a5,a1,a3
a0001120:	02d5d5b3          	divu	a1,a1,a3
a0001124:	07c2                	slli	a5,a5,0x10
a0001126:	8fd1                	or	a5,a5,a2
a0001128:	02b705b3          	mul	a1,a4,a1
a000112c:	00b7f863          	bgeu	a5,a1,a000113c <__moddi3+0x15e>
a0001130:	97c6                	add	a5,a5,a7
a0001132:	0117e563          	bltu	a5,a7,a000113c <__moddi3+0x15e>
a0001136:	00b7f363          	bgeu	a5,a1,a000113c <__moddi3+0x15e>
a000113a:	97c6                	add	a5,a5,a7
a000113c:	40b785b3          	sub	a1,a5,a1
a0001140:	02d5f7b3          	remu	a5,a1,a3
a0001144:	0542                	slli	a0,a0,0x10
a0001146:	8141                	srli	a0,a0,0x10
a0001148:	02d5d5b3          	divu	a1,a1,a3
a000114c:	07c2                	slli	a5,a5,0x10
a000114e:	8d5d                	or	a0,a0,a5
a0001150:	02b705b3          	mul	a1,a4,a1
a0001154:	00b57863          	bgeu	a0,a1,a0001164 <__moddi3+0x186>
a0001158:	9546                	add	a0,a0,a7
a000115a:	01156563          	bltu	a0,a7,a0001164 <__moddi3+0x186>
a000115e:	00b57363          	bgeu	a0,a1,a0001164 <__moddi3+0x186>
a0001162:	9546                	add	a0,a0,a7
a0001164:	8d0d                	sub	a0,a0,a1
a0001166:	b7b1                	j	a00010b2 <__moddi3+0xd4>
a0001168:	01000737          	lui	a4,0x1000
a000116c:	47c1                	li	a5,16
a000116e:	f8e8e2e3          	bltu	a7,a4,a00010f2 <__moddi3+0x114>
a0001172:	47e1                	li	a5,24
a0001174:	bfbd                	j	a00010f2 <__moddi3+0x114>
a0001176:	006898b3          	sll	a7,a7,t1
a000117a:	00d5d733          	srl	a4,a1,a3
a000117e:	0108d613          	srli	a2,a7,0x10
a0001182:	02c777b3          	remu	a5,a4,a2
a0001186:	006595b3          	sll	a1,a1,t1
a000118a:	00df56b3          	srl	a3,t5,a3
a000118e:	8ecd                	or	a3,a3,a1
a0001190:	01089593          	slli	a1,a7,0x10
a0001194:	81c1                	srli	a1,a1,0x10
a0001196:	0106de13          	srli	t3,a3,0x10
a000119a:	006f1533          	sll	a0,t5,t1
a000119e:	02c75733          	divu	a4,a4,a2
a00011a2:	07c2                	slli	a5,a5,0x10
a00011a4:	01c7e7b3          	or	a5,a5,t3
a00011a8:	02e58733          	mul	a4,a1,a4
a00011ac:	00e7f863          	bgeu	a5,a4,a00011bc <__moddi3+0x1de>
a00011b0:	97c6                	add	a5,a5,a7
a00011b2:	0117e563          	bltu	a5,a7,a00011bc <__moddi3+0x1de>
a00011b6:	00e7f363          	bgeu	a5,a4,a00011bc <__moddi3+0x1de>
a00011ba:	97c6                	add	a5,a5,a7
a00011bc:	40e78733          	sub	a4,a5,a4
a00011c0:	02c777b3          	remu	a5,a4,a2
a00011c4:	06c2                	slli	a3,a3,0x10
a00011c6:	82c1                	srli	a3,a3,0x10
a00011c8:	02c75733          	divu	a4,a4,a2
a00011cc:	07c2                	slli	a5,a5,0x10
a00011ce:	02e58733          	mul	a4,a1,a4
a00011d2:	00d7e5b3          	or	a1,a5,a3
a00011d6:	00e5f863          	bgeu	a1,a4,a00011e6 <__moddi3+0x208>
a00011da:	95c6                	add	a1,a1,a7
a00011dc:	0115e563          	bltu	a1,a7,a00011e6 <__moddi3+0x208>
a00011e0:	00e5f363          	bgeu	a1,a4,a00011e6 <__moddi3+0x208>
a00011e4:	95c6                	add	a1,a1,a7
a00011e6:	8d99                	sub	a1,a1,a4
a00011e8:	b71d                	j	a000110e <__moddi3+0x130>
a00011ea:	ecd5e7e3          	bltu	a1,a3,a00010b8 <__moddi3+0xda>
a00011ee:	67c1                	lui	a5,0x10
a00011f0:	04f6f463          	bgeu	a3,a5,a0001238 <__moddi3+0x25a>
a00011f4:	0ff00313          	li	t1,255
a00011f8:	00d337b3          	sltu	a5,t1,a3
a00011fc:	078e                	slli	a5,a5,0x3
a00011fe:	00f6d333          	srl	t1,a3,a5
a0001202:	0000b897          	auipc	a7,0xb
a0001206:	2f688893          	addi	a7,a7,758 # a000c4f8 <__clz_tab>
a000120a:	989a                	add	a7,a7,t1
a000120c:	0008c303          	lbu	t1,0(a7)
a0001210:	933e                	add	t1,t1,a5
a0001212:	02000793          	li	a5,32
a0001216:	406788b3          	sub	a7,a5,t1
a000121a:	02679663          	bne	a5,t1,a0001246 <__moddi3+0x268>
a000121e:	00b6e463          	bltu	a3,a1,a0001226 <__moddi3+0x248>
a0001222:	00cf6963          	bltu	t5,a2,a0001234 <__moddi3+0x256>
a0001226:	40cf0533          	sub	a0,t5,a2
a000122a:	8d95                	sub	a1,a1,a3
a000122c:	00af3733          	sltu	a4,t5,a0
a0001230:	40e58733          	sub	a4,a1,a4
a0001234:	85ba                	mv	a1,a4
a0001236:	b549                	j	a00010b8 <__moddi3+0xda>
a0001238:	010008b7          	lui	a7,0x1000
a000123c:	47c1                	li	a5,16
a000123e:	fd16e0e3          	bltu	a3,a7,a00011fe <__moddi3+0x220>
a0001242:	47e1                	li	a5,24
a0001244:	bf6d                	j	a00011fe <__moddi3+0x220>
a0001246:	006657b3          	srl	a5,a2,t1
a000124a:	011696b3          	sll	a3,a3,a7
a000124e:	8edd                	or	a3,a3,a5
a0001250:	0065de33          	srl	t3,a1,t1
a0001254:	006f57b3          	srl	a5,t5,t1
a0001258:	011f1533          	sll	a0,t5,a7
a000125c:	0106df13          	srli	t5,a3,0x10
a0001260:	01161eb3          	sll	t4,a2,a7
a0001264:	03ee7633          	remu	a2,t3,t5
a0001268:	011595b3          	sll	a1,a1,a7
a000126c:	8fcd                	or	a5,a5,a1
a000126e:	01069593          	slli	a1,a3,0x10
a0001272:	81c1                	srli	a1,a1,0x10
a0001274:	0107d713          	srli	a4,a5,0x10
a0001278:	03ee5e33          	divu	t3,t3,t5
a000127c:	0642                	slli	a2,a2,0x10
a000127e:	8f51                	or	a4,a4,a2
a0001280:	03c58fb3          	mul	t6,a1,t3
a0001284:	8672                	mv	a2,t3
a0001286:	01f77c63          	bgeu	a4,t6,a000129e <__moddi3+0x2c0>
a000128a:	9736                	add	a4,a4,a3
a000128c:	fffe0613          	addi	a2,t3,-1
a0001290:	00d76763          	bltu	a4,a3,a000129e <__moddi3+0x2c0>
a0001294:	01f77563          	bgeu	a4,t6,a000129e <__moddi3+0x2c0>
a0001298:	ffee0613          	addi	a2,t3,-2
a000129c:	9736                	add	a4,a4,a3
a000129e:	41f70733          	sub	a4,a4,t6
a00012a2:	03e77e33          	remu	t3,a4,t5
a00012a6:	07c2                	slli	a5,a5,0x10
a00012a8:	83c1                	srli	a5,a5,0x10
a00012aa:	03e75733          	divu	a4,a4,t5
a00012ae:	0e42                	slli	t3,t3,0x10
a00012b0:	00fe6e33          	or	t3,t3,a5
a00012b4:	02e585b3          	mul	a1,a1,a4
a00012b8:	87ba                	mv	a5,a4
a00012ba:	00be7c63          	bgeu	t3,a1,a00012d2 <__moddi3+0x2f4>
a00012be:	9e36                	add	t3,t3,a3
a00012c0:	fff70793          	addi	a5,a4,-1 # ffffff <nocache_min_size+0xffafff>
a00012c4:	00de6763          	bltu	t3,a3,a00012d2 <__moddi3+0x2f4>
a00012c8:	00be7563          	bgeu	t3,a1,a00012d2 <__moddi3+0x2f4>
a00012cc:	ffe70793          	addi	a5,a4,-2
a00012d0:	9e36                	add	t3,t3,a3
a00012d2:	0642                	slli	a2,a2,0x10
a00012d4:	6fc1                	lui	t6,0x10
a00012d6:	8e5d                	or	a2,a2,a5
a00012d8:	40be05b3          	sub	a1,t3,a1
a00012dc:	ffff8e13          	addi	t3,t6,-1 # ffff <nocache_min_size+0xafff>
a00012e0:	01c67f33          	and	t5,a2,t3
a00012e4:	010ed713          	srli	a4,t4,0x10
a00012e8:	8241                	srli	a2,a2,0x10
a00012ea:	01cefe33          	and	t3,t4,t3
a00012ee:	03cf07b3          	mul	a5,t5,t3
a00012f2:	03c60e33          	mul	t3,a2,t3
a00012f6:	02ef0f33          	mul	t5,t5,a4
a00012fa:	02e60633          	mul	a2,a2,a4
a00012fe:	9f72                	add	t5,t5,t3
a0001300:	0107d713          	srli	a4,a5,0x10
a0001304:	977a                	add	a4,a4,t5
a0001306:	01c77363          	bgeu	a4,t3,a000130c <__moddi3+0x32e>
a000130a:	967e                	add	a2,a2,t6
a000130c:	01075e13          	srli	t3,a4,0x10
a0001310:	9672                	add	a2,a2,t3
a0001312:	6e41                	lui	t3,0x10
a0001314:	1e7d                	addi	t3,t3,-1
a0001316:	01c77733          	and	a4,a4,t3
a000131a:	0742                	slli	a4,a4,0x10
a000131c:	01c7f7b3          	and	a5,a5,t3
a0001320:	97ba                	add	a5,a5,a4
a0001322:	00c5e663          	bltu	a1,a2,a000132e <__moddi3+0x350>
a0001326:	00c59b63          	bne	a1,a2,a000133c <__moddi3+0x35e>
a000132a:	00f57963          	bgeu	a0,a5,a000133c <__moddi3+0x35e>
a000132e:	41d78eb3          	sub	t4,a5,t4
a0001332:	01d7b7b3          	sltu	a5,a5,t4
a0001336:	97b6                	add	a5,a5,a3
a0001338:	8e1d                	sub	a2,a2,a5
a000133a:	87f6                	mv	a5,t4
a000133c:	40f507b3          	sub	a5,a0,a5
a0001340:	00f53533          	sltu	a0,a0,a5
a0001344:	8d91                	sub	a1,a1,a2
a0001346:	8d89                	sub	a1,a1,a0
a0001348:	00659333          	sll	t1,a1,t1
a000134c:	0117d533          	srl	a0,a5,a7
a0001350:	00a36533          	or	a0,t1,a0
a0001354:	0115d5b3          	srl	a1,a1,a7
a0001358:	b385                	j	a00010b8 <__moddi3+0xda>

a000135a <__udivdi3>:
a000135a:	88aa                	mv	a7,a0
a000135c:	87ae                	mv	a5,a1
a000135e:	8832                	mv	a6,a2
a0001360:	8536                	mv	a0,a3
a0001362:	8346                	mv	t1,a7
a0001364:	20069663          	bnez	a3,a0001570 <__udivdi3+0x216>
a0001368:	0000b697          	auipc	a3,0xb
a000136c:	19068693          	addi	a3,a3,400 # a000c4f8 <__clz_tab>
a0001370:	0ac5ff63          	bgeu	a1,a2,a000142e <__udivdi3+0xd4>
a0001374:	6741                	lui	a4,0x10
a0001376:	0ae67563          	bgeu	a2,a4,a0001420 <__udivdi3+0xc6>
a000137a:	0ff00713          	li	a4,255
a000137e:	00c73733          	sltu	a4,a4,a2
a0001382:	070e                	slli	a4,a4,0x3
a0001384:	00e65533          	srl	a0,a2,a4
a0001388:	96aa                	add	a3,a3,a0
a000138a:	0006c683          	lbu	a3,0(a3)
a000138e:	02000513          	li	a0,32
a0001392:	9736                	add	a4,a4,a3
a0001394:	40e506b3          	sub	a3,a0,a4
a0001398:	00e50b63          	beq	a0,a4,a00013ae <__udivdi3+0x54>
a000139c:	00d795b3          	sll	a1,a5,a3
a00013a0:	00e8d733          	srl	a4,a7,a4
a00013a4:	00d61833          	sll	a6,a2,a3
a00013a8:	8dd9                	or	a1,a1,a4
a00013aa:	00d89333          	sll	t1,a7,a3
a00013ae:	01085893          	srli	a7,a6,0x10
a00013b2:	0315d6b3          	divu	a3,a1,a7
a00013b6:	01081613          	slli	a2,a6,0x10
a00013ba:	8241                	srli	a2,a2,0x10
a00013bc:	01035793          	srli	a5,t1,0x10
a00013c0:	0315f733          	remu	a4,a1,a7
a00013c4:	8536                	mv	a0,a3
a00013c6:	02d605b3          	mul	a1,a2,a3
a00013ca:	0742                	slli	a4,a4,0x10
a00013cc:	8fd9                	or	a5,a5,a4
a00013ce:	00b7fc63          	bgeu	a5,a1,a00013e6 <__udivdi3+0x8c>
a00013d2:	97c2                	add	a5,a5,a6
a00013d4:	fff68513          	addi	a0,a3,-1
a00013d8:	0107e763          	bltu	a5,a6,a00013e6 <__udivdi3+0x8c>
a00013dc:	00b7f563          	bgeu	a5,a1,a00013e6 <__udivdi3+0x8c>
a00013e0:	ffe68513          	addi	a0,a3,-2
a00013e4:	97c2                	add	a5,a5,a6
a00013e6:	8f8d                	sub	a5,a5,a1
a00013e8:	0317f733          	remu	a4,a5,a7
a00013ec:	0342                	slli	t1,t1,0x10
a00013ee:	01035313          	srli	t1,t1,0x10
a00013f2:	0317d7b3          	divu	a5,a5,a7
a00013f6:	0742                	slli	a4,a4,0x10
a00013f8:	00676333          	or	t1,a4,t1
a00013fc:	02f606b3          	mul	a3,a2,a5
a0001400:	863e                	mv	a2,a5
a0001402:	00d37b63          	bgeu	t1,a3,a0001418 <__udivdi3+0xbe>
a0001406:	9342                	add	t1,t1,a6
a0001408:	fff78613          	addi	a2,a5,-1 # ffff <nocache_min_size+0xafff>
a000140c:	01036663          	bltu	t1,a6,a0001418 <__udivdi3+0xbe>
a0001410:	00d37463          	bgeu	t1,a3,a0001418 <__udivdi3+0xbe>
a0001414:	ffe78613          	addi	a2,a5,-2
a0001418:	0542                	slli	a0,a0,0x10
a000141a:	8d51                	or	a0,a0,a2
a000141c:	4581                	li	a1,0
a000141e:	a85d                	j	a00014d4 <__udivdi3+0x17a>
a0001420:	01000537          	lui	a0,0x1000
a0001424:	4741                	li	a4,16
a0001426:	f4a66fe3          	bltu	a2,a0,a0001384 <__udivdi3+0x2a>
a000142a:	4761                	li	a4,24
a000142c:	bfa1                	j	a0001384 <__udivdi3+0x2a>
a000142e:	e601                	bnez	a2,a0001436 <__udivdi3+0xdc>
a0001430:	4705                	li	a4,1
a0001432:	02c75833          	divu	a6,a4,a2
a0001436:	6741                	lui	a4,0x10
a0001438:	08e87f63          	bgeu	a6,a4,a00014d6 <__udivdi3+0x17c>
a000143c:	0ff00713          	li	a4,255
a0001440:	01077363          	bgeu	a4,a6,a0001446 <__udivdi3+0xec>
a0001444:	4521                	li	a0,8
a0001446:	00a85733          	srl	a4,a6,a0
a000144a:	96ba                	add	a3,a3,a4
a000144c:	0006c703          	lbu	a4,0(a3)
a0001450:	02000613          	li	a2,32
a0001454:	972a                	add	a4,a4,a0
a0001456:	40e606b3          	sub	a3,a2,a4
a000145a:	08e61563          	bne	a2,a4,a00014e4 <__udivdi3+0x18a>
a000145e:	410787b3          	sub	a5,a5,a6
a0001462:	4585                	li	a1,1
a0001464:	01085893          	srli	a7,a6,0x10
a0001468:	01081613          	slli	a2,a6,0x10
a000146c:	8241                	srli	a2,a2,0x10
a000146e:	01035713          	srli	a4,t1,0x10
a0001472:	0317f6b3          	remu	a3,a5,a7
a0001476:	0317d7b3          	divu	a5,a5,a7
a000147a:	06c2                	slli	a3,a3,0x10
a000147c:	8f55                	or	a4,a4,a3
a000147e:	02f60e33          	mul	t3,a2,a5
a0001482:	853e                	mv	a0,a5
a0001484:	01c77c63          	bgeu	a4,t3,a000149c <__udivdi3+0x142>
a0001488:	9742                	add	a4,a4,a6
a000148a:	fff78513          	addi	a0,a5,-1
a000148e:	01076763          	bltu	a4,a6,a000149c <__udivdi3+0x142>
a0001492:	01c77563          	bgeu	a4,t3,a000149c <__udivdi3+0x142>
a0001496:	ffe78513          	addi	a0,a5,-2
a000149a:	9742                	add	a4,a4,a6
a000149c:	41c70733          	sub	a4,a4,t3
a00014a0:	031777b3          	remu	a5,a4,a7
a00014a4:	0342                	slli	t1,t1,0x10
a00014a6:	01035313          	srli	t1,t1,0x10
a00014aa:	03175733          	divu	a4,a4,a7
a00014ae:	07c2                	slli	a5,a5,0x10
a00014b0:	0067e333          	or	t1,a5,t1
a00014b4:	02e606b3          	mul	a3,a2,a4
a00014b8:	863a                	mv	a2,a4
a00014ba:	00d37b63          	bgeu	t1,a3,a00014d0 <__udivdi3+0x176>
a00014be:	9342                	add	t1,t1,a6
a00014c0:	fff70613          	addi	a2,a4,-1 # ffff <nocache_min_size+0xafff>
a00014c4:	01036663          	bltu	t1,a6,a00014d0 <__udivdi3+0x176>
a00014c8:	00d37463          	bgeu	t1,a3,a00014d0 <__udivdi3+0x176>
a00014cc:	ffe70613          	addi	a2,a4,-2
a00014d0:	0542                	slli	a0,a0,0x10
a00014d2:	8d51                	or	a0,a0,a2
a00014d4:	8082                	ret
a00014d6:	01000737          	lui	a4,0x1000
a00014da:	4541                	li	a0,16
a00014dc:	f6e865e3          	bltu	a6,a4,a0001446 <__udivdi3+0xec>
a00014e0:	4561                	li	a0,24
a00014e2:	b795                	j	a0001446 <__udivdi3+0xec>
a00014e4:	00d81833          	sll	a6,a6,a3
a00014e8:	00e7d533          	srl	a0,a5,a4
a00014ec:	00d89333          	sll	t1,a7,a3
a00014f0:	00d797b3          	sll	a5,a5,a3
a00014f4:	00e8d733          	srl	a4,a7,a4
a00014f8:	01085893          	srli	a7,a6,0x10
a00014fc:	00f76633          	or	a2,a4,a5
a0001500:	03157733          	remu	a4,a0,a7
a0001504:	01081793          	slli	a5,a6,0x10
a0001508:	83c1                	srli	a5,a5,0x10
a000150a:	01065593          	srli	a1,a2,0x10
a000150e:	03155533          	divu	a0,a0,a7
a0001512:	0742                	slli	a4,a4,0x10
a0001514:	8f4d                	or	a4,a4,a1
a0001516:	02a786b3          	mul	a3,a5,a0
a000151a:	85aa                	mv	a1,a0
a000151c:	00d77c63          	bgeu	a4,a3,a0001534 <__udivdi3+0x1da>
a0001520:	9742                	add	a4,a4,a6
a0001522:	fff50593          	addi	a1,a0,-1 # ffffff <nocache_min_size+0xffafff>
a0001526:	01076763          	bltu	a4,a6,a0001534 <__udivdi3+0x1da>
a000152a:	00d77563          	bgeu	a4,a3,a0001534 <__udivdi3+0x1da>
a000152e:	ffe50593          	addi	a1,a0,-2
a0001532:	9742                	add	a4,a4,a6
a0001534:	40d706b3          	sub	a3,a4,a3
a0001538:	0316f733          	remu	a4,a3,a7
a000153c:	0642                	slli	a2,a2,0x10
a000153e:	8241                	srli	a2,a2,0x10
a0001540:	0316d6b3          	divu	a3,a3,a7
a0001544:	0742                	slli	a4,a4,0x10
a0001546:	02d78533          	mul	a0,a5,a3
a000154a:	00c767b3          	or	a5,a4,a2
a000154e:	8736                	mv	a4,a3
a0001550:	00a7fc63          	bgeu	a5,a0,a0001568 <__udivdi3+0x20e>
a0001554:	97c2                	add	a5,a5,a6
a0001556:	fff68713          	addi	a4,a3,-1
a000155a:	0107e763          	bltu	a5,a6,a0001568 <__udivdi3+0x20e>
a000155e:	00a7f563          	bgeu	a5,a0,a0001568 <__udivdi3+0x20e>
a0001562:	ffe68713          	addi	a4,a3,-2
a0001566:	97c2                	add	a5,a5,a6
a0001568:	05c2                	slli	a1,a1,0x10
a000156a:	8f89                	sub	a5,a5,a0
a000156c:	8dd9                	or	a1,a1,a4
a000156e:	bddd                	j	a0001464 <__udivdi3+0x10a>
a0001570:	14d5e263          	bltu	a1,a3,a00016b4 <__udivdi3+0x35a>
a0001574:	6741                	lui	a4,0x10
a0001576:	02e6ff63          	bgeu	a3,a4,a00015b4 <__udivdi3+0x25a>
a000157a:	0ff00713          	li	a4,255
a000157e:	00d735b3          	sltu	a1,a4,a3
a0001582:	058e                	slli	a1,a1,0x3
a0001584:	00b6d533          	srl	a0,a3,a1
a0001588:	0000b717          	auipc	a4,0xb
a000158c:	f7070713          	addi	a4,a4,-144 # a000c4f8 <__clz_tab>
a0001590:	972a                	add	a4,a4,a0
a0001592:	00074703          	lbu	a4,0(a4)
a0001596:	02000513          	li	a0,32
a000159a:	972e                	add	a4,a4,a1
a000159c:	40e505b3          	sub	a1,a0,a4
a00015a0:	02e51163          	bne	a0,a4,a00015c2 <__udivdi3+0x268>
a00015a4:	4505                	li	a0,1
a00015a6:	f2f6e7e3          	bltu	a3,a5,a00014d4 <__udivdi3+0x17a>
a00015aa:	00c8b533          	sltu	a0,a7,a2
a00015ae:	00154513          	xori	a0,a0,1
a00015b2:	b70d                	j	a00014d4 <__udivdi3+0x17a>
a00015b4:	01000737          	lui	a4,0x1000
a00015b8:	45c1                	li	a1,16
a00015ba:	fce6e5e3          	bltu	a3,a4,a0001584 <__udivdi3+0x22a>
a00015be:	45e1                	li	a1,24
a00015c0:	b7d1                	j	a0001584 <__udivdi3+0x22a>
a00015c2:	00e65833          	srl	a6,a2,a4
a00015c6:	00b696b3          	sll	a3,a3,a1
a00015ca:	00d86833          	or	a6,a6,a3
a00015ce:	00e7d333          	srl	t1,a5,a4
a00015d2:	01085e93          	srli	t4,a6,0x10
a00015d6:	03d376b3          	remu	a3,t1,t4
a00015da:	00b797b3          	sll	a5,a5,a1
a00015de:	00e8d733          	srl	a4,a7,a4
a00015e2:	00b61e33          	sll	t3,a2,a1
a00015e6:	00f76633          	or	a2,a4,a5
a00015ea:	01081793          	slli	a5,a6,0x10
a00015ee:	83c1                	srli	a5,a5,0x10
a00015f0:	01065713          	srli	a4,a2,0x10
a00015f4:	03d35333          	divu	t1,t1,t4
a00015f8:	06c2                	slli	a3,a3,0x10
a00015fa:	8f55                	or	a4,a4,a3
a00015fc:	02678f33          	mul	t5,a5,t1
a0001600:	851a                	mv	a0,t1
a0001602:	01e77c63          	bgeu	a4,t5,a000161a <__udivdi3+0x2c0>
a0001606:	9742                	add	a4,a4,a6
a0001608:	fff30513          	addi	a0,t1,-1 # ffffff <nocache_min_size+0xffafff>
a000160c:	01076763          	bltu	a4,a6,a000161a <__udivdi3+0x2c0>
a0001610:	01e77563          	bgeu	a4,t5,a000161a <__udivdi3+0x2c0>
a0001614:	ffe30513          	addi	a0,t1,-2
a0001618:	9742                	add	a4,a4,a6
a000161a:	41e70733          	sub	a4,a4,t5
a000161e:	03d776b3          	remu	a3,a4,t4
a0001622:	03d75733          	divu	a4,a4,t4
a0001626:	06c2                	slli	a3,a3,0x10
a0001628:	02e78333          	mul	t1,a5,a4
a000162c:	01061793          	slli	a5,a2,0x10
a0001630:	83c1                	srli	a5,a5,0x10
a0001632:	8fd5                	or	a5,a5,a3
a0001634:	863a                	mv	a2,a4
a0001636:	0067fc63          	bgeu	a5,t1,a000164e <__udivdi3+0x2f4>
a000163a:	97c2                	add	a5,a5,a6
a000163c:	fff70613          	addi	a2,a4,-1 # ffffff <nocache_min_size+0xffafff>
a0001640:	0107e763          	bltu	a5,a6,a000164e <__udivdi3+0x2f4>
a0001644:	0067f563          	bgeu	a5,t1,a000164e <__udivdi3+0x2f4>
a0001648:	ffe70613          	addi	a2,a4,-2
a000164c:	97c2                	add	a5,a5,a6
a000164e:	0542                	slli	a0,a0,0x10
a0001650:	6ec1                	lui	t4,0x10
a0001652:	8d51                	or	a0,a0,a2
a0001654:	fffe8693          	addi	a3,t4,-1 # ffff <nocache_min_size+0xafff>
a0001658:	010e5613          	srli	a2,t3,0x10
a000165c:	01055813          	srli	a6,a0,0x10
a0001660:	406787b3          	sub	a5,a5,t1
a0001664:	00d57333          	and	t1,a0,a3
a0001668:	00de76b3          	and	a3,t3,a3
a000166c:	02d30e33          	mul	t3,t1,a3
a0001670:	02d806b3          	mul	a3,a6,a3
a0001674:	010e5713          	srli	a4,t3,0x10
a0001678:	02c30333          	mul	t1,t1,a2
a000167c:	9336                	add	t1,t1,a3
a000167e:	971a                	add	a4,a4,t1
a0001680:	02c80833          	mul	a6,a6,a2
a0001684:	00d77363          	bgeu	a4,a3,a000168a <__udivdi3+0x330>
a0001688:	9876                	add	a6,a6,t4
a000168a:	01075693          	srli	a3,a4,0x10
a000168e:	9836                	add	a6,a6,a3
a0001690:	0307e063          	bltu	a5,a6,a00016b0 <__udivdi3+0x356>
a0001694:	d90794e3          	bne	a5,a6,a000141c <__udivdi3+0xc2>
a0001698:	67c1                	lui	a5,0x10
a000169a:	17fd                	addi	a5,a5,-1
a000169c:	8f7d                	and	a4,a4,a5
a000169e:	0742                	slli	a4,a4,0x10
a00016a0:	00fe7e33          	and	t3,t3,a5
a00016a4:	00b898b3          	sll	a7,a7,a1
a00016a8:	9772                	add	a4,a4,t3
a00016aa:	4581                	li	a1,0
a00016ac:	e2e8f4e3          	bgeu	a7,a4,a00014d4 <__udivdi3+0x17a>
a00016b0:	157d                	addi	a0,a0,-1
a00016b2:	b3ad                	j	a000141c <__udivdi3+0xc2>
a00016b4:	4581                	li	a1,0
a00016b6:	4501                	li	a0,0
a00016b8:	bd31                	j	a00014d4 <__udivdi3+0x17a>

a00016ba <__umoddi3>:
a00016ba:	832a                	mv	t1,a0
a00016bc:	8832                	mv	a6,a2
a00016be:	87b6                	mv	a5,a3
a00016c0:	872e                	mv	a4,a1
a00016c2:	1c069563          	bnez	a3,a000188c <__umoddi3+0x1d2>
a00016c6:	0000b697          	auipc	a3,0xb
a00016ca:	e3268693          	addi	a3,a3,-462 # a000c4f8 <__clz_tab>
a00016ce:	0ac5f663          	bgeu	a1,a2,a000177a <__umoddi3+0xc0>
a00016d2:	68c1                	lui	a7,0x10
a00016d4:	09167c63          	bgeu	a2,a7,a000176c <__umoddi3+0xb2>
a00016d8:	0ff00893          	li	a7,255
a00016dc:	00c8f363          	bgeu	a7,a2,a00016e2 <__umoddi3+0x28>
a00016e0:	47a1                	li	a5,8
a00016e2:	00f658b3          	srl	a7,a2,a5
a00016e6:	96c6                	add	a3,a3,a7
a00016e8:	0006c683          	lbu	a3,0(a3)
a00016ec:	97b6                	add	a5,a5,a3
a00016ee:	02000693          	li	a3,32
a00016f2:	40f688b3          	sub	a7,a3,a5
a00016f6:	00f68c63          	beq	a3,a5,a000170e <__umoddi3+0x54>
a00016fa:	011595b3          	sll	a1,a1,a7
a00016fe:	00f357b3          	srl	a5,t1,a5
a0001702:	01161833          	sll	a6,a2,a7
a0001706:	00b7e733          	or	a4,a5,a1
a000170a:	01131533          	sll	a0,t1,a7
a000170e:	01085593          	srli	a1,a6,0x10
a0001712:	02b777b3          	remu	a5,a4,a1
a0001716:	01081613          	slli	a2,a6,0x10
a000171a:	8241                	srli	a2,a2,0x10
a000171c:	01055693          	srli	a3,a0,0x10
a0001720:	02b75733          	divu	a4,a4,a1
a0001724:	07c2                	slli	a5,a5,0x10
a0001726:	8edd                	or	a3,a3,a5
a0001728:	02e60733          	mul	a4,a2,a4
a000172c:	00e6f863          	bgeu	a3,a4,a000173c <__umoddi3+0x82>
a0001730:	96c2                	add	a3,a3,a6
a0001732:	0106e563          	bltu	a3,a6,a000173c <__umoddi3+0x82>
a0001736:	00e6f363          	bgeu	a3,a4,a000173c <__umoddi3+0x82>
a000173a:	96c2                	add	a3,a3,a6
a000173c:	8e99                	sub	a3,a3,a4
a000173e:	02b6f7b3          	remu	a5,a3,a1
a0001742:	0542                	slli	a0,a0,0x10
a0001744:	8141                	srli	a0,a0,0x10
a0001746:	02b6d6b3          	divu	a3,a3,a1
a000174a:	07c2                	slli	a5,a5,0x10
a000174c:	8d5d                	or	a0,a0,a5
a000174e:	02d606b3          	mul	a3,a2,a3
a0001752:	00d57863          	bgeu	a0,a3,a0001762 <__umoddi3+0xa8>
a0001756:	9542                	add	a0,a0,a6
a0001758:	01056563          	bltu	a0,a6,a0001762 <__umoddi3+0xa8>
a000175c:	00d57363          	bgeu	a0,a3,a0001762 <__umoddi3+0xa8>
a0001760:	9542                	add	a0,a0,a6
a0001762:	8d15                	sub	a0,a0,a3
a0001764:	01155533          	srl	a0,a0,a7
a0001768:	4581                	li	a1,0
a000176a:	8082                	ret
a000176c:	010008b7          	lui	a7,0x1000
a0001770:	47c1                	li	a5,16
a0001772:	f71668e3          	bltu	a2,a7,a00016e2 <__umoddi3+0x28>
a0001776:	47e1                	li	a5,24
a0001778:	b7ad                	j	a00016e2 <__umoddi3+0x28>
a000177a:	e601                	bnez	a2,a0001782 <__umoddi3+0xc8>
a000177c:	4705                	li	a4,1
a000177e:	02c75833          	divu	a6,a4,a2
a0001782:	6741                	lui	a4,0x10
a0001784:	08e87363          	bgeu	a6,a4,a000180a <__umoddi3+0x150>
a0001788:	0ff00713          	li	a4,255
a000178c:	01077363          	bgeu	a4,a6,a0001792 <__umoddi3+0xd8>
a0001790:	47a1                	li	a5,8
a0001792:	00f85733          	srl	a4,a6,a5
a0001796:	96ba                	add	a3,a3,a4
a0001798:	0006c603          	lbu	a2,0(a3)
a000179c:	963e                	add	a2,a2,a5
a000179e:	02000793          	li	a5,32
a00017a2:	40c788b3          	sub	a7,a5,a2
a00017a6:	06c79963          	bne	a5,a2,a0001818 <__umoddi3+0x15e>
a00017aa:	410585b3          	sub	a1,a1,a6
a00017ae:	01085693          	srli	a3,a6,0x10
a00017b2:	01081793          	slli	a5,a6,0x10
a00017b6:	83c1                	srli	a5,a5,0x10
a00017b8:	01055613          	srli	a2,a0,0x10
a00017bc:	02d5f733          	remu	a4,a1,a3
a00017c0:	02d5d5b3          	divu	a1,a1,a3
a00017c4:	0742                	slli	a4,a4,0x10
a00017c6:	8f51                	or	a4,a4,a2
a00017c8:	02b785b3          	mul	a1,a5,a1
a00017cc:	00b77863          	bgeu	a4,a1,a00017dc <__umoddi3+0x122>
a00017d0:	9742                	add	a4,a4,a6
a00017d2:	01076563          	bltu	a4,a6,a00017dc <__umoddi3+0x122>
a00017d6:	00b77363          	bgeu	a4,a1,a00017dc <__umoddi3+0x122>
a00017da:	9742                	add	a4,a4,a6
a00017dc:	40b705b3          	sub	a1,a4,a1
a00017e0:	02d5f733          	remu	a4,a1,a3
a00017e4:	0542                	slli	a0,a0,0x10
a00017e6:	8141                	srli	a0,a0,0x10
a00017e8:	02d5d5b3          	divu	a1,a1,a3
a00017ec:	02b785b3          	mul	a1,a5,a1
a00017f0:	01071793          	slli	a5,a4,0x10
a00017f4:	8d5d                	or	a0,a0,a5
a00017f6:	00b57863          	bgeu	a0,a1,a0001806 <__umoddi3+0x14c>
a00017fa:	9542                	add	a0,a0,a6
a00017fc:	01056563          	bltu	a0,a6,a0001806 <__umoddi3+0x14c>
a0001800:	00b57363          	bgeu	a0,a1,a0001806 <__umoddi3+0x14c>
a0001804:	9542                	add	a0,a0,a6
a0001806:	8d0d                	sub	a0,a0,a1
a0001808:	bfb1                	j	a0001764 <__umoddi3+0xaa>
a000180a:	01000737          	lui	a4,0x1000
a000180e:	47c1                	li	a5,16
a0001810:	f8e861e3          	bltu	a6,a4,a0001792 <__umoddi3+0xd8>
a0001814:	47e1                	li	a5,24
a0001816:	bfb5                	j	a0001792 <__umoddi3+0xd8>
a0001818:	01181833          	sll	a6,a6,a7
a000181c:	00c5d6b3          	srl	a3,a1,a2
a0001820:	01085793          	srli	a5,a6,0x10
a0001824:	02f6f733          	remu	a4,a3,a5
a0001828:	011595b3          	sll	a1,a1,a7
a000182c:	00c35633          	srl	a2,t1,a2
a0001830:	8e4d                	or	a2,a2,a1
a0001832:	01081593          	slli	a1,a6,0x10
a0001836:	81c1                	srli	a1,a1,0x10
a0001838:	01131533          	sll	a0,t1,a7
a000183c:	01065313          	srli	t1,a2,0x10
a0001840:	02f6d6b3          	divu	a3,a3,a5
a0001844:	0742                	slli	a4,a4,0x10
a0001846:	00676733          	or	a4,a4,t1
a000184a:	02d586b3          	mul	a3,a1,a3
a000184e:	00d77863          	bgeu	a4,a3,a000185e <__umoddi3+0x1a4>
a0001852:	9742                	add	a4,a4,a6
a0001854:	01076563          	bltu	a4,a6,a000185e <__umoddi3+0x1a4>
a0001858:	00d77363          	bgeu	a4,a3,a000185e <__umoddi3+0x1a4>
a000185c:	9742                	add	a4,a4,a6
a000185e:	40d706b3          	sub	a3,a4,a3
a0001862:	02f6f733          	remu	a4,a3,a5
a0001866:	0642                	slli	a2,a2,0x10
a0001868:	8241                	srli	a2,a2,0x10
a000186a:	02f6d6b3          	divu	a3,a3,a5
a000186e:	0742                	slli	a4,a4,0x10
a0001870:	02d586b3          	mul	a3,a1,a3
a0001874:	00c765b3          	or	a1,a4,a2
a0001878:	00d5f863          	bgeu	a1,a3,a0001888 <__umoddi3+0x1ce>
a000187c:	95c2                	add	a1,a1,a6
a000187e:	0105e563          	bltu	a1,a6,a0001888 <__umoddi3+0x1ce>
a0001882:	00d5f363          	bgeu	a1,a3,a0001888 <__umoddi3+0x1ce>
a0001886:	95c2                	add	a1,a1,a6
a0001888:	8d95                	sub	a1,a1,a3
a000188a:	b715                	j	a00017ae <__umoddi3+0xf4>
a000188c:	ecd5efe3          	bltu	a1,a3,a000176a <__umoddi3+0xb0>
a0001890:	67c1                	lui	a5,0x10
a0001892:	04f6f463          	bgeu	a3,a5,a00018da <__umoddi3+0x220>
a0001896:	0ff00893          	li	a7,255
a000189a:	00d8b7b3          	sltu	a5,a7,a3
a000189e:	078e                	slli	a5,a5,0x3
a00018a0:	00f6d8b3          	srl	a7,a3,a5
a00018a4:	0000b817          	auipc	a6,0xb
a00018a8:	c5480813          	addi	a6,a6,-940 # a000c4f8 <__clz_tab>
a00018ac:	9846                	add	a6,a6,a7
a00018ae:	00084883          	lbu	a7,0(a6)
a00018b2:	98be                	add	a7,a7,a5
a00018b4:	02000793          	li	a5,32
a00018b8:	41178833          	sub	a6,a5,a7
a00018bc:	03179663          	bne	a5,a7,a00018e8 <__umoddi3+0x22e>
a00018c0:	00b6e463          	bltu	a3,a1,a00018c8 <__umoddi3+0x20e>
a00018c4:	00c36963          	bltu	t1,a2,a00018d6 <__umoddi3+0x21c>
a00018c8:	40c30533          	sub	a0,t1,a2
a00018cc:	8d95                	sub	a1,a1,a3
a00018ce:	00a33733          	sltu	a4,t1,a0
a00018d2:	40e58733          	sub	a4,a1,a4
a00018d6:	85ba                	mv	a1,a4
a00018d8:	bd49                	j	a000176a <__umoddi3+0xb0>
a00018da:	01000837          	lui	a6,0x1000
a00018de:	47c1                	li	a5,16
a00018e0:	fd06e0e3          	bltu	a3,a6,a00018a0 <__umoddi3+0x1e6>
a00018e4:	47e1                	li	a5,24
a00018e6:	bf6d                	j	a00018a0 <__umoddi3+0x1e6>
a00018e8:	011657b3          	srl	a5,a2,a7
a00018ec:	010696b3          	sll	a3,a3,a6
a00018f0:	00d7ee33          	or	t3,a5,a3
a00018f4:	0115d733          	srl	a4,a1,a7
a00018f8:	010e5f13          	srli	t5,t3,0x10
a00018fc:	01061eb3          	sll	t4,a2,a6
a0001900:	03e77633          	remu	a2,a4,t5
a0001904:	010595b3          	sll	a1,a1,a6
a0001908:	011357b3          	srl	a5,t1,a7
a000190c:	8fcd                	or	a5,a5,a1
a000190e:	010e1593          	slli	a1,t3,0x10
a0001912:	81c1                	srli	a1,a1,0x10
a0001914:	01031533          	sll	a0,t1,a6
a0001918:	0107d693          	srli	a3,a5,0x10
a000191c:	03e75733          	divu	a4,a4,t5
a0001920:	0642                	slli	a2,a2,0x10
a0001922:	8ed1                	or	a3,a3,a2
a0001924:	02e58333          	mul	t1,a1,a4
a0001928:	863a                	mv	a2,a4
a000192a:	0066fc63          	bgeu	a3,t1,a0001942 <__umoddi3+0x288>
a000192e:	96f2                	add	a3,a3,t3
a0001930:	fff70613          	addi	a2,a4,-1 # ffffff <nocache_min_size+0xffafff>
a0001934:	01c6e763          	bltu	a3,t3,a0001942 <__umoddi3+0x288>
a0001938:	0066f563          	bgeu	a3,t1,a0001942 <__umoddi3+0x288>
a000193c:	ffe70613          	addi	a2,a4,-2
a0001940:	96f2                	add	a3,a3,t3
a0001942:	406686b3          	sub	a3,a3,t1
a0001946:	03e6f333          	remu	t1,a3,t5
a000194a:	03e6d6b3          	divu	a3,a3,t5
a000194e:	0342                	slli	t1,t1,0x10
a0001950:	02d58733          	mul	a4,a1,a3
a0001954:	01079593          	slli	a1,a5,0x10
a0001958:	81c1                	srli	a1,a1,0x10
a000195a:	00b365b3          	or	a1,t1,a1
a000195e:	87b6                	mv	a5,a3
a0001960:	00e5fc63          	bgeu	a1,a4,a0001978 <__umoddi3+0x2be>
a0001964:	95f2                	add	a1,a1,t3
a0001966:	fff68793          	addi	a5,a3,-1
a000196a:	01c5e763          	bltu	a1,t3,a0001978 <__umoddi3+0x2be>
a000196e:	00e5f563          	bgeu	a1,a4,a0001978 <__umoddi3+0x2be>
a0001972:	ffe68793          	addi	a5,a3,-2
a0001976:	95f2                	add	a1,a1,t3
a0001978:	0642                	slli	a2,a2,0x10
a000197a:	6f41                	lui	t5,0x10
a000197c:	8e5d                	or	a2,a2,a5
a000197e:	ffff0693          	addi	a3,t5,-1 # ffff <nocache_min_size+0xafff>
a0001982:	00d67333          	and	t1,a2,a3
a0001986:	8d99                	sub	a1,a1,a4
a0001988:	8241                	srli	a2,a2,0x10
a000198a:	010ed713          	srli	a4,t4,0x10
a000198e:	00def6b3          	and	a3,t4,a3
a0001992:	02d307b3          	mul	a5,t1,a3
a0001996:	02d606b3          	mul	a3,a2,a3
a000199a:	02e30333          	mul	t1,t1,a4
a000199e:	02e60633          	mul	a2,a2,a4
a00019a2:	9336                	add	t1,t1,a3
a00019a4:	0107d713          	srli	a4,a5,0x10
a00019a8:	971a                	add	a4,a4,t1
a00019aa:	00d77363          	bgeu	a4,a3,a00019b0 <__umoddi3+0x2f6>
a00019ae:	967a                	add	a2,a2,t5
a00019b0:	01075693          	srli	a3,a4,0x10
a00019b4:	96b2                	add	a3,a3,a2
a00019b6:	6641                	lui	a2,0x10
a00019b8:	167d                	addi	a2,a2,-1
a00019ba:	8f71                	and	a4,a4,a2
a00019bc:	0742                	slli	a4,a4,0x10
a00019be:	8ff1                	and	a5,a5,a2
a00019c0:	97ba                	add	a5,a5,a4
a00019c2:	00d5e663          	bltu	a1,a3,a00019ce <__umoddi3+0x314>
a00019c6:	00d59b63          	bne	a1,a3,a00019dc <__umoddi3+0x322>
a00019ca:	00f57963          	bgeu	a0,a5,a00019dc <__umoddi3+0x322>
a00019ce:	41d78633          	sub	a2,a5,t4
a00019d2:	00c7b7b3          	sltu	a5,a5,a2
a00019d6:	97f2                	add	a5,a5,t3
a00019d8:	8e9d                	sub	a3,a3,a5
a00019da:	87b2                	mv	a5,a2
a00019dc:	40f507b3          	sub	a5,a0,a5
a00019e0:	00f53533          	sltu	a0,a0,a5
a00019e4:	8d95                	sub	a1,a1,a3
a00019e6:	8d89                	sub	a1,a1,a0
a00019e8:	011598b3          	sll	a7,a1,a7
a00019ec:	0107d533          	srl	a0,a5,a6
a00019f0:	00a8e533          	or	a0,a7,a0
a00019f4:	0105d5b3          	srl	a1,a1,a6
a00019f8:	bb8d                	j	a000176a <__umoddi3+0xb0>

a00019fa <__adddf3>:
a00019fa:	1101                	addi	sp,sp,-32
a00019fc:	ce06                	sw	ra,28(sp)
a00019fe:	cc22                	sw	s0,24(sp)
a0001a00:	ca26                	sw	s1,20(sp)
a0001a02:	c84a                	sw	s2,16(sp)
a0001a04:	c64e                	sw	s3,12(sp)
a0001a06:	c452                	sw	s4,8(sp)
a0001a08:	002029f3          	frrm	s3
a0001a0c:	001008b7          	lui	a7,0x100
a0001a10:	18fd                	addi	a7,a7,-1
a0001a12:	00b8f733          	and	a4,a7,a1
a0001a16:	0145d413          	srli	s0,a1,0x14
a0001a1a:	01f5d493          	srli	s1,a1,0x1f
a0001a1e:	0146d593          	srli	a1,a3,0x14
a0001a22:	00371793          	slli	a5,a4,0x3
a0001a26:	00d8f8b3          	and	a7,a7,a3
a0001a2a:	01d55713          	srli	a4,a0,0x1d
a0001a2e:	7ff47413          	andi	s0,s0,2047
a0001a32:	7ff5f593          	andi	a1,a1,2047
a0001a36:	8f5d                	or	a4,a4,a5
a0001a38:	01f6d313          	srli	t1,a3,0x1f
a0001a3c:	00351793          	slli	a5,a0,0x3
a0001a40:	01d65693          	srli	a3,a2,0x1d
a0001a44:	088e                	slli	a7,a7,0x3
a0001a46:	40b40533          	sub	a0,s0,a1
a0001a4a:	00361813          	slli	a6,a2,0x3
a0001a4e:	0116e6b3          	or	a3,a3,a7
a0001a52:	862a                	mv	a2,a0
a0001a54:	34649563          	bne	s1,t1,a0001d9e <__adddf3+0x3a4>
a0001a58:	10a05a63          	blez	a0,a0001b6c <__adddf3+0x172>
a0001a5c:	04059463          	bnez	a1,a0001aa4 <__adddf3+0xaa>
a0001a60:	0106e533          	or	a0,a3,a6
a0001a64:	e511                	bnez	a0,a0001a70 <__adddf3+0x76>
a0001a66:	7ff00693          	li	a3,2047
a0001a6a:	2ad61c63          	bne	a2,a3,a0001d22 <__adddf3+0x328>
a0001a6e:	a839                	j	a0001a8c <__adddf3+0x92>
a0001a70:	fff60513          	addi	a0,a2,-1 # ffff <nocache_min_size+0xafff>
a0001a74:	e901                	bnez	a0,a0001a84 <__adddf3+0x8a>
a0001a76:	983e                	add	a6,a6,a5
a0001a78:	96ba                	add	a3,a3,a4
a0001a7a:	00f837b3          	sltu	a5,a6,a5
a0001a7e:	96be                	add	a3,a3,a5
a0001a80:	4605                	li	a2,1
a0001a82:	a059                	j	a0001b08 <__adddf3+0x10e>
a0001a84:	7ff00893          	li	a7,2047
a0001a88:	05161163          	bne	a2,a7,a0001aca <__adddf3+0xd0>
a0001a8c:	00f766b3          	or	a3,a4,a5
a0001a90:	70068063          	beqz	a3,a0002190 <__adddf3+0x796>
a0001a94:	004006b7          	lui	a3,0x400
a0001a98:	8ef9                	and	a3,a3,a4
a0001a9a:	4401                	li	s0,0
a0001a9c:	20069263          	bnez	a3,a0001ca0 <__adddf3+0x2a6>
a0001aa0:	45c1                	li	a1,16
a0001aa2:	aafd                	j	a0001ca0 <__adddf3+0x2a6>
a0001aa4:	7ff00613          	li	a2,2047
a0001aa8:	00c41e63          	bne	s0,a2,a0001ac4 <__adddf3+0xca>
a0001aac:	00f766b3          	or	a3,a4,a5
a0001ab0:	6e068363          	beqz	a3,a0002196 <__adddf3+0x79c>
a0001ab4:	004006b7          	lui	a3,0x400
a0001ab8:	8ef9                	and	a3,a3,a4
a0001aba:	12068563          	beqz	a3,a0001be4 <__adddf3+0x1ea>
a0001abe:	7ff00613          	li	a2,2047
a0001ac2:	a485                	j	a0001d22 <__adddf3+0x328>
a0001ac4:	00800637          	lui	a2,0x800
a0001ac8:	8ed1                	or	a3,a3,a2
a0001aca:	03800613          	li	a2,56
a0001ace:	08a64a63          	blt	a2,a0,a0001b62 <__adddf3+0x168>
a0001ad2:	467d                	li	a2,31
a0001ad4:	06a64063          	blt	a2,a0,a0001b34 <__adddf3+0x13a>
a0001ad8:	02000613          	li	a2,32
a0001adc:	8e09                	sub	a2,a2,a0
a0001ade:	00a858b3          	srl	a7,a6,a0
a0001ae2:	00c695b3          	sll	a1,a3,a2
a0001ae6:	00c81833          	sll	a6,a6,a2
a0001aea:	0115e5b3          	or	a1,a1,a7
a0001aee:	01003833          	snez	a6,a6
a0001af2:	0105e833          	or	a6,a1,a6
a0001af6:	00a6d533          	srl	a0,a3,a0
a0001afa:	983e                	add	a6,a6,a5
a0001afc:	953a                	add	a0,a0,a4
a0001afe:	00f837b3          	sltu	a5,a6,a5
a0001b02:	00f506b3          	add	a3,a0,a5
a0001b06:	8622                	mv	a2,s0
a0001b08:	008007b7          	lui	a5,0x800
a0001b0c:	8ff5                	and	a5,a5,a3
a0001b0e:	cbb5                	beqz	a5,a0001b82 <__adddf3+0x188>
a0001b10:	0605                	addi	a2,a2,1
a0001b12:	7ff00793          	li	a5,2047
a0001b16:	26f60363          	beq	a2,a5,a0001d7c <__adddf3+0x382>
a0001b1a:	ff800737          	lui	a4,0xff800
a0001b1e:	177d                	addi	a4,a4,-1
a0001b20:	00185793          	srli	a5,a6,0x1
a0001b24:	8f75                	and	a4,a4,a3
a0001b26:	00187813          	andi	a6,a6,1
a0001b2a:	0107e833          	or	a6,a5,a6
a0001b2e:	01f71793          	slli	a5,a4,0x1f
a0001b32:	a2ed                	j	a0001d1c <__adddf3+0x322>
a0001b34:	fe050593          	addi	a1,a0,-32
a0001b38:	02000893          	li	a7,32
a0001b3c:	00b6d5b3          	srl	a1,a3,a1
a0001b40:	4601                	li	a2,0
a0001b42:	01150863          	beq	a0,a7,a0001b52 <__adddf3+0x158>
a0001b46:	04000613          	li	a2,64
a0001b4a:	40a60533          	sub	a0,a2,a0
a0001b4e:	00a69633          	sll	a2,a3,a0
a0001b52:	01066833          	or	a6,a2,a6
a0001b56:	01003833          	snez	a6,a6
a0001b5a:	0105e833          	or	a6,a1,a6
a0001b5e:	4501                	li	a0,0
a0001b60:	bf69                	j	a0001afa <__adddf3+0x100>
a0001b62:	0106e833          	or	a6,a3,a6
a0001b66:	01003833          	snez	a6,a6
a0001b6a:	bfd5                	j	a0001b5e <__adddf3+0x164>
a0001b6c:	c97d                	beqz	a0,a0001c62 <__adddf3+0x268>
a0001b6e:	40858633          	sub	a2,a1,s0
a0001b72:	e821                	bnez	s0,a0001bc2 <__adddf3+0x1c8>
a0001b74:	00f76533          	or	a0,a4,a5
a0001b78:	e911                	bnez	a0,a0001b8c <__adddf3+0x192>
a0001b7a:	7ff00793          	li	a5,2047
a0001b7e:	02f60663          	beq	a2,a5,a0001baa <__adddf3+0x1b0>
a0001b82:	8736                	mv	a4,a3
a0001b84:	87c2                	mv	a5,a6
a0001b86:	40060563          	beqz	a2,a0001f90 <__adddf3+0x596>
a0001b8a:	aa61                	j	a0001d22 <__adddf3+0x328>
a0001b8c:	fff60893          	addi	a7,a2,-1 # 7fffff <nocache_min_size+0x7fafff>
a0001b90:	00089963          	bnez	a7,a0001ba2 <__adddf3+0x1a8>
a0001b94:	97c2                	add	a5,a5,a6
a0001b96:	0107b833          	sltu	a6,a5,a6
a0001b9a:	96ba                	add	a3,a3,a4
a0001b9c:	96c2                	add	a3,a3,a6
a0001b9e:	883e                	mv	a6,a5
a0001ba0:	b5c5                	j	a0001a80 <__adddf3+0x86>
a0001ba2:	7ff00513          	li	a0,2047
a0001ba6:	04a61563          	bne	a2,a0,a0001bf0 <__adddf3+0x1f6>
a0001baa:	0106e7b3          	or	a5,a3,a6
a0001bae:	5e078763          	beqz	a5,a000219c <__adddf3+0x7a2>
a0001bb2:	004007b7          	lui	a5,0x400
a0001bb6:	8ff5                	and	a5,a5,a3
a0001bb8:	8736                	mv	a4,a3
a0001bba:	5e079363          	bnez	a5,a00021a0 <__adddf3+0x7a6>
a0001bbe:	87c2                	mv	a5,a6
a0001bc0:	b5c5                	j	a0001aa0 <__adddf3+0xa6>
a0001bc2:	7ff00513          	li	a0,2047
a0001bc6:	02a59163          	bne	a1,a0,a0001be8 <__adddf3+0x1ee>
a0001bca:	0106e7b3          	or	a5,a3,a6
a0001bce:	5a078463          	beqz	a5,a0002176 <__adddf3+0x77c>
a0001bd2:	004007b7          	lui	a5,0x400
a0001bd6:	8ff5                	and	a5,a5,a3
a0001bd8:	8736                	mv	a4,a3
a0001bda:	5a079363          	bnez	a5,a0002180 <__adddf3+0x786>
a0001bde:	87c2                	mv	a5,a6
a0001be0:	7ff00613          	li	a2,2047
a0001be4:	4401                	li	s0,0
a0001be6:	bd6d                	j	a0001aa0 <__adddf3+0xa6>
a0001be8:	00800537          	lui	a0,0x800
a0001bec:	8f49                	or	a4,a4,a0
a0001bee:	88b2                	mv	a7,a2
a0001bf0:	03800613          	li	a2,56
a0001bf4:	07164363          	blt	a2,a7,a0001c5a <__adddf3+0x260>
a0001bf8:	467d                	li	a2,31
a0001bfa:	03164b63          	blt	a2,a7,a0001c30 <__adddf3+0x236>
a0001bfe:	02000513          	li	a0,32
a0001c02:	41150533          	sub	a0,a0,a7
a0001c06:	00a71633          	sll	a2,a4,a0
a0001c0a:	0117d333          	srl	t1,a5,a7
a0001c0e:	00a797b3          	sll	a5,a5,a0
a0001c12:	00666633          	or	a2,a2,t1
a0001c16:	00f037b3          	snez	a5,a5
a0001c1a:	8fd1                	or	a5,a5,a2
a0001c1c:	01175733          	srl	a4,a4,a7
a0001c20:	97c2                	add	a5,a5,a6
a0001c22:	9736                	add	a4,a4,a3
a0001c24:	0107b6b3          	sltu	a3,a5,a6
a0001c28:	96ba                	add	a3,a3,a4
a0001c2a:	883e                	mv	a6,a5
a0001c2c:	862e                	mv	a2,a1
a0001c2e:	bde9                	j	a0001b08 <__adddf3+0x10e>
a0001c30:	fe088613          	addi	a2,a7,-32 # fffe0 <nocache_min_size+0xfafe0>
a0001c34:	02000313          	li	t1,32
a0001c38:	00c75633          	srl	a2,a4,a2
a0001c3c:	4501                	li	a0,0
a0001c3e:	00688863          	beq	a7,t1,a0001c4e <__adddf3+0x254>
a0001c42:	04000513          	li	a0,64
a0001c46:	41150533          	sub	a0,a0,a7
a0001c4a:	00a71533          	sll	a0,a4,a0
a0001c4e:	8fc9                	or	a5,a5,a0
a0001c50:	00f037b3          	snez	a5,a5
a0001c54:	8fd1                	or	a5,a5,a2
a0001c56:	4701                	li	a4,0
a0001c58:	b7e1                	j	a0001c20 <__adddf3+0x226>
a0001c5a:	8fd9                	or	a5,a5,a4
a0001c5c:	00f037b3          	snez	a5,a5
a0001c60:	bfdd                	j	a0001c56 <__adddf3+0x25c>
a0001c62:	00140613          	addi	a2,s0,1
a0001c66:	7fe67513          	andi	a0,a2,2046
a0001c6a:	ed41                	bnez	a0,a0001d02 <__adddf3+0x308>
a0001c6c:	00f76533          	or	a0,a4,a5
a0001c70:	e421                	bnez	s0,a0001cb8 <__adddf3+0x2be>
a0001c72:	4c050563          	beqz	a0,a000213c <__adddf3+0x742>
a0001c76:	0106e633          	or	a2,a3,a6
a0001c7a:	30060b63          	beqz	a2,a0001f90 <__adddf3+0x596>
a0001c7e:	983e                	add	a6,a6,a5
a0001c80:	00f837b3          	sltu	a5,a6,a5
a0001c84:	9736                	add	a4,a4,a3
a0001c86:	973e                	add	a4,a4,a5
a0001c88:	008007b7          	lui	a5,0x800
a0001c8c:	8ff9                	and	a5,a5,a4
a0001c8e:	4a078863          	beqz	a5,a000213e <__adddf3+0x744>
a0001c92:	ff8007b7          	lui	a5,0xff800
a0001c96:	17fd                	addi	a5,a5,-1
a0001c98:	8f7d                	and	a4,a4,a5
a0001c9a:	4581                	li	a1,0
a0001c9c:	87c2                	mv	a5,a6
a0001c9e:	4605                	li	a2,1
a0001ca0:	0077f693          	andi	a3,a5,7
a0001ca4:	e6d5                	bnez	a3,a0001d50 <__adddf3+0x356>
a0001ca6:	58040363          	beqz	s0,a000222c <__adddf3+0x832>
a0001caa:	0015f693          	andi	a3,a1,1
a0001cae:	56068f63          	beqz	a3,a000222c <__adddf3+0x832>
a0001cb2:	0025e593          	ori	a1,a1,2
a0001cb6:	ab9d                	j	a000222c <__adddf3+0x832>
a0001cb8:	7ff00613          	li	a2,2047
a0001cbc:	02c41d63          	bne	s0,a2,a0001cf6 <__adddf3+0x2fc>
a0001cc0:	5e050563          	beqz	a0,a00022aa <__adddf3+0x8b0>
a0001cc4:	00400637          	lui	a2,0x400
a0001cc8:	8e79                	and	a2,a2,a4
a0001cca:	00163613          	seqz	a2,a2
a0001cce:	0612                	slli	a2,a2,0x4
a0001cd0:	54859363          	bne	a1,s0,a0002216 <__adddf3+0x81c>
a0001cd4:	85b2                	mv	a1,a2
a0001cd6:	0106e633          	or	a2,a3,a6
a0001cda:	c611                	beqz	a2,a0001ce6 <__adddf3+0x2ec>
a0001cdc:	00400637          	lui	a2,0x400
a0001ce0:	8e75                	and	a2,a2,a3
a0001ce2:	e211                	bnez	a2,a0001ce6 <__adddf3+0x2ec>
a0001ce4:	45c1                	li	a1,16
a0001ce6:	52051963          	bnez	a0,a0002218 <__adddf3+0x81e>
a0001cea:	8736                	mv	a4,a3
a0001cec:	87c2                	mv	a5,a6
a0001cee:	4401                	li	s0,0
a0001cf0:	7ff00613          	li	a2,2047
a0001cf4:	b775                	j	a0001ca0 <__adddf3+0x2a6>
a0001cf6:	00c59463          	bne	a1,a2,a0001cfe <__adddf3+0x304>
a0001cfa:	4581                	li	a1,0
a0001cfc:	bfe9                	j	a0001cd6 <__adddf3+0x2dc>
a0001cfe:	4581                	li	a1,0
a0001d00:	b7dd                	j	a0001ce6 <__adddf3+0x2ec>
a0001d02:	7ff00593          	li	a1,2047
a0001d06:	02b60063          	beq	a2,a1,a0001d26 <__adddf3+0x32c>
a0001d0a:	983e                	add	a6,a6,a5
a0001d0c:	00f837b3          	sltu	a5,a6,a5
a0001d10:	9736                	add	a4,a4,a3
a0001d12:	973e                	add	a4,a4,a5
a0001d14:	01f71793          	slli	a5,a4,0x1f
a0001d18:	00185813          	srli	a6,a6,0x1
a0001d1c:	0107e7b3          	or	a5,a5,a6
a0001d20:	8305                	srli	a4,a4,0x1
a0001d22:	4401                	li	s0,0
a0001d24:	a9bd                	j	a00021a2 <__adddf3+0x7a8>
a0001d26:	00098763          	beqz	s3,a0001d34 <__adddf3+0x33a>
a0001d2a:	478d                	li	a5,3
a0001d2c:	00f99763          	bne	s3,a5,a0001d3a <__adddf3+0x340>
a0001d30:	00049a63          	bnez	s1,a0001d44 <__adddf3+0x34a>
a0001d34:	7ff00613          	li	a2,2047
a0001d38:	a889                	j	a0001d8a <__adddf3+0x390>
a0001d3a:	4789                	li	a5,2
a0001d3c:	00f99463          	bne	s3,a5,a0001d44 <__adddf3+0x34a>
a0001d40:	fe049ae3          	bnez	s1,a0001d34 <__adddf3+0x33a>
a0001d44:	4401                	li	s0,0
a0001d46:	577d                	li	a4,-1
a0001d48:	57fd                	li	a5,-1
a0001d4a:	7fe00613          	li	a2,2046
a0001d4e:	4595                	li	a1,5
a0001d50:	4689                	li	a3,2
a0001d52:	0015e593          	ori	a1,a1,1
a0001d56:	48d98763          	beq	s3,a3,a00021e4 <__adddf3+0x7ea>
a0001d5a:	468d                	li	a3,3
a0001d5c:	48d98063          	beq	s3,a3,a00021dc <__adddf3+0x7e2>
a0001d60:	48099363          	bnez	s3,a00021e6 <__adddf3+0x7ec>
a0001d64:	00f7f693          	andi	a3,a5,15
a0001d68:	4511                	li	a0,4
a0001d6a:	46a68e63          	beq	a3,a0,a00021e6 <__adddf3+0x7ec>
a0001d6e:	00478693          	addi	a3,a5,4 # ff800004 <__psram_limit+0x57400004>
a0001d72:	00f6b7b3          	sltu	a5,a3,a5
a0001d76:	973e                	add	a4,a4,a5
a0001d78:	87b6                	mv	a5,a3
a0001d7a:	a1b5                	j	a00021e6 <__adddf3+0x7ec>
a0001d7c:	00098763          	beqz	s3,a0001d8a <__adddf3+0x390>
a0001d80:	478d                	li	a5,3
a0001d82:	00f99863          	bne	s3,a5,a0001d92 <__adddf3+0x398>
a0001d86:	3e049f63          	bnez	s1,a0002184 <__adddf3+0x78a>
a0001d8a:	4701                	li	a4,0
a0001d8c:	4781                	li	a5,0
a0001d8e:	4595                	li	a1,5
a0001d90:	a971                	j	a000222c <__adddf3+0x832>
a0001d92:	4789                	li	a5,2
a0001d94:	3ef99863          	bne	s3,a5,a0002184 <__adddf3+0x78a>
a0001d98:	fe0499e3          	bnez	s1,a0001d8a <__adddf3+0x390>
a0001d9c:	b765                	j	a0001d44 <__adddf3+0x34a>
a0001d9e:	0ca05763          	blez	a0,a0001e6c <__adddf3+0x472>
a0001da2:	08059263          	bnez	a1,a0001e26 <__adddf3+0x42c>
a0001da6:	0106e533          	or	a0,a3,a6
a0001daa:	ca050ee3          	beqz	a0,a0001a66 <__adddf3+0x6c>
a0001dae:	fff60513          	addi	a0,a2,-1 # 3fffff <nocache_min_size+0x3fafff>
a0001db2:	e911                	bnez	a0,a0001dc6 <__adddf3+0x3cc>
a0001db4:	41078833          	sub	a6,a5,a6
a0001db8:	40d706b3          	sub	a3,a4,a3
a0001dbc:	0107b7b3          	sltu	a5,a5,a6
a0001dc0:	8e9d                	sub	a3,a3,a5
a0001dc2:	4605                	li	a2,1
a0001dc4:	a0a9                	j	a0001e0e <__adddf3+0x414>
a0001dc6:	7ff00893          	li	a7,2047
a0001dca:	cd1601e3          	beq	a2,a7,a0001a8c <__adddf3+0x92>
a0001dce:	03800613          	li	a2,56
a0001dd2:	08a64863          	blt	a2,a0,a0001e62 <__adddf3+0x468>
a0001dd6:	467d                	li	a2,31
a0001dd8:	04a64f63          	blt	a2,a0,a0001e36 <__adddf3+0x43c>
a0001ddc:	02000613          	li	a2,32
a0001de0:	8e09                	sub	a2,a2,a0
a0001de2:	00c695b3          	sll	a1,a3,a2
a0001de6:	00a858b3          	srl	a7,a6,a0
a0001dea:	00c81833          	sll	a6,a6,a2
a0001dee:	0115e5b3          	or	a1,a1,a7
a0001df2:	01003833          	snez	a6,a6
a0001df6:	0105e833          	or	a6,a1,a6
a0001dfa:	00a6d6b3          	srl	a3,a3,a0
a0001dfe:	41078833          	sub	a6,a5,a6
a0001e02:	40d706b3          	sub	a3,a4,a3
a0001e06:	0107b7b3          	sltu	a5,a5,a6
a0001e0a:	8e9d                	sub	a3,a3,a5
a0001e0c:	8622                	mv	a2,s0
a0001e0e:	00800937          	lui	s2,0x800
a0001e12:	0126f7b3          	and	a5,a3,s2
a0001e16:	d60786e3          	beqz	a5,a0001b82 <__adddf3+0x188>
a0001e1a:	197d                	addi	s2,s2,-1
a0001e1c:	0126f933          	and	s2,a3,s2
a0001e20:	8a42                	mv	s4,a6
a0001e22:	8432                	mv	s0,a2
a0001e24:	a4b5                	j	a0002090 <__adddf3+0x696>
a0001e26:	7ff00613          	li	a2,2047
a0001e2a:	c8c401e3          	beq	s0,a2,a0001aac <__adddf3+0xb2>
a0001e2e:	00800637          	lui	a2,0x800
a0001e32:	8ed1                	or	a3,a3,a2
a0001e34:	bf69                	j	a0001dce <__adddf3+0x3d4>
a0001e36:	fe050593          	addi	a1,a0,-32 # 7fffe0 <nocache_min_size+0x7fafe0>
a0001e3a:	02000893          	li	a7,32
a0001e3e:	00b6d5b3          	srl	a1,a3,a1
a0001e42:	4601                	li	a2,0
a0001e44:	01150763          	beq	a0,a7,a0001e52 <__adddf3+0x458>
a0001e48:	04000613          	li	a2,64
a0001e4c:	8e09                	sub	a2,a2,a0
a0001e4e:	00c69633          	sll	a2,a3,a2
a0001e52:	01066833          	or	a6,a2,a6
a0001e56:	01003833          	snez	a6,a6
a0001e5a:	0105e833          	or	a6,a1,a6
a0001e5e:	4681                	li	a3,0
a0001e60:	bf79                	j	a0001dfe <__adddf3+0x404>
a0001e62:	0106e833          	or	a6,a3,a6
a0001e66:	01003833          	snez	a6,a6
a0001e6a:	bfd5                	j	a0001e5e <__adddf3+0x464>
a0001e6c:	cd75                	beqz	a0,a0001f68 <__adddf3+0x56e>
a0001e6e:	40858633          	sub	a2,a1,s0
a0001e72:	e439                	bnez	s0,a0001ec0 <__adddf3+0x4c6>
a0001e74:	00f76533          	or	a0,a4,a5
a0001e78:	e509                	bnez	a0,a0001e82 <__adddf3+0x488>
a0001e7a:	7ff00793          	li	a5,2047
a0001e7e:	849a                	mv	s1,t1
a0001e80:	b9fd                	j	a0001b7e <__adddf3+0x184>
a0001e82:	fff60893          	addi	a7,a2,-1 # 7fffff <nocache_min_size+0x7fafff>
a0001e86:	00089c63          	bnez	a7,a0001e9e <__adddf3+0x4a4>
a0001e8a:	40f807b3          	sub	a5,a6,a5
a0001e8e:	00f83833          	sltu	a6,a6,a5
a0001e92:	8e99                	sub	a3,a3,a4
a0001e94:	410686b3          	sub	a3,a3,a6
a0001e98:	849a                	mv	s1,t1
a0001e9a:	883e                	mv	a6,a5
a0001e9c:	b71d                	j	a0001dc2 <__adddf3+0x3c8>
a0001e9e:	7ff00513          	li	a0,2047
a0001ea2:	04a61663          	bne	a2,a0,a0001eee <__adddf3+0x4f4>
a0001ea6:	0106e7b3          	or	a5,a3,a6
a0001eaa:	2e078e63          	beqz	a5,a00021a6 <__adddf3+0x7ac>
a0001eae:	004007b7          	lui	a5,0x400
a0001eb2:	8ff5                	and	a5,a5,a3
a0001eb4:	8736                	mv	a4,a3
a0001eb6:	2e079b63          	bnez	a5,a00021ac <__adddf3+0x7b2>
a0001eba:	87c2                	mv	a5,a6
a0001ebc:	849a                	mv	s1,t1
a0001ebe:	b6cd                	j	a0001aa0 <__adddf3+0xa6>
a0001ec0:	7ff00513          	li	a0,2047
a0001ec4:	02a59163          	bne	a1,a0,a0001ee6 <__adddf3+0x4ec>
a0001ec8:	0106e7b3          	or	a5,a3,a6
a0001ecc:	2e078363          	beqz	a5,a00021b2 <__adddf3+0x7b8>
a0001ed0:	004007b7          	lui	a5,0x400
a0001ed4:	8ff5                	and	a5,a5,a3
a0001ed6:	8736                	mv	a4,a3
a0001ed8:	2e079163          	bnez	a5,a00021ba <__adddf3+0x7c0>
a0001edc:	87c2                	mv	a5,a6
a0001ede:	7ff00613          	li	a2,2047
a0001ee2:	849a                	mv	s1,t1
a0001ee4:	b301                	j	a0001be4 <__adddf3+0x1ea>
a0001ee6:	00800537          	lui	a0,0x800
a0001eea:	8f49                	or	a4,a4,a0
a0001eec:	88b2                	mv	a7,a2
a0001eee:	03800613          	li	a2,56
a0001ef2:	07164763          	blt	a2,a7,a0001f60 <__adddf3+0x566>
a0001ef6:	467d                	li	a2,31
a0001ef8:	03164f63          	blt	a2,a7,a0001f36 <__adddf3+0x53c>
a0001efc:	02000513          	li	a0,32
a0001f00:	41150533          	sub	a0,a0,a7
a0001f04:	00a71633          	sll	a2,a4,a0
a0001f08:	0117de33          	srl	t3,a5,a7
a0001f0c:	00a797b3          	sll	a5,a5,a0
a0001f10:	01c66633          	or	a2,a2,t3
a0001f14:	00f037b3          	snez	a5,a5
a0001f18:	8fd1                	or	a5,a5,a2
a0001f1a:	01175733          	srl	a4,a4,a7
a0001f1e:	40f807b3          	sub	a5,a6,a5
a0001f22:	40e68733          	sub	a4,a3,a4
a0001f26:	00f836b3          	sltu	a3,a6,a5
a0001f2a:	40d706b3          	sub	a3,a4,a3
a0001f2e:	883e                	mv	a6,a5
a0001f30:	862e                	mv	a2,a1
a0001f32:	849a                	mv	s1,t1
a0001f34:	bde9                	j	a0001e0e <__adddf3+0x414>
a0001f36:	fe088613          	addi	a2,a7,-32
a0001f3a:	02000e13          	li	t3,32
a0001f3e:	00c75633          	srl	a2,a4,a2
a0001f42:	4501                	li	a0,0
a0001f44:	01c88863          	beq	a7,t3,a0001f54 <__adddf3+0x55a>
a0001f48:	04000513          	li	a0,64
a0001f4c:	41150533          	sub	a0,a0,a7
a0001f50:	00a71533          	sll	a0,a4,a0
a0001f54:	8fc9                	or	a5,a5,a0
a0001f56:	00f037b3          	snez	a5,a5
a0001f5a:	8fd1                	or	a5,a5,a2
a0001f5c:	4701                	li	a4,0
a0001f5e:	b7c1                	j	a0001f1e <__adddf3+0x524>
a0001f60:	8fd9                	or	a5,a5,a4
a0001f62:	00f037b3          	snez	a5,a5
a0001f66:	bfdd                	j	a0001f5c <__adddf3+0x562>
a0001f68:	00140613          	addi	a2,s0,1
a0001f6c:	7fe67613          	andi	a2,a2,2046
a0001f70:	ea7d                	bnez	a2,a0002066 <__adddf3+0x66c>
a0001f72:	00f768b3          	or	a7,a4,a5
a0001f76:	0106e533          	or	a0,a3,a6
a0001f7a:	e05d                	bnez	s0,a0002020 <__adddf3+0x626>
a0001f7c:	06089263          	bnez	a7,a0001fe0 <__adddf3+0x5e6>
a0001f80:	1c051163          	bnez	a0,a0002142 <__adddf3+0x748>
a0001f84:	ffe98493          	addi	s1,s3,-2
a0001f88:	0014b493          	seqz	s1,s1
a0001f8c:	4701                	li	a4,0
a0001f8e:	4781                	li	a5,0
a0001f90:	00e7e6b3          	or	a3,a5,a4
a0001f94:	24068063          	beqz	a3,a00021d4 <__adddf3+0x7da>
a0001f98:	01f7d693          	srli	a3,a5,0x1f
a0001f9c:	00171413          	slli	s0,a4,0x1
a0001fa0:	9436                	add	s0,s0,a3
a0001fa2:	00179693          	slli	a3,a5,0x1
a0001fa6:	0076f613          	andi	a2,a3,7
a0001faa:	4581                	li	a1,0
a0001fac:	c605                	beqz	a2,a0001fd4 <__adddf3+0x5da>
a0001fae:	4609                	li	a2,2
a0001fb0:	1ac98963          	beq	s3,a2,a0002162 <__adddf3+0x768>
a0001fb4:	460d                	li	a2,3
a0001fb6:	18c98c63          	beq	s3,a2,a000214e <__adddf3+0x754>
a0001fba:	4585                	li	a1,1
a0001fbc:	00099c63          	bnez	s3,a0001fd4 <__adddf3+0x5da>
a0001fc0:	00f6f613          	andi	a2,a3,15
a0001fc4:	4511                	li	a0,4
a0001fc6:	00a60763          	beq	a2,a0,a0001fd4 <__adddf3+0x5da>
a0001fca:	ffc6b693          	sltiu	a3,a3,-4
a0001fce:	0016c693          	xori	a3,a3,1
a0001fd2:	9436                	add	s0,s0,a3
a0001fd4:	8061                	srli	s0,s0,0x18
a0001fd6:	00144413          	xori	s0,s0,1
a0001fda:	8805                	andi	s0,s0,1
a0001fdc:	4601                	li	a2,0
a0001fde:	b1c9                	j	a0001ca0 <__adddf3+0x2a6>
a0001fe0:	d945                	beqz	a0,a0001f90 <__adddf3+0x596>
a0001fe2:	410785b3          	sub	a1,a5,a6
a0001fe6:	00b7b533          	sltu	a0,a5,a1
a0001fea:	40d70633          	sub	a2,a4,a3
a0001fee:	8e09                	sub	a2,a2,a0
a0001ff0:	00800537          	lui	a0,0x800
a0001ff4:	8d71                	and	a0,a0,a2
a0001ff6:	c919                	beqz	a0,a000200c <__adddf3+0x612>
a0001ff8:	40f807b3          	sub	a5,a6,a5
a0001ffc:	40e68733          	sub	a4,a3,a4
a0002000:	00f83833          	sltu	a6,a6,a5
a0002004:	41070733          	sub	a4,a4,a6
a0002008:	849a                	mv	s1,t1
a000200a:	b759                	j	a0001f90 <__adddf3+0x596>
a000200c:	00c5e7b3          	or	a5,a1,a2
a0002010:	12079c63          	bnez	a5,a0002148 <__adddf3+0x74e>
a0002014:	ffe98493          	addi	s1,s3,-2
a0002018:	0014b493          	seqz	s1,s1
a000201c:	4701                	li	a4,0
a000201e:	bf8d                	j	a0001f90 <__adddf3+0x596>
a0002020:	7ff00613          	li	a2,2047
a0002024:	00c41e63          	bne	s0,a2,a0002040 <__adddf3+0x646>
a0002028:	26088963          	beqz	a7,a000229a <__adddf3+0x8a0>
a000202c:	00400637          	lui	a2,0x400
a0002030:	8e79                	and	a2,a2,a4
a0002032:	00163613          	seqz	a2,a2
a0002036:	0612                	slli	a2,a2,0x4
a0002038:	26859563          	bne	a1,s0,a00022a2 <__adddf3+0x8a8>
a000203c:	85b2                	mv	a1,a2
a000203e:	a021                	j	a0002046 <__adddf3+0x64c>
a0002040:	02c59163          	bne	a1,a2,a0002062 <__adddf3+0x668>
a0002044:	4581                	li	a1,0
a0002046:	c511                	beqz	a0,a0002052 <__adddf3+0x658>
a0002048:	00400637          	lui	a2,0x400
a000204c:	8e75                	and	a2,a2,a3
a000204e:	e211                	bnez	a2,a0002052 <__adddf3+0x658>
a0002050:	45c1                	li	a1,16
a0002052:	24089963          	bnez	a7,a00022a4 <__adddf3+0x8aa>
a0002056:	16050763          	beqz	a0,a00021c4 <__adddf3+0x7ca>
a000205a:	8736                	mv	a4,a3
a000205c:	87c2                	mv	a5,a6
a000205e:	849a                	mv	s1,t1
a0002060:	b179                	j	a0001cee <__adddf3+0x2f4>
a0002062:	4581                	li	a1,0
a0002064:	b7fd                	j	a0002052 <__adddf3+0x658>
a0002066:	41078a33          	sub	s4,a5,a6
a000206a:	0147b633          	sltu	a2,a5,s4
a000206e:	40d70933          	sub	s2,a4,a3
a0002072:	40c90933          	sub	s2,s2,a2
a0002076:	00800637          	lui	a2,0x800
a000207a:	00c97633          	and	a2,s2,a2
a000207e:	c62d                	beqz	a2,a00020e8 <__adddf3+0x6ee>
a0002080:	40f80a33          	sub	s4,a6,a5
a0002084:	8e99                	sub	a3,a3,a4
a0002086:	01483833          	sltu	a6,a6,s4
a000208a:	41068933          	sub	s2,a3,a6
a000208e:	849a                	mv	s1,t1
a0002090:	06090063          	beqz	s2,a00020f0 <__adddf3+0x6f6>
a0002094:	854a                	mv	a0,s2
a0002096:	b6bfe0ef          	jal	ra,a0000c00 <__clzsi2>
a000209a:	ff850613          	addi	a2,a0,-8 # 7ffff8 <nocache_min_size+0x7faff8>
a000209e:	47fd                	li	a5,31
a00020a0:	04c7ce63          	blt	a5,a2,a00020fc <__adddf3+0x702>
a00020a4:	02000693          	li	a3,32
a00020a8:	8e91                	sub	a3,a3,a2
a00020aa:	00c91733          	sll	a4,s2,a2
a00020ae:	00da56b3          	srl	a3,s4,a3
a00020b2:	8ed9                	or	a3,a3,a4
a00020b4:	00ca1833          	sll	a6,s4,a2
a00020b8:	06864b63          	blt	a2,s0,a000212e <__adddf3+0x734>
a00020bc:	8e01                	sub	a2,a2,s0
a00020be:	00160713          	addi	a4,a2,1 # 800001 <nocache_min_size+0x7fb001>
a00020c2:	47fd                	li	a5,31
a00020c4:	04e7c263          	blt	a5,a4,a0002108 <__adddf3+0x70e>
a00020c8:	02000613          	li	a2,32
a00020cc:	8e19                	sub	a2,a2,a4
a00020ce:	00c697b3          	sll	a5,a3,a2
a00020d2:	00e85533          	srl	a0,a6,a4
a00020d6:	00c81633          	sll	a2,a6,a2
a00020da:	8fc9                	or	a5,a5,a0
a00020dc:	00c03633          	snez	a2,a2
a00020e0:	8fd1                	or	a5,a5,a2
a00020e2:	00e6d733          	srl	a4,a3,a4
a00020e6:	b56d                	j	a0001f90 <__adddf3+0x596>
a00020e8:	012a67b3          	or	a5,s4,s2
a00020ec:	f3d5                	bnez	a5,a0002090 <__adddf3+0x696>
a00020ee:	b71d                	j	a0002014 <__adddf3+0x61a>
a00020f0:	8552                	mv	a0,s4
a00020f2:	b0ffe0ef          	jal	ra,a0000c00 <__clzsi2>
a00020f6:	02050513          	addi	a0,a0,32
a00020fa:	b745                	j	a000209a <__adddf3+0x6a0>
a00020fc:	fd850693          	addi	a3,a0,-40
a0002100:	00da16b3          	sll	a3,s4,a3
a0002104:	4801                	li	a6,0
a0002106:	bf4d                	j	a00020b8 <__adddf3+0x6be>
a0002108:	1605                	addi	a2,a2,-31
a000210a:	02000593          	li	a1,32
a000210e:	00c6d633          	srl	a2,a3,a2
a0002112:	4781                	li	a5,0
a0002114:	00b70763          	beq	a4,a1,a0002122 <__adddf3+0x728>
a0002118:	04000793          	li	a5,64
a000211c:	8f99                	sub	a5,a5,a4
a000211e:	00f697b3          	sll	a5,a3,a5
a0002122:	00f867b3          	or	a5,a6,a5
a0002126:	00f037b3          	snez	a5,a5
a000212a:	8fd1                	or	a5,a5,a2
a000212c:	bdc5                	j	a000201c <__adddf3+0x622>
a000212e:	ff8007b7          	lui	a5,0xff800
a0002132:	17fd                	addi	a5,a5,-1
a0002134:	40c40633          	sub	a2,s0,a2
a0002138:	8efd                	and	a3,a3,a5
a000213a:	b4a1                	j	a0001b82 <__adddf3+0x188>
a000213c:	8736                	mv	a4,a3
a000213e:	87c2                	mv	a5,a6
a0002140:	bd81                	j	a0001f90 <__adddf3+0x596>
a0002142:	8736                	mv	a4,a3
a0002144:	87c2                	mv	a5,a6
a0002146:	b5c9                	j	a0002008 <__adddf3+0x60e>
a0002148:	8732                	mv	a4,a2
a000214a:	87ae                	mv	a5,a1
a000214c:	b591                	j	a0001f90 <__adddf3+0x596>
a000214e:	85a6                	mv	a1,s1
a0002150:	e80492e3          	bnez	s1,a0001fd4 <__adddf3+0x5da>
a0002154:	ff86b693          	sltiu	a3,a3,-8
a0002158:	0016c693          	xori	a3,a3,1
a000215c:	9436                	add	s0,s0,a3
a000215e:	4585                	li	a1,1
a0002160:	bd95                	j	a0001fd4 <__adddf3+0x5da>
a0002162:	4585                	li	a1,1
a0002164:	e60488e3          	beqz	s1,a0001fd4 <__adddf3+0x5da>
a0002168:	ff86b693          	sltiu	a3,a3,-8
a000216c:	0016c693          	xori	a3,a3,1
a0002170:	9436                	add	s0,s0,a3
a0002172:	85a6                	mv	a1,s1
a0002174:	b585                	j	a0001fd4 <__adddf3+0x5da>
a0002176:	4701                	li	a4,0
a0002178:	7ff00613          	li	a2,2047
a000217c:	4581                	li	a1,0
a000217e:	a07d                	j	a000222c <__adddf3+0x832>
a0002180:	87c2                	mv	a5,a6
a0002182:	ba35                	j	a0001abe <__adddf3+0xc4>
a0002184:	577d                	li	a4,-1
a0002186:	57fd                	li	a5,-1
a0002188:	7fe00613          	li	a2,2046
a000218c:	4401                	li	s0,0
a000218e:	b6c1                	j	a0001d4e <__adddf3+0x354>
a0002190:	4701                	li	a4,0
a0002192:	4781                	li	a5,0
a0002194:	a861                	j	a000222c <__adddf3+0x832>
a0002196:	4701                	li	a4,0
a0002198:	4781                	li	a5,0
a000219a:	bff9                	j	a0002178 <__adddf3+0x77e>
a000219c:	4701                	li	a4,0
a000219e:	bff9                	j	a000217c <__adddf3+0x782>
a00021a0:	87c2                	mv	a5,a6
a00021a2:	4581                	li	a1,0
a00021a4:	bcf5                	j	a0001ca0 <__adddf3+0x2a6>
a00021a6:	4701                	li	a4,0
a00021a8:	849a                	mv	s1,t1
a00021aa:	bfc9                	j	a000217c <__adddf3+0x782>
a00021ac:	87c2                	mv	a5,a6
a00021ae:	849a                	mv	s1,t1
a00021b0:	bfcd                	j	a00021a2 <__adddf3+0x7a8>
a00021b2:	4701                	li	a4,0
a00021b4:	7ff00613          	li	a2,2047
a00021b8:	bfc5                	j	a00021a8 <__adddf3+0x7ae>
a00021ba:	87c2                	mv	a5,a6
a00021bc:	7ff00613          	li	a2,2047
a00021c0:	849a                	mv	s1,t1
a00021c2:	b685                	j	a0001d22 <__adddf3+0x328>
a00021c4:	4781                	li	a5,0
a00021c6:	4481                	li	s1,0
a00021c8:	00400737          	lui	a4,0x400
a00021cc:	7ff00613          	li	a2,2047
a00021d0:	45c1                	li	a1,16
a00021d2:	a8a9                	j	a000222c <__adddf3+0x832>
a00021d4:	4701                	li	a4,0
a00021d6:	4781                	li	a5,0
a00021d8:	4601                	li	a2,0
a00021da:	b74d                	j	a000217c <__adddf3+0x782>
a00021dc:	e489                	bnez	s1,a00021e6 <__adddf3+0x7ec>
a00021de:	00878693          	addi	a3,a5,8 # ff800008 <__psram_limit+0x57400008>
a00021e2:	be41                	j	a0001d72 <__adddf3+0x378>
a00021e4:	fced                	bnez	s1,a00021de <__adddf3+0x7e4>
a00021e6:	ac0416e3          	bnez	s0,a0001cb2 <__adddf3+0x2b8>
a00021ea:	a089                	j	a000222c <__adddf3+0x832>
a00021ec:	4781                	li	a5,0
a00021ee:	02098063          	beqz	s3,a000220e <__adddf3+0x814>
a00021f2:	470d                	li	a4,3
a00021f4:	00e99863          	bne	s3,a4,a0002204 <__adddf3+0x80a>
a00021f8:	00048b63          	beqz	s1,a000220e <__adddf3+0x814>
a00021fc:	57fd                	li	a5,-1
a00021fe:	7fe00613          	li	a2,2046
a0002202:	a031                	j	a000220e <__adddf3+0x814>
a0002204:	4709                	li	a4,2
a0002206:	fee99be3          	bne	s3,a4,a00021fc <__adddf3+0x802>
a000220a:	fe0489e3          	beqz	s1,a00021fc <__adddf3+0x802>
a000220e:	0055e593          	ori	a1,a1,5
a0002212:	873e                	mv	a4,a5
a0002214:	a80d                	j	a0002246 <__adddf3+0x84c>
a0002216:	85b2                	mv	a1,a2
a0002218:	0106e6b3          	or	a3,a3,a6
a000221c:	ac0689e3          	beqz	a3,a0001cee <__adddf3+0x2f4>
a0002220:	4481                	li	s1,0
a0002222:	00400737          	lui	a4,0x400
a0002226:	4781                	li	a5,0
a0002228:	7ff00613          	li	a2,2047
a000222c:	008006b7          	lui	a3,0x800
a0002230:	8ef9                	and	a3,a3,a4
a0002232:	ca91                	beqz	a3,a0002246 <__adddf3+0x84c>
a0002234:	0605                	addi	a2,a2,1
a0002236:	7ff00693          	li	a3,2047
a000223a:	fad609e3          	beq	a2,a3,a00021ec <__adddf3+0x7f2>
a000223e:	ff8006b7          	lui	a3,0xff800
a0002242:	16fd                	addi	a3,a3,-1
a0002244:	8f75                	and	a4,a4,a3
a0002246:	0037d513          	srli	a0,a5,0x3
a000224a:	7ff00693          	li	a3,2047
a000224e:	01d71793          	slli	a5,a4,0x1d
a0002252:	8fc9                	or	a5,a5,a0
a0002254:	830d                	srli	a4,a4,0x3
a0002256:	00d61963          	bne	a2,a3,a0002268 <__adddf3+0x86e>
a000225a:	8fd9                	or	a5,a5,a4
a000225c:	4701                	li	a4,0
a000225e:	c789                	beqz	a5,a0002268 <__adddf3+0x86e>
a0002260:	00080737          	lui	a4,0x80
a0002264:	4781                	li	a5,0
a0002266:	4481                	li	s1,0
a0002268:	7ff006b7          	lui	a3,0x7ff00
a000226c:	0652                	slli	a2,a2,0x14
a000226e:	0732                	slli	a4,a4,0xc
a0002270:	8e75                	and	a2,a2,a3
a0002272:	8331                	srli	a4,a4,0xc
a0002274:	8f51                	or	a4,a4,a2
a0002276:	04fe                	slli	s1,s1,0x1f
a0002278:	009766b3          	or	a3,a4,s1
a000227c:	873e                	mv	a4,a5
a000227e:	87b6                	mv	a5,a3
a0002280:	c199                	beqz	a1,a0002286 <__adddf3+0x88c>
a0002282:	0015a073          	csrs	fflags,a1
a0002286:	40f2                	lw	ra,28(sp)
a0002288:	4462                	lw	s0,24(sp)
a000228a:	44d2                	lw	s1,20(sp)
a000228c:	4942                	lw	s2,16(sp)
a000228e:	49b2                	lw	s3,12(sp)
a0002290:	4a22                	lw	s4,8(sp)
a0002292:	853a                	mv	a0,a4
a0002294:	85be                	mv	a1,a5
a0002296:	6105                	addi	sp,sp,32
a0002298:	8082                	ret
a000229a:	da8585e3          	beq	a1,s0,a0002044 <__adddf3+0x64a>
a000229e:	4581                	li	a1,0
a00022a0:	bb5d                	j	a0002056 <__adddf3+0x65c>
a00022a2:	85b2                	mv	a1,a2
a00022a4:	a40505e3          	beqz	a0,a0001cee <__adddf3+0x2f4>
a00022a8:	bfa5                	j	a0002220 <__adddf3+0x826>
a00022aa:	a48588e3          	beq	a1,s0,a0001cfa <__adddf3+0x300>
a00022ae:	4581                	li	a1,0
a00022b0:	bc2d                	j	a0001cea <__adddf3+0x2f0>

a00022b2 <__divdf3>:
a00022b2:	7179                	addi	sp,sp,-48
a00022b4:	d422                	sw	s0,40(sp)
a00022b6:	ca56                	sw	s5,20(sp)
a00022b8:	c266                	sw	s9,4(sp)
a00022ba:	d606                	sw	ra,44(sp)
a00022bc:	d226                	sw	s1,36(sp)
a00022be:	d04a                	sw	s2,32(sp)
a00022c0:	ce4e                	sw	s3,28(sp)
a00022c2:	cc52                	sw	s4,24(sp)
a00022c4:	c85a                	sw	s6,16(sp)
a00022c6:	c65e                	sw	s7,12(sp)
a00022c8:	c462                	sw	s8,8(sp)
a00022ca:	842a                	mv	s0,a0
a00022cc:	8cb2                	mv	s9,a2
a00022ce:	8ab6                	mv	s5,a3
a00022d0:	00202973          	frrm	s2
a00022d4:	0145db13          	srli	s6,a1,0x14
a00022d8:	00c59b93          	slli	s7,a1,0xc
a00022dc:	7ffb7b13          	andi	s6,s6,2047
a00022e0:	00cbdb93          	srli	s7,s7,0xc
a00022e4:	01f5da13          	srli	s4,a1,0x1f
a00022e8:	020b0663          	beqz	s6,a0002314 <__divdf3+0x62>
a00022ec:	7ff00793          	li	a5,2047
a00022f0:	06fb0b63          	beq	s6,a5,a0002366 <__divdf3+0xb4>
a00022f4:	01d55713          	srli	a4,a0,0x1d
a00022f8:	0b8e                	slli	s7,s7,0x3
a00022fa:	01776bb3          	or	s7,a4,s7
a00022fe:	008007b7          	lui	a5,0x800
a0002302:	00fbebb3          	or	s7,s7,a5
a0002306:	00351993          	slli	s3,a0,0x3
a000230a:	c01b0b13          	addi	s6,s6,-1023
a000230e:	4c01                	li	s8,0
a0002310:	4481                	li	s1,0
a0002312:	a0bd                	j	a0002380 <__divdf3+0xce>
a0002314:	00abe7b3          	or	a5,s7,a0
a0002318:	c7e9                	beqz	a5,a00023e2 <__divdf3+0x130>
a000231a:	020b8b63          	beqz	s7,a0002350 <__divdf3+0x9e>
a000231e:	855e                	mv	a0,s7
a0002320:	8e1fe0ef          	jal	ra,a0000c00 <__clzsi2>
a0002324:	ff550713          	addi	a4,a0,-11
a0002328:	47f1                	li	a5,28
a000232a:	02e7c863          	blt	a5,a4,a000235a <__divdf3+0xa8>
a000232e:	46f5                	li	a3,29
a0002330:	ff850993          	addi	s3,a0,-8
a0002334:	8e99                	sub	a3,a3,a4
a0002336:	013b9bb3          	sll	s7,s7,s3
a000233a:	00d456b3          	srl	a3,s0,a3
a000233e:	0176ebb3          	or	s7,a3,s7
a0002342:	013419b3          	sll	s3,s0,s3
a0002346:	c0d00593          	li	a1,-1011
a000234a:	40a58b33          	sub	s6,a1,a0
a000234e:	b7c1                	j	a000230e <__divdf3+0x5c>
a0002350:	8b1fe0ef          	jal	ra,a0000c00 <__clzsi2>
a0002354:	02050513          	addi	a0,a0,32
a0002358:	b7f1                	j	a0002324 <__divdf3+0x72>
a000235a:	fd850b93          	addi	s7,a0,-40
a000235e:	01741bb3          	sll	s7,s0,s7
a0002362:	4981                	li	s3,0
a0002364:	b7cd                	j	a0002346 <__divdf3+0x94>
a0002366:	00abe433          	or	s0,s7,a0
a000236a:	c049                	beqz	s0,a00023ec <__divdf3+0x13a>
a000236c:	000807b7          	lui	a5,0x80
a0002370:	00fbf7b3          	and	a5,s7,a5
a0002374:	89aa                	mv	s3,a0
a0002376:	7ff00b13          	li	s6,2047
a000237a:	4c0d                	li	s8,3
a000237c:	44c1                	li	s1,16
a000237e:	fbc9                	bnez	a5,a0002310 <__divdf3+0x5e>
a0002380:	00ca9513          	slli	a0,s5,0xc
a0002384:	00c55413          	srli	s0,a0,0xc
a0002388:	014ad513          	srli	a0,s5,0x14
a000238c:	7ff57593          	andi	a1,a0,2047
a0002390:	87e6                	mv	a5,s9
a0002392:	01fada93          	srli	s5,s5,0x1f
a0002396:	c1ad                	beqz	a1,a00023f8 <__divdf3+0x146>
a0002398:	7ff00713          	li	a4,2047
a000239c:	0ae58963          	beq	a1,a4,a000244e <__divdf3+0x19c>
a00023a0:	01dcd793          	srli	a5,s9,0x1d
a00023a4:	00341513          	slli	a0,s0,0x3
a00023a8:	8d5d                	or	a0,a0,a5
a00023aa:	00800437          	lui	s0,0x800
a00023ae:	8c49                	or	s0,s0,a0
a00023b0:	003c9793          	slli	a5,s9,0x3
a00023b4:	c0158513          	addi	a0,a1,-1023
a00023b8:	4701                	li	a4,0
a00023ba:	002c1693          	slli	a3,s8,0x2
a00023be:	8ed9                	or	a3,a3,a4
a00023c0:	40ab05b3          	sub	a1,s6,a0
a00023c4:	16fd                	addi	a3,a3,-1
a00023c6:	4539                	li	a0,14
a00023c8:	015a4633          	xor	a2,s4,s5
a00023cc:	0ad56a63          	bltu	a0,a3,a0002480 <__divdf3+0x1ce>
a00023d0:	0000a517          	auipc	a0,0xa
a00023d4:	22850513          	addi	a0,a0,552 # a000c5f8 <__clz_tab+0x100>
a00023d8:	068a                	slli	a3,a3,0x2
a00023da:	96aa                	add	a3,a3,a0
a00023dc:	4294                	lw	a3,0(a3)
a00023de:	96aa                	add	a3,a3,a0
a00023e0:	8682                	jr	a3
a00023e2:	4b81                	li	s7,0
a00023e4:	4981                	li	s3,0
a00023e6:	4b01                	li	s6,0
a00023e8:	4c05                	li	s8,1
a00023ea:	b71d                	j	a0002310 <__divdf3+0x5e>
a00023ec:	4b81                	li	s7,0
a00023ee:	4981                	li	s3,0
a00023f0:	7ff00b13          	li	s6,2047
a00023f4:	4c09                	li	s8,2
a00023f6:	bf29                	j	a0002310 <__divdf3+0x5e>
a00023f8:	019467b3          	or	a5,s0,s9
a00023fc:	c7ad                	beqz	a5,a0002466 <__divdf3+0x1b4>
a00023fe:	02040c63          	beqz	s0,a0002436 <__divdf3+0x184>
a0002402:	8522                	mv	a0,s0
a0002404:	ffcfe0ef          	jal	ra,a0000c00 <__clzsi2>
a0002408:	85aa                	mv	a1,a0
a000240a:	ff558693          	addi	a3,a1,-11
a000240e:	47f1                	li	a5,28
a0002410:	02d7c963          	blt	a5,a3,a0002442 <__divdf3+0x190>
a0002414:	4775                	li	a4,29
a0002416:	ff858793          	addi	a5,a1,-8
a000241a:	8f15                	sub	a4,a4,a3
a000241c:	00f41533          	sll	a0,s0,a5
a0002420:	00ecd733          	srl	a4,s9,a4
a0002424:	00a76433          	or	s0,a4,a0
a0002428:	00fc97b3          	sll	a5,s9,a5
a000242c:	c0d00713          	li	a4,-1011
a0002430:	40b70533          	sub	a0,a4,a1
a0002434:	b751                	j	a00023b8 <__divdf3+0x106>
a0002436:	8566                	mv	a0,s9
a0002438:	fc8fe0ef          	jal	ra,a0000c00 <__clzsi2>
a000243c:	02050593          	addi	a1,a0,32
a0002440:	b7e9                	j	a000240a <__divdf3+0x158>
a0002442:	fd858513          	addi	a0,a1,-40
a0002446:	00ac9433          	sll	s0,s9,a0
a000244a:	4781                	li	a5,0
a000244c:	b7c5                	j	a000242c <__divdf3+0x17a>
a000244e:	01946633          	or	a2,s0,s9
a0002452:	ce19                	beqz	a2,a0002470 <__divdf3+0x1be>
a0002454:	00080737          	lui	a4,0x80
a0002458:	8f61                	and	a4,a4,s0
a000245a:	7ff00513          	li	a0,2047
a000245e:	ef19                	bnez	a4,a000247c <__divdf3+0x1ca>
a0002460:	470d                	li	a4,3
a0002462:	44c1                	li	s1,16
a0002464:	bf99                	j	a00023ba <__divdf3+0x108>
a0002466:	4401                	li	s0,0
a0002468:	4781                	li	a5,0
a000246a:	4501                	li	a0,0
a000246c:	4705                	li	a4,1
a000246e:	b7b1                	j	a00023ba <__divdf3+0x108>
a0002470:	4401                	li	s0,0
a0002472:	4781                	li	a5,0
a0002474:	7ff00513          	li	a0,2047
a0002478:	4709                	li	a4,2
a000247a:	b781                	j	a00023ba <__divdf3+0x108>
a000247c:	470d                	li	a4,3
a000247e:	bf35                	j	a00023ba <__divdf3+0x108>
a0002480:	01746663          	bltu	s0,s7,a000248c <__divdf3+0x1da>
a0002484:	268b9463          	bne	s7,s0,a00026ec <__divdf3+0x43a>
a0002488:	26f9e263          	bltu	s3,a5,a00026ec <__divdf3+0x43a>
a000248c:	01fb9513          	slli	a0,s7,0x1f
a0002490:	0019d713          	srli	a4,s3,0x1
a0002494:	01f99693          	slli	a3,s3,0x1f
a0002498:	001bdb93          	srli	s7,s7,0x1
a000249c:	00e569b3          	or	s3,a0,a4
a00024a0:	00841513          	slli	a0,s0,0x8
a00024a4:	0187d813          	srli	a6,a5,0x18
a00024a8:	00a86833          	or	a6,a6,a0
a00024ac:	8141                	srli	a0,a0,0x10
a00024ae:	02abde33          	divu	t3,s7,a0
a00024b2:	01081f13          	slli	t5,a6,0x10
a00024b6:	010f5f13          	srli	t5,t5,0x10
a00024ba:	00879893          	slli	a7,a5,0x8
a00024be:	0109d793          	srli	a5,s3,0x10
a00024c2:	02abfbb3          	remu	s7,s7,a0
a00024c6:	8372                	mv	t1,t3
a00024c8:	03cf0733          	mul	a4,t5,t3
a00024cc:	0bc2                	slli	s7,s7,0x10
a00024ce:	0177e7b3          	or	a5,a5,s7
a00024d2:	00e7fc63          	bgeu	a5,a4,a00024ea <__divdf3+0x238>
a00024d6:	97c2                	add	a5,a5,a6
a00024d8:	fffe0313          	addi	t1,t3,-1 # ffff <nocache_min_size+0xafff>
a00024dc:	0107e763          	bltu	a5,a6,a00024ea <__divdf3+0x238>
a00024e0:	00e7f563          	bgeu	a5,a4,a00024ea <__divdf3+0x238>
a00024e4:	ffee0313          	addi	t1,t3,-2
a00024e8:	97c2                	add	a5,a5,a6
a00024ea:	8f99                	sub	a5,a5,a4
a00024ec:	02a7deb3          	divu	t4,a5,a0
a00024f0:	01099713          	slli	a4,s3,0x10
a00024f4:	8341                	srli	a4,a4,0x10
a00024f6:	02a7f7b3          	remu	a5,a5,a0
a00024fa:	89f6                	mv	s3,t4
a00024fc:	03df0e33          	mul	t3,t5,t4
a0002500:	07c2                	slli	a5,a5,0x10
a0002502:	8f5d                	or	a4,a4,a5
a0002504:	01c77c63          	bgeu	a4,t3,a000251c <__divdf3+0x26a>
a0002508:	9742                	add	a4,a4,a6
a000250a:	fffe8993          	addi	s3,t4,-1
a000250e:	01076763          	bltu	a4,a6,a000251c <__divdf3+0x26a>
a0002512:	01c77563          	bgeu	a4,t3,a000251c <__divdf3+0x26a>
a0002516:	ffee8993          	addi	s3,t4,-2
a000251a:	9742                	add	a4,a4,a6
a000251c:	0342                	slli	t1,t1,0x10
a000251e:	013369b3          	or	s3,t1,s3
a0002522:	6341                	lui	t1,0x10
a0002524:	fff30e93          	addi	t4,t1,-1 # ffff <nocache_min_size+0xafff>
a0002528:	0109d293          	srli	t0,s3,0x10
a000252c:	0108df93          	srli	t6,a7,0x10
a0002530:	41c70733          	sub	a4,a4,t3
a0002534:	01d9fe33          	and	t3,s3,t4
a0002538:	01d8feb3          	and	t4,a7,t4
a000253c:	03de07b3          	mul	a5,t3,t4
a0002540:	03d28433          	mul	s0,t0,t4
a0002544:	03cf8e33          	mul	t3,t6,t3
a0002548:	008e03b3          	add	t2,t3,s0
a000254c:	0107de13          	srli	t3,a5,0x10
a0002550:	9e1e                	add	t3,t3,t2
a0002552:	03f282b3          	mul	t0,t0,t6
a0002556:	008e7363          	bgeu	t3,s0,a000255c <__divdf3+0x2aa>
a000255a:	929a                	add	t0,t0,t1
a000255c:	63c1                	lui	t2,0x10
a000255e:	010e5313          	srli	t1,t3,0x10
a0002562:	13fd                	addi	t2,t2,-1
a0002564:	929a                	add	t0,t0,t1
a0002566:	007e7333          	and	t1,t3,t2
a000256a:	0342                	slli	t1,t1,0x10
a000256c:	0077f7b3          	and	a5,a5,t2
a0002570:	933e                	add	t1,t1,a5
a0002572:	00576763          	bltu	a4,t0,a0002580 <__divdf3+0x2ce>
a0002576:	844e                	mv	s0,s3
a0002578:	02571e63          	bne	a4,t0,a00025b4 <__divdf3+0x302>
a000257c:	0266fc63          	bgeu	a3,t1,a00025b4 <__divdf3+0x302>
a0002580:	96c6                	add	a3,a3,a7
a0002582:	0116b7b3          	sltu	a5,a3,a7
a0002586:	97c2                	add	a5,a5,a6
a0002588:	973e                	add	a4,a4,a5
a000258a:	fff98413          	addi	s0,s3,-1
a000258e:	00e86663          	bltu	a6,a4,a000259a <__divdf3+0x2e8>
a0002592:	02e81163          	bne	a6,a4,a00025b4 <__divdf3+0x302>
a0002596:	0116ef63          	bltu	a3,a7,a00025b4 <__divdf3+0x302>
a000259a:	00576663          	bltu	a4,t0,a00025a6 <__divdf3+0x2f4>
a000259e:	00e29b63          	bne	t0,a4,a00025b4 <__divdf3+0x302>
a00025a2:	0066f963          	bgeu	a3,t1,a00025b4 <__divdf3+0x302>
a00025a6:	96c6                	add	a3,a3,a7
a00025a8:	0116b7b3          	sltu	a5,a3,a7
a00025ac:	97c2                	add	a5,a5,a6
a00025ae:	ffe98413          	addi	s0,s3,-2
a00025b2:	973e                	add	a4,a4,a5
a00025b4:	40668333          	sub	t1,a3,t1
a00025b8:	40570733          	sub	a4,a4,t0
a00025bc:	0066b6b3          	sltu	a3,a3,t1
a00025c0:	8f15                	sub	a4,a4,a3
a00025c2:	57fd                	li	a5,-1
a00025c4:	0ee80763          	beq	a6,a4,a00026b2 <__divdf3+0x400>
a00025c8:	02a752b3          	divu	t0,a4,a0
a00025cc:	01035793          	srli	a5,t1,0x10
a00025d0:	02a77733          	remu	a4,a4,a0
a00025d4:	8696                	mv	a3,t0
a00025d6:	025f0e33          	mul	t3,t5,t0
a00025da:	0742                	slli	a4,a4,0x10
a00025dc:	8f5d                	or	a4,a4,a5
a00025de:	01c77c63          	bgeu	a4,t3,a00025f6 <__divdf3+0x344>
a00025e2:	9742                	add	a4,a4,a6
a00025e4:	fff28693          	addi	a3,t0,-1
a00025e8:	01076763          	bltu	a4,a6,a00025f6 <__divdf3+0x344>
a00025ec:	01c77563          	bgeu	a4,t3,a00025f6 <__divdf3+0x344>
a00025f0:	ffe28693          	addi	a3,t0,-2
a00025f4:	9742                	add	a4,a4,a6
a00025f6:	41c70733          	sub	a4,a4,t3
a00025fa:	02a75e33          	divu	t3,a4,a0
a00025fe:	01031793          	slli	a5,t1,0x10
a0002602:	83c1                	srli	a5,a5,0x10
a0002604:	02a77733          	remu	a4,a4,a0
a0002608:	03cf0f33          	mul	t5,t5,t3
a000260c:	0742                	slli	a4,a4,0x10
a000260e:	8f5d                	or	a4,a4,a5
a0002610:	87f2                	mv	a5,t3
a0002612:	01e77c63          	bgeu	a4,t5,a000262a <__divdf3+0x378>
a0002616:	9742                	add	a4,a4,a6
a0002618:	fffe0793          	addi	a5,t3,-1
a000261c:	01076763          	bltu	a4,a6,a000262a <__divdf3+0x378>
a0002620:	01e77563          	bgeu	a4,t5,a000262a <__divdf3+0x378>
a0002624:	ffee0793          	addi	a5,t3,-2
a0002628:	9742                	add	a4,a4,a6
a000262a:	06c2                	slli	a3,a3,0x10
a000262c:	8edd                	or	a3,a3,a5
a000262e:	01069793          	slli	a5,a3,0x10
a0002632:	83c1                	srli	a5,a5,0x10
a0002634:	0106d313          	srli	t1,a3,0x10
a0002638:	026f8e33          	mul	t3,t6,t1
a000263c:	41e70733          	sub	a4,a4,t5
a0002640:	02ff8fb3          	mul	t6,t6,a5
a0002644:	02fe8f33          	mul	t5,t4,a5
a0002648:	03d30eb3          	mul	t4,t1,t4
a000264c:	010f5793          	srli	a5,t5,0x10
a0002650:	9ff6                	add	t6,t6,t4
a0002652:	97fe                	add	a5,a5,t6
a0002654:	01d7f463          	bgeu	a5,t4,a000265c <__divdf3+0x3aa>
a0002658:	6541                	lui	a0,0x10
a000265a:	9e2a                	add	t3,t3,a0
a000265c:	0107d313          	srli	t1,a5,0x10
a0002660:	9372                	add	t1,t1,t3
a0002662:	6e41                	lui	t3,0x10
a0002664:	1e7d                	addi	t3,t3,-1
a0002666:	01c7f533          	and	a0,a5,t3
a000266a:	0542                	slli	a0,a0,0x10
a000266c:	01cf7f33          	and	t5,t5,t3
a0002670:	957a                	add	a0,a0,t5
a0002672:	00676663          	bltu	a4,t1,a000267e <__divdf3+0x3cc>
a0002676:	2c671263          	bne	a4,t1,a000293a <__divdf3+0x688>
a000267a:	87b6                	mv	a5,a3
a000267c:	c91d                	beqz	a0,a00026b2 <__divdf3+0x400>
a000267e:	9742                	add	a4,a4,a6
a0002680:	fff68793          	addi	a5,a3,-1 # 7fefffff <BOOT2_PT_ADDR+0x1ced83ff>
a0002684:	03076163          	bltu	a4,a6,a00026a6 <__divdf3+0x3f4>
a0002688:	00676663          	bltu	a4,t1,a0002694 <__divdf3+0x3e2>
a000268c:	2a671663          	bne	a4,t1,a0002938 <__divdf3+0x686>
a0002690:	00a8fd63          	bgeu	a7,a0,a00026aa <__divdf3+0x3f8>
a0002694:	ffe68793          	addi	a5,a3,-2
a0002698:	00189693          	slli	a3,a7,0x1
a000269c:	0116b8b3          	sltu	a7,a3,a7
a00026a0:	9846                	add	a6,a6,a7
a00026a2:	9742                	add	a4,a4,a6
a00026a4:	88b6                	mv	a7,a3
a00026a6:	00671463          	bne	a4,t1,a00026ae <__divdf3+0x3fc>
a00026aa:	00a88463          	beq	a7,a0,a00026b2 <__divdf3+0x400>
a00026ae:	0017e793          	ori	a5,a5,1
a00026b2:	3ff58813          	addi	a6,a1,1023
a00026b6:	11005863          	blez	a6,a00027c6 <__divdf3+0x514>
a00026ba:	0077f713          	andi	a4,a5,7
a00026be:	cf25                	beqz	a4,a0002736 <__divdf3+0x484>
a00026c0:	4709                	li	a4,2
a00026c2:	0014e493          	ori	s1,s1,1
a00026c6:	06e90763          	beq	s2,a4,a0002734 <__divdf3+0x482>
a00026ca:	470d                	li	a4,3
a00026cc:	06e90063          	beq	s2,a4,a000272c <__divdf3+0x47a>
a00026d0:	06091363          	bnez	s2,a0002736 <__divdf3+0x484>
a00026d4:	00f7f713          	andi	a4,a5,15
a00026d8:	4691                	li	a3,4
a00026da:	04d70e63          	beq	a4,a3,a0002736 <__divdf3+0x484>
a00026de:	00478713          	addi	a4,a5,4 # 80004 <nocache_min_size+0x7b004>
a00026e2:	00f737b3          	sltu	a5,a4,a5
a00026e6:	943e                	add	s0,s0,a5
a00026e8:	87ba                	mv	a5,a4
a00026ea:	a0b1                	j	a0002736 <__divdf3+0x484>
a00026ec:	15fd                	addi	a1,a1,-1
a00026ee:	4681                	li	a3,0
a00026f0:	bb45                	j	a00024a0 <__divdf3+0x1ee>
a00026f2:	8652                	mv	a2,s4
a00026f4:	845e                	mv	s0,s7
a00026f6:	87ce                	mv	a5,s3
a00026f8:	8762                	mv	a4,s8
a00026fa:	468d                	li	a3,3
a00026fc:	22d70763          	beq	a4,a3,a000292a <__divdf3+0x678>
a0002700:	4685                	li	a3,1
a0002702:	22d70163          	beq	a4,a3,a0002924 <__divdf3+0x672>
a0002706:	4689                	li	a3,2
a0002708:	fad715e3          	bne	a4,a3,a00026b2 <__divdf3+0x400>
a000270c:	a029                	j	a0002716 <__divdf3+0x464>
a000270e:	8656                	mv	a2,s5
a0002710:	b7ed                	j	a00026fa <__divdf3+0x448>
a0002712:	0084e493          	ori	s1,s1,8
a0002716:	4501                	li	a0,0
a0002718:	4781                	li	a5,0
a000271a:	7ff00713          	li	a4,2047
a000271e:	a091                	j	a0002762 <__divdf3+0x4b0>
a0002720:	00080437          	lui	s0,0x80
a0002724:	4781                	li	a5,0
a0002726:	4601                	li	a2,0
a0002728:	470d                	li	a4,3
a000272a:	bfc1                	j	a00026fa <__divdf3+0x448>
a000272c:	e609                	bnez	a2,a0002736 <__divdf3+0x484>
a000272e:	00878713          	addi	a4,a5,8
a0002732:	bf45                	j	a00026e2 <__divdf3+0x430>
a0002734:	fe6d                	bnez	a2,a000272e <__divdf3+0x47c>
a0002736:	01000737          	lui	a4,0x1000
a000273a:	8f61                	and	a4,a4,s0
a000273c:	c719                	beqz	a4,a000274a <__divdf3+0x498>
a000273e:	ff000737          	lui	a4,0xff000
a0002742:	177d                	addi	a4,a4,-1
a0002744:	8c79                	and	s0,s0,a4
a0002746:	40058813          	addi	a6,a1,1024
a000274a:	7fe00713          	li	a4,2046
a000274e:	05074663          	blt	a4,a6,a000279a <__divdf3+0x4e8>
a0002752:	0037d713          	srli	a4,a5,0x3
a0002756:	01d41793          	slli	a5,s0,0x1d
a000275a:	8fd9                	or	a5,a5,a4
a000275c:	00345513          	srli	a0,s0,0x3
a0002760:	8742                	mv	a4,a6
a0002762:	0752                	slli	a4,a4,0x14
a0002764:	7ff006b7          	lui	a3,0x7ff00
a0002768:	0532                	slli	a0,a0,0xc
a000276a:	8f75                	and	a4,a4,a3
a000276c:	8131                	srli	a0,a0,0xc
a000276e:	8d59                	or	a0,a0,a4
a0002770:	067e                	slli	a2,a2,0x1f
a0002772:	00c56733          	or	a4,a0,a2
a0002776:	85ba                	mv	a1,a4
a0002778:	853e                	mv	a0,a5
a000277a:	c099                	beqz	s1,a0002780 <__divdf3+0x4ce>
a000277c:	0014a073          	csrs	fflags,s1
a0002780:	50b2                	lw	ra,44(sp)
a0002782:	5422                	lw	s0,40(sp)
a0002784:	5492                	lw	s1,36(sp)
a0002786:	5902                	lw	s2,32(sp)
a0002788:	49f2                	lw	s3,28(sp)
a000278a:	4a62                	lw	s4,24(sp)
a000278c:	4ad2                	lw	s5,20(sp)
a000278e:	4b42                	lw	s6,16(sp)
a0002790:	4bb2                	lw	s7,12(sp)
a0002792:	4c22                	lw	s8,8(sp)
a0002794:	4c92                	lw	s9,4(sp)
a0002796:	6145                	addi	sp,sp,48
a0002798:	8082                	ret
a000279a:	4789                	li	a5,2
a000279c:	02f90363          	beq	s2,a5,a00027c2 <__divdf3+0x510>
a00027a0:	478d                	li	a5,3
a00027a2:	00f90863          	beq	s2,a5,a00027b2 <__divdf3+0x500>
a00027a6:	00091763          	bnez	s2,a00027b4 <__divdf3+0x502>
a00027aa:	4781                	li	a5,0
a00027ac:	7ff00713          	li	a4,2047
a00027b0:	a029                	j	a00027ba <__divdf3+0x508>
a00027b2:	de65                	beqz	a2,a00027aa <__divdf3+0x4f8>
a00027b4:	57fd                	li	a5,-1
a00027b6:	7fe00713          	li	a4,2046
a00027ba:	0054e493          	ori	s1,s1,5
a00027be:	853e                	mv	a0,a5
a00027c0:	b74d                	j	a0002762 <__divdf3+0x4b0>
a00027c2:	f665                	bnez	a2,a00027aa <__divdf3+0x4f8>
a00027c4:	bfc5                	j	a00027b4 <__divdf3+0x502>
a00027c6:	4705                	li	a4,1
a00027c8:	04081463          	bnez	a6,a0002810 <__divdf3+0x55e>
a00027cc:	0077f693          	andi	a3,a5,7
a00027d0:	8722                	mv	a4,s0
a00027d2:	ca9d                	beqz	a3,a0002808 <__divdf3+0x556>
a00027d4:	4689                	li	a3,2
a00027d6:	0014e493          	ori	s1,s1,1
a00027da:	02d90663          	beq	s2,a3,a0002806 <__divdf3+0x554>
a00027de:	468d                	li	a3,3
a00027e0:	00d90f63          	beq	s2,a3,a00027fe <__divdf3+0x54c>
a00027e4:	02091263          	bnez	s2,a0002808 <__divdf3+0x556>
a00027e8:	00f7f693          	andi	a3,a5,15
a00027ec:	4511                	li	a0,4
a00027ee:	00a68d63          	beq	a3,a0,a0002808 <__divdf3+0x556>
a00027f2:	ffc7b713          	sltiu	a4,a5,-4
a00027f6:	00174713          	xori	a4,a4,1
a00027fa:	9722                	add	a4,a4,s0
a00027fc:	a031                	j	a0002808 <__divdf3+0x556>
a00027fe:	e609                	bnez	a2,a0002808 <__divdf3+0x556>
a0002800:	ff87b713          	sltiu	a4,a5,-8
a0002804:	bfcd                	j	a00027f6 <__divdf3+0x544>
a0002806:	fe6d                	bnez	a2,a0002800 <__divdf3+0x54e>
a0002808:	8361                	srli	a4,a4,0x18
a000280a:	00174713          	xori	a4,a4,1
a000280e:	8b05                	andi	a4,a4,1
a0002810:	4505                	li	a0,1
a0002812:	41050533          	sub	a0,a0,a6
a0002816:	03800693          	li	a3,56
a000281a:	0ca6c263          	blt	a3,a0,a00028de <__divdf3+0x62c>
a000281e:	46fd                	li	a3,31
a0002820:	04a6ca63          	blt	a3,a0,a0002874 <__divdf3+0x5c2>
a0002824:	41e58593          	addi	a1,a1,1054
a0002828:	00a7d833          	srl	a6,a5,a0
a000282c:	00b416b3          	sll	a3,s0,a1
a0002830:	00b797b3          	sll	a5,a5,a1
a0002834:	0106e6b3          	or	a3,a3,a6
a0002838:	00f037b3          	snez	a5,a5
a000283c:	8fd5                	or	a5,a5,a3
a000283e:	00a45533          	srl	a0,s0,a0
a0002842:	0077f693          	andi	a3,a5,7
a0002846:	c2ad                	beqz	a3,a00028a8 <__divdf3+0x5f6>
a0002848:	4689                	li	a3,2
a000284a:	0014e493          	ori	s1,s1,1
a000284e:	04d90c63          	beq	s2,a3,a00028a6 <__divdf3+0x5f4>
a0002852:	468d                	li	a3,3
a0002854:	04d90563          	beq	s2,a3,a000289e <__divdf3+0x5ec>
a0002858:	04091863          	bnez	s2,a00028a8 <__divdf3+0x5f6>
a000285c:	00f7f693          	andi	a3,a5,15
a0002860:	4591                	li	a1,4
a0002862:	04b68363          	beq	a3,a1,a00028a8 <__divdf3+0x5f6>
a0002866:	00478693          	addi	a3,a5,4
a000286a:	00f6b7b3          	sltu	a5,a3,a5
a000286e:	953e                	add	a0,a0,a5
a0002870:	87b6                	mv	a5,a3
a0002872:	a81d                	j	a00028a8 <__divdf3+0x5f6>
a0002874:	5685                	li	a3,-31
a0002876:	410686b3          	sub	a3,a3,a6
a000287a:	02000893          	li	a7,32
a000287e:	00d456b3          	srl	a3,s0,a3
a0002882:	4801                	li	a6,0
a0002884:	01150663          	beq	a0,a7,a0002890 <__divdf3+0x5de>
a0002888:	43e58593          	addi	a1,a1,1086
a000288c:	00b41833          	sll	a6,s0,a1
a0002890:	00f867b3          	or	a5,a6,a5
a0002894:	00f037b3          	snez	a5,a5
a0002898:	8fd5                	or	a5,a5,a3
a000289a:	4501                	li	a0,0
a000289c:	b75d                	j	a0002842 <__divdf3+0x590>
a000289e:	e609                	bnez	a2,a00028a8 <__divdf3+0x5f6>
a00028a0:	00878693          	addi	a3,a5,8
a00028a4:	b7d9                	j	a000286a <__divdf3+0x5b8>
a00028a6:	fe6d                	bnez	a2,a00028a0 <__divdf3+0x5ee>
a00028a8:	008006b7          	lui	a3,0x800
a00028ac:	8ee9                	and	a3,a3,a0
a00028ae:	ca81                	beqz	a3,a00028be <__divdf3+0x60c>
a00028b0:	0014e493          	ori	s1,s1,1
a00028b4:	4501                	li	a0,0
a00028b6:	4781                	li	a5,0
a00028b8:	e305                	bnez	a4,a00028d8 <__divdf3+0x626>
a00028ba:	4705                	li	a4,1
a00028bc:	b55d                	j	a0002762 <__divdf3+0x4b0>
a00028be:	0037d693          	srli	a3,a5,0x3
a00028c2:	01d51793          	slli	a5,a0,0x1d
a00028c6:	8fd5                	or	a5,a5,a3
a00028c8:	810d                	srli	a0,a0,0x3
a00028ca:	e8070ce3          	beqz	a4,a0002762 <__divdf3+0x4b0>
a00028ce:	0014f713          	andi	a4,s1,1
a00028d2:	e80708e3          	beqz	a4,a0002762 <__divdf3+0x4b0>
a00028d6:	4701                	li	a4,0
a00028d8:	0024e493          	ori	s1,s1,2
a00028dc:	b559                	j	a0002762 <__divdf3+0x4b0>
a00028de:	8fc1                	or	a5,a5,s0
a00028e0:	cf91                	beqz	a5,a00028fc <__divdf3+0x64a>
a00028e2:	4789                	li	a5,2
a00028e4:	0014e493          	ori	s1,s1,1
a00028e8:	02f90363          	beq	s2,a5,a000290e <__divdf3+0x65c>
a00028ec:	478d                	li	a5,3
a00028ee:	00f90c63          	beq	s2,a5,a0002906 <__divdf3+0x654>
a00028f2:	4785                	li	a5,1
a00028f4:	00091363          	bnez	s2,a00028fa <__divdf3+0x648>
a00028f8:	4795                	li	a5,5
a00028fa:	838d                	srli	a5,a5,0x3
a00028fc:	0024e493          	ori	s1,s1,2
a0002900:	4501                	li	a0,0
a0002902:	4701                	li	a4,0
a0002904:	bdb9                	j	a0002762 <__divdf3+0x4b0>
a0002906:	47a5                	li	a5,9
a0002908:	da6d                	beqz	a2,a00028fa <__divdf3+0x648>
a000290a:	4785                	li	a5,1
a000290c:	b7fd                	j	a00028fa <__divdf3+0x648>
a000290e:	47a5                	li	a5,9
a0002910:	f66d                	bnez	a2,a00028fa <__divdf3+0x648>
a0002912:	bfe5                	j	a000290a <__divdf3+0x658>
a0002914:	00080537          	lui	a0,0x80
a0002918:	4781                	li	a5,0
a000291a:	7ff00713          	li	a4,2047
a000291e:	4601                	li	a2,0
a0002920:	44c1                	li	s1,16
a0002922:	b581                	j	a0002762 <__divdf3+0x4b0>
a0002924:	4501                	li	a0,0
a0002926:	4781                	li	a5,0
a0002928:	bfe9                	j	a0002902 <__divdf3+0x650>
a000292a:	00080537          	lui	a0,0x80
a000292e:	4781                	li	a5,0
a0002930:	7ff00713          	li	a4,2047
a0002934:	4601                	li	a2,0
a0002936:	b535                	j	a0002762 <__divdf3+0x4b0>
a0002938:	86be                	mv	a3,a5
a000293a:	87b6                	mv	a5,a3
a000293c:	bb8d                	j	a00026ae <__divdf3+0x3fc>

a000293e <__eqdf2>:
a000293e:	882a                	mv	a6,a0
a0002940:	002027f3          	frrm	a5
a0002944:	001007b7          	lui	a5,0x100
a0002948:	0145d893          	srli	a7,a1,0x14
a000294c:	17fd                	addi	a5,a5,-1
a000294e:	0146d313          	srli	t1,a3,0x14
a0002952:	8e2a                	mv	t3,a0
a0002954:	7ff8f893          	andi	a7,a7,2047
a0002958:	7ff00513          	li	a0,2047
a000295c:	00b7f733          	and	a4,a5,a1
a0002960:	8eb2                	mv	t4,a2
a0002962:	8ff5                	and	a5,a5,a3
a0002964:	81fd                	srli	a1,a1,0x1f
a0002966:	7ff37313          	andi	t1,t1,2047
a000296a:	82fd                	srli	a3,a3,0x1f
a000296c:	00a89863          	bne	a7,a0,a000297c <__eqdf2+0x3e>
a0002970:	01076533          	or	a0,a4,a6
a0002974:	e531                	bnez	a0,a00029c0 <__eqdf2+0x82>
a0002976:	07131463          	bne	t1,a7,a00029de <__eqdf2+0xa0>
a000297a:	a019                	j	a0002980 <__eqdf2+0x42>
a000297c:	00a31563          	bne	t1,a0,a0002986 <__eqdf2+0x48>
a0002980:	00c7e533          	or	a0,a5,a2
a0002984:	e515                	bnez	a0,a00029b0 <__eqdf2+0x72>
a0002986:	4505                	li	a0,1
a0002988:	04689c63          	bne	a7,t1,a00029e0 <__eqdf2+0xa2>
a000298c:	04f71a63          	bne	a4,a5,a00029e0 <__eqdf2+0xa2>
a0002990:	05de1863          	bne	t3,t4,a00029e0 <__eqdf2+0xa2>
a0002994:	00d58c63          	beq	a1,a3,a00029ac <__eqdf2+0x6e>
a0002998:	04089463          	bnez	a7,a00029e0 <__eqdf2+0xa2>
a000299c:	01076733          	or	a4,a4,a6
a00029a0:	00e03533          	snez	a0,a4
a00029a4:	8082                	ret
a00029a6:	00186073          	csrsi	fflags,16
a00029aa:	a815                	j	a00029de <__eqdf2+0xa0>
a00029ac:	4501                	li	a0,0
a00029ae:	8082                	ret
a00029b0:	7ff00693          	li	a3,2047
a00029b4:	02d89163          	bne	a7,a3,a00029d6 <__eqdf2+0x98>
a00029b8:	01076833          	or	a6,a4,a6
a00029bc:	00080d63          	beqz	a6,a00029d6 <__eqdf2+0x98>
a00029c0:	000806b7          	lui	a3,0x80
a00029c4:	8f75                	and	a4,a4,a3
a00029c6:	d365                	beqz	a4,a00029a6 <__eqdf2+0x68>
a00029c8:	7ff00713          	li	a4,2047
a00029cc:	4505                	li	a0,1
a00029ce:	00e31963          	bne	t1,a4,a00029e0 <__eqdf2+0xa2>
a00029d2:	8e5d                	or	a2,a2,a5
a00029d4:	c611                	beqz	a2,a00029e0 <__eqdf2+0xa2>
a00029d6:	00080737          	lui	a4,0x80
a00029da:	8ff9                	and	a5,a5,a4
a00029dc:	d7e9                	beqz	a5,a00029a6 <__eqdf2+0x68>
a00029de:	4505                	li	a0,1
a00029e0:	8082                	ret

a00029e2 <__gedf2>:
a00029e2:	87aa                	mv	a5,a0
a00029e4:	00202773          	frrm	a4
a00029e8:	00100737          	lui	a4,0x100
a00029ec:	177d                	addi	a4,a4,-1
a00029ee:	0145d813          	srli	a6,a1,0x14
a00029f2:	00b778b3          	and	a7,a4,a1
a00029f6:	832a                	mv	t1,a0
a00029f8:	7ff87813          	andi	a6,a6,2047
a00029fc:	01f5d513          	srli	a0,a1,0x1f
a0002a00:	7ff00e93          	li	t4,2047
a0002a04:	0146d593          	srli	a1,a3,0x14
a0002a08:	8f75                	and	a4,a4,a3
a0002a0a:	8e32                	mv	t3,a2
a0002a0c:	7ff5f593          	andi	a1,a1,2047
a0002a10:	82fd                	srli	a3,a3,0x1f
a0002a12:	01d81a63          	bne	a6,t4,a0002a26 <__gedf2+0x44>
a0002a16:	00f8eeb3          	or	t4,a7,a5
a0002a1a:	060e8963          	beqz	t4,a0002a8c <__gedf2+0xaa>
a0002a1e:	00186073          	csrsi	fflags,16
a0002a22:	5579                	li	a0,-2
a0002a24:	8082                	ret
a0002a26:	01d59663          	bne	a1,t4,a0002a32 <__gedf2+0x50>
a0002a2a:	00c76eb3          	or	t4,a4,a2
a0002a2e:	fe0e98e3          	bnez	t4,a0002a1e <__gedf2+0x3c>
a0002a32:	04081f63          	bnez	a6,a0002a90 <__gedf2+0xae>
a0002a36:	00f8e7b3          	or	a5,a7,a5
a0002a3a:	0017b793          	seqz	a5,a5
a0002a3e:	e199                	bnez	a1,a0002a44 <__gedf2+0x62>
a0002a40:	8e59                	or	a2,a2,a4
a0002a42:	c221                	beqz	a2,a0002a82 <__gedf2+0xa0>
a0002a44:	00079a63          	bnez	a5,a0002a58 <__gedf2+0x76>
a0002a48:	00d51463          	bne	a0,a3,a0002a50 <__gedf2+0x6e>
a0002a4c:	0105da63          	bge	a1,a6,a0002a60 <__gedf2+0x7e>
a0002a50:	02050763          	beqz	a0,a0002a7e <__gedf2+0x9c>
a0002a54:	557d                	li	a0,-1
a0002a56:	8082                	ret
a0002a58:	557d                	li	a0,-1
a0002a5a:	c699                	beqz	a3,a0002a68 <__gedf2+0x86>
a0002a5c:	8536                	mv	a0,a3
a0002a5e:	8082                	ret
a0002a60:	00b85563          	bge	a6,a1,a0002a6a <__gedf2+0x88>
a0002a64:	fe0508e3          	beqz	a0,a0002a54 <__gedf2+0x72>
a0002a68:	8082                	ret
a0002a6a:	ff1763e3          	bltu	a4,a7,a0002a50 <__gedf2+0x6e>
a0002a6e:	00e89c63          	bne	a7,a4,a0002a86 <__gedf2+0xa4>
a0002a72:	fc6e6fe3          	bltu	t3,t1,a0002a50 <__gedf2+0x6e>
a0002a76:	ffc367e3          	bltu	t1,t3,a0002a64 <__gedf2+0x82>
a0002a7a:	4501                	li	a0,0
a0002a7c:	8082                	ret
a0002a7e:	4505                	li	a0,1
a0002a80:	8082                	ret
a0002a82:	ffe5                	bnez	a5,a0002a7a <__gedf2+0x98>
a0002a84:	b7f1                	j	a0002a50 <__gedf2+0x6e>
a0002a86:	fce8efe3          	bltu	a7,a4,a0002a64 <__gedf2+0x82>
a0002a8a:	bfc5                	j	a0002a7a <__gedf2+0x98>
a0002a8c:	f9058fe3          	beq	a1,a6,a0002a2a <__gedf2+0x48>
a0002a90:	fa059ce3          	bnez	a1,a0002a48 <__gedf2+0x66>
a0002a94:	4781                	li	a5,0
a0002a96:	b76d                	j	a0002a40 <__gedf2+0x5e>

a0002a98 <__ledf2>:
a0002a98:	87aa                	mv	a5,a0
a0002a9a:	00202773          	frrm	a4
a0002a9e:	00100737          	lui	a4,0x100
a0002aa2:	177d                	addi	a4,a4,-1
a0002aa4:	0145d813          	srli	a6,a1,0x14
a0002aa8:	00b778b3          	and	a7,a4,a1
a0002aac:	832a                	mv	t1,a0
a0002aae:	7ff87813          	andi	a6,a6,2047
a0002ab2:	01f5d513          	srli	a0,a1,0x1f
a0002ab6:	7ff00e93          	li	t4,2047
a0002aba:	0146d593          	srli	a1,a3,0x14
a0002abe:	8f75                	and	a4,a4,a3
a0002ac0:	8e32                	mv	t3,a2
a0002ac2:	7ff5f593          	andi	a1,a1,2047
a0002ac6:	82fd                	srli	a3,a3,0x1f
a0002ac8:	01d81a63          	bne	a6,t4,a0002adc <__ledf2+0x44>
a0002acc:	00f8eeb3          	or	t4,a7,a5
a0002ad0:	060e8963          	beqz	t4,a0002b42 <__ledf2+0xaa>
a0002ad4:	00186073          	csrsi	fflags,16
a0002ad8:	4509                	li	a0,2
a0002ada:	8082                	ret
a0002adc:	01d59663          	bne	a1,t4,a0002ae8 <__ledf2+0x50>
a0002ae0:	00c76eb3          	or	t4,a4,a2
a0002ae4:	fe0e98e3          	bnez	t4,a0002ad4 <__ledf2+0x3c>
a0002ae8:	04081f63          	bnez	a6,a0002b46 <__ledf2+0xae>
a0002aec:	00f8e7b3          	or	a5,a7,a5
a0002af0:	0017b793          	seqz	a5,a5
a0002af4:	e199                	bnez	a1,a0002afa <__ledf2+0x62>
a0002af6:	8e59                	or	a2,a2,a4
a0002af8:	c221                	beqz	a2,a0002b38 <__ledf2+0xa0>
a0002afa:	00079a63          	bnez	a5,a0002b0e <__ledf2+0x76>
a0002afe:	00d51463          	bne	a0,a3,a0002b06 <__ledf2+0x6e>
a0002b02:	0105da63          	bge	a1,a6,a0002b16 <__ledf2+0x7e>
a0002b06:	02050763          	beqz	a0,a0002b34 <__ledf2+0x9c>
a0002b0a:	557d                	li	a0,-1
a0002b0c:	8082                	ret
a0002b0e:	557d                	li	a0,-1
a0002b10:	c699                	beqz	a3,a0002b1e <__ledf2+0x86>
a0002b12:	8536                	mv	a0,a3
a0002b14:	8082                	ret
a0002b16:	00b85563          	bge	a6,a1,a0002b20 <__ledf2+0x88>
a0002b1a:	fe0508e3          	beqz	a0,a0002b0a <__ledf2+0x72>
a0002b1e:	8082                	ret
a0002b20:	ff1763e3          	bltu	a4,a7,a0002b06 <__ledf2+0x6e>
a0002b24:	00e89c63          	bne	a7,a4,a0002b3c <__ledf2+0xa4>
a0002b28:	fc6e6fe3          	bltu	t3,t1,a0002b06 <__ledf2+0x6e>
a0002b2c:	ffc367e3          	bltu	t1,t3,a0002b1a <__ledf2+0x82>
a0002b30:	4501                	li	a0,0
a0002b32:	8082                	ret
a0002b34:	4505                	li	a0,1
a0002b36:	8082                	ret
a0002b38:	ffe5                	bnez	a5,a0002b30 <__ledf2+0x98>
a0002b3a:	b7f1                	j	a0002b06 <__ledf2+0x6e>
a0002b3c:	fce8efe3          	bltu	a7,a4,a0002b1a <__ledf2+0x82>
a0002b40:	bfc5                	j	a0002b30 <__ledf2+0x98>
a0002b42:	f9058fe3          	beq	a1,a6,a0002ae0 <__ledf2+0x48>
a0002b46:	fa059ce3          	bnez	a1,a0002afe <__ledf2+0x66>
a0002b4a:	4781                	li	a5,0
a0002b4c:	b76d                	j	a0002af6 <__ledf2+0x5e>

a0002b4e <__muldf3>:
a0002b4e:	7179                	addi	sp,sp,-48
a0002b50:	d422                	sw	s0,40(sp)
a0002b52:	ca56                	sw	s5,20(sp)
a0002b54:	c266                	sw	s9,4(sp)
a0002b56:	d606                	sw	ra,44(sp)
a0002b58:	d226                	sw	s1,36(sp)
a0002b5a:	d04a                	sw	s2,32(sp)
a0002b5c:	ce4e                	sw	s3,28(sp)
a0002b5e:	cc52                	sw	s4,24(sp)
a0002b60:	c85a                	sw	s6,16(sp)
a0002b62:	c65e                	sw	s7,12(sp)
a0002b64:	c462                	sw	s8,8(sp)
a0002b66:	842a                	mv	s0,a0
a0002b68:	8cb2                	mv	s9,a2
a0002b6a:	8ab6                	mv	s5,a3
a0002b6c:	00202973          	frrm	s2
a0002b70:	0145db93          	srli	s7,a1,0x14
a0002b74:	00c59993          	slli	s3,a1,0xc
a0002b78:	7ffbfb93          	andi	s7,s7,2047
a0002b7c:	00c9d993          	srli	s3,s3,0xc
a0002b80:	01f5db13          	srli	s6,a1,0x1f
a0002b84:	020b8663          	beqz	s7,a0002bb0 <__muldf3+0x62>
a0002b88:	7ff00793          	li	a5,2047
a0002b8c:	06fb8b63          	beq	s7,a5,a0002c02 <__muldf3+0xb4>
a0002b90:	01d55793          	srli	a5,a0,0x1d
a0002b94:	098e                	slli	s3,s3,0x3
a0002b96:	0137e9b3          	or	s3,a5,s3
a0002b9a:	008007b7          	lui	a5,0x800
a0002b9e:	00f9e9b3          	or	s3,s3,a5
a0002ba2:	00351a13          	slli	s4,a0,0x3
a0002ba6:	c01b8b93          	addi	s7,s7,-1023
a0002baa:	4c01                	li	s8,0
a0002bac:	4481                	li	s1,0
a0002bae:	a0bd                	j	a0002c1c <__muldf3+0xce>
a0002bb0:	00a9e7b3          	or	a5,s3,a0
a0002bb4:	c7e1                	beqz	a5,a0002c7c <__muldf3+0x12e>
a0002bb6:	02098b63          	beqz	s3,a0002bec <__muldf3+0x9e>
a0002bba:	854e                	mv	a0,s3
a0002bbc:	844fe0ef          	jal	ra,a0000c00 <__clzsi2>
a0002bc0:	ff550713          	addi	a4,a0,-11 # 7fff5 <nocache_min_size+0x7aff5>
a0002bc4:	47f1                	li	a5,28
a0002bc6:	02e7c863          	blt	a5,a4,a0002bf6 <__muldf3+0xa8>
a0002bca:	47f5                	li	a5,29
a0002bcc:	ff850a13          	addi	s4,a0,-8
a0002bd0:	8f99                	sub	a5,a5,a4
a0002bd2:	014999b3          	sll	s3,s3,s4
a0002bd6:	00f457b3          	srl	a5,s0,a5
a0002bda:	0137e9b3          	or	s3,a5,s3
a0002bde:	01441a33          	sll	s4,s0,s4
a0002be2:	c0d00b93          	li	s7,-1011
a0002be6:	40ab8bb3          	sub	s7,s7,a0
a0002bea:	b7c1                	j	a0002baa <__muldf3+0x5c>
a0002bec:	814fe0ef          	jal	ra,a0000c00 <__clzsi2>
a0002bf0:	02050513          	addi	a0,a0,32
a0002bf4:	b7f1                	j	a0002bc0 <__muldf3+0x72>
a0002bf6:	fd850993          	addi	s3,a0,-40
a0002bfa:	013419b3          	sll	s3,s0,s3
a0002bfe:	4a01                	li	s4,0
a0002c00:	b7cd                	j	a0002be2 <__muldf3+0x94>
a0002c02:	00a9e433          	or	s0,s3,a0
a0002c06:	c041                	beqz	s0,a0002c86 <__muldf3+0x138>
a0002c08:	000807b7          	lui	a5,0x80
a0002c0c:	00f9f7b3          	and	a5,s3,a5
a0002c10:	8a2a                	mv	s4,a0
a0002c12:	7ff00b93          	li	s7,2047
a0002c16:	4c0d                	li	s8,3
a0002c18:	44c1                	li	s1,16
a0002c1a:	fbc9                	bnez	a5,a0002bac <__muldf3+0x5e>
a0002c1c:	014ad513          	srli	a0,s5,0x14
a0002c20:	00ca9413          	slli	s0,s5,0xc
a0002c24:	7ff57513          	andi	a0,a0,2047
a0002c28:	87e6                	mv	a5,s9
a0002c2a:	8031                	srli	s0,s0,0xc
a0002c2c:	01fada93          	srli	s5,s5,0x1f
a0002c30:	c12d                	beqz	a0,a0002c92 <__muldf3+0x144>
a0002c32:	7ff00713          	li	a4,2047
a0002c36:	0ae50763          	beq	a0,a4,a0002ce4 <__muldf3+0x196>
a0002c3a:	01dcd793          	srli	a5,s9,0x1d
a0002c3e:	040e                	slli	s0,s0,0x3
a0002c40:	8c5d                	or	s0,s0,a5
a0002c42:	008007b7          	lui	a5,0x800
a0002c46:	8c5d                	or	s0,s0,a5
a0002c48:	c0150513          	addi	a0,a0,-1023
a0002c4c:	003c9793          	slli	a5,s9,0x3
a0002c50:	4701                	li	a4,0
a0002c52:	002c1693          	slli	a3,s8,0x2
a0002c56:	8ed9                	or	a3,a3,a4
a0002c58:	9baa                	add	s7,s7,a0
a0002c5a:	16fd                	addi	a3,a3,-1
a0002c5c:	4639                	li	a2,14
a0002c5e:	015b45b3          	xor	a1,s6,s5
a0002c62:	001b8513          	addi	a0,s7,1
a0002c66:	0ed66b63          	bltu	a2,a3,a0002d5c <__muldf3+0x20e>
a0002c6a:	0000a617          	auipc	a2,0xa
a0002c6e:	9ca60613          	addi	a2,a2,-1590 # a000c634 <__clz_tab+0x13c>
a0002c72:	068a                	slli	a3,a3,0x2
a0002c74:	96b2                	add	a3,a3,a2
a0002c76:	4294                	lw	a3,0(a3)
a0002c78:	96b2                	add	a3,a3,a2
a0002c7a:	8682                	jr	a3
a0002c7c:	4981                	li	s3,0
a0002c7e:	4a01                	li	s4,0
a0002c80:	4b81                	li	s7,0
a0002c82:	4c05                	li	s8,1
a0002c84:	b725                	j	a0002bac <__muldf3+0x5e>
a0002c86:	4981                	li	s3,0
a0002c88:	4a01                	li	s4,0
a0002c8a:	7ff00b93          	li	s7,2047
a0002c8e:	4c09                	li	s8,2
a0002c90:	bf31                	j	a0002bac <__muldf3+0x5e>
a0002c92:	019467b3          	or	a5,s0,s9
a0002c96:	c3bd                	beqz	a5,a0002cfc <__muldf3+0x1ae>
a0002c98:	02040a63          	beqz	s0,a0002ccc <__muldf3+0x17e>
a0002c9c:	8522                	mv	a0,s0
a0002c9e:	f63fd0ef          	jal	ra,a0000c00 <__clzsi2>
a0002ca2:	ff550693          	addi	a3,a0,-11
a0002ca6:	47f1                	li	a5,28
a0002ca8:	02d7c863          	blt	a5,a3,a0002cd8 <__muldf3+0x18a>
a0002cac:	4775                	li	a4,29
a0002cae:	ff850793          	addi	a5,a0,-8
a0002cb2:	8f15                	sub	a4,a4,a3
a0002cb4:	00f41433          	sll	s0,s0,a5
a0002cb8:	00ecd733          	srl	a4,s9,a4
a0002cbc:	8c59                	or	s0,s0,a4
a0002cbe:	00fc97b3          	sll	a5,s9,a5
a0002cc2:	c0d00713          	li	a4,-1011
a0002cc6:	40a70533          	sub	a0,a4,a0
a0002cca:	b759                	j	a0002c50 <__muldf3+0x102>
a0002ccc:	8566                	mv	a0,s9
a0002cce:	f33fd0ef          	jal	ra,a0000c00 <__clzsi2>
a0002cd2:	02050513          	addi	a0,a0,32
a0002cd6:	b7f1                	j	a0002ca2 <__muldf3+0x154>
a0002cd8:	fd850413          	addi	s0,a0,-40
a0002cdc:	008c9433          	sll	s0,s9,s0
a0002ce0:	4781                	li	a5,0
a0002ce2:	b7c5                	j	a0002cc2 <__muldf3+0x174>
a0002ce4:	01946633          	or	a2,s0,s9
a0002ce8:	ce19                	beqz	a2,a0002d06 <__muldf3+0x1b8>
a0002cea:	00080737          	lui	a4,0x80
a0002cee:	8f61                	and	a4,a4,s0
a0002cf0:	7ff00513          	li	a0,2047
a0002cf4:	ef19                	bnez	a4,a0002d12 <__muldf3+0x1c4>
a0002cf6:	470d                	li	a4,3
a0002cf8:	44c1                	li	s1,16
a0002cfa:	bfa1                	j	a0002c52 <__muldf3+0x104>
a0002cfc:	4401                	li	s0,0
a0002cfe:	4781                	li	a5,0
a0002d00:	4501                	li	a0,0
a0002d02:	4705                	li	a4,1
a0002d04:	b7b9                	j	a0002c52 <__muldf3+0x104>
a0002d06:	4401                	li	s0,0
a0002d08:	4781                	li	a5,0
a0002d0a:	7ff00513          	li	a0,2047
a0002d0e:	4709                	li	a4,2
a0002d10:	b789                	j	a0002c52 <__muldf3+0x104>
a0002d12:	470d                	li	a4,3
a0002d14:	bf3d                	j	a0002c52 <__muldf3+0x104>
a0002d16:	00080437          	lui	s0,0x80
a0002d1a:	4781                	li	a5,0
a0002d1c:	7ff00713          	li	a4,2047
a0002d20:	4581                	li	a1,0
a0002d22:	44c1                	li	s1,16
a0002d24:	0752                	slli	a4,a4,0x14
a0002d26:	7ff006b7          	lui	a3,0x7ff00
a0002d2a:	0432                	slli	s0,s0,0xc
a0002d2c:	8f75                	and	a4,a4,a3
a0002d2e:	8031                	srli	s0,s0,0xc
a0002d30:	05fe                	slli	a1,a1,0x1f
a0002d32:	8c59                	or	s0,s0,a4
a0002d34:	00b46733          	or	a4,s0,a1
a0002d38:	853e                	mv	a0,a5
a0002d3a:	85ba                	mv	a1,a4
a0002d3c:	c099                	beqz	s1,a0002d42 <__muldf3+0x1f4>
a0002d3e:	0014a073          	csrs	fflags,s1
a0002d42:	50b2                	lw	ra,44(sp)
a0002d44:	5422                	lw	s0,40(sp)
a0002d46:	5492                	lw	s1,36(sp)
a0002d48:	5902                	lw	s2,32(sp)
a0002d4a:	49f2                	lw	s3,28(sp)
a0002d4c:	4a62                	lw	s4,24(sp)
a0002d4e:	4ad2                	lw	s5,20(sp)
a0002d50:	4b42                	lw	s6,16(sp)
a0002d52:	4bb2                	lw	s7,12(sp)
a0002d54:	4c22                	lw	s8,8(sp)
a0002d56:	4c92                	lw	s9,4(sp)
a0002d58:	6145                	addi	sp,sp,48
a0002d5a:	8082                	ret
a0002d5c:	6ec1                	lui	t4,0x10
a0002d5e:	fffe8e13          	addi	t3,t4,-1 # ffff <nocache_min_size+0xafff>
a0002d62:	010a5713          	srli	a4,s4,0x10
a0002d66:	0107d893          	srli	a7,a5,0x10
a0002d6a:	01ca7a33          	and	s4,s4,t3
a0002d6e:	01c7f7b3          	and	a5,a5,t3
a0002d72:	03488833          	mul	a6,a7,s4
a0002d76:	034786b3          	mul	a3,a5,s4
a0002d7a:	02f70f33          	mul	t5,a4,a5
a0002d7e:	01e80333          	add	t1,a6,t5
a0002d82:	0106d813          	srli	a6,a3,0x10
a0002d86:	981a                	add	a6,a6,t1
a0002d88:	03170633          	mul	a2,a4,a7
a0002d8c:	01e87363          	bgeu	a6,t5,a0002d92 <__muldf3+0x244>
a0002d90:	9676                	add	a2,a2,t4
a0002d92:	01085f93          	srli	t6,a6,0x10
a0002d96:	01c87833          	and	a6,a6,t3
a0002d9a:	01c6f6b3          	and	a3,a3,t3
a0002d9e:	01045e93          	srli	t4,s0,0x10
a0002da2:	01c47e33          	and	t3,s0,t3
a0002da6:	0842                	slli	a6,a6,0x10
a0002da8:	9836                	add	a6,a6,a3
a0002daa:	03c70f33          	mul	t5,a4,t3
a0002dae:	03ca06b3          	mul	a3,s4,t3
a0002db2:	034e8a33          	mul	s4,t4,s4
a0002db6:	01ea0333          	add	t1,s4,t5
a0002dba:	0106da13          	srli	s4,a3,0x10
a0002dbe:	9a1a                	add	s4,s4,t1
a0002dc0:	03d70733          	mul	a4,a4,t4
a0002dc4:	01ea7463          	bgeu	s4,t5,a0002dcc <__muldf3+0x27e>
a0002dc8:	6341                	lui	t1,0x10
a0002dca:	971a                	add	a4,a4,t1
a0002dcc:	010a5313          	srli	t1,s4,0x10
a0002dd0:	933a                	add	t1,t1,a4
a0002dd2:	6741                	lui	a4,0x10
a0002dd4:	fff70f13          	addi	t5,a4,-1 # ffff <nocache_min_size+0xafff>
a0002dd8:	01ea7a33          	and	s4,s4,t5
a0002ddc:	01e6f6b3          	and	a3,a3,t5
a0002de0:	0109d413          	srli	s0,s3,0x10
a0002de4:	0a42                	slli	s4,s4,0x10
a0002de6:	01e9f9b3          	and	s3,s3,t5
a0002dea:	03378f33          	mul	t5,a5,s3
a0002dee:	9a36                	add	s4,s4,a3
a0002df0:	9fd2                	add	t6,t6,s4
a0002df2:	033886b3          	mul	a3,a7,s3
a0002df6:	02f407b3          	mul	a5,s0,a5
a0002dfa:	028882b3          	mul	t0,a7,s0
a0002dfe:	00f688b3          	add	a7,a3,a5
a0002e02:	010f5693          	srli	a3,t5,0x10
a0002e06:	96c6                	add	a3,a3,a7
a0002e08:	00f6f363          	bgeu	a3,a5,a0002e0e <__muldf3+0x2c0>
a0002e0c:	92ba                	add	t0,t0,a4
a0002e0e:	6741                	lui	a4,0x10
a0002e10:	fff70793          	addi	a5,a4,-1 # ffff <nocache_min_size+0xafff>
a0002e14:	00ff7f33          	and	t5,t5,a5
a0002e18:	0106d893          	srli	a7,a3,0x10
a0002e1c:	8efd                	and	a3,a3,a5
a0002e1e:	03c987b3          	mul	a5,s3,t3
a0002e22:	06c2                	slli	a3,a3,0x10
a0002e24:	96fa                	add	a3,a3,t5
a0002e26:	9896                	add	a7,a7,t0
a0002e28:	03c40e33          	mul	t3,s0,t3
a0002e2c:	033e89b3          	mul	s3,t4,s3
a0002e30:	028e8f33          	mul	t5,t4,s0
a0002e34:	99f2                	add	s3,s3,t3
a0002e36:	0107d413          	srli	s0,a5,0x10
a0002e3a:	99a2                	add	s3,s3,s0
a0002e3c:	01c9f363          	bgeu	s3,t3,a0002e42 <__muldf3+0x2f4>
a0002e40:	9f3a                	add	t5,t5,a4
a0002e42:	6e41                	lui	t3,0x10
a0002e44:	1e7d                	addi	t3,t3,-1
a0002e46:	01c9f733          	and	a4,s3,t3
a0002e4a:	01c7f7b3          	and	a5,a5,t3
a0002e4e:	0742                	slli	a4,a4,0x10
a0002e50:	967e                	add	a2,a2,t6
a0002e52:	973e                	add	a4,a4,a5
a0002e54:	01463a33          	sltu	s4,a2,s4
a0002e58:	971a                	add	a4,a4,t1
a0002e5a:	01470433          	add	s0,a4,s4
a0002e5e:	9636                	add	a2,a2,a3
a0002e60:	00d636b3          	sltu	a3,a2,a3
a0002e64:	01140e33          	add	t3,s0,a7
a0002e68:	00de0eb3          	add	t4,t3,a3
a0002e6c:	00673733          	sltu	a4,a4,t1
a0002e70:	01443433          	sltu	s0,s0,s4
a0002e74:	8c59                	or	s0,s0,a4
a0002e76:	00deb6b3          	sltu	a3,t4,a3
a0002e7a:	0109d993          	srli	s3,s3,0x10
a0002e7e:	011e38b3          	sltu	a7,t3,a7
a0002e82:	944e                	add	s0,s0,s3
a0002e84:	00d8e6b3          	or	a3,a7,a3
a0002e88:	9436                	add	s0,s0,a3
a0002e8a:	947a                	add	s0,s0,t5
a0002e8c:	017ed793          	srli	a5,t4,0x17
a0002e90:	0426                	slli	s0,s0,0x9
a0002e92:	8c5d                	or	s0,s0,a5
a0002e94:	00961793          	slli	a5,a2,0x9
a0002e98:	0107e7b3          	or	a5,a5,a6
a0002e9c:	00f037b3          	snez	a5,a5
a0002ea0:	825d                	srli	a2,a2,0x17
a0002ea2:	01000737          	lui	a4,0x1000
a0002ea6:	8fd1                	or	a5,a5,a2
a0002ea8:	0ea6                	slli	t4,t4,0x9
a0002eaa:	8f61                	and	a4,a4,s0
a0002eac:	01d7e7b3          	or	a5,a5,t4
a0002eb0:	cb25                	beqz	a4,a0002f20 <__muldf3+0x3d2>
a0002eb2:	0017d713          	srli	a4,a5,0x1
a0002eb6:	8b85                	andi	a5,a5,1
a0002eb8:	8fd9                	or	a5,a5,a4
a0002eba:	01f41713          	slli	a4,s0,0x1f
a0002ebe:	8fd9                	or	a5,a5,a4
a0002ec0:	8005                	srli	s0,s0,0x1
a0002ec2:	3ff50813          	addi	a6,a0,1023
a0002ec6:	0d005063          	blez	a6,a0002f86 <__muldf3+0x438>
a0002eca:	0077f713          	andi	a4,a5,7
a0002ece:	c325                	beqz	a4,a0002f2e <__muldf3+0x3e0>
a0002ed0:	4709                	li	a4,2
a0002ed2:	0014e493          	ori	s1,s1,1
a0002ed6:	04e90b63          	beq	s2,a4,a0002f2c <__muldf3+0x3de>
a0002eda:	470d                	li	a4,3
a0002edc:	04e90463          	beq	s2,a4,a0002f24 <__muldf3+0x3d6>
a0002ee0:	04091763          	bnez	s2,a0002f2e <__muldf3+0x3e0>
a0002ee4:	00f7f713          	andi	a4,a5,15
a0002ee8:	4691                	li	a3,4
a0002eea:	04d70263          	beq	a4,a3,a0002f2e <__muldf3+0x3e0>
a0002eee:	00478713          	addi	a4,a5,4 # 800004 <nocache_min_size+0x7fb004>
a0002ef2:	00f737b3          	sltu	a5,a4,a5
a0002ef6:	943e                	add	s0,s0,a5
a0002ef8:	87ba                	mv	a5,a4
a0002efa:	a815                	j	a0002f2e <__muldf3+0x3e0>
a0002efc:	85da                	mv	a1,s6
a0002efe:	844e                	mv	s0,s3
a0002f00:	87d2                	mv	a5,s4
a0002f02:	8762                	mv	a4,s8
a0002f04:	4689                	li	a3,2
a0002f06:	1cd70763          	beq	a4,a3,a00030d4 <__muldf3+0x586>
a0002f0a:	468d                	li	a3,3
a0002f0c:	1cd70963          	beq	a4,a3,a00030de <__muldf3+0x590>
a0002f10:	4685                	li	a3,1
a0002f12:	fad718e3          	bne	a4,a3,a0002ec2 <__muldf3+0x374>
a0002f16:	4401                	li	s0,0
a0002f18:	4781                	li	a5,0
a0002f1a:	a265                	j	a00030c2 <__muldf3+0x574>
a0002f1c:	85d6                	mv	a1,s5
a0002f1e:	b7dd                	j	a0002f04 <__muldf3+0x3b6>
a0002f20:	855e                	mv	a0,s7
a0002f22:	b745                	j	a0002ec2 <__muldf3+0x374>
a0002f24:	e589                	bnez	a1,a0002f2e <__muldf3+0x3e0>
a0002f26:	00878713          	addi	a4,a5,8
a0002f2a:	b7e1                	j	a0002ef2 <__muldf3+0x3a4>
a0002f2c:	fded                	bnez	a1,a0002f26 <__muldf3+0x3d8>
a0002f2e:	01000737          	lui	a4,0x1000
a0002f32:	8f61                	and	a4,a4,s0
a0002f34:	c719                	beqz	a4,a0002f42 <__muldf3+0x3f4>
a0002f36:	ff000737          	lui	a4,0xff000
a0002f3a:	177d                	addi	a4,a4,-1
a0002f3c:	8c79                	and	s0,s0,a4
a0002f3e:	40050813          	addi	a6,a0,1024
a0002f42:	7fe00713          	li	a4,2046
a0002f46:	01074a63          	blt	a4,a6,a0002f5a <__muldf3+0x40c>
a0002f4a:	0037d713          	srli	a4,a5,0x3
a0002f4e:	01d41793          	slli	a5,s0,0x1d
a0002f52:	8fd9                	or	a5,a5,a4
a0002f54:	800d                	srli	s0,s0,0x3
a0002f56:	8742                	mv	a4,a6
a0002f58:	b3f1                	j	a0002d24 <__muldf3+0x1d6>
a0002f5a:	4789                	li	a5,2
a0002f5c:	02f90363          	beq	s2,a5,a0002f82 <__muldf3+0x434>
a0002f60:	478d                	li	a5,3
a0002f62:	00f90863          	beq	s2,a5,a0002f72 <__muldf3+0x424>
a0002f66:	00091763          	bnez	s2,a0002f74 <__muldf3+0x426>
a0002f6a:	4781                	li	a5,0
a0002f6c:	7ff00713          	li	a4,2047
a0002f70:	a029                	j	a0002f7a <__muldf3+0x42c>
a0002f72:	dde5                	beqz	a1,a0002f6a <__muldf3+0x41c>
a0002f74:	57fd                	li	a5,-1
a0002f76:	7fe00713          	li	a4,2046
a0002f7a:	0054e493          	ori	s1,s1,5
a0002f7e:	843e                	mv	s0,a5
a0002f80:	b355                	j	a0002d24 <__muldf3+0x1d6>
a0002f82:	f5e5                	bnez	a1,a0002f6a <__muldf3+0x41c>
a0002f84:	bfc5                	j	a0002f74 <__muldf3+0x426>
a0002f86:	4705                	li	a4,1
a0002f88:	04081463          	bnez	a6,a0002fd0 <__muldf3+0x482>
a0002f8c:	0077f693          	andi	a3,a5,7
a0002f90:	8722                	mv	a4,s0
a0002f92:	ca9d                	beqz	a3,a0002fc8 <__muldf3+0x47a>
a0002f94:	4689                	li	a3,2
a0002f96:	0014e493          	ori	s1,s1,1
a0002f9a:	02d90663          	beq	s2,a3,a0002fc6 <__muldf3+0x478>
a0002f9e:	468d                	li	a3,3
a0002fa0:	00d90f63          	beq	s2,a3,a0002fbe <__muldf3+0x470>
a0002fa4:	02091263          	bnez	s2,a0002fc8 <__muldf3+0x47a>
a0002fa8:	00f7f693          	andi	a3,a5,15
a0002fac:	4611                	li	a2,4
a0002fae:	00c68d63          	beq	a3,a2,a0002fc8 <__muldf3+0x47a>
a0002fb2:	ffc7b713          	sltiu	a4,a5,-4
a0002fb6:	00174713          	xori	a4,a4,1
a0002fba:	9722                	add	a4,a4,s0
a0002fbc:	a031                	j	a0002fc8 <__muldf3+0x47a>
a0002fbe:	e589                	bnez	a1,a0002fc8 <__muldf3+0x47a>
a0002fc0:	ff87b713          	sltiu	a4,a5,-8
a0002fc4:	bfcd                	j	a0002fb6 <__muldf3+0x468>
a0002fc6:	fded                	bnez	a1,a0002fc0 <__muldf3+0x472>
a0002fc8:	8361                	srli	a4,a4,0x18
a0002fca:	00174713          	xori	a4,a4,1
a0002fce:	8b05                	andi	a4,a4,1
a0002fd0:	4685                	li	a3,1
a0002fd2:	410686b3          	sub	a3,a3,a6
a0002fd6:	03800613          	li	a2,56
a0002fda:	0cd64263          	blt	a2,a3,a000309e <__muldf3+0x550>
a0002fde:	467d                	li	a2,31
a0002fe0:	04d64a63          	blt	a2,a3,a0003034 <__muldf3+0x4e6>
a0002fe4:	41e50513          	addi	a0,a0,1054
a0002fe8:	00a41633          	sll	a2,s0,a0
a0002fec:	00d7d833          	srl	a6,a5,a3
a0002ff0:	00a797b3          	sll	a5,a5,a0
a0002ff4:	01066633          	or	a2,a2,a6
a0002ff8:	00f037b3          	snez	a5,a5
a0002ffc:	8fd1                	or	a5,a5,a2
a0002ffe:	00d45433          	srl	s0,s0,a3
a0003002:	0077f693          	andi	a3,a5,7
a0003006:	c2ad                	beqz	a3,a0003068 <__muldf3+0x51a>
a0003008:	4689                	li	a3,2
a000300a:	0014e493          	ori	s1,s1,1
a000300e:	04d90c63          	beq	s2,a3,a0003066 <__muldf3+0x518>
a0003012:	468d                	li	a3,3
a0003014:	04d90563          	beq	s2,a3,a000305e <__muldf3+0x510>
a0003018:	04091863          	bnez	s2,a0003068 <__muldf3+0x51a>
a000301c:	00f7f693          	andi	a3,a5,15
a0003020:	4611                	li	a2,4
a0003022:	04c68363          	beq	a3,a2,a0003068 <__muldf3+0x51a>
a0003026:	00478693          	addi	a3,a5,4
a000302a:	00f6b7b3          	sltu	a5,a3,a5
a000302e:	943e                	add	s0,s0,a5
a0003030:	87b6                	mv	a5,a3
a0003032:	a81d                	j	a0003068 <__muldf3+0x51a>
a0003034:	5605                	li	a2,-31
a0003036:	41060633          	sub	a2,a2,a6
a000303a:	02000893          	li	a7,32
a000303e:	00c45633          	srl	a2,s0,a2
a0003042:	4801                	li	a6,0
a0003044:	01168663          	beq	a3,a7,a0003050 <__muldf3+0x502>
a0003048:	43e50513          	addi	a0,a0,1086
a000304c:	00a41833          	sll	a6,s0,a0
a0003050:	00f867b3          	or	a5,a6,a5
a0003054:	00f037b3          	snez	a5,a5
a0003058:	8fd1                	or	a5,a5,a2
a000305a:	4401                	li	s0,0
a000305c:	b75d                	j	a0003002 <__muldf3+0x4b4>
a000305e:	e589                	bnez	a1,a0003068 <__muldf3+0x51a>
a0003060:	00878693          	addi	a3,a5,8
a0003064:	b7d9                	j	a000302a <__muldf3+0x4dc>
a0003066:	fded                	bnez	a1,a0003060 <__muldf3+0x512>
a0003068:	008006b7          	lui	a3,0x800
a000306c:	8ee1                	and	a3,a3,s0
a000306e:	ca81                	beqz	a3,a000307e <__muldf3+0x530>
a0003070:	0014e493          	ori	s1,s1,1
a0003074:	4401                	li	s0,0
a0003076:	4781                	li	a5,0
a0003078:	e305                	bnez	a4,a0003098 <__muldf3+0x54a>
a000307a:	4705                	li	a4,1
a000307c:	b165                	j	a0002d24 <__muldf3+0x1d6>
a000307e:	0037d693          	srli	a3,a5,0x3
a0003082:	01d41793          	slli	a5,s0,0x1d
a0003086:	8fd5                	or	a5,a5,a3
a0003088:	800d                	srli	s0,s0,0x3
a000308a:	c8070de3          	beqz	a4,a0002d24 <__muldf3+0x1d6>
a000308e:	0014f713          	andi	a4,s1,1
a0003092:	c80709e3          	beqz	a4,a0002d24 <__muldf3+0x1d6>
a0003096:	4701                	li	a4,0
a0003098:	0024e493          	ori	s1,s1,2
a000309c:	b161                	j	a0002d24 <__muldf3+0x1d6>
a000309e:	8fc1                	or	a5,a5,s0
a00030a0:	cf91                	beqz	a5,a00030bc <__muldf3+0x56e>
a00030a2:	4789                	li	a5,2
a00030a4:	0014e493          	ori	s1,s1,1
a00030a8:	02f90363          	beq	s2,a5,a00030ce <__muldf3+0x580>
a00030ac:	478d                	li	a5,3
a00030ae:	00f90c63          	beq	s2,a5,a00030c6 <__muldf3+0x578>
a00030b2:	4785                	li	a5,1
a00030b4:	00091363          	bnez	s2,a00030ba <__muldf3+0x56c>
a00030b8:	4795                	li	a5,5
a00030ba:	838d                	srli	a5,a5,0x3
a00030bc:	0024e493          	ori	s1,s1,2
a00030c0:	4401                	li	s0,0
a00030c2:	4701                	li	a4,0
a00030c4:	b185                	j	a0002d24 <__muldf3+0x1d6>
a00030c6:	47a5                	li	a5,9
a00030c8:	d9ed                	beqz	a1,a00030ba <__muldf3+0x56c>
a00030ca:	4785                	li	a5,1
a00030cc:	b7fd                	j	a00030ba <__muldf3+0x56c>
a00030ce:	47a5                	li	a5,9
a00030d0:	f5ed                	bnez	a1,a00030ba <__muldf3+0x56c>
a00030d2:	bfe5                	j	a00030ca <__muldf3+0x57c>
a00030d4:	4401                	li	s0,0
a00030d6:	4781                	li	a5,0
a00030d8:	7ff00713          	li	a4,2047
a00030dc:	b1a1                	j	a0002d24 <__muldf3+0x1d6>
a00030de:	00080437          	lui	s0,0x80
a00030e2:	4781                	li	a5,0
a00030e4:	7ff00713          	li	a4,2047
a00030e8:	4581                	li	a1,0
a00030ea:	b92d                	j	a0002d24 <__muldf3+0x1d6>

a00030ec <__subdf3>:
a00030ec:	1101                	addi	sp,sp,-32
a00030ee:	ce06                	sw	ra,28(sp)
a00030f0:	cc22                	sw	s0,24(sp)
a00030f2:	ca26                	sw	s1,20(sp)
a00030f4:	c84a                	sw	s2,16(sp)
a00030f6:	c64e                	sw	s3,12(sp)
a00030f8:	c452                	sw	s4,8(sp)
a00030fa:	002029f3          	frrm	s3
a00030fe:	001008b7          	lui	a7,0x100
a0003102:	18fd                	addi	a7,a7,-1
a0003104:	00b8f733          	and	a4,a7,a1
a0003108:	0145d413          	srli	s0,a1,0x14
a000310c:	00d8f8b3          	and	a7,a7,a3
a0003110:	01f5d493          	srli	s1,a1,0x1f
a0003114:	0146d593          	srli	a1,a3,0x14
a0003118:	00371793          	slli	a5,a4,0x3
a000311c:	01f6d313          	srli	t1,a3,0x1f
a0003120:	01d55713          	srli	a4,a0,0x1d
a0003124:	01d65693          	srli	a3,a2,0x1d
a0003128:	088e                	slli	a7,a7,0x3
a000312a:	00361813          	slli	a6,a2,0x3
a000312e:	7ff5f593          	andi	a1,a1,2047
a0003132:	7ff00613          	li	a2,2047
a0003136:	8f5d                	or	a4,a4,a5
a0003138:	7ff47413          	andi	s0,s0,2047
a000313c:	00351793          	slli	a5,a0,0x3
a0003140:	0116e6b3          	or	a3,a3,a7
a0003144:	00c59563          	bne	a1,a2,a000314e <__subdf3+0x62>
a0003148:	0106e633          	or	a2,a3,a6
a000314c:	e219                	bnez	a2,a0003152 <__subdf3+0x66>
a000314e:	00134313          	xori	t1,t1,1
a0003152:	40b40633          	sub	a2,s0,a1
a0003156:	3c931c63          	bne	t1,s1,a000352e <__subdf3+0x442>
a000315a:	12c05163          	blez	a2,a000327c <__subdf3+0x190>
a000315e:	04059a63          	bnez	a1,a00031b2 <__subdf3+0xc6>
a0003162:	0106e533          	or	a0,a3,a6
a0003166:	e10d                	bnez	a0,a0003188 <__subdf3+0x9c>
a0003168:	7ff00693          	li	a3,2047
a000316c:	4401                	li	s0,0
a000316e:	24d61363          	bne	a2,a3,a00033b4 <__subdf3+0x2c8>
a0003172:	00f766b3          	or	a3,a4,a5
a0003176:	7a068963          	beqz	a3,a0003928 <__subdf3+0x83c>
a000317a:	00400437          	lui	s0,0x400
a000317e:	8c79                	and	s0,s0,a4
a0003180:	00143413          	seqz	s0,s0
a0003184:	0412                	slli	s0,s0,0x4
a0003186:	a43d                	j	a00033b4 <__subdf3+0x2c8>
a0003188:	fff60513          	addi	a0,a2,-1
a000318c:	e901                	bnez	a0,a000319c <__subdf3+0xb0>
a000318e:	983e                	add	a6,a6,a5
a0003190:	96ba                	add	a3,a3,a4
a0003192:	00f837b3          	sltu	a5,a6,a5
a0003196:	96be                	add	a3,a3,a5
a0003198:	4605                	li	a2,1
a000319a:	a041                	j	a000321a <__subdf3+0x12e>
a000319c:	7ff00893          	li	a7,2047
a00031a0:	03161f63          	bne	a2,a7,a00031de <__subdf3+0xf2>
a00031a4:	00f766b3          	or	a3,a4,a5
a00031a8:	fae9                	bnez	a3,a000317a <__subdf3+0x8e>
a00031aa:	4701                	li	a4,0
a00031ac:	4781                	li	a5,0
a00031ae:	4401                	li	s0,0
a00031b0:	ac9d                	j	a0003426 <__subdf3+0x33a>
a00031b2:	7ff00593          	li	a1,2047
a00031b6:	02b41063          	bne	s0,a1,a00031d6 <__subdf3+0xea>
a00031ba:	00f766b3          	or	a3,a4,a5
a00031be:	76068863          	beqz	a3,a000392e <__subdf3+0x842>
a00031c2:	004006b7          	lui	a3,0x400
a00031c6:	8ef9                	and	a3,a3,a4
a00031c8:	7ff00613          	li	a2,2047
a00031cc:	4581                	li	a1,0
a00031ce:	2e069263          	bnez	a3,a00034b2 <__subdf3+0x3c6>
a00031d2:	4441                	li	s0,16
a00031d4:	a2c5                	j	a00033b4 <__subdf3+0x2c8>
a00031d6:	008005b7          	lui	a1,0x800
a00031da:	8ecd                	or	a3,a3,a1
a00031dc:	8532                	mv	a0,a2
a00031de:	03800613          	li	a2,56
a00031e2:	08a64863          	blt	a2,a0,a0003272 <__subdf3+0x186>
a00031e6:	467d                	li	a2,31
a00031e8:	04a64f63          	blt	a2,a0,a0003246 <__subdf3+0x15a>
a00031ec:	02000613          	li	a2,32
a00031f0:	8e09                	sub	a2,a2,a0
a00031f2:	00c695b3          	sll	a1,a3,a2
a00031f6:	00a858b3          	srl	a7,a6,a0
a00031fa:	00c81833          	sll	a6,a6,a2
a00031fe:	0115e5b3          	or	a1,a1,a7
a0003202:	01003833          	snez	a6,a6
a0003206:	0105e833          	or	a6,a1,a6
a000320a:	00a6d6b3          	srl	a3,a3,a0
a000320e:	983e                	add	a6,a6,a5
a0003210:	96ba                	add	a3,a3,a4
a0003212:	00f837b3          	sltu	a5,a6,a5
a0003216:	96be                	add	a3,a3,a5
a0003218:	8622                	mv	a2,s0
a000321a:	008007b7          	lui	a5,0x800
a000321e:	8ff5                	and	a5,a5,a3
a0003220:	cbad                	beqz	a5,a0003292 <__subdf3+0x1a6>
a0003222:	0605                	addi	a2,a2,1
a0003224:	7ff00793          	li	a5,2047
a0003228:	2ef60263          	beq	a2,a5,a000350c <__subdf3+0x420>
a000322c:	ff800737          	lui	a4,0xff800
a0003230:	177d                	addi	a4,a4,-1
a0003232:	00185793          	srli	a5,a6,0x1
a0003236:	8f75                	and	a4,a4,a3
a0003238:	00187813          	andi	a6,a6,1
a000323c:	0107e833          	or	a6,a5,a6
a0003240:	01f71793          	slli	a5,a4,0x1f
a0003244:	a49d                	j	a00034aa <__subdf3+0x3be>
a0003246:	fe050593          	addi	a1,a0,-32
a000324a:	02000893          	li	a7,32
a000324e:	00b6d5b3          	srl	a1,a3,a1
a0003252:	4601                	li	a2,0
a0003254:	01150763          	beq	a0,a7,a0003262 <__subdf3+0x176>
a0003258:	04000613          	li	a2,64
a000325c:	8e09                	sub	a2,a2,a0
a000325e:	00c69633          	sll	a2,a3,a2
a0003262:	01066833          	or	a6,a2,a6
a0003266:	01003833          	snez	a6,a6
a000326a:	0105e833          	or	a6,a1,a6
a000326e:	4681                	li	a3,0
a0003270:	bf79                	j	a000320e <__subdf3+0x122>
a0003272:	0106e833          	or	a6,a3,a6
a0003276:	01003833          	snez	a6,a6
a000327a:	bfd5                	j	a000326e <__subdf3+0x182>
a000327c:	ce65                	beqz	a2,a0003374 <__subdf3+0x288>
a000327e:	40858633          	sub	a2,a1,s0
a0003282:	e829                	bnez	s0,a00032d4 <__subdf3+0x1e8>
a0003284:	00f76533          	or	a0,a4,a5
a0003288:	e911                	bnez	a0,a000329c <__subdf3+0x1b0>
a000328a:	7ff00793          	li	a5,2047
a000328e:	02f60663          	beq	a2,a5,a00032ba <__subdf3+0x1ce>
a0003292:	8736                	mv	a4,a3
a0003294:	87c2                	mv	a5,a6
a0003296:	48060563          	beqz	a2,a0003720 <__subdf3+0x634>
a000329a:	ac19                	j	a00034b0 <__subdf3+0x3c4>
a000329c:	fff60893          	addi	a7,a2,-1
a00032a0:	00089963          	bnez	a7,a00032b2 <__subdf3+0x1c6>
a00032a4:	97c2                	add	a5,a5,a6
a00032a6:	0107b833          	sltu	a6,a5,a6
a00032aa:	96ba                	add	a3,a3,a4
a00032ac:	96c2                	add	a3,a3,a6
a00032ae:	883e                	mv	a6,a5
a00032b0:	b5e5                	j	a0003198 <__subdf3+0xac>
a00032b2:	7ff00513          	li	a0,2047
a00032b6:	04a61663          	bne	a2,a0,a0003302 <__subdf3+0x216>
a00032ba:	0106e7b3          	or	a5,a3,a6
a00032be:	4701                	li	a4,0
a00032c0:	16078363          	beqz	a5,a0003426 <__subdf3+0x33a>
a00032c4:	004007b7          	lui	a5,0x400
a00032c8:	8ff5                	and	a5,a5,a3
a00032ca:	8736                	mv	a4,a3
a00032cc:	66079463          	bnez	a5,a0003934 <__subdf3+0x848>
a00032d0:	87c2                	mv	a5,a6
a00032d2:	a015                	j	a00032f6 <__subdf3+0x20a>
a00032d4:	7ff00513          	li	a0,2047
a00032d8:	02a59163          	bne	a1,a0,a00032fa <__subdf3+0x20e>
a00032dc:	0106e7b3          	or	a5,a3,a6
a00032e0:	62078663          	beqz	a5,a000390c <__subdf3+0x820>
a00032e4:	004007b7          	lui	a5,0x400
a00032e8:	8ff5                	and	a5,a5,a3
a00032ea:	8736                	mv	a4,a3
a00032ec:	62079463          	bnez	a5,a0003914 <__subdf3+0x828>
a00032f0:	87c2                	mv	a5,a6
a00032f2:	7ff00613          	li	a2,2047
a00032f6:	4581                	li	a1,0
a00032f8:	bde9                	j	a00031d2 <__subdf3+0xe6>
a00032fa:	00800537          	lui	a0,0x800
a00032fe:	8f49                	or	a4,a4,a0
a0003300:	88b2                	mv	a7,a2
a0003302:	03800613          	li	a2,56
a0003306:	07164363          	blt	a2,a7,a000336c <__subdf3+0x280>
a000330a:	467d                	li	a2,31
a000330c:	03164b63          	blt	a2,a7,a0003342 <__subdf3+0x256>
a0003310:	02000513          	li	a0,32
a0003314:	41150533          	sub	a0,a0,a7
a0003318:	00a71633          	sll	a2,a4,a0
a000331c:	0117d333          	srl	t1,a5,a7
a0003320:	00a797b3          	sll	a5,a5,a0
a0003324:	00666633          	or	a2,a2,t1
a0003328:	00f037b3          	snez	a5,a5
a000332c:	8fd1                	or	a5,a5,a2
a000332e:	01175733          	srl	a4,a4,a7
a0003332:	97c2                	add	a5,a5,a6
a0003334:	9736                	add	a4,a4,a3
a0003336:	0107b6b3          	sltu	a3,a5,a6
a000333a:	96ba                	add	a3,a3,a4
a000333c:	883e                	mv	a6,a5
a000333e:	862e                	mv	a2,a1
a0003340:	bde9                	j	a000321a <__subdf3+0x12e>
a0003342:	fe088613          	addi	a2,a7,-32 # fffe0 <nocache_min_size+0xfafe0>
a0003346:	02000313          	li	t1,32
a000334a:	00c75633          	srl	a2,a4,a2
a000334e:	4501                	li	a0,0
a0003350:	00688863          	beq	a7,t1,a0003360 <__subdf3+0x274>
a0003354:	04000513          	li	a0,64
a0003358:	41150533          	sub	a0,a0,a7
a000335c:	00a71533          	sll	a0,a4,a0
a0003360:	8fc9                	or	a5,a5,a0
a0003362:	00f037b3          	snez	a5,a5
a0003366:	8fd1                	or	a5,a5,a2
a0003368:	4701                	li	a4,0
a000336a:	b7e1                	j	a0003332 <__subdf3+0x246>
a000336c:	8fd9                	or	a5,a5,a4
a000336e:	00f037b3          	snez	a5,a5
a0003372:	bfdd                	j	a0003368 <__subdf3+0x27c>
a0003374:	00140613          	addi	a2,s0,1 # 400001 <nocache_min_size+0x3fb001>
a0003378:	7fe67513          	andi	a0,a2,2046
a000337c:	10051a63          	bnez	a0,a0003490 <__subdf3+0x3a4>
a0003380:	00f76633          	or	a2,a4,a5
a0003384:	e421                	bnez	s0,a00033cc <__subdf3+0x2e0>
a0003386:	54060663          	beqz	a2,a00038d2 <__subdf3+0x7e6>
a000338a:	0106e633          	or	a2,a3,a6
a000338e:	38060963          	beqz	a2,a0003720 <__subdf3+0x634>
a0003392:	983e                	add	a6,a6,a5
a0003394:	00f837b3          	sltu	a5,a6,a5
a0003398:	9736                	add	a4,a4,a3
a000339a:	973e                	add	a4,a4,a5
a000339c:	008007b7          	lui	a5,0x800
a00033a0:	8ff9                	and	a5,a5,a4
a00033a2:	52078963          	beqz	a5,a00038d4 <__subdf3+0x7e8>
a00033a6:	ff8007b7          	lui	a5,0xff800
a00033aa:	17fd                	addi	a5,a5,-1
a00033ac:	8f7d                	and	a4,a4,a5
a00033ae:	4581                	li	a1,0
a00033b0:	87c2                	mv	a5,a6
a00033b2:	4605                	li	a2,1
a00033b4:	0077f693          	andi	a3,a5,7
a00033b8:	12069463          	bnez	a3,a00034e0 <__subdf3+0x3f4>
a00033bc:	06058563          	beqz	a1,a0003426 <__subdf3+0x33a>
a00033c0:	00147693          	andi	a3,s0,1
a00033c4:	c2ad                	beqz	a3,a0003426 <__subdf3+0x33a>
a00033c6:	00246413          	ori	s0,s0,2
a00033ca:	a8b1                	j	a0003426 <__subdf3+0x33a>
a00033cc:	7ff00513          	li	a0,2047
a00033d0:	02a41563          	bne	s0,a0,a00033fa <__subdf3+0x30e>
a00033d4:	5e060063          	beqz	a2,a00039b4 <__subdf3+0x8c8>
a00033d8:	00400437          	lui	s0,0x400
a00033dc:	8c79                	and	s0,s0,a4
a00033de:	00143413          	seqz	s0,s0
a00033e2:	0412                	slli	s0,s0,0x4
a00033e4:	02a59863          	bne	a1,a0,a0003414 <__subdf3+0x328>
a00033e8:	0106e5b3          	or	a1,a3,a6
a00033ec:	c991                	beqz	a1,a0003400 <__subdf3+0x314>
a00033ee:	004005b7          	lui	a1,0x400
a00033f2:	8df5                	and	a1,a1,a3
a00033f4:	e591                	bnez	a1,a0003400 <__subdf3+0x314>
a00033f6:	4441                	li	s0,16
a00033f8:	a021                	j	a0003400 <__subdf3+0x314>
a00033fa:	4401                	li	s0,0
a00033fc:	fea586e3          	beq	a1,a0,a00033e8 <__subdf3+0x2fc>
a0003400:	00061a63          	bnez	a2,a0003414 <__subdf3+0x328>
a0003404:	8736                	mv	a4,a3
a0003406:	87c2                	mv	a5,a6
a0003408:	4581                	li	a1,0
a000340a:	7ff00613          	li	a2,2047
a000340e:	b75d                	j	a00033b4 <__subdf3+0x2c8>
a0003410:	4401                	li	s0,0
a0003412:	bfd9                	j	a00033e8 <__subdf3+0x2fc>
a0003414:	0106e6b3          	or	a3,a3,a6
a0003418:	dae5                	beqz	a3,a0003408 <__subdf3+0x31c>
a000341a:	4481                	li	s1,0
a000341c:	00400737          	lui	a4,0x400
a0003420:	4781                	li	a5,0
a0003422:	7ff00613          	li	a2,2047
a0003426:	008006b7          	lui	a3,0x800
a000342a:	8ef9                	and	a3,a3,a4
a000342c:	ca91                	beqz	a3,a0003440 <__subdf3+0x354>
a000342e:	0605                	addi	a2,a2,1
a0003430:	7ff00693          	li	a3,2047
a0003434:	54d60763          	beq	a2,a3,a0003982 <__subdf3+0x896>
a0003438:	ff8006b7          	lui	a3,0xff800
a000343c:	16fd                	addi	a3,a3,-1
a000343e:	8f75                	and	a4,a4,a3
a0003440:	0037d513          	srli	a0,a5,0x3
a0003444:	7ff00693          	li	a3,2047
a0003448:	01d71793          	slli	a5,a4,0x1d
a000344c:	8fc9                	or	a5,a5,a0
a000344e:	830d                	srli	a4,a4,0x3
a0003450:	00d61963          	bne	a2,a3,a0003462 <__subdf3+0x376>
a0003454:	8fd9                	or	a5,a5,a4
a0003456:	4701                	li	a4,0
a0003458:	c789                	beqz	a5,a0003462 <__subdf3+0x376>
a000345a:	00080737          	lui	a4,0x80
a000345e:	4781                	li	a5,0
a0003460:	4481                	li	s1,0
a0003462:	7ff006b7          	lui	a3,0x7ff00
a0003466:	0652                	slli	a2,a2,0x14
a0003468:	0732                	slli	a4,a4,0xc
a000346a:	8e75                	and	a2,a2,a3
a000346c:	8331                	srli	a4,a4,0xc
a000346e:	8f51                	or	a4,a4,a2
a0003470:	04fe                	slli	s1,s1,0x1f
a0003472:	009766b3          	or	a3,a4,s1
a0003476:	853e                	mv	a0,a5
a0003478:	85b6                	mv	a1,a3
a000347a:	c019                	beqz	s0,a0003480 <__subdf3+0x394>
a000347c:	00142073          	csrs	fflags,s0
a0003480:	40f2                	lw	ra,28(sp)
a0003482:	4462                	lw	s0,24(sp)
a0003484:	44d2                	lw	s1,20(sp)
a0003486:	4942                	lw	s2,16(sp)
a0003488:	49b2                	lw	s3,12(sp)
a000348a:	4a22                	lw	s4,8(sp)
a000348c:	6105                	addi	sp,sp,32
a000348e:	8082                	ret
a0003490:	7ff00593          	li	a1,2047
a0003494:	02b60163          	beq	a2,a1,a00034b6 <__subdf3+0x3ca>
a0003498:	983e                	add	a6,a6,a5
a000349a:	00f837b3          	sltu	a5,a6,a5
a000349e:	9736                	add	a4,a4,a3
a00034a0:	973e                	add	a4,a4,a5
a00034a2:	01f71793          	slli	a5,a4,0x1f
a00034a6:	00185813          	srli	a6,a6,0x1
a00034aa:	0107e7b3          	or	a5,a5,a6
a00034ae:	8305                	srli	a4,a4,0x1
a00034b0:	4581                	li	a1,0
a00034b2:	4401                	li	s0,0
a00034b4:	b701                	j	a00033b4 <__subdf3+0x2c8>
a00034b6:	00098763          	beqz	s3,a00034c4 <__subdf3+0x3d8>
a00034ba:	478d                	li	a5,3
a00034bc:	00f99763          	bne	s3,a5,a00034ca <__subdf3+0x3de>
a00034c0:	00049a63          	bnez	s1,a00034d4 <__subdf3+0x3e8>
a00034c4:	7ff00613          	li	a2,2047
a00034c8:	a889                	j	a000351a <__subdf3+0x42e>
a00034ca:	4789                	li	a5,2
a00034cc:	00f99463          	bne	s3,a5,a00034d4 <__subdf3+0x3e8>
a00034d0:	fe049ae3          	bnez	s1,a00034c4 <__subdf3+0x3d8>
a00034d4:	4581                	li	a1,0
a00034d6:	577d                	li	a4,-1
a00034d8:	57fd                	li	a5,-1
a00034da:	7fe00613          	li	a2,2046
a00034de:	4415                	li	s0,5
a00034e0:	4689                	li	a3,2
a00034e2:	00146413          	ori	s0,s0,1
a00034e6:	48d98a63          	beq	s3,a3,a000397a <__subdf3+0x88e>
a00034ea:	468d                	li	a3,3
a00034ec:	48d98363          	beq	s3,a3,a0003972 <__subdf3+0x886>
a00034f0:	48099663          	bnez	s3,a000397c <__subdf3+0x890>
a00034f4:	00f7f693          	andi	a3,a5,15
a00034f8:	4511                	li	a0,4
a00034fa:	48a68163          	beq	a3,a0,a000397c <__subdf3+0x890>
a00034fe:	00478693          	addi	a3,a5,4 # ff800004 <__psram_limit+0x57400004>
a0003502:	00f6b7b3          	sltu	a5,a3,a5
a0003506:	973e                	add	a4,a4,a5
a0003508:	87b6                	mv	a5,a3
a000350a:	a98d                	j	a000397c <__subdf3+0x890>
a000350c:	00098763          	beqz	s3,a000351a <__subdf3+0x42e>
a0003510:	478d                	li	a5,3
a0003512:	00f99863          	bne	s3,a5,a0003522 <__subdf3+0x436>
a0003516:	40049363          	bnez	s1,a000391c <__subdf3+0x830>
a000351a:	4701                	li	a4,0
a000351c:	4781                	li	a5,0
a000351e:	4415                	li	s0,5
a0003520:	b719                	j	a0003426 <__subdf3+0x33a>
a0003522:	4789                	li	a5,2
a0003524:	3ef99c63          	bne	s3,a5,a000391c <__subdf3+0x830>
a0003528:	fe0499e3          	bnez	s1,a000351a <__subdf3+0x42e>
a000352c:	b765                	j	a00034d4 <__subdf3+0x3e8>
a000352e:	0cc05863          	blez	a2,a00035fe <__subdf3+0x512>
a0003532:	08059263          	bnez	a1,a00035b6 <__subdf3+0x4ca>
a0003536:	0106e533          	or	a0,a3,a6
a000353a:	c20507e3          	beqz	a0,a0003168 <__subdf3+0x7c>
a000353e:	fff60513          	addi	a0,a2,-1
a0003542:	e911                	bnez	a0,a0003556 <__subdf3+0x46a>
a0003544:	41078833          	sub	a6,a5,a6
a0003548:	40d706b3          	sub	a3,a4,a3
a000354c:	0107b7b3          	sltu	a5,a5,a6
a0003550:	8e9d                	sub	a3,a3,a5
a0003552:	4605                	li	a2,1
a0003554:	a0a9                	j	a000359e <__subdf3+0x4b2>
a0003556:	7ff00893          	li	a7,2047
a000355a:	c51605e3          	beq	a2,a7,a00031a4 <__subdf3+0xb8>
a000355e:	03800613          	li	a2,56
a0003562:	08a64963          	blt	a2,a0,a00035f4 <__subdf3+0x508>
a0003566:	467d                	li	a2,31
a0003568:	06a64063          	blt	a2,a0,a00035c8 <__subdf3+0x4dc>
a000356c:	02000613          	li	a2,32
a0003570:	8e09                	sub	a2,a2,a0
a0003572:	00c695b3          	sll	a1,a3,a2
a0003576:	00a858b3          	srl	a7,a6,a0
a000357a:	00c81833          	sll	a6,a6,a2
a000357e:	0115e5b3          	or	a1,a1,a7
a0003582:	01003833          	snez	a6,a6
a0003586:	0105e833          	or	a6,a1,a6
a000358a:	00a6d6b3          	srl	a3,a3,a0
a000358e:	41078833          	sub	a6,a5,a6
a0003592:	40d706b3          	sub	a3,a4,a3
a0003596:	0107b7b3          	sltu	a5,a5,a6
a000359a:	8e9d                	sub	a3,a3,a5
a000359c:	8622                	mv	a2,s0
a000359e:	00800937          	lui	s2,0x800
a00035a2:	0126f7b3          	and	a5,a3,s2
a00035a6:	ce0786e3          	beqz	a5,a0003292 <__subdf3+0x1a6>
a00035aa:	197d                	addi	s2,s2,-1
a00035ac:	0126f933          	and	s2,a3,s2
a00035b0:	8a42                	mv	s4,a6
a00035b2:	8432                	mv	s0,a2
a00035b4:	ac8d                	j	a0003826 <__subdf3+0x73a>
a00035b6:	7ff00593          	li	a1,2047
a00035ba:	c0b400e3          	beq	s0,a1,a00031ba <__subdf3+0xce>
a00035be:	008005b7          	lui	a1,0x800
a00035c2:	8ecd                	or	a3,a3,a1
a00035c4:	8532                	mv	a0,a2
a00035c6:	bf61                	j	a000355e <__subdf3+0x472>
a00035c8:	fe050593          	addi	a1,a0,-32 # 7fffe0 <nocache_min_size+0x7fafe0>
a00035cc:	02000893          	li	a7,32
a00035d0:	00b6d5b3          	srl	a1,a3,a1
a00035d4:	4601                	li	a2,0
a00035d6:	01150763          	beq	a0,a7,a00035e4 <__subdf3+0x4f8>
a00035da:	04000613          	li	a2,64
a00035de:	8e09                	sub	a2,a2,a0
a00035e0:	00c69633          	sll	a2,a3,a2
a00035e4:	01066833          	or	a6,a2,a6
a00035e8:	01003833          	snez	a6,a6
a00035ec:	0105e833          	or	a6,a1,a6
a00035f0:	4681                	li	a3,0
a00035f2:	bf71                	j	a000358e <__subdf3+0x4a2>
a00035f4:	0106e833          	or	a6,a3,a6
a00035f8:	01003833          	snez	a6,a6
a00035fc:	bfd5                	j	a00035f0 <__subdf3+0x504>
a00035fe:	ce6d                	beqz	a2,a00036f8 <__subdf3+0x60c>
a0003600:	40858633          	sub	a2,a1,s0
a0003604:	e439                	bnez	s0,a0003652 <__subdf3+0x566>
a0003606:	00f76533          	or	a0,a4,a5
a000360a:	e509                	bnez	a0,a0003614 <__subdf3+0x528>
a000360c:	7ff00793          	li	a5,2047
a0003610:	849a                	mv	s1,t1
a0003612:	b9b5                	j	a000328e <__subdf3+0x1a2>
a0003614:	fff60893          	addi	a7,a2,-1
a0003618:	00089c63          	bnez	a7,a0003630 <__subdf3+0x544>
a000361c:	40f807b3          	sub	a5,a6,a5
a0003620:	00f83833          	sltu	a6,a6,a5
a0003624:	8e99                	sub	a3,a3,a4
a0003626:	410686b3          	sub	a3,a3,a6
a000362a:	849a                	mv	s1,t1
a000362c:	883e                	mv	a6,a5
a000362e:	b715                	j	a0003552 <__subdf3+0x466>
a0003630:	7ff00513          	li	a0,2047
a0003634:	04a61563          	bne	a2,a0,a000367e <__subdf3+0x592>
a0003638:	0106e7b3          	or	a5,a3,a6
a000363c:	2e078f63          	beqz	a5,a000393a <__subdf3+0x84e>
a0003640:	004007b7          	lui	a5,0x400
a0003644:	8ff5                	and	a5,a5,a3
a0003646:	8736                	mv	a4,a3
a0003648:	2e079c63          	bnez	a5,a0003940 <__subdf3+0x854>
a000364c:	87c2                	mv	a5,a6
a000364e:	849a                	mv	s1,t1
a0003650:	b15d                	j	a00032f6 <__subdf3+0x20a>
a0003652:	7ff00513          	li	a0,2047
a0003656:	02a59063          	bne	a1,a0,a0003676 <__subdf3+0x58a>
a000365a:	0106e7b3          	or	a5,a3,a6
a000365e:	2e078463          	beqz	a5,a0003946 <__subdf3+0x85a>
a0003662:	004007b7          	lui	a5,0x400
a0003666:	8ff5                	and	a5,a5,a3
a0003668:	8736                	mv	a4,a3
a000366a:	2e079363          	bnez	a5,a0003950 <__subdf3+0x864>
a000366e:	87c2                	mv	a5,a6
a0003670:	7ff00613          	li	a2,2047
a0003674:	bfe9                	j	a000364e <__subdf3+0x562>
a0003676:	00800537          	lui	a0,0x800
a000367a:	8f49                	or	a4,a4,a0
a000367c:	88b2                	mv	a7,a2
a000367e:	03800613          	li	a2,56
a0003682:	07164763          	blt	a2,a7,a00036f0 <__subdf3+0x604>
a0003686:	467d                	li	a2,31
a0003688:	03164f63          	blt	a2,a7,a00036c6 <__subdf3+0x5da>
a000368c:	02000513          	li	a0,32
a0003690:	41150533          	sub	a0,a0,a7
a0003694:	00a71633          	sll	a2,a4,a0
a0003698:	0117de33          	srl	t3,a5,a7
a000369c:	00a797b3          	sll	a5,a5,a0
a00036a0:	01c66633          	or	a2,a2,t3
a00036a4:	00f037b3          	snez	a5,a5
a00036a8:	8fd1                	or	a5,a5,a2
a00036aa:	01175733          	srl	a4,a4,a7
a00036ae:	40f807b3          	sub	a5,a6,a5
a00036b2:	40e68733          	sub	a4,a3,a4
a00036b6:	00f836b3          	sltu	a3,a6,a5
a00036ba:	40d706b3          	sub	a3,a4,a3
a00036be:	883e                	mv	a6,a5
a00036c0:	862e                	mv	a2,a1
a00036c2:	849a                	mv	s1,t1
a00036c4:	bde9                	j	a000359e <__subdf3+0x4b2>
a00036c6:	fe088613          	addi	a2,a7,-32
a00036ca:	02000e13          	li	t3,32
a00036ce:	00c75633          	srl	a2,a4,a2
a00036d2:	4501                	li	a0,0
a00036d4:	01c88863          	beq	a7,t3,a00036e4 <__subdf3+0x5f8>
a00036d8:	04000513          	li	a0,64
a00036dc:	41150533          	sub	a0,a0,a7
a00036e0:	00a71533          	sll	a0,a4,a0
a00036e4:	8fc9                	or	a5,a5,a0
a00036e6:	00f037b3          	snez	a5,a5
a00036ea:	8fd1                	or	a5,a5,a2
a00036ec:	4701                	li	a4,0
a00036ee:	b7c1                	j	a00036ae <__subdf3+0x5c2>
a00036f0:	8fd9                	or	a5,a5,a4
a00036f2:	00f037b3          	snez	a5,a5
a00036f6:	bfdd                	j	a00036ec <__subdf3+0x600>
a00036f8:	00140613          	addi	a2,s0,1 # 400001 <nocache_min_size+0x3fb001>
a00036fc:	7fe67613          	andi	a2,a2,2046
a0003700:	ee75                	bnez	a2,a00037fc <__subdf3+0x710>
a0003702:	00f76533          	or	a0,a4,a5
a0003706:	0106e633          	or	a2,a3,a6
a000370a:	e05d                	bnez	s0,a00037b0 <__subdf3+0x6c4>
a000370c:	06051263          	bnez	a0,a0003770 <__subdf3+0x684>
a0003710:	1c061463          	bnez	a2,a00038d8 <__subdf3+0x7ec>
a0003714:	ffe98493          	addi	s1,s3,-2
a0003718:	0014b493          	seqz	s1,s1
a000371c:	4701                	li	a4,0
a000371e:	4781                	li	a5,0
a0003720:	00e7e6b3          	or	a3,a5,a4
a0003724:	24068363          	beqz	a3,a000396a <__subdf3+0x87e>
a0003728:	01f7d693          	srli	a3,a5,0x1f
a000372c:	00171593          	slli	a1,a4,0x1
a0003730:	95b6                	add	a1,a1,a3
a0003732:	00179693          	slli	a3,a5,0x1
a0003736:	0076f613          	andi	a2,a3,7
a000373a:	4401                	li	s0,0
a000373c:	c605                	beqz	a2,a0003764 <__subdf3+0x678>
a000373e:	4609                	li	a2,2
a0003740:	1ac98c63          	beq	s3,a2,a00038f8 <__subdf3+0x80c>
a0003744:	460d                	li	a2,3
a0003746:	18c98f63          	beq	s3,a2,a00038e4 <__subdf3+0x7f8>
a000374a:	4405                	li	s0,1
a000374c:	00099c63          	bnez	s3,a0003764 <__subdf3+0x678>
a0003750:	00f6f613          	andi	a2,a3,15
a0003754:	4511                	li	a0,4
a0003756:	00a60763          	beq	a2,a0,a0003764 <__subdf3+0x678>
a000375a:	ffc6b693          	sltiu	a3,a3,-4
a000375e:	0016c693          	xori	a3,a3,1
a0003762:	95b6                	add	a1,a1,a3
a0003764:	81e1                	srli	a1,a1,0x18
a0003766:	0015c593          	xori	a1,a1,1
a000376a:	8985                	andi	a1,a1,1
a000376c:	4601                	li	a2,0
a000376e:	b199                	j	a00033b4 <__subdf3+0x2c8>
a0003770:	da45                	beqz	a2,a0003720 <__subdf3+0x634>
a0003772:	410785b3          	sub	a1,a5,a6
a0003776:	00b7b533          	sltu	a0,a5,a1
a000377a:	40d70633          	sub	a2,a4,a3
a000377e:	8e09                	sub	a2,a2,a0
a0003780:	00800537          	lui	a0,0x800
a0003784:	8d71                	and	a0,a0,a2
a0003786:	c919                	beqz	a0,a000379c <__subdf3+0x6b0>
a0003788:	40f807b3          	sub	a5,a6,a5
a000378c:	40e68733          	sub	a4,a3,a4
a0003790:	00f83833          	sltu	a6,a6,a5
a0003794:	41070733          	sub	a4,a4,a6
a0003798:	849a                	mv	s1,t1
a000379a:	b759                	j	a0003720 <__subdf3+0x634>
a000379c:	00c5e7b3          	or	a5,a1,a2
a00037a0:	12079f63          	bnez	a5,a00038de <__subdf3+0x7f2>
a00037a4:	ffe98493          	addi	s1,s3,-2
a00037a8:	0014b493          	seqz	s1,s1
a00037ac:	4701                	li	a4,0
a00037ae:	bf8d                	j	a0003720 <__subdf3+0x634>
a00037b0:	7ff00893          	li	a7,2047
a00037b4:	03141463          	bne	s0,a7,a00037dc <__subdf3+0x6f0>
a00037b8:	1e050a63          	beqz	a0,a00039ac <__subdf3+0x8c0>
a00037bc:	00400437          	lui	s0,0x400
a00037c0:	8c79                	and	s0,s0,a4
a00037c2:	00143413          	seqz	s0,s0
a00037c6:	0412                	slli	s0,s0,0x4
a00037c8:	03159763          	bne	a1,a7,a00037f6 <__subdf3+0x70a>
a00037cc:	00060b63          	beqz	a2,a00037e2 <__subdf3+0x6f6>
a00037d0:	004005b7          	lui	a1,0x400
a00037d4:	8df5                	and	a1,a1,a3
a00037d6:	e591                	bnez	a1,a00037e2 <__subdf3+0x6f6>
a00037d8:	4441                	li	s0,16
a00037da:	a021                	j	a00037e2 <__subdf3+0x6f6>
a00037dc:	4401                	li	s0,0
a00037de:	ff1587e3          	beq	a1,a7,a00037cc <__subdf3+0x6e0>
a00037e2:	00051a63          	bnez	a0,a00037f6 <__subdf3+0x70a>
a00037e6:	16060a63          	beqz	a2,a000395a <__subdf3+0x86e>
a00037ea:	8736                	mv	a4,a3
a00037ec:	87c2                	mv	a5,a6
a00037ee:	849a                	mv	s1,t1
a00037f0:	b921                	j	a0003408 <__subdf3+0x31c>
a00037f2:	4401                	li	s0,0
a00037f4:	bfe1                	j	a00037cc <__subdf3+0x6e0>
a00037f6:	c00609e3          	beqz	a2,a0003408 <__subdf3+0x31c>
a00037fa:	b105                	j	a000341a <__subdf3+0x32e>
a00037fc:	41078a33          	sub	s4,a5,a6
a0003800:	0147b633          	sltu	a2,a5,s4
a0003804:	40d70933          	sub	s2,a4,a3
a0003808:	40c90933          	sub	s2,s2,a2
a000380c:	00800637          	lui	a2,0x800
a0003810:	00c97633          	and	a2,s2,a2
a0003814:	c62d                	beqz	a2,a000387e <__subdf3+0x792>
a0003816:	40f80a33          	sub	s4,a6,a5
a000381a:	8e99                	sub	a3,a3,a4
a000381c:	01483833          	sltu	a6,a6,s4
a0003820:	41068933          	sub	s2,a3,a6
a0003824:	849a                	mv	s1,t1
a0003826:	06090063          	beqz	s2,a0003886 <__subdf3+0x79a>
a000382a:	854a                	mv	a0,s2
a000382c:	bd4fd0ef          	jal	ra,a0000c00 <__clzsi2>
a0003830:	ff850613          	addi	a2,a0,-8 # 7ffff8 <nocache_min_size+0x7faff8>
a0003834:	47fd                	li	a5,31
a0003836:	04c7ce63          	blt	a5,a2,a0003892 <__subdf3+0x7a6>
a000383a:	02000693          	li	a3,32
a000383e:	8e91                	sub	a3,a3,a2
a0003840:	00c91733          	sll	a4,s2,a2
a0003844:	00da56b3          	srl	a3,s4,a3
a0003848:	8ed9                	or	a3,a3,a4
a000384a:	00ca1833          	sll	a6,s4,a2
a000384e:	06864b63          	blt	a2,s0,a00038c4 <__subdf3+0x7d8>
a0003852:	8e01                	sub	a2,a2,s0
a0003854:	00160713          	addi	a4,a2,1 # 800001 <nocache_min_size+0x7fb001>
a0003858:	47fd                	li	a5,31
a000385a:	04e7c263          	blt	a5,a4,a000389e <__subdf3+0x7b2>
a000385e:	02000613          	li	a2,32
a0003862:	8e19                	sub	a2,a2,a4
a0003864:	00c697b3          	sll	a5,a3,a2
a0003868:	00e85533          	srl	a0,a6,a4
a000386c:	00c81633          	sll	a2,a6,a2
a0003870:	8fc9                	or	a5,a5,a0
a0003872:	00c03633          	snez	a2,a2
a0003876:	8fd1                	or	a5,a5,a2
a0003878:	00e6d733          	srl	a4,a3,a4
a000387c:	b555                	j	a0003720 <__subdf3+0x634>
a000387e:	012a67b3          	or	a5,s4,s2
a0003882:	f3d5                	bnez	a5,a0003826 <__subdf3+0x73a>
a0003884:	b705                	j	a00037a4 <__subdf3+0x6b8>
a0003886:	8552                	mv	a0,s4
a0003888:	b78fd0ef          	jal	ra,a0000c00 <__clzsi2>
a000388c:	02050513          	addi	a0,a0,32
a0003890:	b745                	j	a0003830 <__subdf3+0x744>
a0003892:	fd850693          	addi	a3,a0,-40
a0003896:	00da16b3          	sll	a3,s4,a3
a000389a:	4801                	li	a6,0
a000389c:	bf4d                	j	a000384e <__subdf3+0x762>
a000389e:	1605                	addi	a2,a2,-31
a00038a0:	02000593          	li	a1,32
a00038a4:	00c6d633          	srl	a2,a3,a2
a00038a8:	4781                	li	a5,0
a00038aa:	00b70763          	beq	a4,a1,a00038b8 <__subdf3+0x7cc>
a00038ae:	04000793          	li	a5,64
a00038b2:	8f99                	sub	a5,a5,a4
a00038b4:	00f697b3          	sll	a5,a3,a5
a00038b8:	00f867b3          	or	a5,a6,a5
a00038bc:	00f037b3          	snez	a5,a5
a00038c0:	8fd1                	or	a5,a5,a2
a00038c2:	b5ed                	j	a00037ac <__subdf3+0x6c0>
a00038c4:	ff8007b7          	lui	a5,0xff800
a00038c8:	17fd                	addi	a5,a5,-1
a00038ca:	40c40633          	sub	a2,s0,a2
a00038ce:	8efd                	and	a3,a3,a5
a00038d0:	b2c9                	j	a0003292 <__subdf3+0x1a6>
a00038d2:	8736                	mv	a4,a3
a00038d4:	87c2                	mv	a5,a6
a00038d6:	b5a9                	j	a0003720 <__subdf3+0x634>
a00038d8:	8736                	mv	a4,a3
a00038da:	87c2                	mv	a5,a6
a00038dc:	bd75                	j	a0003798 <__subdf3+0x6ac>
a00038de:	8732                	mv	a4,a2
a00038e0:	87ae                	mv	a5,a1
a00038e2:	bd3d                	j	a0003720 <__subdf3+0x634>
a00038e4:	8426                	mv	s0,s1
a00038e6:	e6049fe3          	bnez	s1,a0003764 <__subdf3+0x678>
a00038ea:	ff86b693          	sltiu	a3,a3,-8
a00038ee:	0016c693          	xori	a3,a3,1
a00038f2:	95b6                	add	a1,a1,a3
a00038f4:	4405                	li	s0,1
a00038f6:	b5bd                	j	a0003764 <__subdf3+0x678>
a00038f8:	4405                	li	s0,1
a00038fa:	e60485e3          	beqz	s1,a0003764 <__subdf3+0x678>
a00038fe:	ff86b693          	sltiu	a3,a3,-8
a0003902:	0016c693          	xori	a3,a3,1
a0003906:	95b6                	add	a1,a1,a3
a0003908:	8426                	mv	s0,s1
a000390a:	bda9                	j	a0003764 <__subdf3+0x678>
a000390c:	4701                	li	a4,0
a000390e:	7ff00613          	li	a2,2047
a0003912:	b871                	j	a00031ae <__subdf3+0xc2>
a0003914:	87c2                	mv	a5,a6
a0003916:	7ff00613          	li	a2,2047
a000391a:	be59                	j	a00034b0 <__subdf3+0x3c4>
a000391c:	577d                	li	a4,-1
a000391e:	57fd                	li	a5,-1
a0003920:	7fe00613          	li	a2,2046
a0003924:	4581                	li	a1,0
a0003926:	be65                	j	a00034de <__subdf3+0x3f2>
a0003928:	4701                	li	a4,0
a000392a:	4781                	li	a5,0
a000392c:	bced                	j	a0003426 <__subdf3+0x33a>
a000392e:	4701                	li	a4,0
a0003930:	4781                	li	a5,0
a0003932:	bff1                	j	a000390e <__subdf3+0x822>
a0003934:	87c2                	mv	a5,a6
a0003936:	4581                	li	a1,0
a0003938:	bcb5                	j	a00033b4 <__subdf3+0x2c8>
a000393a:	4701                	li	a4,0
a000393c:	849a                	mv	s1,t1
a000393e:	b4e5                	j	a0003426 <__subdf3+0x33a>
a0003940:	87c2                	mv	a5,a6
a0003942:	849a                	mv	s1,t1
a0003944:	bfcd                	j	a0003936 <__subdf3+0x84a>
a0003946:	4701                	li	a4,0
a0003948:	7ff00613          	li	a2,2047
a000394c:	849a                	mv	s1,t1
a000394e:	b085                	j	a00031ae <__subdf3+0xc2>
a0003950:	87c2                	mv	a5,a6
a0003952:	7ff00613          	li	a2,2047
a0003956:	849a                	mv	s1,t1
a0003958:	bea1                	j	a00034b0 <__subdf3+0x3c4>
a000395a:	4781                	li	a5,0
a000395c:	4481                	li	s1,0
a000395e:	00400737          	lui	a4,0x400
a0003962:	7ff00613          	li	a2,2047
a0003966:	4441                	li	s0,16
a0003968:	bc7d                	j	a0003426 <__subdf3+0x33a>
a000396a:	4701                	li	a4,0
a000396c:	4781                	li	a5,0
a000396e:	4601                	li	a2,0
a0003970:	b83d                	j	a00031ae <__subdf3+0xc2>
a0003972:	e489                	bnez	s1,a000397c <__subdf3+0x890>
a0003974:	00878693          	addi	a3,a5,8 # ff800008 <__psram_limit+0x57400008>
a0003978:	b669                	j	a0003502 <__subdf3+0x416>
a000397a:	fced                	bnez	s1,a0003974 <__subdf3+0x888>
a000397c:	a40595e3          	bnez	a1,a00033c6 <__subdf3+0x2da>
a0003980:	b45d                	j	a0003426 <__subdf3+0x33a>
a0003982:	4781                	li	a5,0
a0003984:	02098063          	beqz	s3,a00039a4 <__subdf3+0x8b8>
a0003988:	470d                	li	a4,3
a000398a:	00e99863          	bne	s3,a4,a000399a <__subdf3+0x8ae>
a000398e:	00048b63          	beqz	s1,a00039a4 <__subdf3+0x8b8>
a0003992:	57fd                	li	a5,-1
a0003994:	7fe00613          	li	a2,2046
a0003998:	a031                	j	a00039a4 <__subdf3+0x8b8>
a000399a:	4709                	li	a4,2
a000399c:	fee99be3          	bne	s3,a4,a0003992 <__subdf3+0x8a6>
a00039a0:	fe0489e3          	beqz	s1,a0003992 <__subdf3+0x8a6>
a00039a4:	00546413          	ori	s0,s0,5
a00039a8:	873e                	mv	a4,a5
a00039aa:	bc59                	j	a0003440 <__subdf3+0x354>
a00039ac:	e48583e3          	beq	a1,s0,a00037f2 <__subdf3+0x706>
a00039b0:	4401                	li	s0,0
a00039b2:	bd15                	j	a00037e6 <__subdf3+0x6fa>
a00039b4:	a4858ee3          	beq	a1,s0,a0003410 <__subdf3+0x324>
a00039b8:	4401                	li	s0,0
a00039ba:	b4a9                	j	a0003404 <__subdf3+0x318>

a00039bc <__fixdfsi>:
a00039bc:	882a                	mv	a6,a0
a00039be:	002027f3          	frrm	a5
a00039c2:	001007b7          	lui	a5,0x100
a00039c6:	0145d693          	srli	a3,a1,0x14
a00039ca:	fff78613          	addi	a2,a5,-1 # fffff <nocache_min_size+0xfafff>
a00039ce:	7ff6f693          	andi	a3,a3,2047
a00039d2:	3fe00713          	li	a4,1022
a00039d6:	8e6d                	and	a2,a2,a1
a00039d8:	81fd                	srli	a1,a1,0x1f
a00039da:	00d74763          	blt	a4,a3,a00039e8 <__fixdfsi+0x2c>
a00039de:	08069b63          	bnez	a3,a0003a74 <__fixdfsi+0xb8>
a00039e2:	8d51                	or	a0,a0,a2
a00039e4:	e941                	bnez	a0,a0003a74 <__fixdfsi+0xb8>
a00039e6:	8082                	ret
a00039e8:	41d00713          	li	a4,1053
a00039ec:	02d75863          	bge	a4,a3,a0003a1c <__fixdfsi+0x60>
a00039f0:	80000737          	lui	a4,0x80000
a00039f4:	fff74713          	not	a4,a4
a00039f8:	00e58533          	add	a0,a1,a4
a00039fc:	cdbd                	beqz	a1,a0003a7a <__fixdfsi+0xbe>
a00039fe:	41e00793          	li	a5,1054
a0003a02:	4741                	li	a4,16
a0003a04:	04f69263          	bne	a3,a5,a0003a48 <__fixdfsi+0x8c>
a0003a08:	00b61793          	slli	a5,a2,0xb
a0003a0c:	01585613          	srli	a2,a6,0x15
a0003a10:	8fd1                	or	a5,a5,a2
a0003a12:	eb9d                	bnez	a5,a0003a48 <__fixdfsi+0x8c>
a0003a14:	00b81713          	slli	a4,a6,0xb
a0003a18:	e33d                	bnez	a4,a0003a7e <__fixdfsi+0xc2>
a0003a1a:	8082                	ret
a0003a1c:	43300513          	li	a0,1075
a0003a20:	8d15                	sub	a0,a0,a3
a0003a22:	477d                	li	a4,31
a0003a24:	8fd1                	or	a5,a5,a2
a0003a26:	02a74463          	blt	a4,a0,a0003a4e <__fixdfsi+0x92>
a0003a2a:	bed68613          	addi	a2,a3,-1043 # 7feffbed <BOOT2_PT_ADDR+0x1ced7fed>
a0003a2e:	00c816b3          	sll	a3,a6,a2
a0003a32:	00c797b3          	sll	a5,a5,a2
a0003a36:	00a85533          	srl	a0,a6,a0
a0003a3a:	00d03733          	snez	a4,a3
a0003a3e:	8d5d                	or	a0,a0,a5
a0003a40:	c199                	beqz	a1,a0003a46 <__fixdfsi+0x8a>
a0003a42:	40a00533          	neg	a0,a0
a0003a46:	c319                	beqz	a4,a0003a4c <__fixdfsi+0x90>
a0003a48:	00172073          	csrs	fflags,a4
a0003a4c:	8082                	ret
a0003a4e:	02000613          	li	a2,32
a0003a52:	4701                	li	a4,0
a0003a54:	00c50663          	beq	a0,a2,a0003a60 <__fixdfsi+0xa4>
a0003a58:	c0d68713          	addi	a4,a3,-1011
a0003a5c:	00e79733          	sll	a4,a5,a4
a0003a60:	41300513          	li	a0,1043
a0003a64:	01076733          	or	a4,a4,a6
a0003a68:	8d15                	sub	a0,a0,a3
a0003a6a:	00e03733          	snez	a4,a4
a0003a6e:	00a7d533          	srl	a0,a5,a0
a0003a72:	b7f9                	j	a0003a40 <__fixdfsi+0x84>
a0003a74:	4501                	li	a0,0
a0003a76:	4705                	li	a4,1
a0003a78:	bfc1                	j	a0003a48 <__fixdfsi+0x8c>
a0003a7a:	4741                	li	a4,16
a0003a7c:	b7f1                	j	a0003a48 <__fixdfsi+0x8c>
a0003a7e:	872e                	mv	a4,a1
a0003a80:	b7e1                	j	a0003a48 <__fixdfsi+0x8c>

a0003a82 <__fixunsdfsi>:
a0003a82:	86aa                	mv	a3,a0
a0003a84:	002027f3          	frrm	a5
a0003a88:	00100837          	lui	a6,0x100
a0003a8c:	0145d793          	srli	a5,a1,0x14
a0003a90:	fff80513          	addi	a0,a6,-1 # fffff <nocache_min_size+0xfafff>
a0003a94:	7ff7f793          	andi	a5,a5,2047
a0003a98:	3fe00613          	li	a2,1022
a0003a9c:	8d6d                	and	a0,a0,a1
a0003a9e:	01f5d713          	srli	a4,a1,0x1f
a0003aa2:	00f64763          	blt	a2,a5,a0003ab0 <__fixunsdfsi+0x2e>
a0003aa6:	06079763          	bnez	a5,a0003b14 <__fixunsdfsi+0x92>
a0003aaa:	8d55                	or	a0,a0,a3
a0003aac:	e525                	bnez	a0,a0003b14 <__fixunsdfsi+0x92>
a0003aae:	8082                	ret
a0003ab0:	41f00613          	li	a2,1055
a0003ab4:	8e19                	sub	a2,a2,a4
a0003ab6:	02c7d863          	bge	a5,a2,a0003ae6 <__fixunsdfsi+0x64>
a0003aba:	04071f63          	bnez	a4,a0003b18 <__fixunsdfsi+0x96>
a0003abe:	010565b3          	or	a1,a0,a6
a0003ac2:	43300513          	li	a0,1075
a0003ac6:	8d1d                	sub	a0,a0,a5
a0003ac8:	477d                	li	a4,31
a0003aca:	02a74463          	blt	a4,a0,a0003af2 <__fixunsdfsi+0x70>
a0003ace:	bed78793          	addi	a5,a5,-1043
a0003ad2:	00f595b3          	sll	a1,a1,a5
a0003ad6:	00a6d533          	srl	a0,a3,a0
a0003ada:	00f697b3          	sll	a5,a3,a5
a0003ade:	8d4d                	or	a0,a0,a1
a0003ae0:	cb8d                	beqz	a5,a0003b12 <__fixunsdfsi+0x90>
a0003ae2:	4785                	li	a5,1
a0003ae4:	a021                	j	a0003aec <__fixunsdfsi+0x6a>
a0003ae6:	fff70513          	addi	a0,a4,-1 # 7fffffff <__psram_limit+0xd7bfffff>
a0003aea:	47c1                	li	a5,16
a0003aec:	0017a073          	csrs	fflags,a5
a0003af0:	a00d                	j	a0003b12 <__fixunsdfsi+0x90>
a0003af2:	02000613          	li	a2,32
a0003af6:	4701                	li	a4,0
a0003af8:	00c50663          	beq	a0,a2,a0003b04 <__fixunsdfsi+0x82>
a0003afc:	c0d78713          	addi	a4,a5,-1011
a0003b00:	00e59733          	sll	a4,a1,a4
a0003b04:	41300513          	li	a0,1043
a0003b08:	8d1d                	sub	a0,a0,a5
a0003b0a:	8f55                	or	a4,a4,a3
a0003b0c:	00a5d533          	srl	a0,a1,a0
a0003b10:	fb69                	bnez	a4,a0003ae2 <__fixunsdfsi+0x60>
a0003b12:	8082                	ret
a0003b14:	4501                	li	a0,0
a0003b16:	b7f1                	j	a0003ae2 <__fixunsdfsi+0x60>
a0003b18:	4501                	li	a0,0
a0003b1a:	bfc1                	j	a0003aea <__fixunsdfsi+0x68>

a0003b1c <__floatsidf>:
a0003b1c:	1141                	addi	sp,sp,-16
a0003b1e:	c606                	sw	ra,12(sp)
a0003b20:	c422                	sw	s0,8(sp)
a0003b22:	c226                	sw	s1,4(sp)
a0003b24:	cd29                	beqz	a0,a0003b7e <__floatsidf+0x62>
a0003b26:	41f55793          	srai	a5,a0,0x1f
a0003b2a:	00a7c433          	xor	s0,a5,a0
a0003b2e:	8c1d                	sub	s0,s0,a5
a0003b30:	01f55493          	srli	s1,a0,0x1f
a0003b34:	8522                	mv	a0,s0
a0003b36:	8cafd0ef          	jal	ra,a0000c00 <__clzsi2>
a0003b3a:	41e00713          	li	a4,1054
a0003b3e:	47a9                	li	a5,10
a0003b40:	8f09                	sub	a4,a4,a0
a0003b42:	02a7c863          	blt	a5,a0,a0003b72 <__floatsidf+0x56>
a0003b46:	47ad                	li	a5,11
a0003b48:	8f89                	sub	a5,a5,a0
a0003b4a:	0555                	addi	a0,a0,21
a0003b4c:	00f457b3          	srl	a5,s0,a5
a0003b50:	00a41433          	sll	s0,s0,a0
a0003b54:	8526                	mv	a0,s1
a0003b56:	07b2                	slli	a5,a5,0xc
a0003b58:	0752                	slli	a4,a4,0x14
a0003b5a:	83b1                	srli	a5,a5,0xc
a0003b5c:	057e                	slli	a0,a0,0x1f
a0003b5e:	8fd9                	or	a5,a5,a4
a0003b60:	40b2                	lw	ra,12(sp)
a0003b62:	00a7e733          	or	a4,a5,a0
a0003b66:	8522                	mv	a0,s0
a0003b68:	4422                	lw	s0,8(sp)
a0003b6a:	4492                	lw	s1,4(sp)
a0003b6c:	85ba                	mv	a1,a4
a0003b6e:	0141                	addi	sp,sp,16
a0003b70:	8082                	ret
a0003b72:	1555                	addi	a0,a0,-11
a0003b74:	00a417b3          	sll	a5,s0,a0
a0003b78:	8526                	mv	a0,s1
a0003b7a:	4401                	li	s0,0
a0003b7c:	bfe9                	j	a0003b56 <__floatsidf+0x3a>
a0003b7e:	4701                	li	a4,0
a0003b80:	4781                	li	a5,0
a0003b82:	bfe5                	j	a0003b7a <__floatsidf+0x5e>

a0003b84 <__floatunsidf>:
a0003b84:	1141                	addi	sp,sp,-16
a0003b86:	c422                	sw	s0,8(sp)
a0003b88:	c606                	sw	ra,12(sp)
a0003b8a:	842a                	mv	s0,a0
a0003b8c:	c129                	beqz	a0,a0003bce <__floatunsidf+0x4a>
a0003b8e:	872fd0ef          	jal	ra,a0000c00 <__clzsi2>
a0003b92:	41e00713          	li	a4,1054
a0003b96:	47a9                	li	a5,10
a0003b98:	8f09                	sub	a4,a4,a0
a0003b9a:	02a7c463          	blt	a5,a0,a0003bc2 <__floatunsidf+0x3e>
a0003b9e:	47ad                	li	a5,11
a0003ba0:	8f89                	sub	a5,a5,a0
a0003ba2:	0555                	addi	a0,a0,21
a0003ba4:	00f457b3          	srl	a5,s0,a5
a0003ba8:	00a41433          	sll	s0,s0,a0
a0003bac:	40b2                	lw	ra,12(sp)
a0003bae:	8522                	mv	a0,s0
a0003bb0:	07b2                	slli	a5,a5,0xc
a0003bb2:	4422                	lw	s0,8(sp)
a0003bb4:	0752                	slli	a4,a4,0x14
a0003bb6:	83b1                	srli	a5,a5,0xc
a0003bb8:	00f766b3          	or	a3,a4,a5
a0003bbc:	85b6                	mv	a1,a3
a0003bbe:	0141                	addi	sp,sp,16
a0003bc0:	8082                	ret
a0003bc2:	ff550793          	addi	a5,a0,-11
a0003bc6:	00f417b3          	sll	a5,s0,a5
a0003bca:	4401                	li	s0,0
a0003bcc:	b7c5                	j	a0003bac <__floatunsidf+0x28>
a0003bce:	4781                	li	a5,0
a0003bd0:	4701                	li	a4,0
a0003bd2:	bfe9                	j	a0003bac <__floatunsidf+0x28>

a0003bd4 <__fixdfdi>:
a0003bd4:	002027f3          	frrm	a5
a0003bd8:	00100737          	lui	a4,0x100
a0003bdc:	0145d613          	srli	a2,a1,0x14
a0003be0:	fff70693          	addi	a3,a4,-1 # fffff <nocache_min_size+0xfafff>
a0003be4:	7ff67613          	andi	a2,a2,2047
a0003be8:	3fe00793          	li	a5,1022
a0003bec:	8eed                	and	a3,a3,a1
a0003bee:	00c7cb63          	blt	a5,a2,a0003c04 <__fixdfdi+0x30>
a0003bf2:	0c061b63          	bnez	a2,a0003cc8 <__fixdfdi+0xf4>
a0003bf6:	00a6e733          	or	a4,a3,a0
a0003bfa:	4781                	li	a5,0
a0003bfc:	4581                	li	a1,0
a0003bfe:	e779                	bnez	a4,a0003ccc <__fixdfdi+0xf8>
a0003c00:	853e                	mv	a0,a5
a0003c02:	8082                	ret
a0003c04:	1141                	addi	sp,sp,-16
a0003c06:	c422                	sw	s0,8(sp)
a0003c08:	c606                	sw	ra,12(sp)
a0003c0a:	43d00793          	li	a5,1085
a0003c0e:	01f5d413          	srli	s0,a1,0x1f
a0003c12:	02c7dc63          	bge	a5,a2,a0003c4a <__fixdfdi+0x76>
a0003c16:	4785                	li	a5,1
a0003c18:	8f81                	sub	a5,a5,s0
a0003c1a:	41f7d813          	srai	a6,a5,0x1f
a0003c1e:	800005b7          	lui	a1,0x80000
a0003c22:	00f03733          	snez	a4,a5
a0003c26:	410585b3          	sub	a1,a1,a6
a0003c2a:	40f007b3          	neg	a5,a5
a0003c2e:	8d99                	sub	a1,a1,a4
a0003c30:	c055                	beqz	s0,a0003cd4 <__fixdfdi+0x100>
a0003c32:	43e00813          	li	a6,1086
a0003c36:	4741                	li	a4,16
a0003c38:	07061263          	bne	a2,a6,a0003c9c <__fixdfdi+0xc8>
a0003c3c:	8d55                	or	a0,a0,a3
a0003c3e:	ed39                	bnez	a0,a0003c9c <__fixdfdi+0xc8>
a0003c40:	40b2                	lw	ra,12(sp)
a0003c42:	4422                	lw	s0,8(sp)
a0003c44:	853e                	mv	a0,a5
a0003c46:	0141                	addi	sp,sp,16
a0003c48:	8082                	ret
a0003c4a:	43200793          	li	a5,1074
a0003c4e:	00e6e5b3          	or	a1,a3,a4
a0003c52:	00c7d963          	bge	a5,a2,a0003c64 <__fixdfdi+0x90>
a0003c56:	bcd60613          	addi	a2,a2,-1075
a0003c5a:	249d                	jal	a0003ec0 <__ashldi3>
a0003c5c:	87aa                	mv	a5,a0
a0003c5e:	d06d                	beqz	s0,a0003c40 <__fixdfdi+0x6c>
a0003c60:	4701                	li	a4,0
a0003c62:	a02d                	j	a0003c8c <__fixdfdi+0xb8>
a0003c64:	43300693          	li	a3,1075
a0003c68:	8e91                	sub	a3,a3,a2
a0003c6a:	47fd                	li	a5,31
a0003c6c:	02d7cb63          	blt	a5,a3,a0003ca2 <__fixdfdi+0xce>
a0003c70:	bed60613          	addi	a2,a2,-1043
a0003c74:	00c51733          	sll	a4,a0,a2
a0003c78:	00d557b3          	srl	a5,a0,a3
a0003c7c:	00c59633          	sll	a2,a1,a2
a0003c80:	00e03733          	snez	a4,a4
a0003c84:	8fd1                	or	a5,a5,a2
a0003c86:	00d5d5b3          	srl	a1,a1,a3
a0003c8a:	c801                	beqz	s0,a0003c9a <__fixdfdi+0xc6>
a0003c8c:	00f036b3          	snez	a3,a5
a0003c90:	40b005b3          	neg	a1,a1
a0003c94:	8d95                	sub	a1,a1,a3
a0003c96:	40f007b3          	neg	a5,a5
a0003c9a:	d35d                	beqz	a4,a0003c40 <__fixdfdi+0x6c>
a0003c9c:	00172073          	csrs	fflags,a4
a0003ca0:	b745                	j	a0003c40 <__fixdfdi+0x6c>
a0003ca2:	02000793          	li	a5,32
a0003ca6:	4701                	li	a4,0
a0003ca8:	00f68663          	beq	a3,a5,a0003cb4 <__fixdfdi+0xe0>
a0003cac:	c0d60713          	addi	a4,a2,-1011
a0003cb0:	00e59733          	sll	a4,a1,a4
a0003cb4:	41300793          	li	a5,1043
a0003cb8:	8f49                	or	a4,a4,a0
a0003cba:	8f91                	sub	a5,a5,a2
a0003cbc:	00f5d7b3          	srl	a5,a1,a5
a0003cc0:	00e03733          	snez	a4,a4
a0003cc4:	4581                	li	a1,0
a0003cc6:	b7d1                	j	a0003c8a <__fixdfdi+0xb6>
a0003cc8:	4781                	li	a5,0
a0003cca:	4581                	li	a1,0
a0003ccc:	4705                	li	a4,1
a0003cce:	00172073          	csrs	fflags,a4
a0003cd2:	b73d                	j	a0003c00 <__fixdfdi+0x2c>
a0003cd4:	4741                	li	a4,16
a0003cd6:	b7d9                	j	a0003c9c <__fixdfdi+0xc8>

a0003cd8 <__floatdidf>:
a0003cd8:	7179                	addi	sp,sp,-48
a0003cda:	d606                	sw	ra,44(sp)
a0003cdc:	d422                	sw	s0,40(sp)
a0003cde:	d226                	sw	s1,36(sp)
a0003ce0:	d04a                	sw	s2,32(sp)
a0003ce2:	ce4e                	sw	s3,28(sp)
a0003ce4:	cc52                	sw	s4,24(sp)
a0003ce6:	ca56                	sw	s5,20(sp)
a0003ce8:	c85a                	sw	s6,16(sp)
a0003cea:	c65e                	sw	s7,12(sp)
a0003cec:	c462                	sw	s8,8(sp)
a0003cee:	00202a73          	frrm	s4
a0003cf2:	00b567b3          	or	a5,a0,a1
a0003cf6:	18078963          	beqz	a5,a0003e88 <__floatdidf+0x1b0>
a0003cfa:	842a                	mv	s0,a0
a0003cfc:	8bae                	mv	s7,a1
a0003cfe:	89ae                	mv	s3,a1
a0003d00:	01f5d913          	srli	s2,a1,0x1f
a0003d04:	0005da63          	bgez	a1,a0003d18 <__floatdidf+0x40>
a0003d08:	00a03733          	snez	a4,a0
a0003d0c:	40b009b3          	neg	s3,a1
a0003d10:	40e989b3          	sub	s3,s3,a4
a0003d14:	40a00433          	neg	s0,a0
a0003d18:	84ce                	mv	s1,s3
a0003d1a:	06098d63          	beqz	s3,a0003d94 <__floatdidf+0xbc>
a0003d1e:	854e                	mv	a0,s3
a0003d20:	ee1fc0ef          	jal	ra,a0000c00 <__clzsi2>
a0003d24:	8aaa                	mv	s5,a0
a0003d26:	43e00b13          	li	s6,1086
a0003d2a:	415b0b33          	sub	s6,s6,s5
a0003d2e:	43300793          	li	a5,1075
a0003d32:	0767cd63          	blt	a5,s6,a0003dac <__floatdidf+0xd4>
a0003d36:	47ad                	li	a5,11
a0003d38:	4701                	li	a4,0
a0003d3a:	0357d363          	bge	a5,s5,a0003d60 <__floatdidf+0x88>
a0003d3e:	02a00793          	li	a5,42
a0003d42:	0557cf63          	blt	a5,s5,a0003da0 <__floatdidf+0xc8>
a0003d46:	02b00493          	li	s1,43
a0003d4a:	ff5a8693          	addi	a3,s5,-11
a0003d4e:	415484b3          	sub	s1,s1,s5
a0003d52:	009454b3          	srl	s1,s0,s1
a0003d56:	00d997b3          	sll	a5,s3,a3
a0003d5a:	8cdd                	or	s1,s1,a5
a0003d5c:	00d41433          	sll	s0,s0,a3
a0003d60:	00c49793          	slli	a5,s1,0xc
a0003d64:	0b52                	slli	s6,s6,0x14
a0003d66:	83b1                	srli	a5,a5,0xc
a0003d68:	00fb67b3          	or	a5,s6,a5
a0003d6c:	097e                	slli	s2,s2,0x1f
a0003d6e:	0127e6b3          	or	a3,a5,s2
a0003d72:	8522                	mv	a0,s0
a0003d74:	85b6                	mv	a1,a3
a0003d76:	c319                	beqz	a4,a0003d7c <__floatdidf+0xa4>
a0003d78:	0010e073          	csrsi	fflags,1
a0003d7c:	50b2                	lw	ra,44(sp)
a0003d7e:	5422                	lw	s0,40(sp)
a0003d80:	5492                	lw	s1,36(sp)
a0003d82:	5902                	lw	s2,32(sp)
a0003d84:	49f2                	lw	s3,28(sp)
a0003d86:	4a62                	lw	s4,24(sp)
a0003d88:	4ad2                	lw	s5,20(sp)
a0003d8a:	4b42                	lw	s6,16(sp)
a0003d8c:	4bb2                	lw	s7,12(sp)
a0003d8e:	4c22                	lw	s8,8(sp)
a0003d90:	6145                	addi	sp,sp,48
a0003d92:	8082                	ret
a0003d94:	8522                	mv	a0,s0
a0003d96:	e6bfc0ef          	jal	ra,a0000c00 <__clzsi2>
a0003d9a:	02050a93          	addi	s5,a0,32
a0003d9e:	b761                	j	a0003d26 <__floatdidf+0x4e>
a0003da0:	fd5a8793          	addi	a5,s5,-43
a0003da4:	00f414b3          	sll	s1,s0,a5
a0003da8:	4401                	li	s0,0
a0003daa:	bf5d                	j	a0003d60 <__floatdidf+0x88>
a0003dac:	43600793          	li	a5,1078
a0003db0:	0367d663          	bge	a5,s6,a0003ddc <__floatdidf+0x104>
a0003db4:	4621                	li	a2,8
a0003db6:	41560633          	sub	a2,a2,s5
a0003dba:	8522                	mv	a0,s0
a0003dbc:	85ce                	mv	a1,s3
a0003dbe:	28d9                	jal	a0003e94 <__lshrdi3>
a0003dc0:	8c2a                	mv	s8,a0
a0003dc2:	84ae                	mv	s1,a1
a0003dc4:	8522                	mv	a0,s0
a0003dc6:	85ce                	mv	a1,s3
a0003dc8:	038a8613          	addi	a2,s5,56
a0003dcc:	28d5                	jal	a0003ec0 <__ashldi3>
a0003dce:	00b56433          	or	s0,a0,a1
a0003dd2:	00803433          	snez	s0,s0
a0003dd6:	01846433          	or	s0,s0,s8
a0003dda:	89a6                	mv	s3,s1
a0003ddc:	47a1                	li	a5,8
a0003dde:	0357d463          	bge	a5,s5,a0003e06 <__floatdidf+0x12e>
a0003de2:	02700793          	li	a5,39
a0003de6:	0557ce63          	blt	a5,s5,a0003e42 <__floatdidf+0x16a>
a0003dea:	02800793          	li	a5,40
a0003dee:	ff8a8713          	addi	a4,s5,-8
a0003df2:	415787b3          	sub	a5,a5,s5
a0003df6:	00f457b3          	srl	a5,s0,a5
a0003dfa:	00e999b3          	sll	s3,s3,a4
a0003dfe:	0137e9b3          	or	s3,a5,s3
a0003e02:	00e41433          	sll	s0,s0,a4
a0003e06:	ff8007b7          	lui	a5,0xff800
a0003e0a:	17fd                	addi	a5,a5,-1
a0003e0c:	00747693          	andi	a3,s0,7
a0003e10:	00f9f7b3          	and	a5,s3,a5
a0003e14:	4701                	li	a4,0
a0003e16:	c6a9                	beqz	a3,a0003e60 <__floatdidf+0x188>
a0003e18:	4709                	li	a4,2
a0003e1a:	04ea0063          	beq	s4,a4,a0003e5a <__floatdidf+0x182>
a0003e1e:	470d                	li	a4,3
a0003e20:	02ea0763          	beq	s4,a4,a0003e4e <__floatdidf+0x176>
a0003e24:	4705                	li	a4,1
a0003e26:	020a1d63          	bnez	s4,a0003e60 <__floatdidf+0x188>
a0003e2a:	00f47693          	andi	a3,s0,15
a0003e2e:	4611                	li	a2,4
a0003e30:	02c68863          	beq	a3,a2,a0003e60 <__floatdidf+0x188>
a0003e34:	00440693          	addi	a3,s0,4 # 400004 <nocache_min_size+0x3fb004>
a0003e38:	0086b433          	sltu	s0,a3,s0
a0003e3c:	97a2                	add	a5,a5,s0
a0003e3e:	8436                	mv	s0,a3
a0003e40:	a005                	j	a0003e60 <__floatdidf+0x188>
a0003e42:	fd8a8993          	addi	s3,s5,-40
a0003e46:	013419b3          	sll	s3,s0,s3
a0003e4a:	4401                	li	s0,0
a0003e4c:	bf6d                	j	a0003e06 <__floatdidf+0x12e>
a0003e4e:	4705                	li	a4,1
a0003e50:	000bc863          	bltz	s7,a0003e60 <__floatdidf+0x188>
a0003e54:	00840693          	addi	a3,s0,8
a0003e58:	b7c5                	j	a0003e38 <__floatdidf+0x160>
a0003e5a:	4705                	li	a4,1
a0003e5c:	fe0bcce3          	bltz	s7,a0003e54 <__floatdidf+0x17c>
a0003e60:	008006b7          	lui	a3,0x800
a0003e64:	8efd                	and	a3,a3,a5
a0003e66:	ca89                	beqz	a3,a0003e78 <__floatdidf+0x1a0>
a0003e68:	ff8006b7          	lui	a3,0xff800
a0003e6c:	16fd                	addi	a3,a3,-1
a0003e6e:	43f00b13          	li	s6,1087
a0003e72:	8ff5                	and	a5,a5,a3
a0003e74:	415b0b33          	sub	s6,s6,s5
a0003e78:	00345513          	srli	a0,s0,0x3
a0003e7c:	01d79413          	slli	s0,a5,0x1d
a0003e80:	8c49                	or	s0,s0,a0
a0003e82:	0037d493          	srli	s1,a5,0x3
a0003e86:	bde9                	j	a0003d60 <__floatdidf+0x88>
a0003e88:	4481                	li	s1,0
a0003e8a:	4401                	li	s0,0
a0003e8c:	4b01                	li	s6,0
a0003e8e:	4901                	li	s2,0
a0003e90:	4701                	li	a4,0
a0003e92:	b5f9                	j	a0003d60 <__floatdidf+0x88>

a0003e94 <__lshrdi3>:
a0003e94:	00060d63          	beqz	a2,a0003eae <__lshrdi3+0x1a>
a0003e98:	02000793          	li	a5,32
a0003e9c:	8f91                	sub	a5,a5,a2
a0003e9e:	00f04963          	bgtz	a5,a0003eb0 <__lshrdi3+0x1c>
a0003ea2:	fe060513          	addi	a0,a2,-32
a0003ea6:	4701                	li	a4,0
a0003ea8:	00a5d533          	srl	a0,a1,a0
a0003eac:	85ba                	mv	a1,a4
a0003eae:	8082                	ret
a0003eb0:	00c5d733          	srl	a4,a1,a2
a0003eb4:	00c55533          	srl	a0,a0,a2
a0003eb8:	00f595b3          	sll	a1,a1,a5
a0003ebc:	8d4d                	or	a0,a0,a1
a0003ebe:	b7fd                	j	a0003eac <__lshrdi3+0x18>

a0003ec0 <__ashldi3>:
a0003ec0:	00060d63          	beqz	a2,a0003eda <__ashldi3+0x1a>
a0003ec4:	02000793          	li	a5,32
a0003ec8:	8f91                	sub	a5,a5,a2
a0003eca:	00f04963          	bgtz	a5,a0003edc <__ashldi3+0x1c>
a0003ece:	fe060593          	addi	a1,a2,-32
a0003ed2:	4701                	li	a4,0
a0003ed4:	00b515b3          	sll	a1,a0,a1
a0003ed8:	853a                	mv	a0,a4
a0003eda:	8082                	ret
a0003edc:	00c51733          	sll	a4,a0,a2
a0003ee0:	00c595b3          	sll	a1,a1,a2
a0003ee4:	00f55533          	srl	a0,a0,a5
a0003ee8:	8dc9                	or	a1,a1,a0
a0003eea:	b7fd                	j	a0003ed8 <__ashldi3+0x18>

a0003eec <u8x8_gpio_and_delay_template>:
}

uint8_t u8x8_gpio_and_delay_template(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{

    switch (msg)
a0003eec:	05300793          	li	a5,83
a0003ef0:	08b7e263          	bltu	a5,a1,a0003f74 <u8x8_gpio_and_delay_template+0x88>
a0003ef4:	04f00793          	li	a5,79
a0003ef8:	00b7f663          	bgeu	a5,a1,a0003f04 <u8x8_gpio_and_delay_template+0x18>
    case U8X8_MSG_GPIO_I2C_CLOCK: // arg_int=0: Output low at I2C clock pin
        break;                    // arg_int=1: Input dir with pullup high for I2C clock pin
    case U8X8_MSG_GPIO_I2C_DATA:  // arg_int=0: Output low at I2C data pin
        break;                    // arg_int=1: Input dir with pullup high for I2C data pin
    case U8X8_MSG_GPIO_MENU_SELECT:
        u8x8_SetGPIOResult(u8x8, /* get menu select pin state */ 0);
a0003efc:	020503a3          	sb	zero,39(a0)
    default:
        u8x8_SetGPIOResult(u8x8, 1); // default return value
        break;
    }
    return 1;
}
a0003f00:	4505                	li	a0,1
a0003f02:	8082                	ret
{
a0003f04:	1141                	addi	sp,sp,-16
a0003f06:	c606                	sw	ra,12(sp)
    switch (msg)
a0003f08:	02a00793          	li	a5,42
a0003f0c:	04f58863          	beq	a1,a5,a0003f5c <u8x8_gpio_and_delay_template+0x70>
a0003f10:	00b7fa63          	bgeu	a5,a1,a0003f24 <u8x8_gpio_and_delay_template+0x38>
a0003f14:	02d00793          	li	a5,45
a0003f18:	02b7e763          	bltu	a5,a1,a0003f46 <u8x8_gpio_and_delay_template+0x5a>
}
a0003f1c:	40b2                	lw	ra,12(sp)
a0003f1e:	4505                	li	a0,1
a0003f20:	0141                	addi	sp,sp,16
a0003f22:	8082                	ret
    switch (msg)
a0003f24:	02800793          	li	a5,40
a0003f28:	fef58ae3          	beq	a1,a5,a0003f1c <u8x8_gpio_and_delay_template+0x30>
a0003f2c:	02900793          	li	a5,41
a0003f30:	02f59263          	bne	a1,a5,a0003f54 <u8x8_gpio_and_delay_template+0x68>
        bflb_mtimer_delay_ms(arg_int);
a0003f34:	8532                	mv	a0,a2
a0003f36:	c2fbc097          	auipc	ra,0xc2fbc
a0003f3a:	6de080e7          	jalr	1758(ra) # 62fc0614 <bflb_mtimer_delay_ms>
}
a0003f3e:	40b2                	lw	ra,12(sp)
a0003f40:	4505                	li	a0,1
a0003f42:	0141                	addi	sp,sp,16
a0003f44:	8082                	ret
    switch (msg)
a0003f46:	fc058593          	addi	a1,a1,-64 # 7fffffc0 <__psram_limit+0xd7bfffc0>
a0003f4a:	0ff5f593          	andi	a1,a1,255
a0003f4e:	47bd                	li	a5,15
a0003f50:	fcb7f6e3          	bgeu	a5,a1,a0003f1c <u8x8_gpio_and_delay_template+0x30>
        u8x8_SetGPIOResult(u8x8, 1); // default return value
a0003f54:	4785                	li	a5,1
a0003f56:	02f503a3          	sb	a5,39(a0)
        break;
a0003f5a:	b7c9                	j	a0003f1c <u8x8_gpio_and_delay_template+0x30>
        bflb_mtimer_delay_us(10 * arg_int);
a0003f5c:	04c6160b          	addsl	a2,a2,a2,2
a0003f60:	00161513          	slli	a0,a2,0x1
a0003f64:	c2fbc097          	auipc	ra,0xc2fbc
a0003f68:	67e080e7          	jalr	1662(ra) # 62fc05e2 <bflb_mtimer_delay_us>
}
a0003f6c:	40b2                	lw	ra,12(sp)
a0003f6e:	4505                	li	a0,1
a0003f70:	0141                	addi	sp,sp,16
a0003f72:	8082                	ret
        u8x8_SetGPIOResult(u8x8, 1); // default return value
a0003f74:	4785                	li	a5,1
a0003f76:	02f503a3          	sb	a5,39(a0)
        break;
a0003f7a:	b759                	j	a0003f00 <u8x8_gpio_and_delay_template+0x14>

a0003f7c <u8x8_byte_i2c>:
    struct bflb_device_s *gpio;
    static uint8_t buffer[32]; /* u8g2/u8x8 will never send more than 32 bytes between START_TRANSFER and END_TRANSFER */
    static uint8_t buf_idx;
    uint8_t *data;

    switch (msg)
a0003f7c:	47e1                	li	a5,24
a0003f7e:	06f58863          	beq	a1,a5,a0003fee <u8x8_byte_i2c+0x72>
{
a0003f82:	1101                	addi	sp,sp,-32
a0003f84:	ce06                	sw	ra,28(sp)
a0003f86:	cc22                	sw	s0,24(sp)
    switch (msg)
a0003f88:	00b7fc63          	bgeu	a5,a1,a0003fa0 <u8x8_byte_i2c+0x24>
a0003f8c:	47e5                	li	a5,25
a0003f8e:	06f58463          	beq	a1,a5,a0003ff6 <u8x8_byte_i2c+0x7a>
a0003f92:	1581                	addi	a1,a1,-32

        break;
    default:
        return 0;
    }
    return 1;
a0003f94:	0015b513          	seqz	a0,a1
}
a0003f98:	40f2                	lw	ra,28(sp)
a0003f9a:	4462                	lw	s0,24(sp)
a0003f9c:	6105                	addi	sp,sp,32
a0003f9e:	8082                	ret
    switch (msg)
a0003fa0:	47d1                	li	a5,20
a0003fa2:	08f58463          	beq	a1,a5,a000402a <u8x8_byte_i2c+0xae>
a0003fa6:	47dd                	li	a5,23
        return 0;
a0003fa8:	4501                	li	a0,0
    switch (msg)
a0003faa:	fef597e3          	bne	a1,a5,a0003f98 <u8x8_byte_i2c+0x1c>
        while (arg_int > 0)
a0003fae:	0c060363          	beqz	a2,a0004074 <u8x8_byte_i2c+0xf8>
a0003fb2:	b5018893          	addi	a7,gp,-1200 # 62fc9350 <buf_idx.1>
a0003fb6:	0008c303          	lbu	t1,0(a7)
        data = (uint8_t *)arg_ptr;
a0003fba:	87b6                	mv	a5,a3
a0003fbc:	96b2                	add	a3,a3,a2
a0003fbe:	b5418513          	addi	a0,gp,-1196 # 62fc9354 <buffer.0>
a0003fc2:	40f30833          	sub	a6,t1,a5
a0003fc6:	0001                	nop
            buffer[buf_idx++] = *data;
a0003fc8:	0007c583          	lbu	a1,0(a5) # ff800000 <__psram_limit+0x57400000>
a0003fcc:	01078733          	add	a4,a5,a6
a0003fd0:	0ff77713          	andi	a4,a4,255
a0003fd4:	00e5558b          	srb	a1,a0,a4,0
            data++;
a0003fd8:	0785                	addi	a5,a5,1
        while (arg_int > 0)
a0003fda:	fed797e3          	bne	a5,a3,a0003fc8 <u8x8_byte_i2c+0x4c>
            buffer[buf_idx++] = *data;
a0003fde:	961a                	add	a2,a2,t1
a0003fe0:	00c88023          	sb	a2,0(a7)
}
a0003fe4:	40f2                	lw	ra,28(sp)
a0003fe6:	4462                	lw	s0,24(sp)
    return 1;
a0003fe8:	4505                	li	a0,1
}
a0003fea:	6105                	addi	sp,sp,32
a0003fec:	8082                	ret
        buf_idx = 0;
a0003fee:	b4018823          	sb	zero,-1200(gp) # 62fc9350 <buf_idx.1>
    return 1;
a0003ff2:	4505                	li	a0,1
}
a0003ff4:	8082                	ret
        i2c_transfer(u8x8_GetI2CAddress(u8x8) >> 1, buf_idx, buffer);
a0003ff6:	02454783          	lbu	a5,36(a0)
a0003ffa:	b501c703          	lbu	a4,-1200(gp) # 62fc9350 <buf_idx.1>
    msgs.addr = addr;
a0003ffe:	4017b78b          	extu	a5,a5,16,1
    bflb_i2c_transfer(i2c0, &msgs, 1);
a0004002:	b781a503          	lw	a0,-1160(gp) # 62fc9378 <i2c0>
    msgs.addr = addr;
a0004006:	00f11223          	sh	a5,4(sp)
    bflb_i2c_transfer(i2c0, &msgs, 1);
a000400a:	004c                	addi	a1,sp,4
    msgs.buffer = buffer;
a000400c:	b5418793          	addi	a5,gp,-1196 # 62fc9354 <buffer.0>
    bflb_i2c_transfer(i2c0, &msgs, 1);
a0004010:	4605                	li	a2,1
    msgs.flags = 0;
a0004012:	00011323          	sh	zero,6(sp)
    msgs.buffer = buffer;
a0004016:	c43e                	sw	a5,8(sp)
    msgs.length = len;
a0004018:	00e11623          	sh	a4,12(sp)
    bflb_i2c_transfer(i2c0, &msgs, 1);
a000401c:	755010ef          	jal	ra,a0005f70 <bflb_i2c_transfer>
}
a0004020:	40f2                	lw	ra,28(sp)
a0004022:	4462                	lw	s0,24(sp)
    return 1;
a0004024:	4505                	li	a0,1
}
a0004026:	6105                	addi	sp,sp,32
a0004028:	8082                	ret
        gpio = bflb_device_get_by_name("gpio");
a000402a:	a0008537          	lui	a0,0xa0008
a000402e:	5e050513          	addi	a0,a0,1504 # a00085e0 <__psram_limit+0xf7c085e0>
a0004032:	4e0020ef          	jal	ra,a0006512 <bflb_device_get_by_name>
        bflb_gpio_init(gpio, GPIO_PIN_0, GPIO_FUNC_I2C0 | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);
a0004036:	6e500613          	li	a2,1765
a000403a:	4581                	li	a1,0
        gpio = bflb_device_get_by_name("gpio");
a000403c:	842a                	mv	s0,a0
        bflb_gpio_init(gpio, GPIO_PIN_0, GPIO_FUNC_I2C0 | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);
a000403e:	3cd010ef          	jal	ra,a0005c0a <bflb_gpio_init>
        bflb_gpio_init(gpio, GPIO_PIN_1, GPIO_FUNC_I2C0 | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);
a0004042:	6e500613          	li	a2,1765
a0004046:	4585                	li	a1,1
a0004048:	8522                	mv	a0,s0
a000404a:	3c1010ef          	jal	ra,a0005c0a <bflb_gpio_init>
        i2c0 = bflb_device_get_by_name("i2c0");
a000404e:	a0008537          	lui	a0,0xa0008
a0004052:	5e850513          	addi	a0,a0,1512 # a00085e8 <__psram_limit+0xf7c085e8>
a0004056:	4bc020ef          	jal	ra,a0006512 <bflb_device_get_by_name>
        bflb_i2c_init(i2c0, 400000);
a000405a:	000625b7          	lui	a1,0x62
a000405e:	a8058593          	addi	a1,a1,-1408 # 61a80 <nocache_min_size+0x5ca80>
        i2c0 = bflb_device_get_by_name("i2c0");
a0004062:	b6a1ac23          	sw	a0,-1160(gp) # 62fc9378 <i2c0>
        bflb_i2c_init(i2c0, 400000);
a0004066:	66b010ef          	jal	ra,a0005ed0 <bflb_i2c_init>
}
a000406a:	40f2                	lw	ra,28(sp)
a000406c:	4462                	lw	s0,24(sp)
        bflb_i2c_init(i2c0, 400000);
a000406e:	4505                	li	a0,1
}
a0004070:	6105                	addi	sp,sp,32
a0004072:	8082                	ret
    return 1;
a0004074:	4505                	li	a0,1
a0004076:	b70d                	j	a0003f98 <u8x8_byte_i2c+0x1c>

a0004078 <main>:

int main(void)
{
a0004078:	1101                	addi	sp,sp,-32
a000407a:	ce06                	sw	ra,28(sp)
a000407c:	cc22                	sw	s0,24(sp)
a000407e:	ca26                	sw	s1,20(sp)
a0004080:	c84a                	sw	s2,16(sp)
a0004082:	c64e                	sw	s3,12(sp)
a0004084:	c452                	sw	s4,8(sp)

    board_init();
a0004086:	679020ef          	jal	ra,a0006efe <board_init>

    u8g2_Setup_ssd1306_i2c_128x64_noname_f(&u8g2, U8G2_R0, u8x8_byte_i2c, u8x8_gpio_and_delay_template);
a000408a:	a00046b7          	lui	a3,0xa0004
a000408e:	a0004637          	lui	a2,0xa0004
a0004092:	a000c5b7          	lui	a1,0xa000c
a0004096:	eec68693          	addi	a3,a3,-276 # a0003eec <__psram_limit+0xf7c03eec>
a000409a:	f7c60613          	addi	a2,a2,-132 # a0003f7c <__psram_limit+0xf7c03f7c>
a000409e:	47c58593          	addi	a1,a1,1148 # a000c47c <__psram_limit+0xf7c0c47c>
a00040a2:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a00040a6:	27e030ef          	jal	ra,a0007324 <u8g2_Setup_ssd1306_i2c_128x64_noname_f>
    u8g2_InitDisplay(&u8g2);
a00040aa:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a00040ae:	4e0040ef          	jal	ra,a000858e <u8x8_InitDisplay>
    u8g2_SetPowerSave(&u8g2, 0);
a00040b2:	4581                	li	a1,0
a00040b4:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a00040b8:	4e0040ef          	jal	ra,a0008598 <u8x8_SetPowerSave>

    gpio = bflb_device_get_by_name("gpio");
a00040bc:	a0008537          	lui	a0,0xa0008
a00040c0:	5e050513          	addi	a0,a0,1504 # a00085e0 <__psram_limit+0xf7c085e0>
a00040c4:	44e020ef          	jal	ra,a0006512 <bflb_device_get_by_name>
a00040c8:	b7418413          	addi	s0,gp,-1164 # 62fc9374 <gpio>

    bflb_gpio_init(gpio, GPIO_PIN_12, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
a00040cc:	2a000613          	li	a2,672
a00040d0:	45b1                	li	a1,12
    gpio = bflb_device_get_by_name("gpio");
a00040d2:	c008                	sw	a0,0(s0)
    bflb_gpio_init(gpio, GPIO_PIN_12, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
a00040d4:	337010ef          	jal	ra,a0005c0a <bflb_gpio_init>
    bflb_gpio_init(gpio, GPIO_PIN_14, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
a00040d8:	4008                	lw	a0,0(s0)
a00040da:	2a000613          	li	a2,672
a00040de:	45b9                	li	a1,14
a00040e0:	32b010ef          	jal	ra,a0005c0a <bflb_gpio_init>
    bflb_gpio_init(gpio, GPIO_PIN_15, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
a00040e4:	4008                	lw	a0,0(s0)
a00040e6:	2a000613          	li	a2,672
a00040ea:	45bd                	li	a1,15
a00040ec:	31f010ef          	jal	ra,a0005c0a <bflb_gpio_init>

    bflb_gpio_reset(gpio, GPIO_PIN_12);
a00040f0:	4008                	lw	a0,0(s0)
a00040f2:	45b1                	li	a1,12
a00040f4:	a0009a37          	lui	s4,0xa0009
a00040f8:	403010ef          	jal	ra,a0005cfa <bflb_gpio_reset>
    bflb_gpio_reset(gpio, GPIO_PIN_14);
a00040fc:	4008                	lw	a0,0(s0)
a00040fe:	45b9                	li	a1,14
a0004100:	a00089b7          	lui	s3,0xa0008
a0004104:	3f7010ef          	jal	ra,a0005cfa <bflb_gpio_reset>
    bflb_gpio_reset(gpio, GPIO_PIN_15);
a0004108:	4008                	lw	a0,0(s0)
a000410a:	45bd                	li	a1,15
        

        //u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
        //LOG_F("2");
        u8g2_SetFont(&u8g2,u8g2_font_wqy12_t_chinese3);
        for(int i=1;i<=4;i++){
a000410c:	04f00913          	li	s2,79
    bflb_gpio_reset(gpio, GPIO_PIN_15);
a0004110:	3eb010ef          	jal	ra,a0005cfa <bflb_gpio_reset>
    bflb_gpio_set(gpio, GPIO_PIN_12);
a0004114:	4008                	lw	a0,0(s0)
a0004116:	45b1                	li	a1,12
a0004118:	3c9010ef          	jal	ra,a0005ce0 <bflb_gpio_set>
    u8g2_SetContrast(&u8g2,50);//亮度设置
a000411c:	03200593          	li	a1,50
a0004120:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a0004124:	47e040ef          	jal	ra,a00085a2 <u8x8_SetContrast>
        u8g2_ClearBuffer(&u8g2);
a0004128:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a000412c:	1be030ef          	jal	ra,a00072ea <u8g2_ClearBuffer>
        u8g2_SetFont(&u8g2,u8g2_font_wqy12_t_chinese3);
a0004130:	fa4a0593          	addi	a1,s4,-92 # a0008fa4 <__psram_limit+0xf7c08fa4>
a0004134:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a0004138:	263030ef          	jal	ra,a0007b9a <u8g2_SetFont>
a000413c:	443d                	li	s0,15
            u8g2_DrawUTF8(&u8g2,0, i *16-1, "安信可");
a000413e:	8622                	mv	a2,s0
        for(int i=1;i<=4;i++){
a0004140:	0441                	addi	s0,s0,16
            u8g2_DrawUTF8(&u8g2,0, i *16-1, "安信可");
a0004142:	5f098693          	addi	a3,s3,1520 # a00085f0 <__psram_limit+0xf7c085f0>
a0004146:	4581                	li	a1,0
a0004148:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
        for(int i=1;i<=4;i++){
a000414c:	3c04340b          	extu	s0,s0,15,0
            u8g2_DrawUTF8(&u8g2,0, i *16-1, "安信可");
a0004150:	233030ef          	jal	ra,a0007b82 <u8g2_DrawUTF8>
        for(int i=1;i<=4;i++){
a0004154:	ff2415e3          	bne	s0,s2,a000413e <main+0xc6>

        //u8g2_DrawGlyph(&u8g2,5, 20, 0x2603);
        //u8g2_DrawGlyph(&u8g2,31, 20, 0x23f0);


        u8g2_SendBuffer(&u8g2);
a0004158:	b7c18513          	addi	a0,gp,-1156 # 62fc937c <u8g2>
a000415c:	1a6030ef          	jal	ra,a0007302 <u8g2_SendBuffer>
        u8g2_ClearBuffer(&u8g2);
a0004160:	b7e1                	j	a0004128 <main+0xb0>
	...

a0004164 <memset>:
    }
#else
  /* This version is optimized for size */

  FAR unsigned char *p = (FAR unsigned char *)s;
  while (n-- > 0) *p++ = c;
a0004164:	0ff5f593          	andi	a1,a1,255
a0004168:	00c50733          	add	a4,a0,a2
  FAR unsigned char *p = (FAR unsigned char *)s;
a000416c:	87aa                	mv	a5,a0
  while (n-- > 0) *p++ = c;
a000416e:	c609                	beqz	a2,a0004178 <memset+0x14>
a0004170:	1817d58b          	sbia	a1,(a5),1,0
a0004174:	fee79ee3          	bne	a5,a4,a0004170 <memset+0xc>
#endif
  return s;
}
a0004178:	8082                	ret

a000417a <strcmp>:
 * Public Functions
 ****************************************************************************/

#ifndef CONFIG_LIBC_ARCH_STRCMP
int strcmp(FAR const char *cs, FAR const char *ct)
{
a000417a:	4701                	li	a4,0
a000417c:	a011                	j	a0004180 <strcmp+0x6>
  register signed char result;
  for (; ; )
    {
      if ((result = *cs - *ct++) != 0 || !*cs++)
a000417e:	ce89                	beqz	a3,a0004198 <strcmp+0x1e>
a0004180:	80e5468b          	lrbu	a3,a0,a4,0
a0004184:	80e5c78b          	lrbu	a5,a1,a4,0
a0004188:	0705                	addi	a4,a4,1
a000418a:	40f687b3          	sub	a5,a3,a5
a000418e:	1c07a78b          	ext	a5,a5,7,0
a0004192:	d7f5                	beqz	a5,a000417e <strcmp+0x4>
      break;
    }

  return result;
a0004194:	853e                	mv	a0,a5
a0004196:	8082                	ret
a0004198:	4501                	li	a0,0
}
a000419a:	8082                	ret

a000419c <out_discard>:

// internal null output
static inline void out_discard(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
a000419c:	8082                	ret
	...

a00041a0 <out_rev_>:
}


// output the specified string in reverse, taking care of any zero-padding
static size_t out_rev_(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
a00041a0:	7179                	addi	sp,sp,-48
a00041a2:	d422                	sw	s0,40(sp)
a00041a4:	d226                	sw	s1,36(sp)
a00041a6:	ce4e                	sw	s3,28(sp)
a00041a8:	cc52                	sw	s4,24(sp)
a00041aa:	ca56                	sw	s5,20(sp)
a00041ac:	c85a                	sw	s6,16(sp)
a00041ae:	c65e                	sw	s7,12(sp)
a00041b0:	8b32                	mv	s6,a2
a00041b2:	c462                	sw	s8,8(sp)
a00041b4:	c266                	sw	s9,4(sp)
a00041b6:	d606                	sw	ra,44(sp)
a00041b8:	d04a                	sw	s2,32(sp)
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
a00041ba:	0038f613          	andi	a2,a7,3
{
a00041be:	8cc6                	mv	s9,a7
a00041c0:	89aa                	mv	s3,a0
a00041c2:	8a2e                	mv	s4,a1
a00041c4:	8ab6                	mv	s5,a3
a00041c6:	8bba                	mv	s7,a4
a00041c8:	843e                	mv	s0,a5
a00041ca:	8c42                	mv	s8,a6
a00041cc:	84da                	mv	s1,s6
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
a00041ce:	e205                	bnez	a2,a00041ee <out_rev_+0x4e>
    for (size_t i = len; i < width; i++) {
a00041d0:	0107ff63          	bgeu	a5,a6,a00041ee <out_rev_+0x4e>
a00041d4:	40f804b3          	sub	s1,a6,a5
a00041d8:	94da                	add	s1,s1,s6
a00041da:	895a                	mv	s2,s6
      out(' ', buffer, idx++, maxlen);
a00041dc:	864a                	mv	a2,s2
a00041de:	86d6                	mv	a3,s5
a00041e0:	0905                	addi	s2,s2,1
a00041e2:	85d2                	mv	a1,s4
a00041e4:	02000513          	li	a0,32
a00041e8:	9982                	jalr	s3
    for (size_t i = len; i < width; i++) {
a00041ea:	ff2499e3          	bne	s1,s2,a00041dc <out_rev_+0x3c>
    }
  }

  // reverse string
  while (len) {
a00041ee:	04040d63          	beqz	s0,a0004248 <out_rev_+0xa8>
a00041f2:	94a2                	add	s1,s1,s0
a00041f4:	40848633          	sub	a2,s1,s0
    out(buf[--len], buffer, idx++, maxlen);
a00041f8:	147d                	addi	s0,s0,-1
a00041fa:	808bc50b          	lrbu	a0,s7,s0,0
a00041fe:	86d6                	mv	a3,s5
a0004200:	85d2                	mv	a1,s4
a0004202:	8926                	mv	s2,s1
a0004204:	9982                	jalr	s3
  while (len) {
a0004206:	f47d                	bnez	s0,a00041f4 <out_rev_+0x54>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
a0004208:	002cfc93          	andi	s9,s9,2
a000420c:	020c8063          	beqz	s9,a000422c <out_rev_+0x8c>
    while (idx - start_idx < width) {
a0004210:	41690b33          	sub	s6,s2,s6
a0004214:	018b7c63          	bgeu	s6,s8,a000422c <out_rev_+0x8c>
      out(' ', buffer, idx++, maxlen);
a0004218:	864a                	mv	a2,s2
    while (idx - start_idx < width) {
a000421a:	0b05                	addi	s6,s6,1
      out(' ', buffer, idx++, maxlen);
a000421c:	86d6                	mv	a3,s5
a000421e:	85d2                	mv	a1,s4
a0004220:	02000513          	li	a0,32
a0004224:	0905                	addi	s2,s2,1
a0004226:	9982                	jalr	s3
    while (idx - start_idx < width) {
a0004228:	ff8b68e3          	bltu	s6,s8,a0004218 <out_rev_+0x78>
    }
  }

  return idx;
}
a000422c:	50b2                	lw	ra,44(sp)
a000422e:	5422                	lw	s0,40(sp)
a0004230:	5492                	lw	s1,36(sp)
a0004232:	49f2                	lw	s3,28(sp)
a0004234:	4a62                	lw	s4,24(sp)
a0004236:	4ad2                	lw	s5,20(sp)
a0004238:	4b42                	lw	s6,16(sp)
a000423a:	4bb2                	lw	s7,12(sp)
a000423c:	4c22                	lw	s8,8(sp)
a000423e:	4c92                	lw	s9,4(sp)
a0004240:	854a                	mv	a0,s2
a0004242:	5902                	lw	s2,32(sp)
a0004244:	6145                	addi	sp,sp,48
a0004246:	8082                	ret
  while (len) {
a0004248:	8926                	mv	s2,s1
a000424a:	bf7d                	j	a0004208 <out_rev_+0x68>
a000424c:	0000                	unimp
	...

a0004250 <print_integer>:
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
}

// An internal itoa-like function
static size_t print_integer(out_fct_type out, char* buffer, size_t idx, size_t maxlen, printf_unsigned_value_t value, bool negative, numeric_base_t base, unsigned int precision, unsigned int width, unsigned int flags)
{
a0004250:	7119                	addi	sp,sp,-128
a0004252:	daa6                	sw	s1,116(sp)
a0004254:	d8ca                	sw	s2,112(sp)
a0004256:	d4d2                	sw	s4,104(sp)
a0004258:	cce2                	sw	s8,88(sp)
a000425a:	de86                	sw	ra,124(sp)
a000425c:	dca2                	sw	s0,120(sp)
a000425e:	d6ce                	sw	s3,108(sp)
a0004260:	d2d6                	sw	s5,100(sp)
a0004262:	d0da                	sw	s6,96(sp)
a0004264:	cede                	sw	s7,92(sp)
a0004266:	cae6                	sw	s9,84(sp)
a0004268:	c8ea                	sw	s10,80(sp)
a000426a:	c6ee                	sw	s11,76(sp)
  char buf[PRINTF_INTEGER_BUFFER_SIZE];
  size_t len = 0U;

  if (!value) {
a000426c:	00f76333          	or	t1,a4,a5
{
a0004270:	c62a                	sw	a0,12(sp)
a0004272:	c82e                	sw	a1,16(sp)
a0004274:	ca32                	sw	a2,20(sp)
a0004276:	cc36                	sw	a3,24(sp)
a0004278:	ce42                	sw	a6,28(sp)
a000427a:	490a                	lw	s2,128(sp)
a000427c:	4a1a                	lw	s4,132(sp)
a000427e:	44aa                	lw	s1,136(sp)
a0004280:	8c46                	mv	s8,a7
  if (!value) {
a0004282:	0e031963          	bnez	t1,a0004374 <print_integer+0x124>
    if ( !(flags & FLAGS_PRECISION) ) {
a0004286:	4004f793          	andi	a5,s1,1024
a000428a:	1a079363          	bnez	a5,a0004430 <print_integer+0x1e0>
      buf[len++] = '0';
a000428e:	03000793          	li	a5,48
a0004292:	02f10023          	sb	a5,32(sp)
      flags &= ~FLAGS_HASH;
a0004296:	98bd                	andi	s1,s1,-17
      buf[len++] = '0';
a0004298:	4c85                	li	s9,1
a000429a:	1000                	addi	s0,sp,32
    if (!(flags & FLAGS_LEFT)) {
a000429c:	0024f793          	andi	a5,s1,2
a00042a0:	12079c63          	bnez	a5,a00043d8 <print_integer+0x188>
      if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
a00042a4:	120a0a63          	beqz	s4,a00043d8 <print_integer+0x188>
a00042a8:	0014f793          	andi	a5,s1,1
a00042ac:	12078663          	beqz	a5,a00043d8 <print_integer+0x188>
a00042b0:	47f2                	lw	a5,28(sp)
a00042b2:	1e079363          	bnez	a5,a0004498 <print_integer+0x248>
a00042b6:	00c4f793          	andi	a5,s1,12
a00042ba:	1c079f63          	bnez	a5,a0004498 <print_integer+0x248>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00042be:	114cfd63          	bgeu	s9,s4,a00043d8 <print_integer+0x188>
a00042c2:	477d                	li	a4,31
a00042c4:	87e6                	mv	a5,s9
        buf[len++] = '0';
a00042c6:	03000693          	li	a3,48
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00042ca:	02000593          	li	a1,32
a00042ce:	01977563          	bgeu	a4,s9,a00042d8 <print_integer+0x88>
a00042d2:	a2e9                	j	a000449c <print_integer+0x24c>
a00042d4:	1cb78463          	beq	a5,a1,a000449c <print_integer+0x24c>
        buf[len++] = '0';
a00042d8:	0785                	addi	a5,a5,1
a00042da:	00f40733          	add	a4,s0,a5
a00042de:	fed70fa3          	sb	a3,-1(a4)
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00042e2:	ff4799e3          	bne	a5,s4,a00042d4 <print_integer+0x84>
a00042e6:	87d2                	mv	a5,s4
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00042e8:	0327f463          	bgeu	a5,s2,a0004310 <print_integer+0xc0>
a00042ec:	02000713          	li	a4,32
      buf[len++] = '0';
a00042f0:	03000693          	li	a3,48
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00042f4:	02000593          	li	a1,32
a00042f8:	00e79563          	bne	a5,a4,a0004302 <print_integer+0xb2>
a00042fc:	a811                	j	a0004310 <print_integer+0xc0>
a00042fe:	00b78963          	beq	a5,a1,a0004310 <print_integer+0xc0>
      buf[len++] = '0';
a0004302:	0785                	addi	a5,a5,1
a0004304:	00f40733          	add	a4,s0,a5
a0004308:	fed70fa3          	sb	a3,-1(a4)
    while ((len < precision) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a000430c:	fef919e3          	bne	s2,a5,a00042fe <print_integer+0xae>
      flags &= ~FLAGS_HASH;
a0004310:	fef4f713          	andi	a4,s1,-17
a0004314:	00fcb6b3          	sltu	a3,s9,a5
a0004318:	40d4970b          	mveqz	a4,s1,a3
a000431c:	ff8c0693          	addi	a3,s8,-8
a0004320:	40d7148b          	mveqz	s1,a4,a3
  if (flags & (FLAGS_HASH | FLAGS_POINTER)) {
a0004324:	6705                	lui	a4,0x1
a0004326:	0741                	addi	a4,a4,16
a0004328:	8f65                	and	a4,a4,s1
a000432a:	c36d                	beqz	a4,a000440c <print_integer+0x1bc>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
a000432c:	4004f713          	andi	a4,s1,1024
a0004330:	c755                	beqz	a4,a00043dc <print_integer+0x18c>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a0004332:	4741                	li	a4,16
a0004334:	16ec0763          	beq	s8,a4,a00044a2 <print_integer+0x252>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a0004338:	4709                	li	a4,2
a000433a:	14ec0363          	beq	s8,a4,a0004480 <print_integer+0x230>
    if (len < PRINTF_INTEGER_BUFFER_SIZE) {
a000433e:	02000713          	li	a4,32
a0004342:	0ae79e63          	bne	a5,a4,a00043fe <print_integer+0x1ae>
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
a0004346:	46e2                	lw	a3,24(sp)
a0004348:	4652                	lw	a2,20(sp)
a000434a:	45c2                	lw	a1,16(sp)
a000434c:	4532                	lw	a0,12(sp)
a000434e:	88a6                	mv	a7,s1
a0004350:	8852                	mv	a6,s4
a0004352:	8722                	mv	a4,s0
a0004354:	35b1                	jal	a00041a0 <out_rev_>
      value /= base;
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
  }

  return print_integer_finalization(out, buffer, idx, maxlen, buf, len, negative, base, precision, width, flags);
}
a0004356:	50f6                	lw	ra,124(sp)
a0004358:	5466                	lw	s0,120(sp)
a000435a:	54d6                	lw	s1,116(sp)
a000435c:	5946                	lw	s2,112(sp)
a000435e:	59b6                	lw	s3,108(sp)
a0004360:	5a26                	lw	s4,104(sp)
a0004362:	5a96                	lw	s5,100(sp)
a0004364:	5b06                	lw	s6,96(sp)
a0004366:	4bf6                	lw	s7,92(sp)
a0004368:	4c66                	lw	s8,88(sp)
a000436a:	4cd6                	lw	s9,84(sp)
a000436c:	4d46                	lw	s10,80(sp)
a000436e:	4db6                	lw	s11,76(sp)
a0004370:	6109                	addi	sp,sp,128
a0004372:	8082                	ret
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
a0004374:	0204f693          	andi	a3,s1,32
a0004378:	8d3a                	mv	s10,a4
a000437a:	8dbe                	mv	s11,a5
a000437c:	06100993          	li	s3,97
a0004380:	e6cd                	bnez	a3,a000442a <print_integer+0x1da>
      const char digit = (char)(value % base);
a0004382:	4b01                	li	s6,0
  size_t len = 0U;
a0004384:	4c81                	li	s9,0
a0004386:	1000                	addi	s0,sp,32
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
a0004388:	4aa5                	li	s5,9
a000438a:	19d9                	addi	s3,s3,-10
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
a000438c:	02000b93          	li	s7,32
      const char digit = (char)(value % base);
a0004390:	4681                	li	a3,0
a0004392:	8662                	mv	a2,s8
a0004394:	856a                	mv	a0,s10
a0004396:	85ee                	mv	a1,s11
a0004398:	b22fd0ef          	jal	ra,a00016ba <__umoddi3>
a000439c:	0ff57513          	andi	a0,a0,255
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
a00043a0:	013508b3          	add	a7,a0,s3
a00043a4:	03050693          	addi	a3,a0,48
a00043a8:	0ff8f893          	andi	a7,a7,255
a00043ac:	00aae463          	bltu	s5,a0,a00043b4 <print_integer+0x164>
a00043b0:	0ff6f893          	andi	a7,a3,255
a00043b4:	0c85                	addi	s9,s9,1
a00043b6:	01940333          	add	t1,s0,s9
      value /= base;
a00043ba:	856a                	mv	a0,s10
a00043bc:	85ee                	mv	a1,s11
a00043be:	8662                	mv	a2,s8
a00043c0:	4681                	li	a3,0
      buf[len++] = (char)(digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10);
a00043c2:	ff130fa3          	sb	a7,-1(t1) # ffff <nocache_min_size+0xafff>
      value /= base;
a00043c6:	f95fc0ef          	jal	ra,a000135a <__udivdi3>
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
a00043ca:	05bb0d63          	beq	s6,s11,a0004424 <print_integer+0x1d4>
a00043ce:	ed7c87e3          	beq	s9,s7,a000429c <print_integer+0x4c>
      value /= base;
a00043d2:	8d2a                	mv	s10,a0
a00043d4:	8dae                	mv	s11,a1
a00043d6:	bf6d                	j	a0004390 <print_integer+0x140>
a00043d8:	87e6                	mv	a5,s9
a00043da:	b739                	j	a00042e8 <print_integer+0x98>
    if (!(flags & FLAGS_PRECISION) && len && ((len == precision) || (len == width))) {
a00043dc:	c3c1                	beqz	a5,a000445c <print_integer+0x20c>
a00043de:	00f90463          	beq	s2,a5,a00043e6 <print_integer+0x196>
a00043e2:	f4fa18e3          	bne	s4,a5,a0004332 <print_integer+0xe2>
      if (unpadded_len < len) {
a00043e6:	f4fcf6e3          	bgeu	s9,a5,a0004332 <print_integer+0xe2>
        len--;
a00043ea:	fff78713          	addi	a4,a5,-1
      if (len && (base == BASE_HEX)) {
a00043ee:	c73d                	beqz	a4,a000445c <print_integer+0x20c>
a00043f0:	46c1                	li	a3,16
a00043f2:	10dc0863          	beq	s8,a3,a0004502 <print_integer+0x2b2>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00043f6:	4789                	li	a5,2
a00043f8:	08fc0963          	beq	s8,a5,a000448a <print_integer+0x23a>
        len--;
a00043fc:	87ba                	mv	a5,a4
      buf[len++] = 'X';
a00043fe:	873e                	mv	a4,a5
      buf[len++] = '0';
a0004400:	03000693          	li	a3,48
a0004404:	00170793          	addi	a5,a4,1 # 1001 <HeapMinSize+0x1>
a0004408:	00e4568b          	srb	a3,s0,a4,0
  if (len < PRINTF_INTEGER_BUFFER_SIZE) {
a000440c:	02000713          	li	a4,32
a0004410:	f2e78be3          	beq	a5,a4,a0004346 <print_integer+0xf6>
    if (negative) {
a0004414:	4772                	lw	a4,28(sp)
a0004416:	c715                	beqz	a4,a0004442 <print_integer+0x1f2>
      buf[len++] = '-';
a0004418:	02d00713          	li	a4,45
a000441c:	00f4570b          	srb	a4,s0,a5,0
a0004420:	0785                	addi	a5,a5,1
a0004422:	b715                	j	a0004346 <print_integer+0xf6>
    } while (value && (len < PRINTF_INTEGER_BUFFER_SIZE));
a0004424:	fb8d75e3          	bgeu	s10,s8,a00043ce <print_integer+0x17e>
a0004428:	bd95                	j	a000429c <print_integer+0x4c>
a000442a:	04100993          	li	s3,65
a000442e:	bf91                	j	a0004382 <print_integer+0x132>
      flags &= ~FLAGS_HASH;
a0004430:	fef4f713          	andi	a4,s1,-17
a0004434:	ff088793          	addi	a5,a7,-16
  size_t len = 0U;
a0004438:	4c81                	li	s9,0
a000443a:	1000                	addi	s0,sp,32
      flags &= ~FLAGS_HASH;
a000443c:	40f7148b          	mveqz	s1,a4,a5
a0004440:	bdb1                	j	a000429c <print_integer+0x4c>
    else if (flags & FLAGS_PLUS) {
a0004442:	0044f713          	andi	a4,s1,4
a0004446:	e71d                	bnez	a4,a0004474 <print_integer+0x224>
    else if (flags & FLAGS_SPACE) {
a0004448:	0084f713          	andi	a4,s1,8
a000444c:	ee070de3          	beqz	a4,a0004346 <print_integer+0xf6>
      buf[len++] = ' ';
a0004450:	02000713          	li	a4,32
a0004454:	00f4570b          	srb	a4,s0,a5,0
a0004458:	0785                	addi	a5,a5,1
a000445a:	b5f5                	j	a0004346 <print_integer+0xf6>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a000445c:	47c1                	li	a5,16
a000445e:	06fc0d63          	beq	s8,a5,a00044d8 <print_integer+0x288>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a0004462:	4789                	li	a5,2
a0004464:	08fc0963          	beq	s8,a5,a00044f6 <print_integer+0x2a6>
      buf[len++] = '0';
a0004468:	03000793          	li	a5,48
a000446c:	02f10023          	sb	a5,32(sp)
a0004470:	4785                	li	a5,1
a0004472:	b74d                	j	a0004414 <print_integer+0x1c4>
      buf[len++] = '+';  // ignore the space if the '+' exists
a0004474:	02b00713          	li	a4,43
a0004478:	00f4570b          	srb	a4,s0,a5,0
a000447c:	0785                	addi	a5,a5,1
a000447e:	b5e1                	j	a0004346 <print_integer+0xf6>
    else if ((base == BASE_BINARY) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a0004480:	02000713          	li	a4,32
a0004484:	ece781e3          	beq	a5,a4,a0004346 <print_integer+0xf6>
a0004488:	873e                	mv	a4,a5
      buf[len++] = 'b';
a000448a:	06200693          	li	a3,98
a000448e:	00170793          	addi	a5,a4,1
a0004492:	00e4568b          	srb	a3,s0,a4,0
a0004496:	b565                	j	a000433e <print_integer+0xee>
        width--;
a0004498:	1a7d                	addi	s4,s4,-1
a000449a:	b515                	j	a00042be <print_integer+0x6e>
      while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a000449c:	02000793          	li	a5,32
a00044a0:	bd85                	j	a0004310 <print_integer+0xc0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00044a2:	0204f713          	andi	a4,s1,32
a00044a6:	cf09                	beqz	a4,a00044c0 <print_integer+0x270>
    else if ((base == BASE_HEX) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00044a8:	02000713          	li	a4,32
a00044ac:	e8e78de3          	beq	a5,a4,a0004346 <print_integer+0xf6>
        len--;
a00044b0:	86be                	mv	a3,a5
      buf[len++] = 'X';
a00044b2:	05800713          	li	a4,88
a00044b6:	00168793          	addi	a5,a3,1
a00044ba:	00d4570b          	srb	a4,s0,a3,0
a00044be:	b541                	j	a000433e <print_integer+0xee>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00044c0:	02000713          	li	a4,32
a00044c4:	e8e781e3          	beq	a5,a4,a0004346 <print_integer+0xf6>
      buf[len++] = 'x';
a00044c8:	00f406b3          	add	a3,s0,a5
a00044cc:	0785                	addi	a5,a5,1
a00044ce:	07800713          	li	a4,120
a00044d2:	00e68023          	sb	a4,0(a3)
a00044d6:	b5a5                	j	a000433e <print_integer+0xee>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a00044d8:	0204f793          	andi	a5,s1,32
a00044dc:	e799                	bnez	a5,a00044ea <print_integer+0x29a>
      buf[len++] = 'x';
a00044de:	07800793          	li	a5,120
a00044e2:	02f10023          	sb	a5,32(sp)
a00044e6:	4705                	li	a4,1
a00044e8:	bf21                	j	a0004400 <print_integer+0x1b0>
      buf[len++] = 'X';
a00044ea:	05800793          	li	a5,88
a00044ee:	02f10023          	sb	a5,32(sp)
a00044f2:	4705                	li	a4,1
a00044f4:	b731                	j	a0004400 <print_integer+0x1b0>
      buf[len++] = 'b';
a00044f6:	06200793          	li	a5,98
a00044fa:	02f10023          	sb	a5,32(sp)
a00044fe:	4705                	li	a4,1
a0004500:	b701                	j	a0004400 <print_integer+0x1b0>
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a0004502:	0204f613          	andi	a2,s1,32
        if (unpadded_len < len) {
a0004506:	00ecf863          	bgeu	s9,a4,a0004516 <print_integer+0x2c6>
          len--;
a000450a:	ffe78693          	addi	a3,a5,-2
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a000450e:	f255                	bnez	a2,a00044b2 <print_integer+0x262>
      buf[len++] = 'x';
a0004510:	96a2                	add	a3,a3,s0
a0004512:	87ba                	mv	a5,a4
a0004514:	bf6d                	j	a00044ce <print_integer+0x27e>
        len--;
a0004516:	87ba                	mv	a5,a4
    if ((base == BASE_HEX) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_INTEGER_BUFFER_SIZE)) {
a0004518:	da45                	beqz	a2,a00044c8 <print_integer+0x278>
a000451a:	bf59                	j	a00044b0 <print_integer+0x260>
	...

a000451e <get_components>:

// Break up a double number - which is known to be a finite non-negative number -
// into its base-10 parts: integral - before the decimal point, and fractional - after it.
// Taken the precision into account, but does not change it even internally.
static struct double_components get_components(double number, unsigned int precision)
{
a000451e:	715d                	addi	sp,sp,-80
  struct double_components number_;
  number_.is_negative = get_sign(number);
a0004520:	01f65793          	srli	a5,a2,0x1f
a0004524:	c23e                	sw	a5,4(sp)
  double abs_number = (number_.is_negative) ? -number : number;
a0004526:	07fe                	slli	a5,a5,0x1f
{
a0004528:	de4e                	sw	s3,60(sp)
  double abs_number = (number_.is_negative) ? -number : number;
a000452a:	00c7c9b3          	xor	s3,a5,a2
{
a000452e:	c0ca                	sw	s2,64(sp)
a0004530:	d266                	sw	s9,36(sp)
a0004532:	892e                	mv	s2,a1
a0004534:	8caa                	mv	s9,a0
  number_.integral = (int_fast64_t)abs_number;
a0004536:	852e                	mv	a0,a1
a0004538:	85ce                	mv	a1,s3
{
a000453a:	c686                	sw	ra,76(sp)
a000453c:	c4a2                	sw	s0,72(sp)
a000453e:	c2a6                	sw	s1,68(sp)
a0004540:	dc52                	sw	s4,56(sp)
a0004542:	da56                	sw	s5,52(sp)
a0004544:	d85a                	sw	s6,48(sp)
a0004546:	d65e                	sw	s7,44(sp)
a0004548:	d462                	sw	s8,40(sp)
a000454a:	d06a                	sw	s10,32(sp)
a000454c:	8c36                	mv	s8,a3
a000454e:	ce6e                	sw	s11,28(sp)
  number_.integral = (int_fast64_t)abs_number;
a0004550:	e84ff0ef          	jal	ra,a0003bd4 <__fixdfdi>
  double remainder = (abs_number - number_.integral) * powers_of_10[precision];
a0004554:	a00087b7          	lui	a5,0xa0008
a0004558:	6b078793          	addi	a5,a5,1712 # a00086b0 <__psram_limit+0xf7c086b0>
a000455c:	0787978b          	addsl	a5,a5,s8,3
a0004560:	0007ab03          	lw	s6,0(a5)
a0004564:	0047ab83          	lw	s7,4(a5)
  number_.integral = (int_fast64_t)abs_number;
a0004568:	8a2a                	mv	s4,a0
a000456a:	8aae                	mv	s5,a1
  double remainder = (abs_number - number_.integral) * powers_of_10[precision];
a000456c:	f6cff0ef          	jal	ra,a0003cd8 <__floatdidf>
a0004570:	862a                	mv	a2,a0
a0004572:	86ae                	mv	a3,a1
a0004574:	854a                	mv	a0,s2
a0004576:	85ce                	mv	a1,s3
a0004578:	b75fe0ef          	jal	ra,a00030ec <__subdf3>
a000457c:	865a                	mv	a2,s6
a000457e:	86de                	mv	a3,s7
a0004580:	dcefe0ef          	jal	ra,a0002b4e <__muldf3>
a0004584:	8d2a                	mv	s10,a0
a0004586:	8dae                	mv	s11,a1
  number_.fractional = (int_fast64_t)remainder;
a0004588:	e4cff0ef          	jal	ra,a0003bd4 <__fixdfdi>
a000458c:	842a                	mv	s0,a0
a000458e:	84ae                	mv	s1,a1

  remainder -= (double) number_.fractional;
a0004590:	f48ff0ef          	jal	ra,a0003cd8 <__floatdidf>
a0004594:	862a                	mv	a2,a0
a0004596:	86ae                	mv	a3,a1
a0004598:	856a                	mv	a0,s10
a000459a:	85ee                	mv	a1,s11
a000459c:	b51fe0ef          	jal	ra,a00030ec <__subdf3>

  if (remainder > 0.5) {
a00045a0:	a00087b7          	lui	a5,0xa0008
a00045a4:	6287ad03          	lw	s10,1576(a5) # a0008628 <__psram_limit+0xf7c08628>
a00045a8:	62c7ad83          	lw	s11,1580(a5)
  remainder -= (double) number_.fractional;
a00045ac:	c42a                	sw	a0,8(sp)
  if (remainder > 0.5) {
a00045ae:	866a                	mv	a2,s10
a00045b0:	86ee                	mv	a3,s11
  remainder -= (double) number_.fractional;
a00045b2:	c62e                	sw	a1,12(sp)
  if (remainder > 0.5) {
a00045b4:	c2efe0ef          	jal	ra,a00029e2 <__gedf2>
a00045b8:	4722                	lw	a4,8(sp)
a00045ba:	47b2                	lw	a5,12(sp)
a00045bc:	0aa05263          	blez	a0,a0004660 <get_components+0x142>
    ++number_.fractional;
a00045c0:	4d05                	li	s10,1
a00045c2:	4d81                	li	s11,0
a00045c4:	c1a41477          	add64	s0,s0,s10
    // handle rollover, e.g. case 0.99 with precision 1 is 1.0
    if ((double) number_.fractional >= powers_of_10[precision]) {
a00045c8:	8522                	mv	a0,s0
a00045ca:	85a6                	mv	a1,s1
a00045cc:	f0cff0ef          	jal	ra,a0003cd8 <__floatdidf>
a00045d0:	862a                	mv	a2,a0
a00045d2:	86ae                	mv	a3,a1
a00045d4:	855a                	mv	a0,s6
a00045d6:	85de                	mv	a1,s7
a00045d8:	cc0fe0ef          	jal	ra,a0002a98 <__ledf2>
a00045dc:	0aa05163          	blez	a0,a000467e <get_components+0x160>
      // if halfway, round up if odd OR if last digit is 0
      ++number_.fractional;
    }
  }

  if (precision == 0U) {
a00045e0:	040c1563          	bnez	s8,a000462a <get_components+0x10c>
    remainder = abs_number - (double) number_.integral;
a00045e4:	8552                	mv	a0,s4
a00045e6:	85d6                	mv	a1,s5
a00045e8:	ef0ff0ef          	jal	ra,a0003cd8 <__floatdidf>
a00045ec:	862a                	mv	a2,a0
a00045ee:	86ae                	mv	a3,a1
a00045f0:	854a                	mv	a0,s2
a00045f2:	85ce                	mv	a1,s3
a00045f4:	af9fe0ef          	jal	ra,a00030ec <__subdf3>
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
a00045f8:	a00087b7          	lui	a5,0xa0008
a00045fc:	6287ab03          	lw	s6,1576(a5) # a0008628 <__psram_limit+0xf7c08628>
a0004600:	62c7ab83          	lw	s7,1580(a5)
    remainder = abs_number - (double) number_.integral;
a0004604:	8d2a                	mv	s10,a0
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
a0004606:	865a                	mv	a2,s6
a0004608:	86de                	mv	a3,s7
    remainder = abs_number - (double) number_.integral;
a000460a:	8dae                	mv	s11,a1
    if ((!(remainder < 0.5) || (remainder > 0.5)) && (number_.integral & 1)) {
a000460c:	c8cfe0ef          	jal	ra,a0002a98 <__ledf2>
a0004610:	00055a63          	bgez	a0,a0004624 <get_components+0x106>
a0004614:	865a                	mv	a2,s6
a0004616:	86de                	mv	a3,s7
a0004618:	856a                	mv	a0,s10
a000461a:	85ee                	mv	a1,s11
a000461c:	bc6fe0ef          	jal	ra,a00029e2 <__gedf2>
a0004620:	00a05563          	blez	a0,a000462a <get_components+0x10c>
a0004624:	001a7793          	andi	a5,s4,1
a0004628:	e3a5                	bnez	a5,a0004688 <get_components+0x16a>
      // exactly 0.5 and ODD, then round up
      // 1.5 -> 2, but 2.5 -> 2
      ++number_.integral;
    }
  }
  return number_;
a000462a:	4792                	lw	a5,4(sp)
a000462c:	008ca423          	sw	s0,8(s9)
}
a0004630:	40b6                	lw	ra,76(sp)
a0004632:	4426                	lw	s0,72(sp)
  return number_;
a0004634:	014ca023          	sw	s4,0(s9)
a0004638:	015ca223          	sw	s5,4(s9)
a000463c:	009ca623          	sw	s1,12(s9)
a0004640:	00fc8823          	sb	a5,16(s9)
}
a0004644:	4496                	lw	s1,68(sp)
a0004646:	4906                	lw	s2,64(sp)
a0004648:	59f2                	lw	s3,60(sp)
a000464a:	5a62                	lw	s4,56(sp)
a000464c:	5ad2                	lw	s5,52(sp)
a000464e:	5b42                	lw	s6,48(sp)
a0004650:	5bb2                	lw	s7,44(sp)
a0004652:	5c22                	lw	s8,40(sp)
a0004654:	5d02                	lw	s10,32(sp)
a0004656:	4df2                	lw	s11,28(sp)
a0004658:	8566                	mv	a0,s9
a000465a:	5c92                	lw	s9,36(sp)
a000465c:	6161                	addi	sp,sp,80
a000465e:	8082                	ret
  else if (remainder == 0.5) {
a0004660:	866a                	mv	a2,s10
a0004662:	86ee                	mv	a3,s11
a0004664:	853a                	mv	a0,a4
a0004666:	85be                	mv	a1,a5
a0004668:	ad6fe0ef          	jal	ra,a000293e <__eqdf2>
a000466c:	f935                	bnez	a0,a00045e0 <get_components+0xc2>
    if ((number_.fractional == 0U) || (number_.fractional & 1U)) {
a000466e:	009467b3          	or	a5,s0,s1
a0004672:	e385                	bnez	a5,a0004692 <get_components+0x174>
      ++number_.fractional;
a0004674:	4705                	li	a4,1
a0004676:	4781                	li	a5,0
a0004678:	c0e41477          	add64	s0,s0,a4
a000467c:	b795                	j	a00045e0 <get_components+0xc2>
      ++number_.integral;
a000467e:	c1aa1a77          	add64	s4,s4,s10
      number_.fractional = 0;
a0004682:	4401                	li	s0,0
a0004684:	4481                	li	s1,0
a0004686:	bfa9                	j	a00045e0 <get_components+0xc2>
      ++number_.integral;
a0004688:	4705                	li	a4,1
a000468a:	4781                	li	a5,0
a000468c:	c0ea1a77          	add64	s4,s4,a4
a0004690:	bf69                	j	a000462a <get_components+0x10c>
    if ((number_.fractional == 0U) || (number_.fractional & 1U)) {
a0004692:	00147793          	andi	a5,s0,1
a0004696:	d7a9                	beqz	a5,a00045e0 <get_components+0xc2>
a0004698:	bff1                	j	a0004674 <get_components+0x156>

a000469a <out_console>:
{
a000469a:	85aa                	mv	a1,a0
  bflb_uart_putchar(console, character);
a000469c:	c101a503          	lw	a0,-1008(gp) # 62fc9410 <console>
a00046a0:	c2fbc317          	auipc	t1,0xc2fbc
a00046a4:	b5430067          	jr	-1196(t1) # 62fc01f4 <bflb_uart_putchar>

a00046a8 <print_broken_up_decimal.isra.0>:
  }
  return components;
}
#endif

static size_t print_broken_up_decimal(
a00046a8:	715d                	addi	sp,sp,-80
a00046aa:	c4a2                	sw	s0,72(sp)
a00046ac:	4446                	lw	s0,80(sp)
a00046ae:	d06a                	sw	s10,32(sp)
a00046b0:	4d56                	lw	s10,84(sp)
a00046b2:	c2a6                	sw	s1,68(sp)
a00046b4:	dc52                	sw	s4,56(sp)
a00046b6:	da56                	sw	s5,52(sp)
a00046b8:	d85a                	sw	s6,48(sp)
a00046ba:	d266                	sw	s9,36(sp)
a00046bc:	ce6e                	sw	s11,28(sp)
a00046be:	c422                	sw	s0,8(sp)
a00046c0:	c686                	sw	ra,76(sp)
a00046c2:	c0ca                	sw	s2,64(sp)
a00046c4:	de4e                	sw	s3,60(sp)
a00046c6:	d65e                	sw	s7,44(sp)
a00046c8:	d462                	sw	s8,40(sp)
a00046ca:	c63a                	sw	a4,12(sp)
a00046cc:	c03e                	sw	a5,0(sp)
a00046ce:	c242                	sw	a6,4(sp)
a00046d0:	4a66                	lw	s4,88(sp)
a00046d2:	4af6                	lw	s5,92(sp)
a00046d4:	5b06                	lw	s6,96(sp)
a00046d6:	5416                	lw	s0,100(sp)
a00046d8:	84aa                	mv	s1,a0
a00046da:	8dae                	mv	s11,a1
a00046dc:	8cc6                	mv	s9,a7
  struct double_components number_, out_fct_type out, char *buffer, size_t idx, size_t maxlen, unsigned int precision,
  unsigned int width, unsigned int flags, char *buf, size_t len)
{
  if (precision != 0U) {
a00046de:	080d0a63          	beqz	s10,a0004772 <print_broken_up_decimal.isra.0+0xca>
    // do fractional part, as an unsigned number

    unsigned int count = precision;

    if (flags & FLAGS_ADAPT_EXP && !(flags & FLAGS_HASH)) {
a00046e2:	6785                	lui	a5,0x1
a00046e4:	81078793          	addi	a5,a5,-2032 # 810 <__RFTLV_SIZE_HOLE+0x10>
a00046e8:	00faf7b3          	and	a5,s5,a5
a00046ec:	80078793          	addi	a5,a5,-2048
a00046f0:	8bb2                	mv	s7,a2
a00046f2:	8c36                	mv	s8,a3
a00046f4:	14078b63          	beqz	a5,a000484a <print_broken_up_decimal.isra.0+0x1a2>
      // ... and even the decimal point if there are no
      // non-zero fractional part digits (see below)
    }

    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
      while (len < PRINTF_FTOA_BUFFER_SIZE) {
a00046f8:	02000993          	li	s3,32
a00046fc:	fffb0913          	addi	s2,s6,-1
a0004700:	a035                	j	a000472c <print_broken_up_decimal.isra.0+0x84>
        --count;
        buf[len++] = (char)('0' + number_.fractional % 10U);
a0004702:	8ddfc0ef          	jal	ra,a0000fde <__moddi3>
a0004706:	03050793          	addi	a5,a0,48
a000470a:	0405                	addi	s0,s0,1
        if (!(number_.fractional /= 10U)) {
a000470c:	855e                	mv	a0,s7
a000470e:	85e2                	mv	a1,s8
        buf[len++] = (char)('0' + number_.fractional % 10U);
a0004710:	0089578b          	srb	a5,s2,s0,0
        if (!(number_.fractional /= 10U)) {
a0004714:	4629                	li	a2,10
a0004716:	4681                	li	a3,0
a0004718:	d24fc0ef          	jal	ra,a0000c3c <__divdi3>
a000471c:	00a5e733          	or	a4,a1,a0
        --count;
a0004720:	fffd0793          	addi	a5,s10,-1
        if (!(number_.fractional /= 10U)) {
a0004724:	8baa                	mv	s7,a0
a0004726:	8c2e                	mv	s8,a1
a0004728:	cf61                	beqz	a4,a0004800 <print_broken_up_decimal.isra.0+0x158>
        --count;
a000472a:	8d3e                	mv	s10,a5
        buf[len++] = (char)('0' + number_.fractional % 10U);
a000472c:	4629                	li	a2,10
a000472e:	4681                	li	a3,0
a0004730:	855e                	mv	a0,s7
a0004732:	85e2                	mv	a1,s8
      while (len < PRINTF_FTOA_BUFFER_SIZE) {
a0004734:	fd3417e3          	bne	s0,s3,a0004702 <print_broken_up_decimal.isra.0+0x5a>
      break;
    }
  }

  // pad leading zeros
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
a0004738:	003af793          	andi	a5,s5,3
a000473c:	4705                	li	a4,1
a000473e:	0ee78b63          	beq	a5,a4,a0004834 <print_broken_up_decimal.isra.0+0x18c>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
      buf[len++] = '0';
    }
  }

  if (len < PRINTF_FTOA_BUFFER_SIZE) {
a0004742:	02000793          	li	a5,32
      buf[len++] = ' ';
    }
  }

  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
}
a0004746:	4426                	lw	s0,72(sp)
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
a0004748:	46a2                	lw	a3,8(sp)
a000474a:	4592                	lw	a1,4(sp)
a000474c:	4502                	lw	a0,0(sp)
}
a000474e:	40b6                	lw	ra,76(sp)
a0004750:	4496                	lw	s1,68(sp)
a0004752:	4906                	lw	s2,64(sp)
a0004754:	59f2                	lw	s3,60(sp)
a0004756:	5bb2                	lw	s7,44(sp)
a0004758:	5c22                	lw	s8,40(sp)
a000475a:	5d02                	lw	s10,32(sp)
a000475c:	4df2                	lw	s11,28(sp)
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
a000475e:	88d6                	mv	a7,s5
a0004760:	8852                	mv	a6,s4
}
a0004762:	5ad2                	lw	s5,52(sp)
a0004764:	5a62                	lw	s4,56(sp)
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
a0004766:	875a                	mv	a4,s6
a0004768:	8666                	mv	a2,s9
}
a000476a:	5b42                	lw	s6,48(sp)
a000476c:	5c92                	lw	s9,36(sp)
a000476e:	6161                	addi	sp,sp,80
  return out_rev_(out, buffer, idx, maxlen, buf, len, width, flags);
a0004770:	bc05                	j	a00041a0 <out_rev_>
    if (flags & FLAGS_HASH) {
a0004772:	010af793          	andi	a5,s5,16
a0004776:	cb99                	beqz	a5,a000478c <print_broken_up_decimal.isra.0+0xe4>
      if (len < PRINTF_FTOA_BUFFER_SIZE) {
a0004778:	02000793          	li	a5,32
a000477c:	faf40ee3          	beq	s0,a5,a0004738 <print_broken_up_decimal.isra.0+0x90>
        buf[len++] = '.';
a0004780:	02e00793          	li	a5,46
a0004784:	008b578b          	srb	a5,s6,s0,0
a0004788:	0405                	addi	s0,s0,1
a000478a:	0001                	nop
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
a000478c:	02000993          	li	s3,32
    buf[len++] = (char)('0' + (number_.integral % 10));
a0004790:	fffb0913          	addi	s2,s6,-1
a0004794:	4629                	li	a2,10
a0004796:	4681                	li	a3,0
a0004798:	8526                	mv	a0,s1
a000479a:	85ee                	mv	a1,s11
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
a000479c:	f9340ee3          	beq	s0,s3,a0004738 <print_broken_up_decimal.isra.0+0x90>
    buf[len++] = (char)('0' + (number_.integral % 10));
a00047a0:	83ffc0ef          	jal	ra,a0000fde <__moddi3>
a00047a4:	03050793          	addi	a5,a0,48
a00047a8:	0405                	addi	s0,s0,1
    if (!(number_.integral /= 10)) {
a00047aa:	8526                	mv	a0,s1
a00047ac:	85ee                	mv	a1,s11
    buf[len++] = (char)('0' + (number_.integral % 10));
a00047ae:	0089578b          	srb	a5,s2,s0,0
    if (!(number_.integral /= 10)) {
a00047b2:	4629                	li	a2,10
a00047b4:	4681                	li	a3,0
a00047b6:	c86fc0ef          	jal	ra,a0000c3c <__divdi3>
a00047ba:	00a5e7b3          	or	a5,a1,a0
a00047be:	84aa                	mv	s1,a0
a00047c0:	8dae                	mv	s11,a1
a00047c2:	fbe9                	bnez	a5,a0004794 <print_broken_up_decimal.isra.0+0xec>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
a00047c4:	003af793          	andi	a5,s5,3
a00047c8:	4705                	li	a4,1
a00047ca:	0ce78b63          	beq	a5,a4,a00048a0 <print_broken_up_decimal.isra.0+0x1f8>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
a00047ce:	02000713          	li	a4,32
a00047d2:	f6e408e3          	beq	s0,a4,a0004742 <print_broken_up_decimal.isra.0+0x9a>
    if (number_.is_negative) {
a00047d6:	47b2                	lw	a5,12(sp)
a00047d8:	cb81                	beqz	a5,a00047e8 <print_broken_up_decimal.isra.0+0x140>
      buf[len++] = '-';
a00047da:	02d00713          	li	a4,45
a00047de:	00140793          	addi	a5,s0,1
a00047e2:	008b570b          	srb	a4,s6,s0,0
a00047e6:	b785                	j	a0004746 <print_broken_up_decimal.isra.0+0x9e>
    else if (flags & FLAGS_PLUS) {
a00047e8:	004af793          	andi	a5,s5,4
a00047ec:	e3dd                	bnez	a5,a0004892 <print_broken_up_decimal.isra.0+0x1ea>
    else if (flags & FLAGS_SPACE) {
a00047ee:	008af693          	andi	a3,s5,8
a00047f2:	87a2                	mv	a5,s0
a00047f4:	daa9                	beqz	a3,a0004746 <print_broken_up_decimal.isra.0+0x9e>
      buf[len++] = ' ';
a00047f6:	00140793          	addi	a5,s0,1
a00047fa:	008b570b          	srb	a4,s6,s0,0
a00047fe:	b7a1                	j	a0004746 <print_broken_up_decimal.isra.0+0x9e>
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
a0004800:	f3340ce3          	beq	s0,s3,a0004738 <print_broken_up_decimal.isra.0+0x90>
a0004804:	8722                	mv	a4,s0
        buf[len++] = '0';
a0004806:	03000613          	li	a2,48
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
a000480a:	02000693          	li	a3,32
a000480e:	cf81                	beqz	a5,a0004826 <print_broken_up_decimal.isra.0+0x17e>
        buf[len++] = '0';
a0004810:	0705                	addi	a4,a4,1
a0004812:	fff74793          	not	a5,a4
a0004816:	97ea                	add	a5,a5,s10
a0004818:	00e9560b          	srb	a2,s2,a4,0
      while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
a000481c:	97a2                	add	a5,a5,s0
a000481e:	f0d70de3          	beq	a4,a3,a0004738 <print_broken_up_decimal.isra.0+0x90>
a0004822:	fe0797e3          	bnez	a5,a0004810 <print_broken_up_decimal.isra.0+0x168>
        buf[len++] = '.';
a0004826:	02e00793          	li	a5,46
a000482a:	00170413          	addi	s0,a4,1
a000482e:	00eb578b          	srb	a5,s6,a4,0
a0004832:	bfa9                	j	a000478c <print_broken_up_decimal.isra.0+0xe4>
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
a0004834:	02000793          	li	a5,32
a0004838:	f00a07e3          	beqz	s4,a0004746 <print_broken_up_decimal.isra.0+0x9e>
a000483c:	4732                	lw	a4,12(sp)
a000483e:	ef41                	bnez	a4,a00048d6 <print_broken_up_decimal.isra.0+0x22e>
a0004840:	00caf713          	andi	a4,s5,12
a0004844:	c355                	beqz	a4,a00048e8 <print_broken_up_decimal.isra.0+0x240>
      width--;
a0004846:	1a7d                	addi	s4,s4,-1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
a0004848:	bded                	j	a0004742 <print_broken_up_decimal.isra.0+0x9a>
      if (number_.fractional > 0) {
a000484a:	08d05163          	blez	a3,a00048cc <print_broken_up_decimal.isra.0+0x224>
          if (digit != 0) {
a000484e:	4629                	li	a2,10
a0004850:	4681                	li	a3,0
a0004852:	855e                	mv	a0,s7
a0004854:	85e2                	mv	a1,s8
a0004856:	f88fc0ef          	jal	ra,a0000fde <__moddi3>
a000485a:	8d4d                	or	a0,a0,a1
a000485c:	e8051ee3          	bnez	a0,a00046f8 <print_broken_up_decimal.isra.0+0x50>
          number_.fractional /= 10U;
a0004860:	4629                	li	a2,10
a0004862:	4681                	li	a3,0
a0004864:	855e                	mv	a0,s7
a0004866:	85e2                	mv	a1,s8
a0004868:	bd4fc0ef          	jal	ra,a0000c3c <__divdi3>
a000486c:	4629                	li	a2,10
a000486e:	4681                	li	a3,0
a0004870:	89de                	mv	s3,s7
a0004872:	8962                	mv	s2,s8
a0004874:	8baa                	mv	s7,a0
a0004876:	8c2e                	mv	s8,a1
a0004878:	f66fc0ef          	jal	ra,a0000fde <__moddi3>
          if (digit != 0) {
a000487c:	8d4d                	or	a0,a0,a1
          --count;
a000487e:	1d7d                	addi	s10,s10,-1
          if (digit != 0) {
a0004880:	d165                	beqz	a0,a0004860 <print_broken_up_decimal.isra.0+0x1b8>
    if (number_.fractional > 0 || !(flags & FLAGS_ADAPT_EXP) || (flags & FLAGS_HASH) ) {
a0004882:	e7204be3          	bgtz	s2,a00046f8 <print_broken_up_decimal.isra.0+0x50>
a0004886:	f00913e3          	bnez	s2,a000478c <print_broken_up_decimal.isra.0+0xe4>
a000488a:	47a5                	li	a5,9
a000488c:	e737e6e3          	bltu	a5,s3,a00046f8 <print_broken_up_decimal.isra.0+0x50>
a0004890:	bdf5                	j	a000478c <print_broken_up_decimal.isra.0+0xe4>
      buf[len++] = '+';  // ignore the space if the '+' exists
a0004892:	02b00713          	li	a4,43
a0004896:	00140793          	addi	a5,s0,1
a000489a:	008b570b          	srb	a4,s6,s0,0
a000489e:	b565                	j	a0004746 <print_broken_up_decimal.isra.0+0x9e>
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
a00048a0:	f20a07e3          	beqz	s4,a00047ce <print_broken_up_decimal.isra.0+0x126>
a00048a4:	47b2                	lw	a5,12(sp)
a00048a6:	cf85                	beqz	a5,a00048de <print_broken_up_decimal.isra.0+0x236>
      width--;
a00048a8:	1a7d                	addi	s4,s4,-1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
a00048aa:	f34472e3          	bgeu	s0,s4,a00047ce <print_broken_up_decimal.isra.0+0x126>
a00048ae:	46fd                	li	a3,31
      buf[len++] = '0';
a00048b0:	03000713          	li	a4,48
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
a00048b4:	02000793          	li	a5,32
a00048b8:	e886e5e3          	bltu	a3,s0,a0004742 <print_broken_up_decimal.isra.0+0x9a>
      buf[len++] = '0';
a00048bc:	0405                	addi	s0,s0,1
a00048be:	0089570b          	srb	a4,s2,s0,0
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
a00048c2:	f14406e3          	beq	s0,s4,a00047ce <print_broken_up_decimal.isra.0+0x126>
a00048c6:	fef41be3          	bne	s0,a5,a00048bc <print_broken_up_decimal.isra.0+0x214>
a00048ca:	bda5                	j	a0004742 <print_broken_up_decimal.isra.0+0x9a>
      if (number_.fractional > 0) {
a00048cc:	ec0690e3          	bnez	a3,a000478c <print_broken_up_decimal.isra.0+0xe4>
a00048d0:	f6061fe3          	bnez	a2,a000484e <print_broken_up_decimal.isra.0+0x1a6>
a00048d4:	bd65                	j	a000478c <print_broken_up_decimal.isra.0+0xe4>
      width--;
a00048d6:	1a7d                	addi	s4,s4,-1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
a00048d8:	e747e5e3          	bltu	a5,s4,a0004742 <print_broken_up_decimal.isra.0+0x9a>
a00048dc:	b5ad                	j	a0004746 <print_broken_up_decimal.isra.0+0x9e>
    if (width && (number_.is_negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
a00048de:	00caf793          	andi	a5,s5,12
a00048e2:	d7e1                	beqz	a5,a00048aa <print_broken_up_decimal.isra.0+0x202>
      width--;
a00048e4:	1a7d                	addi	s4,s4,-1
a00048e6:	b7d1                	j	a00048aa <print_broken_up_decimal.isra.0+0x202>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
a00048e8:	e547ede3          	bltu	a5,s4,a0004742 <print_broken_up_decimal.isra.0+0x9a>
a00048ec:	02000413          	li	s0,32
a00048f0:	bdf9                	j	a00047ce <print_broken_up_decimal.isra.0+0x126>
	...

a00048f4 <print_exponential_number>:
}

#if CONFIG_LIBC_FLOAT_EX
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t print_exponential_number(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double number, unsigned int precision, unsigned int width, unsigned int flags, char* buf, size_t len)
{
a00048f4:	7171                	addi	sp,sp,-176
a00048f6:	deee                	sw	s11,124(sp)
  return get_bit_access(x).U >> (DOUBLE_SIZE_IN_BITS - 1);
a00048f8:	01f7dd93          	srli	s11,a5,0x1f
{
a00048fc:	d522                	sw	s0,168(sp)
a00048fe:	843e                	mv	s0,a5
  const bool negative = get_sign(number);
  // This number will decrease gradually (by factors of 10) as we "extract" the exponent out of it
  double abs_number =  negative ? -number : number;
a0004900:	01fd9793          	slli	a5,s11,0x1f
{
a0004904:	d14a                	sw	s2,160(sp)
  double abs_number =  negative ? -number : number;
a0004906:	8c3d                	xor	s0,s0,a5
{
a0004908:	594a                	lw	s2,176(sp)
a000490a:	d326                	sw	s1,164(sp)
a000490c:	c95a                	sw	s6,144(sp)
a000490e:	c75e                	sw	s7,140(sp)
a0004910:	c562                	sw	s8,136(sp)
a0004912:	c366                	sw	s9,132(sp)
a0004914:	8baa                	mv	s7,a0
a0004916:	8c2e                	mv	s8,a1
a0004918:	84b2                	mv	s1,a2
a000491a:	8cb6                	mv	s9,a3
  bool abs_exp10_covered_by_powers_table;
  struct scaling_factor normalization;


  // Determine the decimal exponent
  if (abs_number == 0.0) {
a000491c:	853a                	mv	a0,a4
a000491e:	85a2                	mv	a1,s0
a0004920:	4601                	li	a2,0
a0004922:	4681                	li	a3,0
  // For both of these, the value of 0 has a special meaning, but not the same one:
  // a 0 exponent-part width means "don't print the exponent"; a 0 decimal-part width
  // means "use as many characters as necessary".

  bool fall_back_to_decimal_only_mode = false;
  if (flags & FLAGS_ADAPT_EXP) {
a0004924:	6b05                	lui	s6,0x1
{
a0004926:	cf4e                	sw	s3,156(sp)
a0004928:	cb56                	sw	s5,148(sp)
a000492a:	c16a                	sw	s10,128(sp)
a000492c:	d706                	sw	ra,172(sp)
a000492e:	cd52                	sw	s4,152(sp)
a0004930:	8aba                	mv	s5,a4
a0004932:	89c2                	mv	s3,a6
a0004934:	8d46                	mv	s10,a7
  if (flags & FLAGS_ADAPT_EXP) {
a0004936:	800b0b13          	addi	s6,s6,-2048 # 800 <__RFTLV_SIZE_HOLE>
  if (abs_number == 0.0) {
a000493a:	804fe0ef          	jal	ra,a000293e <__eqdf2>
  const bool negative = get_sign(number);
a000493e:	d06e                	sw	s11,32(sp)
  if (flags & FLAGS_ADAPT_EXP) {
a0004940:	01697b33          	and	s6,s2,s6
  if (abs_number == 0.0) {
a0004944:	ed4d                	bnez	a0,a00049fe <print_exponential_number+0x10a>
a0004946:	4781                	li	a5,0
  if (flags & FLAGS_ADAPT_EXP) {
a0004948:	660b1363          	bnez	s6,a0004fae <print_exponential_number+0x6ba>
a000494c:	4a01                	li	s4,0

  normalization.multiply = (exp10 < 0 && abs_exp10_covered_by_powers_table);
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || exp10 == 0);
  struct double_components decimal_part_components =
    should_skip_normalization ?
    get_components(negative ? -abs_number : abs_number, precision) :
a000494e:	0dfe                	slli	s11,s11,0x1f
a0004950:	008dcdb3          	xor	s11,s11,s0
a0004954:	86ce                	mv	a3,s3
a0004956:	866e                	mv	a2,s11
a0004958:	85d6                	mv	a1,s5
a000495a:	08a8                	addi	a0,sp,88
a000495c:	d03e                	sw	a5,32(sp)
a000495e:	36c1                	jal	a000451e <get_components>
    get_normalized_components(negative, precision, abs_number, normalization);

  // Account for roll-over, e.g. rounding from 9.99 to 100.0 - which effects
  // the exponent and may require additional tweaking of the parts
  if (fall_back_to_decimal_only_mode) {
a0004960:	5782                	lw	a5,32(sp)
    get_components(negative ? -abs_number : abs_number, precision) :
a0004962:	5e06                	lw	t3,96(sp)
a0004964:	5e96                	lw	t4,100(sp)
a0004966:	06814b03          	lbu	s6,104(sp)
a000496a:	4366                	lw	t1,88(sp)
a000496c:	43f6                	lw	t2,92(sp)
  if (fall_back_to_decimal_only_mode) {
a000496e:	3e078f63          	beqz	a5,a0004d6c <print_exponential_number+0x478>
    if ( (flags & FLAGS_ADAPT_EXP) && exp10 >= -1 && decimal_part_components.integral == powers_of_10[exp10 + 1]) {
a0004972:	2cb9378b          	extu	a5,s2,11,11
a0004976:	c3a1                	beqz	a5,a00049b6 <print_exponential_number+0xc2>
a0004978:	57fd                	li	a5,-1
a000497a:	02fa4e63          	blt	s4,a5,a00049b6 <print_exponential_number+0xc2>
a000497e:	851a                	mv	a0,t1
a0004980:	859e                	mv	a1,t2
a0004982:	d472                	sw	t3,40(sp)
a0004984:	d676                	sw	t4,44(sp)
a0004986:	d01a                	sw	t1,32(sp)
a0004988:	d21e                	sw	t2,36(sp)
a000498a:	b4eff0ef          	jal	ra,a0003cd8 <__floatdidf>
a000498e:	a00087b7          	lui	a5,0xa0008
a0004992:	6b078793          	addi	a5,a5,1712 # a00086b0 <__psram_limit+0xf7c086b0>
a0004996:	07479a0b          	addsl	s4,a5,s4,3
a000499a:	008a2603          	lw	a2,8(s4)
a000499e:	00ca2683          	lw	a3,12(s4)
a00049a2:	f9dfd0ef          	jal	ra,a000293e <__eqdf2>
a00049a6:	5302                	lw	t1,32(sp)
a00049a8:	5392                	lw	t2,36(sp)
a00049aa:	5e22                	lw	t3,40(sp)
a00049ac:	5eb2                	lw	t4,44(sp)
      exp10++; // Not strictly necessary, since exp10 is no longer really used
      precision--;
a00049ae:	00153513          	seqz	a0,a0
a00049b2:	40a989b3          	sub	s3,s3,a0
      // We're padding on the left; so the width constraint is the decimal part's
      // problem. Well, can both the decimal part and the exponent part fit within our overall width?
      ((width > exp10_part_width) ?
        // Yes, so we limit our decimal part's width.
        // (Note this is trivially valid even if we've fallen back to "%f" mode)
        width - exp10_part_width :
a00049b6:	620d0163          	beqz	s10,a0004fd8 <print_exponential_number+0x6e4>
        // No; we just give up on any restriction on the decimal part and use as many
        // characters as we need
        0U);

  const size_t start_idx = idx;
  idx = print_broken_up_decimal(decimal_part_components, out, buffer, idx, maxlen, precision, decimal_part_width, flags, buf, len);
a00049ba:	57ea                	lw	a5,184(sp)
a00049bc:	c64a                	sw	s2,12(sp)
a00049be:	c46a                	sw	s10,8(sp)
a00049c0:	ca3e                	sw	a5,20(sp)
a00049c2:	57da                	lw	a5,180(sp)
a00049c4:	c83e                	sw	a5,16(sp)
a00049c6:	c24e                	sw	s3,4(sp)
a00049c8:	c066                	sw	s9,0(sp)
a00049ca:	88a6                	mv	a7,s1
a00049cc:	8862                	mv	a6,s8
a00049ce:	87de                	mv	a5,s7
a00049d0:	875a                	mv	a4,s6
a00049d2:	8672                	mv	a2,t3
a00049d4:	86f6                	mv	a3,t4
a00049d6:	851a                	mv	a0,t1
a00049d8:	859e                	mv	a1,t2
a00049da:	31f9                	jal	a00046a8 <print_broken_up_decimal.isra.0>
a00049dc:	842a                	mv	s0,a0
      // We need to right-pad with spaces to meet the width requirement
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
    }
  }
  return idx;
}
a00049de:	50ba                	lw	ra,172(sp)
a00049e0:	8522                	mv	a0,s0
a00049e2:	542a                	lw	s0,168(sp)
a00049e4:	549a                	lw	s1,164(sp)
a00049e6:	590a                	lw	s2,160(sp)
a00049e8:	49fa                	lw	s3,156(sp)
a00049ea:	4a6a                	lw	s4,152(sp)
a00049ec:	4ada                	lw	s5,148(sp)
a00049ee:	4b4a                	lw	s6,144(sp)
a00049f0:	4bba                	lw	s7,140(sp)
a00049f2:	4c2a                	lw	s8,136(sp)
a00049f4:	4c9a                	lw	s9,132(sp)
a00049f6:	4d0a                	lw	s10,128(sp)
a00049f8:	5df6                	lw	s11,124(sp)
a00049fa:	614d                	addi	sp,sp,176
a00049fc:	8082                	ret
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
a00049fe:	7944350b          	extu	a0,s0,30,20
      exp10 = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
a0004a02:	c0150513          	addi	a0,a0,-1023
a0004a06:	916ff0ef          	jal	ra,a0003b1c <__floatsidf>
a0004a0a:	a00087b7          	lui	a5,0xa0008
a0004a0e:	6307a603          	lw	a2,1584(a5) # a0008630 <__psram_limit+0xf7c08630>
a0004a12:	6347a683          	lw	a3,1588(a5)
      exp2 = (int)(exp10 * 3.321928094887362 + 0.5);
a0004a16:	a00087b7          	lui	a5,0xa0008
a0004a1a:	d43e                	sw	a5,40(sp)
      exp10 = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
a0004a1c:	932fe0ef          	jal	ra,a0002b4e <__muldf3>
a0004a20:	a00087b7          	lui	a5,0xa0008
a0004a24:	6387a603          	lw	a2,1592(a5) # a0008638 <__psram_limit+0xf7c08638>
a0004a28:	63c7a683          	lw	a3,1596(a5)
a0004a2c:	fcffc0ef          	jal	ra,a00019fa <__adddf3>
      conv.U = (conv.U & (( (double_uint_t)(1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) | ((double_uint_t) DOUBLE_BASE_EXPONENT << DOUBLE_STORED_MANTISSA_BITS);
a0004a30:	001007b7          	lui	a5,0x100
      exp10 = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
a0004a34:	a0008737          	lui	a4,0xa0008
      conv.U = (conv.U & (( (double_uint_t)(1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) | ((double_uint_t) DOUBLE_BASE_EXPONENT << DOUBLE_STORED_MANTISSA_BITS);
a0004a38:	17fd                	addi	a5,a5,-1
      exp10 = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
a0004a3a:	64072603          	lw	a2,1600(a4) # a0008640 <__psram_limit+0xf7c08640>
a0004a3e:	64472683          	lw	a3,1604(a4)
      conv.U = (conv.U & (( (double_uint_t)(1) << DOUBLE_STORED_MANTISSA_BITS) - 1U)) | ((double_uint_t) DOUBLE_BASE_EXPONENT << DOUBLE_STORED_MANTISSA_BITS);
a0004a42:	8fe1                	and	a5,a5,s0
      exp10 = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
a0004a44:	3ff00737          	lui	a4,0x3ff00
a0004a48:	8fd9                	or	a5,a5,a4
a0004a4a:	d82a                	sw	a0,48(sp)
a0004a4c:	da2e                	sw	a1,52(sp)
a0004a4e:	8556                	mv	a0,s5
a0004a50:	85be                	mv	a1,a5
a0004a52:	e9afe0ef          	jal	ra,a00030ec <__subdf3>
a0004a56:	a00087b7          	lui	a5,0xa0008
a0004a5a:	6487a603          	lw	a2,1608(a5) # a0008648 <__psram_limit+0xf7c08648>
a0004a5e:	64c7a683          	lw	a3,1612(a5)
a0004a62:	8ecfe0ef          	jal	ra,a0002b4e <__muldf3>
a0004a66:	5842                	lw	a6,48(sp)
a0004a68:	58d2                	lw	a7,52(sp)
a0004a6a:	862a                	mv	a2,a0
a0004a6c:	86ae                	mv	a3,a1
a0004a6e:	8542                	mv	a0,a6
a0004a70:	85c6                	mv	a1,a7
a0004a72:	f89fc0ef          	jal	ra,a00019fa <__adddf3>
a0004a76:	f47fe0ef          	jal	ra,a00039bc <__fixdfsi>
a0004a7a:	8a2a                	mv	s4,a0
      exp2 = (int)(exp10 * 3.321928094887362 + 0.5);
a0004a7c:	8a0ff0ef          	jal	ra,a0003b1c <__floatsidf>
a0004a80:	a00086b7          	lui	a3,0xa0008
a0004a84:	6506a603          	lw	a2,1616(a3) # a0008650 <__psram_limit+0xf7c08650>
a0004a88:	6546a683          	lw	a3,1620(a3)
a0004a8c:	d82a                	sw	a0,48(sp)
a0004a8e:	da2e                	sw	a1,52(sp)
a0004a90:	8befe0ef          	jal	ra,a0002b4e <__muldf3>
a0004a94:	a00087b7          	lui	a5,0xa0008
a0004a98:	6287a603          	lw	a2,1576(a5) # a0008628 <__psram_limit+0xf7c08628>
a0004a9c:	62c7a683          	lw	a3,1580(a5)
a0004aa0:	f5bfc0ef          	jal	ra,a00019fa <__adddf3>
a0004aa4:	f19fe0ef          	jal	ra,a00039bc <__fixdfsi>
      const double z  = exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
a0004aa8:	5742                	lw	a4,48(sp)
a0004aaa:	57d2                	lw	a5,52(sp)
a0004aac:	a00086b7          	lui	a3,0xa0008
a0004ab0:	6586a603          	lw	a2,1624(a3) # a0008658 <__psram_limit+0xf7c08658>
a0004ab4:	65c6a683          	lw	a3,1628(a3)
a0004ab8:	85be                	mv	a1,a5
      exp2 = (int)(exp10 * 3.321928094887362 + 0.5);
a0004aba:	dc2a                	sw	a0,56(sp)
      const double z  = exp10 * 2.302585092994046 - exp2 * 0.6931471805599453;
a0004abc:	853a                	mv	a0,a4
a0004abe:	890fe0ef          	jal	ra,a0002b4e <__muldf3>
a0004ac2:	d82a                	sw	a0,48(sp)
a0004ac4:	da2e                	sw	a1,52(sp)
a0004ac6:	5e62                	lw	t3,56(sp)
a0004ac8:	8572                	mv	a0,t3
a0004aca:	c6f2                	sw	t3,76(sp)
a0004acc:	850ff0ef          	jal	ra,a0003b1c <__floatsidf>
a0004ad0:	a00086b7          	lui	a3,0xa0008
a0004ad4:	6606a603          	lw	a2,1632(a3) # a0008660 <__psram_limit+0xf7c08660>
a0004ad8:	6646a683          	lw	a3,1636(a3)
a0004adc:	872fe0ef          	jal	ra,a0002b4e <__muldf3>
a0004ae0:	5742                	lw	a4,48(sp)
a0004ae2:	57d2                	lw	a5,52(sp)
a0004ae4:	862a                	mv	a2,a0
a0004ae6:	86ae                	mv	a3,a1
a0004ae8:	853a                	mv	a0,a4
a0004aea:	85be                	mv	a1,a5
a0004aec:	e00fe0ef          	jal	ra,a00030ec <__subdf3>
      const double z2 = z * z;
a0004af0:	862a                	mv	a2,a0
a0004af2:	86ae                	mv	a3,a1
a0004af4:	dc2a                	sw	a0,56(sp)
a0004af6:	de2e                	sw	a1,60(sp)
a0004af8:	856fe0ef          	jal	ra,a0002b4e <__muldf3>
      conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
a0004afc:	5862                	lw	a6,56(sp)
a0004afe:	58f2                	lw	a7,60(sp)
      const double z2 = z * z;
a0004b00:	d82a                	sw	a0,48(sp)
      conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
a0004b02:	8642                	mv	a2,a6
a0004b04:	86c6                	mv	a3,a7
a0004b06:	8542                	mv	a0,a6
      const double z2 = z * z;
a0004b08:	da2e                	sw	a1,52(sp)
      conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
a0004b0a:	85c6                	mv	a1,a7
a0004b0c:	c0c2                	sw	a6,64(sp)
a0004b0e:	c2c6                	sw	a7,68(sp)
a0004b10:	eebfc0ef          	jal	ra,a00019fa <__adddf3>
a0004b14:	5742                	lw	a4,48(sp)
a0004b16:	57d2                	lw	a5,52(sp)
a0004b18:	a00086b7          	lui	a3,0xa0008
a0004b1c:	6686a603          	lw	a2,1640(a3) # a0008668 <__psram_limit+0xf7c08668>
a0004b20:	66c6a683          	lw	a3,1644(a3)
a0004b24:	dc2a                	sw	a0,56(sp)
a0004b26:	de2e                	sw	a1,60(sp)
a0004b28:	853a                	mv	a0,a4
a0004b2a:	85be                	mv	a1,a5
a0004b2c:	f86fd0ef          	jal	ra,a00022b2 <__divdf3>
a0004b30:	a00087b7          	lui	a5,0xa0008
a0004b34:	6707a603          	lw	a2,1648(a5) # a0008670 <__psram_limit+0xf7c08670>
a0004b38:	6747a683          	lw	a3,1652(a5)
a0004b3c:	ebffc0ef          	jal	ra,a00019fa <__adddf3>
a0004b40:	5742                	lw	a4,48(sp)
a0004b42:	57d2                	lw	a5,52(sp)
a0004b44:	862a                	mv	a2,a0
a0004b46:	86ae                	mv	a3,a1
a0004b48:	853a                	mv	a0,a4
a0004b4a:	85be                	mv	a1,a5
a0004b4c:	f66fd0ef          	jal	ra,a00022b2 <__divdf3>
a0004b50:	a00086b7          	lui	a3,0xa0008
a0004b54:	6786a603          	lw	a2,1656(a3) # a0008678 <__psram_limit+0xf7c08678>
a0004b58:	67c6a683          	lw	a3,1660(a3)
a0004b5c:	e9ffc0ef          	jal	ra,a00019fa <__adddf3>
a0004b60:	5742                	lw	a4,48(sp)
a0004b62:	57d2                	lw	a5,52(sp)
a0004b64:	862a                	mv	a2,a0
a0004b66:	86ae                	mv	a3,a1
a0004b68:	853a                	mv	a0,a4
a0004b6a:	85be                	mv	a1,a5
a0004b6c:	f46fd0ef          	jal	ra,a00022b2 <__divdf3>
a0004b70:	a00086b7          	lui	a3,0xa0008
a0004b74:	d82a                	sw	a0,48(sp)
a0004b76:	da2e                	sw	a1,52(sp)
a0004b78:	6806a503          	lw	a0,1664(a3) # a0008680 <__psram_limit+0xf7c08680>
a0004b7c:	6846a583          	lw	a1,1668(a3)
a0004b80:	4806                	lw	a6,64(sp)
a0004b82:	4896                	lw	a7,68(sp)
a0004b84:	8642                	mv	a2,a6
a0004b86:	86c6                	mv	a3,a7
a0004b88:	d64fe0ef          	jal	ra,a00030ec <__subdf3>
a0004b8c:	5742                	lw	a4,48(sp)
a0004b8e:	57d2                	lw	a5,52(sp)
a0004b90:	862a                	mv	a2,a0
a0004b92:	86ae                	mv	a3,a1
a0004b94:	853a                	mv	a0,a4
a0004b96:	85be                	mv	a1,a5
a0004b98:	e63fc0ef          	jal	ra,a00019fa <__adddf3>
a0004b9c:	5362                	lw	t1,56(sp)
a0004b9e:	53f2                	lw	t2,60(sp)
a0004ba0:	862a                	mv	a2,a0
a0004ba2:	86ae                	mv	a3,a1
a0004ba4:	851a                	mv	a0,t1
a0004ba6:	859e                	mv	a1,t2
a0004ba8:	f0afd0ef          	jal	ra,a00022b2 <__divdf3>
a0004bac:	a00087b7          	lui	a5,0xa0008
a0004bb0:	6887a603          	lw	a2,1672(a5) # a0008688 <__psram_limit+0xf7c08688>
a0004bb4:	68c7a683          	lw	a3,1676(a5)
a0004bb8:	e43fc0ef          	jal	ra,a00019fa <__adddf3>
      conv.U = ((double_uint_t)(exp2) + DOUBLE_BASE_EXPONENT) << DOUBLE_STORED_MANTISSA_BITS;
a0004bbc:	4e36                	lw	t3,76(sp)
a0004bbe:	3ff00613          	li	a2,1023
a0004bc2:	4681                	li	a3,0
a0004bc4:	8772                	mv	a4,t3
a0004bc6:	41fe5793          	srai	a5,t3,0x1f
a0004bca:	c0c71777          	add64	a4,a4,a2
      conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
a0004bce:	0752                	slli	a4,a4,0x14
a0004bd0:	86ba                	mv	a3,a4
a0004bd2:	4601                	li	a2,0
a0004bd4:	f7bfd0ef          	jal	ra,a0002b4e <__muldf3>
      if (abs_number < conv.F) {
a0004bd8:	8656                	mv	a2,s5
a0004bda:	86a2                	mv	a3,s0
      conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
a0004bdc:	d82a                	sw	a0,48(sp)
a0004bde:	da2e                	sw	a1,52(sp)
      if (abs_number < conv.F) {
a0004be0:	e03fd0ef          	jal	ra,a00029e2 <__gedf2>
a0004be4:	5742                	lw	a4,48(sp)
a0004be6:	57d2                	lw	a5,52(sp)
a0004be8:	00a05f63          	blez	a0,a0004c06 <print_exponential_number+0x312>
        conv.F /= 10;
a0004bec:	a00086b7          	lui	a3,0xa0008
a0004bf0:	6706a603          	lw	a2,1648(a3) # a0008670 <__psram_limit+0xf7c08670>
a0004bf4:	6746a683          	lw	a3,1652(a3)
a0004bf8:	853a                	mv	a0,a4
a0004bfa:	85be                	mv	a1,a5
a0004bfc:	eb6fd0ef          	jal	ra,a00022b2 <__divdf3>
        exp10--;
a0004c00:	1a7d                	addi	s4,s4,-1
        conv.F /= 10;
a0004c02:	872a                	mv	a4,a0
a0004c04:	87ae                	mv	a5,a1
a0004c06:	85ba                	mv	a1,a4
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(exp10)] : conv.F;
a0004c08:	02200693          	li	a3,34
    abs_exp10_covered_by_powers_table = PRINTF_ABS(exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
a0004c0c:	011a0713          	addi	a4,s4,17
        conv.F /= 10;
a0004c10:	863e                	mv	a2,a5
    abs_exp10_covered_by_powers_table = PRINTF_ABS(exp10) < PRINTF_MAX_PRECOMPUTED_POWER_OF_10;
a0004c12:	02373793          	sltiu	a5,a4,35
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(exp10)] : conv.F;
a0004c16:	1ee6ee63          	bltu	a3,a4,a0004e12 <print_exponential_number+0x51e>
a0004c1a:	41fa5593          	srai	a1,s4,0x1f
a0004c1e:	0145c633          	xor	a2,a1,s4
a0004c22:	a00086b7          	lui	a3,0xa0008
a0004c26:	6b068693          	addi	a3,a3,1712 # a00086b0 <__psram_limit+0xf7c086b0>
a0004c2a:	8e0d                	sub	a2,a2,a1
a0004c2c:	06c6958b          	addsl	a1,a3,a2,3
a0004c30:	46c6c68b          	lrw	a3,a3,a2,3
a0004c34:	d836                	sw	a3,48(sp)
a0004c36:	41d4                	lw	a3,4(a1)
a0004c38:	dc36                	sw	a3,56(sp)
  if (flags & FLAGS_ADAPT_EXP) {
a0004c3a:	1e0b0063          	beqz	s6,a0004e1a <print_exponential_number+0x526>
    fall_back_to_decimal_only_mode = (exp10 >= -4 && exp10 < required_significant_digits);
a0004c3e:	56f1                	li	a3,-4
        (int) precision - 1 - exp10 :
a0004c40:	fff98713          	addi	a4,s3,-1
    fall_back_to_decimal_only_mode = (exp10 >= -4 && exp10 < required_significant_digits);
a0004c44:	40da5c63          	bge	s4,a3,a000505c <print_exponential_number+0x768>
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
a0004c48:	fff74993          	not	s3,a4
a0004c4c:	41f9d993          	srai	s3,s3,0x1f
a0004c50:	013779b3          	and	s3,a4,s3
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
a0004c54:	40096913          	ori	s2,s2,1024
  normalization.multiply = (exp10 < 0 && abs_exp10_covered_by_powers_table);
a0004c58:	1c079763          	bnez	a5,a0004e26 <print_exponential_number+0x532>
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
a0004c5c:	5b62                	lw	s6,56(sp)
a0004c5e:	5dc2                	lw	s11,48(sp)
a0004c60:	8556                	mv	a0,s5
a0004c62:	86da                	mv	a3,s6
a0004c64:	866e                	mv	a2,s11
a0004c66:	85a2                	mv	a1,s0
a0004c68:	e4afd0ef          	jal	ra,a00022b2 <__divdf3>
  components.integral = (int_fast64_t) apply_scaling(non_normalized, normalization);
a0004c6c:	f69fe0ef          	jal	ra,a0003bd4 <__fixdfdi>
a0004c70:	c0aa                	sw	a0,64(sp)
a0004c72:	c2ae                	sw	a1,68(sp)
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004c74:	864ff0ef          	jal	ra,a0003cd8 <__floatdidf>
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
a0004c78:	86da                	mv	a3,s6
a0004c7a:	866e                	mv	a2,s11
a0004c7c:	ed3fd0ef          	jal	ra,a0002b4e <__muldf3>
a0004c80:	862a                	mv	a2,a0
a0004c82:	86ae                	mv	a3,a1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004c84:	8556                	mv	a0,s5
a0004c86:	85a2                	mv	a1,s0
a0004c88:	c64fe0ef          	jal	ra,a00030ec <__subdf3>
  double prec_power_of_10 = powers_of_10[precision];
a0004c8c:	a00086b7          	lui	a3,0xa0008
a0004c90:	6b068693          	addi	a3,a3,1712 # a00086b0 <__psram_limit+0xf7c086b0>
a0004c94:	0736978b          	addsl	a5,a3,s3,3
a0004c98:	43c0                	lw	s0,4(a5)
  return (int)((x.U >> DOUBLE_STORED_MANTISSA_BITS ) & DOUBLE_EXPONENT_MASK) - DOUBLE_BASE_EXPONENT;
a0004c9a:	794b370b          	extu	a4,s6,30,20
a0004c9e:	c0170713          	addi	a4,a4,-1023 # 3feffc01 <__wifi_bss_end+0x1ceefc01>
a0004ca2:	7944378b          	extu	a5,s0,30,20
a0004ca6:	c0178793          	addi	a5,a5,-1023
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
a0004caa:	41f7d613          	srai	a2,a5,0x1f
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004cae:	88ae                	mv	a7,a1
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
a0004cb0:	41f75593          	srai	a1,a4,0x1f
a0004cb4:	8f2d                	xor	a4,a4,a1
a0004cb6:	8fb1                	xor	a5,a5,a2
a0004cb8:	8f0d                	sub	a4,a4,a1
a0004cba:	8f91                	sub	a5,a5,a2
  double prec_power_of_10 = powers_of_10[precision];
a0004cbc:	4736ca8b          	lrw	s5,a3,s3,3
  components.is_negative = negative;
a0004cc0:	5b02                	lw	s6,32(sp)
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
a0004cc2:	4306                	lw	t1,64(sp)
a0004cc4:	4396                	lw	t2,68(sp)
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004cc6:	882a                	mv	a6,a0
    if (PRINTF_ABS(factor_exp2) > PRINTF_ABS(extra_factor_exp2)) {
a0004cc8:	36e7d063          	bge	a5,a4,a0005028 <print_exponential_number+0x734>
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
a0004ccc:	5ec2                	lw	t4,48(sp)
a0004cce:	5e62                	lw	t3,56(sp)
a0004cd0:	8656                	mv	a2,s5
a0004cd2:	8576                	mv	a0,t4
a0004cd4:	85f2                	mv	a1,t3
a0004cd6:	86a2                	mv	a3,s0
a0004cd8:	d01a                	sw	t1,32(sp)
a0004cda:	d21e                	sw	t2,36(sp)
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
a0004cdc:	c0c2                	sw	a6,64(sp)
a0004cde:	c2c6                	sw	a7,68(sp)
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
a0004ce0:	dd2fd0ef          	jal	ra,a00022b2 <__divdf3>
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
a0004ce4:	4806                	lw	a6,64(sp)
a0004ce6:	4896                	lw	a7,68(sp)
      result.raw_factor = sf.raw_factor / extra_multiplicative_factor;
a0004ce8:	862a                	mv	a2,a0
a0004cea:	86ae                	mv	a3,a1
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
a0004cec:	8542                	mv	a0,a6
a0004cee:	85c6                	mv	a1,a7
a0004cf0:	dc2fd0ef          	jal	ra,a00022b2 <__divdf3>
a0004cf4:	5302                	lw	t1,32(sp)
a0004cf6:	5392                	lw	t2,36(sp)
a0004cf8:	8e2a                	mv	t3,a0
a0004cfa:	8eae                	mv	t4,a1
  if (precision == 0U) {
a0004cfc:	18099f63          	bnez	s3,a0004e9a <print_exponential_number+0x5a6>
    components.integral += (scaled_remainder >= rounding_threshold);
a0004d00:	57a2                	lw	a5,40(sp)
a0004d02:	85f6                	mv	a1,t4
a0004d04:	4805                	li	a6,1
a0004d06:	6287af03          	lw	t5,1576(a5)
a0004d0a:	62c7af83          	lw	t6,1580(a5)
a0004d0e:	4881                	li	a7,0
a0004d10:	867a                	mv	a2,t5
a0004d12:	86fe                	mv	a3,t6
a0004d14:	8572                	mv	a0,t3
a0004d16:	d81a                	sw	t1,48(sp)
a0004d18:	da1e                	sw	t2,52(sp)
a0004d1a:	d472                	sw	t3,40(sp)
a0004d1c:	d676                	sw	t4,44(sp)
a0004d1e:	d042                	sw	a6,32(sp)
a0004d20:	d246                	sw	a7,36(sp)
a0004d22:	cc1fd0ef          	jal	ra,a00029e2 <__gedf2>
    if (scaled_remainder == rounding_threshold) {
a0004d26:	a00087b7          	lui	a5,0xa0008
a0004d2a:	6287af03          	lw	t5,1576(a5) # a0008628 <__psram_limit+0xf7c08628>
a0004d2e:	62c7af83          	lw	t6,1580(a5)
a0004d32:	5e22                	lw	t3,40(sp)
a0004d34:	5eb2                	lw	t4,44(sp)
    components.integral += (scaled_remainder >= rounding_threshold);
a0004d36:	857d                	srai	a0,a0,0x1f
a0004d38:	fff54513          	not	a0,a0
a0004d3c:	01f55813          	srli	a6,a0,0x1f
a0004d40:	4881                	li	a7,0
    if (scaled_remainder == rounding_threshold) {
a0004d42:	867a                	mv	a2,t5
a0004d44:	86fe                	mv	a3,t6
a0004d46:	8572                	mv	a0,t3
a0004d48:	85f6                	mv	a1,t4
    components.integral += (scaled_remainder >= rounding_threshold);
a0004d4a:	d042                	sw	a6,32(sp)
a0004d4c:	d246                	sw	a7,36(sp)
    if (scaled_remainder == rounding_threshold) {
a0004d4e:	bf1fd0ef          	jal	ra,a000293e <__eqdf2>
    components.integral += (scaled_remainder >= rounding_threshold);
a0004d52:	5802                	lw	a6,32(sp)
a0004d54:	5892                	lw	a7,36(sp)
a0004d56:	5342                	lw	t1,48(sp)
a0004d58:	53d2                	lw	t2,52(sp)
a0004d5a:	c1031377          	add64	t1,t1,a6
    if (scaled_remainder == rounding_threshold) {
a0004d5e:	2e051c63          	bnez	a0,a0005056 <print_exponential_number+0x762>
      components.integral &= ~((int_fast64_t) 0x1);
a0004d62:	ffe37713          	andi	a4,t1,-2
a0004d66:	833a                	mv	t1,a4
    components.fractional = 0;
a0004d68:	4e01                	li	t3,0
a0004d6a:	4e81                	li	t4,0
    if (decimal_part_components.integral >= 10) {
a0004d6c:	1e704663          	bgtz	t2,a0004f58 <print_exponential_number+0x664>
a0004d70:	28038363          	beqz	t2,a0004ff6 <print_exponential_number+0x702>
  unsigned int exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(exp10) < 100) ? 4U : 5U;
a0004d74:	063a0793          	addi	a5,s4,99
a0004d78:	0c600713          	li	a4,198
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
a0004d7c:	00297a93          	andi	s5,s2,2
  unsigned int exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(exp10) < 100) ? 4U : 5U;
a0004d80:	1ef76963          	bltu	a4,a5,a0004f72 <print_exponential_number+0x67e>
      0U :
a0004d84:	440d                	li	s0,3
a0004d86:	260a8c63          	beqz	s5,a0004ffe <print_exponential_number+0x70a>
  idx = print_broken_up_decimal(decimal_part_components, out, buffer, idx, maxlen, precision, decimal_part_width, flags, buf, len);
a0004d8a:	57ea                	lw	a5,184(sp)
a0004d8c:	8672                	mv	a2,t3
a0004d8e:	c64a                	sw	s2,12(sp)
a0004d90:	ca3e                	sw	a5,20(sp)
a0004d92:	57da                	lw	a5,180(sp)
a0004d94:	c402                	sw	zero,8(sp)
a0004d96:	c24e                	sw	s3,4(sp)
a0004d98:	c83e                	sw	a5,16(sp)
a0004d9a:	c066                	sw	s9,0(sp)
a0004d9c:	88a6                	mv	a7,s1
a0004d9e:	8862                	mv	a6,s8
a0004da0:	87de                	mv	a5,s7
a0004da2:	875a                	mv	a4,s6
a0004da4:	86f6                	mv	a3,t4
a0004da6:	851a                	mv	a0,t1
a0004da8:	859e                	mv	a1,t2
a0004daa:	8ffff0ef          	jal	ra,a00046a8 <print_broken_up_decimal.isra.0>
a0004dae:	862a                	mv	a2,a0
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
a0004db0:	1459350b          	extu	a0,s2,5,5
a0004db4:	40a00533          	neg	a0,a0
a0004db8:	9901                	andi	a0,a0,-32
a0004dba:	86e6                	mv	a3,s9
a0004dbc:	85e2                	mv	a1,s8
a0004dbe:	06550513          	addi	a0,a0,101
a0004dc2:	00160913          	addi	s2,a2,1
a0004dc6:	9b82                	jalr	s7
    idx = print_integer(out, buffer, idx, maxlen,
a0004dc8:	21405f63          	blez	s4,a0004fe6 <print_exponential_number+0x6f2>
a0004dcc:	8752                	mv	a4,s4
a0004dce:	41fa5793          	srai	a5,s4,0x1f
a0004dd2:	4695                	li	a3,5
a0004dd4:	c436                	sw	a3,8(sp)
a0004dd6:	c222                	sw	s0,4(sp)
a0004dd8:	c002                	sw	zero,0(sp)
a0004dda:	48a9                	li	a7,10
a0004ddc:	01fa5813          	srli	a6,s4,0x1f
a0004de0:	86e6                	mv	a3,s9
a0004de2:	864a                	mv	a2,s2
a0004de4:	85e2                	mv	a1,s8
a0004de6:	855e                	mv	a0,s7
a0004de8:	c68ff0ef          	jal	ra,a0004250 <print_integer>
a0004dec:	842a                	mv	s0,a0
    if (flags & FLAGS_LEFT) {
a0004dee:	be0a88e3          	beqz	s5,a00049de <print_exponential_number+0xea>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
a0004df2:	409504b3          	sub	s1,a0,s1
a0004df6:	bfa4f4e3          	bgeu	s1,s10,a00049de <print_exponential_number+0xea>
a0004dfa:	0001                	nop
a0004dfc:	8622                	mv	a2,s0
a0004dfe:	0485                	addi	s1,s1,1
a0004e00:	86e6                	mv	a3,s9
a0004e02:	85e2                	mv	a1,s8
a0004e04:	02000513          	li	a0,32
a0004e08:	0405                	addi	s0,s0,1
a0004e0a:	9b82                	jalr	s7
a0004e0c:	ffa4e8e3          	bltu	s1,s10,a0004dfc <print_exponential_number+0x508>
a0004e10:	b6f9                	j	a00049de <print_exponential_number+0xea>
    normalization.raw_factor = abs_exp10_covered_by_powers_table ? powers_of_10[PRINTF_ABS(exp10)] : conv.F;
a0004e12:	d82e                	sw	a1,48(sp)
a0004e14:	dc32                	sw	a2,56(sp)
  if (flags & FLAGS_ADAPT_EXP) {
a0004e16:	e20b14e3          	bnez	s6,a0004c3e <print_exponential_number+0x34a>
  normalization.multiply = (exp10 < 0 && abs_exp10_covered_by_powers_table);
a0004e1a:	220a5863          	bgez	s4,a000504a <print_exponential_number+0x756>
a0004e1e:	02200793          	li	a5,34
a0004e22:	e2e7ede3          	bltu	a5,a4,a0004c5c <print_exponential_number+0x368>
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
a0004e26:	5b62                	lw	s6,56(sp)
a0004e28:	5dc2                	lw	s11,48(sp)
a0004e2a:	8556                	mv	a0,s5
a0004e2c:	86da                	mv	a3,s6
a0004e2e:	866e                	mv	a2,s11
a0004e30:	85a2                	mv	a1,s0
a0004e32:	d1dfd0ef          	jal	ra,a0002b4e <__muldf3>
  components.integral = (int_fast64_t) apply_scaling(non_normalized, normalization);
a0004e36:	d9ffe0ef          	jal	ra,a0003bd4 <__fixdfdi>
a0004e3a:	dc2a                	sw	a0,56(sp)
a0004e3c:	de2e                	sw	a1,60(sp)
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004e3e:	e9bfe0ef          	jal	ra,a0003cd8 <__floatdidf>
  return normalization.multiply ? normalized / normalization.raw_factor : normalized * normalization.raw_factor;
a0004e42:	86da                	mv	a3,s6
a0004e44:	866e                	mv	a2,s11
a0004e46:	c6cfd0ef          	jal	ra,a00022b2 <__divdf3>
a0004e4a:	862a                	mv	a2,a0
a0004e4c:	86ae                	mv	a3,a1
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004e4e:	8556                	mv	a0,s5
a0004e50:	85a2                	mv	a1,s0
a0004e52:	a9afe0ef          	jal	ra,a00030ec <__subdf3>
  double prec_power_of_10 = powers_of_10[precision];
a0004e56:	a00087b7          	lui	a5,0xa0008
a0004e5a:	6b078793          	addi	a5,a5,1712 # a00086b0 <__psram_limit+0xf7c086b0>
a0004e5e:	0737970b          	addsl	a4,a5,s3,3
a0004e62:	4737ca8b          	lrw	s5,a5,s3,3
a0004e66:	4340                	lw	s0,4(a4)
  double remainder = non_normalized - unapply_scaling((double) components.integral, normalization);
a0004e68:	d82a                	sw	a0,48(sp)
a0004e6a:	da2e                	sw	a1,52(sp)
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
a0004e6c:	86da                	mv	a3,s6
a0004e6e:	866e                	mv	a2,s11
a0004e70:	8556                	mv	a0,s5
a0004e72:	85a2                	mv	a1,s0
a0004e74:	cdbfd0ef          	jal	ra,a0002b4e <__muldf3>
a0004e78:	5842                	lw	a6,48(sp)
  components.is_negative = negative;
a0004e7a:	5b02                	lw	s6,32(sp)
    result.raw_factor = sf.raw_factor * extra_multiplicative_factor;
a0004e7c:	58d2                	lw	a7,52(sp)
a0004e7e:	5362                	lw	t1,56(sp)
a0004e80:	53f2                	lw	t2,60(sp)
  return normalization.multiply ? num * normalization.raw_factor : num / normalization.raw_factor;
a0004e82:	8642                	mv	a2,a6
a0004e84:	86c6                	mv	a3,a7
a0004e86:	d01a                	sw	t1,32(sp)
a0004e88:	d21e                	sw	t2,36(sp)
a0004e8a:	cc5fd0ef          	jal	ra,a0002b4e <__muldf3>
a0004e8e:	5302                	lw	t1,32(sp)
a0004e90:	5392                	lw	t2,36(sp)
a0004e92:	8e2a                	mv	t3,a0
a0004e94:	8eae                	mv	t4,a1
  if (precision == 0U) {
a0004e96:	e60985e3          	beqz	s3,a0004d00 <print_exponential_number+0x40c>
    components.fractional = (int_fast64_t) scaled_remainder;
a0004e9a:	8572                	mv	a0,t3
a0004e9c:	85f6                	mv	a1,t4
a0004e9e:	c09a                	sw	t1,64(sp)
a0004ea0:	c29e                	sw	t2,68(sp)
a0004ea2:	d072                	sw	t3,32(sp)
a0004ea4:	d276                	sw	t4,36(sp)
a0004ea6:	d2ffe0ef          	jal	ra,a0003bd4 <__fixdfdi>
a0004eaa:	dc2a                	sw	a0,56(sp)
a0004eac:	de2e                	sw	a1,60(sp)
    scaled_remainder -= components.fractional;
a0004eae:	e2bfe0ef          	jal	ra,a0003cd8 <__floatdidf>
a0004eb2:	5e02                	lw	t3,32(sp)
a0004eb4:	5e92                	lw	t4,36(sp)
a0004eb6:	862a                	mv	a2,a0
a0004eb8:	86ae                	mv	a3,a1
a0004eba:	8572                	mv	a0,t3
a0004ebc:	85f6                	mv	a1,t4
a0004ebe:	a2efe0ef          	jal	ra,a00030ec <__subdf3>
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004ec2:	57a2                	lw	a5,40(sp)
a0004ec4:	4805                	li	a6,1
a0004ec6:	4881                	li	a7,0
a0004ec8:	6287ae03          	lw	t3,1576(a5)
a0004ecc:	62c7ae83          	lw	t4,1580(a5)
    scaled_remainder -= components.fractional;
a0004ed0:	da2e                	sw	a1,52(sp)
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004ed2:	8672                	mv	a2,t3
a0004ed4:	86f6                	mv	a3,t4
a0004ed6:	d042                	sw	a6,32(sp)
a0004ed8:	d246                	sw	a7,36(sp)
    scaled_remainder -= components.fractional;
a0004eda:	d82a                	sw	a0,48(sp)
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004edc:	b07fd0ef          	jal	ra,a00029e2 <__gedf2>
    if (scaled_remainder == rounding_threshold) {
a0004ee0:	a00087b7          	lui	a5,0xa0008
a0004ee4:	6287ae03          	lw	t3,1576(a5) # a0008628 <__psram_limit+0xf7c08628>
a0004ee8:	62c7ae83          	lw	t4,1580(a5)
a0004eec:	5f42                	lw	t5,48(sp)
a0004eee:	5fd2                	lw	t6,52(sp)
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004ef0:	857d                	srai	a0,a0,0x1f
a0004ef2:	fff54513          	not	a0,a0
a0004ef6:	01f55813          	srli	a6,a0,0x1f
a0004efa:	4881                	li	a7,0
    if (scaled_remainder == rounding_threshold) {
a0004efc:	8672                	mv	a2,t3
a0004efe:	86f6                	mv	a3,t4
a0004f00:	857a                	mv	a0,t5
a0004f02:	85fe                	mv	a1,t6
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004f04:	d042                	sw	a6,32(sp)
a0004f06:	d246                	sw	a7,36(sp)
    if (scaled_remainder == rounding_threshold) {
a0004f08:	a37fd0ef          	jal	ra,a000293e <__eqdf2>
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004f0c:	5802                	lw	a6,32(sp)
a0004f0e:	5892                	lw	a7,36(sp)
a0004f10:	5762                	lw	a4,56(sp)
a0004f12:	57f2                	lw	a5,60(sp)
    if (scaled_remainder == rounding_threshold) {
a0004f14:	4306                	lw	t1,64(sp)
a0004f16:	4396                	lw	t2,68(sp)
    components.fractional += (scaled_remainder >= rounding_threshold);
a0004f18:	c0e81e77          	add64	t3,a6,a4
    if (scaled_remainder == rounding_threshold) {
a0004f1c:	e501                	bnez	a0,a0004f24 <print_exponential_number+0x630>
      components.fractional &= ~((int_fast64_t) 0x1);
a0004f1e:	ffee7713          	andi	a4,t3,-2
a0004f22:	8e3a                	mv	t3,a4
    if ((double) components.fractional >= prec_power_of_10) {
a0004f24:	8572                	mv	a0,t3
a0004f26:	85f6                	mv	a1,t4
a0004f28:	d41a                	sw	t1,40(sp)
a0004f2a:	d61e                	sw	t2,44(sp)
a0004f2c:	d072                	sw	t3,32(sp)
a0004f2e:	d276                	sw	t4,36(sp)
a0004f30:	da9fe0ef          	jal	ra,a0003cd8 <__floatdidf>
a0004f34:	8656                	mv	a2,s5
a0004f36:	86a2                	mv	a3,s0
a0004f38:	aabfd0ef          	jal	ra,a00029e2 <__gedf2>
a0004f3c:	5e02                	lw	t3,32(sp)
a0004f3e:	5e92                	lw	t4,36(sp)
a0004f40:	5322                	lw	t1,40(sp)
a0004f42:	53b2                	lw	t2,44(sp)
a0004f44:	e20544e3          	bltz	a0,a0004d6c <print_exponential_number+0x478>
      ++components.integral;
a0004f48:	4705                	li	a4,1
a0004f4a:	4781                	li	a5,0
a0004f4c:	c0e31377          	add64	t1,t1,a4
      components.fractional = 0;
a0004f50:	4e01                	li	t3,0
a0004f52:	4e81                	li	t4,0
    if (decimal_part_components.integral >= 10) {
a0004f54:	e0705ee3          	blez	t2,a0004d70 <print_exponential_number+0x47c>
      exp10++;
a0004f58:	0a05                	addi	s4,s4,1
  unsigned int exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(exp10) < 100) ? 4U : 5U;
a0004f5a:	063a0793          	addi	a5,s4,99
a0004f5e:	0c600713          	li	a4,198
      decimal_part_components.fractional = 0;
a0004f62:	4e01                	li	t3,0
a0004f64:	4e81                	li	t4,0
      decimal_part_components.integral = 1;
a0004f66:	4305                	li	t1,1
a0004f68:	4381                	li	t2,0
    ((flags & FLAGS_LEFT) && exp10_part_width) ?
a0004f6a:	00297a93          	andi	s5,s2,2
  unsigned int exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(exp10) < 100) ? 4U : 5U;
a0004f6e:	e0f77be3          	bgeu	a4,a5,a0004d84 <print_exponential_number+0x490>
      0U :
a0004f72:	4411                	li	s0,4
a0004f74:	e00a9be3          	bnez	s5,a0004d8a <print_exponential_number+0x496>
  unsigned int exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(exp10) < 100) ? 4U : 5U;
a0004f78:	4415                	li	s0,5
        width - exp10_part_width :
a0004f7a:	09a47563          	bgeu	s0,s10,a0005004 <print_exponential_number+0x710>
  idx = print_broken_up_decimal(decimal_part_components, out, buffer, idx, maxlen, precision, decimal_part_width, flags, buf, len);
a0004f7e:	576a                	lw	a4,184(sp)
        width - exp10_part_width :
a0004f80:	408d07b3          	sub	a5,s10,s0
  idx = print_broken_up_decimal(decimal_part_components, out, buffer, idx, maxlen, precision, decimal_part_width, flags, buf, len);
a0004f84:	c64a                	sw	s2,12(sp)
a0004f86:	ca3a                	sw	a4,20(sp)
a0004f88:	575a                	lw	a4,180(sp)
a0004f8a:	c43e                	sw	a5,8(sp)
a0004f8c:	c83a                	sw	a4,16(sp)
a0004f8e:	8672                	mv	a2,t3
a0004f90:	c24e                	sw	s3,4(sp)
a0004f92:	c066                	sw	s9,0(sp)
a0004f94:	88a6                	mv	a7,s1
a0004f96:	8862                	mv	a6,s8
a0004f98:	87de                	mv	a5,s7
a0004f9a:	875a                	mv	a4,s6
a0004f9c:	86f6                	mv	a3,t4
a0004f9e:	851a                	mv	a0,t1
a0004fa0:	859e                	mv	a1,t2
a0004fa2:	f06ff0ef          	jal	ra,a00046a8 <print_broken_up_decimal.isra.0>
a0004fa6:	862a                	mv	a2,a0
    idx = print_integer(out, buffer, idx, maxlen,
a0004fa8:	147d                	addi	s0,s0,-1
a0004faa:	4a81                	li	s5,0
a0004fac:	b511                	j	a0004db0 <print_exponential_number+0x4bc>
        (int) precision - 1 - exp10 :
a0004fae:	fff98713          	addi	a4,s3,-1
    fall_back_to_decimal_only_mode = (exp10 >= -4 && exp10 < required_significant_digits);
a0004fb2:	06098063          	beqz	s3,a0005012 <print_exponential_number+0x71e>
    exp10 = 0; // ... and no need to set a normalization factor or check the powers table
a0004fb6:	4a01                	li	s4,0
    fall_back_to_decimal_only_mode = (exp10 >= -4 && exp10 < required_significant_digits);
a0004fb8:	05304d63          	bgtz	s3,a0005012 <print_exponential_number+0x71e>
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
a0004fbc:	fff74993          	not	s3,a4
a0004fc0:	41f9d993          	srai	s3,s3,0x1f
a0004fc4:	013779b3          	and	s3,a4,s3
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
a0004fc8:	40096913          	ori	s2,s2,1024
  normalization.multiply = (exp10 < 0 && abs_exp10_covered_by_powers_table);
a0004fcc:	060a5f63          	bgez	s4,a000504a <print_exponential_number+0x756>
a0004fd0:	a0008737          	lui	a4,0xa0008
a0004fd4:	d43a                	sw	a4,40(sp)
a0004fd6:	b149                	j	a0004c58 <print_exponential_number+0x364>
  idx = print_broken_up_decimal(decimal_part_components, out, buffer, idx, maxlen, precision, decimal_part_width, flags, buf, len);
a0004fd8:	57ea                	lw	a5,184(sp)
a0004fda:	c64a                	sw	s2,12(sp)
a0004fdc:	c402                	sw	zero,8(sp)
a0004fde:	ca3e                	sw	a5,20(sp)
a0004fe0:	57da                	lw	a5,180(sp)
a0004fe2:	c83e                	sw	a5,16(sp)
a0004fe4:	b2cd                	j	a00049c6 <print_exponential_number+0xd2>
                ABS_FOR_PRINTING(exp10),
a0004fe6:	8652                	mv	a2,s4
a0004fe8:	41fa5693          	srai	a3,s4,0x1f
a0004fec:	4701                	li	a4,0
a0004fee:	4781                	li	a5,0
a0004ff0:	c2c71777          	sub64	a4,a4,a2
a0004ff4:	bbf9                	j	a0004dd2 <print_exponential_number+0x4de>
    if (decimal_part_components.integral >= 10) {
a0004ff6:	47a5                	li	a5,9
a0004ff8:	d667fee3          	bgeu	a5,t1,a0004d74 <print_exponential_number+0x480>
a0004ffc:	bfb1                	j	a0004f58 <print_exponential_number+0x664>
  unsigned int exp10_part_width = fall_back_to_decimal_only_mode ? 0U : (PRINTF_ABS(exp10) < 100) ? 4U : 5U;
a0004ffe:	4411                	li	s0,4
        width - exp10_part_width :
a0005000:	f7a46fe3          	bltu	s0,s10,a0004f7e <print_exponential_number+0x68a>
  idx = print_broken_up_decimal(decimal_part_components, out, buffer, idx, maxlen, precision, decimal_part_width, flags, buf, len);
a0005004:	57ea                	lw	a5,184(sp)
a0005006:	c64a                	sw	s2,12(sp)
a0005008:	c402                	sw	zero,8(sp)
a000500a:	ca3e                	sw	a5,20(sp)
a000500c:	57da                	lw	a5,180(sp)
a000500e:	c83e                	sw	a5,16(sp)
a0005010:	bfbd                	j	a0004f8e <print_exponential_number+0x69a>
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
a0005012:	fff74993          	not	s3,a4
a0005016:	41f9d993          	srai	s3,s3,0x1f
a000501a:	013779b3          	and	s3,a4,s3
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
a000501e:	40096913          	ori	s2,s2,1024
    exp10 = 0; // ... and no need to set a normalization factor or check the powers table
a0005022:	4a01                	li	s4,0
  normalization.multiply = (exp10 < 0 && abs_exp10_covered_by_powers_table);
a0005024:	4785                	li	a5,1
a0005026:	b225                	j	a000494e <print_exponential_number+0x5a>
      result.raw_factor = extra_multiplicative_factor / sf.raw_factor;
a0005028:	5ec2                	lw	t4,48(sp)
a000502a:	5e62                	lw	t3,56(sp)
a000502c:	8556                	mv	a0,s5
a000502e:	8676                	mv	a2,t4
a0005030:	86f2                	mv	a3,t3
a0005032:	85a2                	mv	a1,s0
a0005034:	c0c2                	sw	a6,64(sp)
a0005036:	c2c6                	sw	a7,68(sp)
a0005038:	d01a                	sw	t1,32(sp)
a000503a:	d21e                	sw	t2,36(sp)
a000503c:	a76fd0ef          	jal	ra,a00022b2 <__divdf3>
a0005040:	5302                	lw	t1,32(sp)
a0005042:	5392                	lw	t2,36(sp)
a0005044:	4806                	lw	a6,64(sp)
a0005046:	4896                	lw	a7,68(sp)
a0005048:	bd2d                	j	a0004e82 <print_exponential_number+0x58e>
  bool should_skip_normalization = (fall_back_to_decimal_only_mode || exp10 == 0);
a000504a:	020a0a63          	beqz	s4,a000507e <print_exponential_number+0x78a>
a000504e:	a00087b7          	lui	a5,0xa0008
a0005052:	d43e                	sw	a5,40(sp)
a0005054:	b121                	j	a0004c5c <print_exponential_number+0x368>
    components.fractional = 0;
a0005056:	4e01                	li	t3,0
a0005058:	4e81                	li	t4,0
  if (fall_back_to_decimal_only_mode) {
a000505a:	bb09                	j	a0004d6c <print_exponential_number+0x478>
    fall_back_to_decimal_only_mode = (exp10 >= -4 && exp10 < required_significant_digits);
a000505c:	4685                	li	a3,1
a000505e:	4339968b          	mvnez	a3,s3,s3
a0005062:	f4da5de3          	bge	s4,a3,a0004fbc <print_exponential_number+0x6c8>
        (int) precision - 1 - exp10 :
a0005066:	414709b3          	sub	s3,a4,s4
    precision = (precision_ > 0 ? (unsigned) precision_ : 0U);
a000506a:	fff9c793          	not	a5,s3
a000506e:	87fd                	srai	a5,a5,0x1f
a0005070:	00f9f9b3          	and	s3,s3,a5
    flags |= FLAGS_PRECISION;   // make sure print_broken_up_decimal respects our choice above
a0005074:	40096913          	ori	s2,s2,1024
  normalization.multiply = (exp10 < 0 && abs_exp10_covered_by_powers_table);
a0005078:	4785                	li	a5,1
a000507a:	8d5ff06f          	j	a000494e <print_exponential_number+0x5a>
a000507e:	4781                	li	a5,0
a0005080:	8cfff06f          	j	a000494e <print_exponential_number+0x5a>

a0005084 <print_floating_point>:
#endif  // CONFIG_LIBC_FLOAT_EX


static size_t print_floating_point(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int precision, unsigned int width, unsigned int flags, bool prefer_exponential)
{
a0005084:	7175                	addi	sp,sp,-144
a0005086:	dad6                	sw	s5,116(sp)
a0005088:	d8da                	sw	s6,112(sp)
a000508a:	d6de                	sw	s7,108(sp)
a000508c:	d4e2                	sw	s8,104(sp)
a000508e:	8aaa                	mv	s5,a0
a0005090:	8b2e                	mv	s6,a1
a0005092:	8bb2                	mv	s7,a2
a0005094:	8c36                	mv	s8,a3
  char buf[PRINTF_FTOA_BUFFER_SIZE];
  size_t len  = 0U;

  // test for special values
  if (value != value)
a0005096:	853a                	mv	a0,a4
a0005098:	85be                	mv	a1,a5
a000509a:	863a                	mv	a2,a4
a000509c:	86be                	mv	a3,a5
{
a000509e:	c326                	sw	s1,132(sp)
a00050a0:	c14a                	sw	s2,128(sp)
a00050a2:	dece                	sw	s3,124(sp)
a00050a4:	dcd2                	sw	s4,120(sp)
a00050a6:	d2e6                	sw	s9,100(sp)
a00050a8:	d0ea                	sw	s10,96(sp)
a00050aa:	c706                	sw	ra,140(sp)
a00050ac:	c522                	sw	s0,136(sp)
a00050ae:	893a                	mv	s2,a4
a00050b0:	89be                	mv	s3,a5
a00050b2:	84c2                	mv	s1,a6
a00050b4:	8cc6                	mv	s9,a7
  if (value != value)
a00050b6:	889fd0ef          	jal	ra,a000293e <__eqdf2>
{
a00050ba:	4a4a                	lw	s4,144(sp)
a00050bc:	09414d03          	lbu	s10,148(sp)
  if (value != value)
a00050c0:	e561                	bnez	a0,a0005188 <print_floating_point+0x104>
    return out_rev_(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
a00050c2:	a00087b7          	lui	a5,0xa0008
a00050c6:	6907a603          	lw	a2,1680(a5) # a0008690 <__psram_limit+0xf7c08690>
a00050ca:	6947a683          	lw	a3,1684(a5)
a00050ce:	854a                	mv	a0,s2
a00050d0:	85ce                	mv	a1,s3
a00050d2:	9c7fd0ef          	jal	ra,a0002a98 <__ledf2>
a00050d6:	14054163          	bltz	a0,a0005218 <print_floating_point+0x194>
    return out_rev_(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
a00050da:	a00087b7          	lui	a5,0xa0008
a00050de:	6987a603          	lw	a2,1688(a5) # a0008698 <__psram_limit+0xf7c08698>
a00050e2:	69c7a683          	lw	a3,1692(a5)
a00050e6:	854a                	mv	a0,s2
a00050e8:	85ce                	mv	a1,s3
a00050ea:	8f9fd0ef          	jal	ra,a00029e2 <__gedf2>
a00050ee:	08a04263          	bgtz	a0,a0005172 <print_floating_point+0xee>
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);

  if (!prefer_exponential && ((value > PRINTF_FLOAT_NOTATION_THRESHOLD) || (value < -PRINTF_FLOAT_NOTATION_THRESHOLD))) {
a00050f2:	020d1a63          	bnez	s10,a0005126 <print_floating_point+0xa2>
a00050f6:	a00087b7          	lui	a5,0xa0008
a00050fa:	6a07a603          	lw	a2,1696(a5) # a00086a0 <__psram_limit+0xf7c086a0>
a00050fe:	6a47a683          	lw	a3,1700(a5)
a0005102:	854a                	mv	a0,s2
a0005104:	85ce                	mv	a1,s3
a0005106:	8ddfd0ef          	jal	ra,a00029e2 <__gedf2>
a000510a:	10a04563          	bgtz	a0,a0005214 <print_floating_point+0x190>
a000510e:	a00087b7          	lui	a5,0xa0008
a0005112:	6a87a603          	lw	a2,1704(a5) # a00086a8 <__psram_limit+0xf7c086a8>
a0005116:	6ac7a683          	lw	a3,1708(a5)
a000511a:	854a                	mv	a0,s2
a000511c:	85ce                	mv	a1,s3
a000511e:	97bfd0ef          	jal	ra,a0002a98 <__ledf2>
a0005122:	0e054963          	bltz	a0,a0005214 <print_floating_point+0x190>
#endif
  }

  // set default precision, if not set explicitly
  if (!(flags & FLAGS_PRECISION)) {
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
a0005126:	4719                	li	a4,6
  if (!(flags & FLAGS_PRECISION)) {
a0005128:	400a7793          	andi	a5,s4,1024
    precision = PRINTF_DEFAULT_FLOAT_PRECISION;
a000512c:	40f7148b          	mveqz	s1,a4,a5
a0005130:	4401                	li	s0,0
  }

  // limit precision so that our integer holding the fractional part does not overflow
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
a0005132:	4745                	li	a4,17
    buf[len++] = '0'; // This respects the precision in terms of result length only
a0005134:	03000613          	li	a2,48
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
a0005138:	02000693          	li	a3,32
a000513c:	00977a63          	bgeu	a4,s1,a0005150 <print_floating_point+0xcc>
    buf[len++] = '0'; // This respects the precision in terms of result length only
a0005140:	0405                	addi	s0,s0,1
a0005142:	009c                	addi	a5,sp,64
a0005144:	97a2                	add	a5,a5,s0
a0005146:	fec78fa3          	sb	a2,-1(a5)
    precision--;
a000514a:	14fd                	addi	s1,s1,-1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (precision > PRINTF_MAX_SUPPORTED_PRECISION)) {
a000514c:	fed418e3          	bne	s0,a3,a000513c <print_floating_point+0xb8>
  }

  return
#if CONFIG_LIBC_FLOAT_EX
    prefer_exponential ?
      print_exponential_number(out, buffer, idx, maxlen, value, precision, width, flags, buf, len) :
a0005150:	060d0663          	beqz	s10,a00051bc <print_floating_point+0x138>
a0005154:	c422                	sw	s0,8(sp)
a0005156:	009c                	addi	a5,sp,64
a0005158:	c23e                	sw	a5,4(sp)
a000515a:	c052                	sw	s4,0(sp)
a000515c:	88e6                	mv	a7,s9
a000515e:	8826                	mv	a6,s1
a0005160:	874a                	mv	a4,s2
a0005162:	87ce                	mv	a5,s3
a0005164:	86e2                	mv	a3,s8
a0005166:	865e                	mv	a2,s7
a0005168:	85da                	mv	a1,s6
a000516a:	8556                	mv	a0,s5
a000516c:	f88ff0ef          	jal	ra,a00048f4 <print_exponential_number>
a0005170:	a8b5                	j	a00051ec <print_floating_point+0x168>
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
a0005172:	004a7793          	andi	a5,s4,4
a0005176:	ebc9                	bnez	a5,a0005208 <print_floating_point+0x184>
a0005178:	a0008737          	lui	a4,0xa0008
a000517c:	5fc70713          	addi	a4,a4,1532 # a00085fc <__psram_limit+0xf7c085fc>
a0005180:	478d                	li	a5,3
a0005182:	88d2                	mv	a7,s4
a0005184:	8866                	mv	a6,s9
a0005186:	a801                	j	a0005196 <print_floating_point+0x112>
    return out_rev_(out, buffer, idx, maxlen, "nan", 3, width, flags);
a0005188:	a0008737          	lui	a4,0xa0008
a000518c:	88d2                	mv	a7,s4
a000518e:	8866                	mv	a6,s9
a0005190:	478d                	li	a5,3
a0005192:	60870713          	addi	a4,a4,1544 # a0008608 <__psram_limit+0xf7c08608>
#endif
      print_decimal_number(out, buffer, idx, maxlen, value, precision, width, flags, buf, len);
}
a0005196:	442a                	lw	s0,136(sp)
a0005198:	40ba                	lw	ra,140(sp)
a000519a:	449a                	lw	s1,132(sp)
a000519c:	490a                	lw	s2,128(sp)
a000519e:	59f6                	lw	s3,124(sp)
a00051a0:	5a66                	lw	s4,120(sp)
a00051a2:	5c96                	lw	s9,100(sp)
a00051a4:	5d06                	lw	s10,96(sp)
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
a00051a6:	86e2                	mv	a3,s8
a00051a8:	865e                	mv	a2,s7
}
a00051aa:	5c26                	lw	s8,104(sp)
a00051ac:	5bb6                	lw	s7,108(sp)
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
a00051ae:	85da                	mv	a1,s6
a00051b0:	8556                	mv	a0,s5
}
a00051b2:	5b46                	lw	s6,112(sp)
a00051b4:	5ad6                	lw	s5,116(sp)
a00051b6:	6149                	addi	sp,sp,144
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
a00051b8:	fe9fe06f          	j	a00041a0 <out_rev_>
  struct double_components value_ = get_components(number, precision);
a00051bc:	85ca                	mv	a1,s2
a00051be:	864e                	mv	a2,s3
a00051c0:	86a6                	mv	a3,s1
a00051c2:	1028                	addi	a0,sp,40
a00051c4:	b5aff0ef          	jal	ra,a000451e <get_components>
  return print_broken_up_decimal(value_, out, buffer, idx, maxlen, precision, width, flags, buf, len);
a00051c8:	03814703          	lbu	a4,56(sp)
a00051cc:	5642                	lw	a2,48(sp)
a00051ce:	56d2                	lw	a3,52(sp)
a00051d0:	5522                	lw	a0,40(sp)
a00051d2:	55b2                	lw	a1,44(sp)
a00051d4:	009c                	addi	a5,sp,64
a00051d6:	c83e                	sw	a5,16(sp)
a00051d8:	ca22                	sw	s0,20(sp)
a00051da:	c652                	sw	s4,12(sp)
a00051dc:	c466                	sw	s9,8(sp)
a00051de:	c226                	sw	s1,4(sp)
a00051e0:	c062                	sw	s8,0(sp)
a00051e2:	88de                	mv	a7,s7
a00051e4:	885a                	mv	a6,s6
a00051e6:	87d6                	mv	a5,s5
a00051e8:	cc0ff0ef          	jal	ra,a00046a8 <print_broken_up_decimal.isra.0>
}
a00051ec:	40ba                	lw	ra,140(sp)
a00051ee:	442a                	lw	s0,136(sp)
a00051f0:	449a                	lw	s1,132(sp)
a00051f2:	490a                	lw	s2,128(sp)
a00051f4:	59f6                	lw	s3,124(sp)
a00051f6:	5a66                	lw	s4,120(sp)
a00051f8:	5ad6                	lw	s5,116(sp)
a00051fa:	5b46                	lw	s6,112(sp)
a00051fc:	5bb6                	lw	s7,108(sp)
a00051fe:	5c26                	lw	s8,104(sp)
a0005200:	5c96                	lw	s9,100(sp)
a0005202:	5d06                	lw	s10,96(sp)
a0005204:	6149                	addi	sp,sp,144
a0005206:	8082                	ret
    return out_rev_(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
a0005208:	a0008737          	lui	a4,0xa0008
a000520c:	60070713          	addi	a4,a4,1536 # a0008600 <__psram_limit+0xf7c08600>
a0005210:	4791                	li	a5,4
a0005212:	bf85                	j	a0005182 <print_floating_point+0xfe>
    return print_exponential_number(out, buffer, idx, maxlen, value, precision, width, flags, buf, len);
a0005214:	c402                	sw	zero,8(sp)
a0005216:	b781                	j	a0005156 <print_floating_point+0xd2>
    return out_rev_(out, buffer, idx, maxlen, "fni-", 4, width, flags);
a0005218:	a0008737          	lui	a4,0xa0008
a000521c:	88d2                	mv	a7,s4
a000521e:	8866                	mv	a6,s9
a0005220:	4791                	li	a5,4
a0005222:	60c70713          	addi	a4,a4,1548 # a000860c <__psram_limit+0xf7c0860c>
a0005226:	bf85                	j	a0005196 <print_floating_point+0x112>
a0005228:	0000                	unimp
	...

a000522c <__vsnprintf>:

#endif  // (CONFIG_LIBC_FLOAT || CONFIG_LIBC_FLOAT_EX)

// internal vsnprintf
static int __vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
a000522c:	7135                	addi	sp,sp,-160
a000522e:	c356                	sw	s5,132(sp)
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if ((!buffer) && (out != out_console)) {
a0005230:	a0004ab7          	lui	s5,0xa0004
{
a0005234:	c74e                	sw	s3,140(sp)
a0005236:	89ba                	mv	s3,a4
  if ((!buffer) && (out != out_console)) {
a0005238:	69aa8713          	addi	a4,s5,1690 # a000469a <__psram_limit+0xf7c0469a>
{
a000523c:	cd22                	sw	s0,152(sp)
a000523e:	cb26                	sw	s1,148(sp)
a0005240:	c94a                	sw	s2,144(sp)
a0005242:	c15a                	sw	s6,128(sp)
a0005244:	cf06                	sw	ra,156(sp)
a0005246:	c552                	sw	s4,136(sp)
a0005248:	dede                	sw	s7,124(sp)
a000524a:	dce2                	sw	s8,120(sp)
a000524c:	dae6                	sw	s9,116(sp)
a000524e:	d8ea                	sw	s10,112(sp)
a0005250:	d6ee                	sw	s11,108(sp)
  if ((!buffer) && (out != out_console)) {
a0005252:	cc3a                	sw	a4,24(sp)
    // use null output function
    out = out_discard;
  }

  while (*format)
a0005254:	0006c783          	lbu	a5,0(a3)
{
a0005258:	8b36                	mv	s6,a3
a000525a:	892e                	mv	s2,a1
a000525c:	842a                	mv	s0,a0
a000525e:	84b2                	mv	s1,a2
  if ((!buffer) && (out != out_console)) {
a0005260:	3c058b63          	beqz	a1,a0005636 <__vsnprintf+0x40a>
  while (*format)
a0005264:	5c078563          	beqz	a5,a000582e <__vsnprintf+0x602>
a0005268:	6741                	lui	a4,0x10
a000526a:	177d                	addi	a4,a4,-1
a000526c:	a0008cb7          	lui	s9,0xa0008
a0005270:	d03a                	sw	a4,32(sp)
a0005272:	6a25                	lui	s4,0x9
a0005274:	61bc8713          	addi	a4,s9,1563 # a000861b <__psram_limit+0xf7c0861b>
    out = out_discard;
a0005278:	4b81                	li	s7,0
a000527a:	041a0a13          	addi	s4,s4,65 # 9041 <nocache_min_size+0x4041>
a000527e:	ce3a                	sw	a4,28(sp)
a0005280:	a819                	j	a0005296 <__vsnprintf+0x6a>
  {
    // format specifier?  %[flags][width][.precision][length]
    if (*format != '%') {
      // no
      out(*format, buffer, idx++, maxlen);
a0005282:	865e                	mv	a2,s7
a0005284:	86a6                	mv	a3,s1
a0005286:	85ca                	mv	a1,s2
a0005288:	853e                	mv	a0,a5
a000528a:	0b85                	addi	s7,s7,1
a000528c:	9402                	jalr	s0
  while (*format)
a000528e:	000b4783          	lbu	a5,0(s6)
a0005292:	10078763          	beqz	a5,a00053a0 <__vsnprintf+0x174>
    if (*format != '%') {
a0005296:	02500713          	li	a4,37
      format++;
a000529a:	0b05                	addi	s6,s6,1
    if (*format != '%') {
a000529c:	fee793e3          	bne	a5,a4,a0005282 <__vsnprintf+0x56>
    }

    // evaluate flags
    flags = 0U;
    do {
      switch (*format) {
a00052a0:	875a                	mv	a4,s6
a00052a2:	9817450b          	lbuia	a0,(a4),1,0
a00052a6:	02b00793          	li	a5,43
    flags = 0U;
a00052aa:	4d81                	li	s11,0
      switch (*format) {
a00052ac:	02d00893          	li	a7,45
a00052b0:	03000813          	li	a6,48
a00052b4:	02000593          	li	a1,32
a00052b8:	02300613          	li	a2,35
        width = (unsigned int)-w;
      }
      else {
        width = (unsigned int)w;
      }
      format++;
a00052bc:	86ba                	mv	a3,a4
      switch (*format) {
a00052be:	02f50263          	beq	a0,a5,a00052e2 <__vsnprintf+0xb6>
a00052c2:	0001                	nop
a00052c4:	02a7e363          	bltu	a5,a0,a00052ea <__vsnprintf+0xbe>
a00052c8:	02b50963          	beq	a0,a1,a00052fa <__vsnprintf+0xce>
a00052cc:	02c51f63          	bne	a0,a2,a000530a <__vsnprintf+0xde>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
a00052d0:	010ded93          	ori	s11,s11,16
      format++;
a00052d4:	8b36                	mv	s6,a3
      switch (*format) {
a00052d6:	875a                	mv	a4,s6
a00052d8:	9817450b          	lbuia	a0,(a4),1,0
      format++;
a00052dc:	86ba                	mv	a3,a4
      switch (*format) {
a00052de:	fef513e3          	bne	a0,a5,a00052c4 <__vsnprintf+0x98>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
a00052e2:	004ded93          	ori	s11,s11,4
      format++;
a00052e6:	8b36                	mv	s6,a3
a00052e8:	b7fd                	j	a00052d6 <__vsnprintf+0xaa>
      switch (*format) {
a00052ea:	01150c63          	beq	a0,a7,a0005302 <__vsnprintf+0xd6>
a00052ee:	6b051f63          	bne	a0,a6,a00059ac <__vsnprintf+0x780>
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
a00052f2:	001ded93          	ori	s11,s11,1
      format++;
a00052f6:	8b36                	mv	s6,a3
a00052f8:	bff9                	j	a00052d6 <__vsnprintf+0xaa>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
a00052fa:	008ded93          	ori	s11,s11,8
      format++;
a00052fe:	8b36                	mv	s6,a3
a0005300:	bfd9                	j	a00052d6 <__vsnprintf+0xaa>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
a0005302:	002ded93          	ori	s11,s11,2
      format++;
a0005306:	8b36                	mv	s6,a3
a0005308:	b7f9                	j	a00052d6 <__vsnprintf+0xaa>
    else if (*format == '*') {
a000530a:	02a00793          	li	a5,42
    width = 0U;
a000530e:	4a81                	li	s5,0
    else if (*format == '*') {
a0005310:	0cf50763          	beq	a0,a5,a00053de <__vsnprintf+0x1b2>
    }

    // evaluate precision field
    precision = 0U;
a0005314:	4c81                	li	s9,0
        format++;
      }
    }
#if PRINTF_SUPPORT_LENGTH_FILED
    // evaluate length field
    switch (*format) {
a0005316:	06c00693          	li	a3,108
a000531a:	10d50563          	beq	a0,a3,a0005424 <__vsnprintf+0x1f8>
a000531e:	10a6ed63          	bltu	a3,a0,a0005438 <__vsnprintf+0x20c>
a0005322:	06800693          	li	a3,104
a0005326:	2ed50f63          	beq	a0,a3,a0005624 <__vsnprintf+0x3f8>
a000532a:	06a00693          	li	a3,106
a000532e:	66d51963          	bne	a0,a3,a00059a0 <__vsnprintf+0x774>
      default:
        break;
    }
#endif
    // evaluate specifier
    switch (*format) {
a0005332:	001b4503          	lbu	a0,1(s6)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
a0005336:	200ded93          	ori	s11,s11,512
          else {
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, base, precision, width, flags);
          }
        }
        format++;
a000533a:	00170b13          	addi	s6,a4,1 # 10001 <nocache_min_size+0xb001>
    switch (*format) {
a000533e:	06500713          	li	a4,101
a0005342:	24e50d63          	beq	a0,a4,a000559c <__vsnprintf+0x370>
a0005346:	18a76963          	bltu	a4,a0,a00054d8 <__vsnprintf+0x2ac>
a000534a:	04600713          	li	a4,70
a000534e:	48e50a63          	beq	a0,a4,a00057e2 <__vsnprintf+0x5b6>
a0005352:	16a77763          	bgeu	a4,a0,a00054c0 <__vsnprintf+0x294>
a0005356:	06300713          	li	a4,99
a000535a:	0ee51e63          	bne	a0,a4,a0005456 <__vsnprintf+0x22a>
      out(*format, buffer, idx++, maxlen);
a000535e:	001b8c93          	addi	s9,s7,1

#if PRINTF_SUPPORT_CHAR
      case 'c' : {
        unsigned int l = 1U;
        // pre padding
        if (!(flags & FLAGS_LEFT)) {
a0005362:	002dfe93          	andi	t4,s11,2
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
a0005366:	00498d13          	addi	s10,s3,4
      out(*format, buffer, idx++, maxlen);
a000536a:	8c66                	mv	s8,s9
        if (!(flags & FLAGS_LEFT)) {
a000536c:	420e8a63          	beqz	t4,a00057a0 <__vsnprintf+0x574>
          while (l++ < width) {
            out(' ', buffer, idx++, maxlen);
          }
        }
        // char output
        out((char)va_arg(va, int), buffer, idx++, maxlen);
a0005370:	0009c503          	lbu	a0,0(s3)
a0005374:	865e                	mv	a2,s7
a0005376:	86a6                	mv	a3,s1
a0005378:	85ca                	mv	a1,s2
a000537a:	9402                	jalr	s0
        // post padding
        if (flags & FLAGS_LEFT) {
          while (l++ < width) {
a000537c:	4685                	li	a3,1
a000537e:	9bd6                	add	s7,s7,s5
a0005380:	6156f163          	bgeu	a3,s5,a0005982 <__vsnprintf+0x756>
            out(' ', buffer, idx++, maxlen);
a0005384:	8662                	mv	a2,s8
a0005386:	86a6                	mv	a3,s1
a0005388:	0c05                	addi	s8,s8,1
a000538a:	85ca                	mv	a1,s2
a000538c:	02000513          	li	a0,32
a0005390:	9402                	jalr	s0
          while (l++ < width) {
a0005392:	ff7c19e3          	bne	s8,s7,a0005384 <__vsnprintf+0x158>
          }
        }
        format++;
        break;
a0005396:	89ea                	mv	s3,s10
  while (*format)
a0005398:	000b4783          	lbu	a5,0(s6)
a000539c:	ee079de3          	bnez	a5,a0005296 <__vsnprintf+0x6a>
    // console does not need to output NULL
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
  }

  // return written chars without terminating \0
  return (int)idx;
a00053a0:	89de                	mv	s3,s7
  if(out != out_console){
a00053a2:	47e2                	lw	a5,24(sp)
a00053a4:	00f40d63          	beq	s0,a5,a00053be <__vsnprintf+0x192>
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
a00053a8:	009bb633          	sltu	a2,s7,s1
a00053ac:	fff48793          	addi	a5,s1,-1
a00053b0:	40c79b8b          	mveqz	s7,a5,a2
a00053b4:	86a6                	mv	a3,s1
a00053b6:	865e                	mv	a2,s7
a00053b8:	85ca                	mv	a1,s2
a00053ba:	4501                	li	a0,0
a00053bc:	9402                	jalr	s0
}
a00053be:	40fa                	lw	ra,156(sp)
a00053c0:	446a                	lw	s0,152(sp)
a00053c2:	44da                	lw	s1,148(sp)
a00053c4:	494a                	lw	s2,144(sp)
a00053c6:	4a2a                	lw	s4,136(sp)
a00053c8:	4a9a                	lw	s5,132(sp)
a00053ca:	4b0a                	lw	s6,128(sp)
a00053cc:	5bf6                	lw	s7,124(sp)
a00053ce:	5c66                	lw	s8,120(sp)
a00053d0:	5cd6                	lw	s9,116(sp)
a00053d2:	5d46                	lw	s10,112(sp)
a00053d4:	5db6                	lw	s11,108(sp)
a00053d6:	854e                	mv	a0,s3
a00053d8:	49ba                	lw	s3,140(sp)
a00053da:	610d                	addi	sp,sp,160
a00053dc:	8082                	ret
      const int w = va_arg(va, int);
a00053de:	5849ca8b          	lwia	s5,(s3),4,0
      if (w < 0) {
a00053e2:	220acc63          	bltz	s5,a000561a <__vsnprintf+0x3ee>
    if (*format == '.') {
a00053e6:	001b4503          	lbu	a0,1(s6)
      format++;
a00053ea:	002b0713          	addi	a4,s6,2
      format++;
a00053ee:	8b36                	mv	s6,a3
    if (*format == '.') {
a00053f0:	02e00693          	li	a3,46
a00053f4:	f2d510e3          	bne	a0,a3,a0005314 <__vsnprintf+0xe8>
      if (is_digit_(*format)) {
a00053f8:	001b4503          	lbu	a0,1(s6)
a00053fc:	4625                	li	a2,9
      flags |= FLAGS_PRECISION;
a00053fe:	400ded93          	ori	s11,s11,1024
  return (ch >= '0') && (ch <= '9');
a0005402:	fd050693          	addi	a3,a0,-48
      if (is_digit_(*format)) {
a0005406:	0ff6f693          	andi	a3,a3,255
a000540a:	2ed67963          	bgeu	a2,a3,a00056fc <__vsnprintf+0x4d0>
      else if (*format == '*') {
a000540e:	02a00693          	li	a3,42
a0005412:	30d50a63          	beq	a0,a3,a0005726 <__vsnprintf+0x4fa>
    switch (*format) {
a0005416:	06c00693          	li	a3,108
        format++;
a000541a:	8b3a                	mv	s6,a4
    precision = 0U;
a000541c:	4c81                	li	s9,0
        format++;
a000541e:	0705                	addi	a4,a4,1
    switch (*format) {
a0005420:	eed51fe3          	bne	a0,a3,a000531e <__vsnprintf+0xf2>
        if (*format == 'l') {
a0005424:	001b4503          	lbu	a0,1(s6)
a0005428:	02d51263          	bne	a0,a3,a000544c <__vsnprintf+0x220>
    switch (*format) {
a000542c:	002b4503          	lbu	a0,2(s6)
          flags |= FLAGS_LONG_LONG;
a0005430:	300ded93          	ori	s11,s11,768
        format++;
a0005434:	0b0d                	addi	s6,s6,3
a0005436:	b721                	j	a000533e <__vsnprintf+0x112>
    switch (*format) {
a0005438:	07400693          	li	a3,116
a000543c:	00d50663          	beq	a0,a3,a0005448 <__vsnprintf+0x21c>
a0005440:	07a00693          	li	a3,122
a0005444:	54d51663          	bne	a0,a3,a0005990 <__vsnprintf+0x764>
    switch (*format) {
a0005448:	001b4503          	lbu	a0,1(s6)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
a000544c:	100ded93          	ori	s11,s11,256
        format++;
a0005450:	00170b13          	addi	s6,a4,1
        break;
a0005454:	b5ed                	j	a000533e <__vsnprintf+0x112>
    switch (*format) {
a0005456:	06400713          	li	a4,100
a000545a:	0ae51e63          	bne	a0,a4,a0005516 <__vsnprintf+0x2ea>
        else if (*format == 'o') {
a000545e:	06f00713          	li	a4,111
a0005462:	42e50e63          	beq	a0,a4,a000589e <__vsnprintf+0x672>
        if ((*format != 'i') && (*format != 'd')) {
a0005466:	06900693          	li	a3,105
          flags &= ~FLAGS_HASH;   // no hash for dec format
a000546a:	fefdf593          	andi	a1,s11,-17
        if (flags & FLAGS_PRECISION) {
a000546e:	400df713          	andi	a4,s11,1024
        if ((*format != 'i') && (*format != 'd')) {
a0005472:	52d51563          	bne	a0,a3,a000599c <__vsnprintf+0x770>
        if (flags & FLAGS_PRECISION) {
a0005476:	42071263          	bnez	a4,a000589a <__vsnprintf+0x66e>
          if (flags & FLAGS_LONG_LONG) {
a000547a:	200dfe93          	andi	t4,s11,512
          base = BASE_DECIMAL;
a000547e:	48a9                	li	a7,10
          if (flags & FLAGS_LONG_LONG) {
a0005480:	3e0e9163          	bnez	t4,a0005862 <__vsnprintf+0x636>
          else if (flags & FLAGS_LONG) {
a0005484:	1005f713          	andi	a4,a1,256
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
a0005488:	00498c13          	addi	s8,s3,4
          else if (flags & FLAGS_LONG) {
a000548c:	3a070463          	beqz	a4,a0005834 <__vsnprintf+0x608>
            const long value = va_arg(va, long);
a0005490:	0009a803          	lw	a6,0(s3)
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
a0005494:	45005163          	blez	a6,a00058d6 <__vsnprintf+0x6aa>
a0005498:	41f85793          	srai	a5,a6,0x1f
a000549c:	c0c2                	sw	a6,64(sp)
a000549e:	c2be                	sw	a5,68(sp)
a00054a0:	4706                	lw	a4,64(sp)
a00054a2:	4796                	lw	a5,68(sp)
a00054a4:	c42e                	sw	a1,8(sp)
a00054a6:	c256                	sw	s5,4(sp)
a00054a8:	c066                	sw	s9,0(sp)
a00054aa:	01f85813          	srli	a6,a6,0x1f
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, base, precision, width, flags);
a00054ae:	865e                	mv	a2,s7
a00054b0:	86a6                	mv	a3,s1
a00054b2:	85ca                	mv	a1,s2
a00054b4:	8522                	mv	a0,s0
a00054b6:	d9bfe0ef          	jal	ra,a0004250 <print_integer>
a00054ba:	8baa                	mv	s7,a0
a00054bc:	89e2                	mv	s3,s8
        break;
a00054be:	bbc1                	j	a000528e <__vsnprintf+0x62>
    switch (*format) {
a00054c0:	02500713          	li	a4,37
a00054c4:	10e51263          	bne	a0,a4,a00055c8 <__vsnprintf+0x39c>
        out('%', buffer, idx++, maxlen);
a00054c8:	865e                	mv	a2,s7
a00054ca:	86a6                	mv	a3,s1
a00054cc:	85ca                	mv	a1,s2
a00054ce:	02500513          	li	a0,37
a00054d2:	0b85                	addi	s7,s7,1
a00054d4:	9402                	jalr	s0
        break;
a00054d6:	bb65                	j	a000528e <__vsnprintf+0x62>
    switch (*format) {
a00054d8:	07800713          	li	a4,120
a00054dc:	02a76763          	bltu	a4,a0,a000550a <__vsnprintf+0x2de>
a00054e0:	06800713          	li	a4,104
a00054e4:	0ea77963          	bgeu	a4,a0,a00055d6 <__vsnprintf+0x3aa>
a00054e8:	f9750693          	addi	a3,a0,-105
a00054ec:	4705                	li	a4,1
a00054ee:	00d716b3          	sll	a3,a4,a3
a00054f2:	0146fc33          	and	s8,a3,s4
a00054f6:	2e0c1963          	bnez	s8,a00057e8 <__vsnprintf+0x5bc>
a00054fa:	4006f613          	andi	a2,a3,1024
a00054fe:	16061e63          	bnez	a2,a000567a <__vsnprintf+0x44e>
a0005502:	0806f693          	andi	a3,a3,128
a0005506:	14069363          	bnez	a3,a000564c <__vsnprintf+0x420>
        out(*format, buffer, idx++, maxlen);
a000550a:	865e                	mv	a2,s7
a000550c:	86a6                	mv	a3,s1
a000550e:	85ca                	mv	a1,s2
a0005510:	0b85                	addi	s7,s7,1
a0005512:	9402                	jalr	s0
        break;
a0005514:	bbad                	j	a000528e <__vsnprintf+0x62>
    switch (*format) {
a0005516:	05800713          	li	a4,88
a000551a:	2ee50263          	beq	a0,a4,a00057fe <__vsnprintf+0x5d2>
a000551e:	06200713          	li	a4,98
          base =  BASE_BINARY;
a0005522:	4889                	li	a7,2
    switch (*format) {
a0005524:	06e51163          	bne	a0,a4,a0005586 <__vsnprintf+0x35a>
a0005528:	85ee                	mv	a1,s11
        if ((*format != 'i') && (*format != 'd')) {
a000552a:	06400693          	li	a3,100
        if (flags & FLAGS_PRECISION) {
a000552e:	4005f713          	andi	a4,a1,1024
        if ((*format != 'i') && (*format != 'd')) {
a0005532:	46d51963          	bne	a0,a3,a00059a4 <__vsnprintf+0x778>
          if (flags & FLAGS_LONG_LONG) {
a0005536:	2005fe93          	andi	t4,a1,512
        if (flags & FLAGS_PRECISION) {
a000553a:	d339                	beqz	a4,a0005480 <__vsnprintf+0x254>
          flags &= ~FLAGS_ZEROPAD;
a000553c:	99f9                	andi	a1,a1,-2
        if ((*format == 'i') || (*format == 'd')) {
a000553e:	06900713          	li	a4,105
          if (flags & FLAGS_LONG_LONG) {
a0005542:	2005fe93          	andi	t4,a1,512
        if ((*format == 'i') || (*format == 'd')) {
a0005546:	f2e50de3          	beq	a0,a4,a0005480 <__vsnprintf+0x254>
a000554a:	06400713          	li	a4,100
a000554e:	f2e509e3          	beq	a0,a4,a0005480 <__vsnprintf+0x254>
          if (flags & FLAGS_LONG_LONG) {
a0005552:	3e0e9163          	bnez	t4,a0005934 <__vsnprintf+0x708>
          else if (flags & FLAGS_LONG) {
a0005556:	1005f713          	andi	a4,a1,256
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long), false, base, precision, width, flags);
a000555a:	00498c13          	addi	s8,s3,4
          else if (flags & FLAGS_LONG) {
a000555e:	3c071863          	bnez	a4,a000592e <__vsnprintf+0x702>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
a0005562:	0405f713          	andi	a4,a1,64
a0005566:	36071263          	bnez	a4,a00058ca <__vsnprintf+0x69e>
a000556a:	0805f713          	andi	a4,a1,128
a000556e:	3c070063          	beqz	a4,a000592e <__vsnprintf+0x702>
a0005572:	0009a703          	lw	a4,0(s3)
a0005576:	5782                	lw	a5,32(sp)
a0005578:	8f7d                	and	a4,a4,a5
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, base, precision, width, flags);
a000557a:	c42e                	sw	a1,8(sp)
a000557c:	c256                	sw	s5,4(sp)
a000557e:	c066                	sw	s9,0(sp)
a0005580:	4801                	li	a6,0
a0005582:	4781                	li	a5,0
a0005584:	b72d                	j	a00054ae <__vsnprintf+0x282>
    switch (*format) {
a0005586:	04700713          	li	a4,71
a000558a:	f8e510e3          	bne	a0,a4,a000550a <__vsnprintf+0x2de>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
a000558e:	6705                	lui	a4,0x1
a0005590:	80070713          	addi	a4,a4,-2048 # 800 <__RFTLV_SIZE_HOLE>
a0005594:	00ededb3          	or	s11,s11,a4
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
a0005598:	020ded93          	ori	s11,s11,32
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
a000559c:	099d                	addi	s3,s3,7
a000559e:	ff89f993          	andi	s3,s3,-8
a00055a2:	0009a603          	lw	a2,0(s3)
a00055a6:	0049a683          	lw	a3,4(s3)
a00055aa:	4705                	li	a4,1
a00055ac:	c23a                	sw	a4,4(sp)
a00055ae:	87b6                	mv	a5,a3
a00055b0:	8732                	mv	a4,a2
a00055b2:	c06e                	sw	s11,0(sp)
a00055b4:	865e                	mv	a2,s7
a00055b6:	88d6                	mv	a7,s5
a00055b8:	8866                	mv	a6,s9
a00055ba:	86a6                	mv	a3,s1
a00055bc:	85ca                	mv	a1,s2
a00055be:	8522                	mv	a0,s0
a00055c0:	34d1                	jal	a0005084 <print_floating_point>
a00055c2:	09a1                	addi	s3,s3,8
a00055c4:	8baa                	mv	s7,a0
        break;
a00055c6:	b1e1                	j	a000528e <__vsnprintf+0x62>
    switch (*format) {
a00055c8:	04500713          	li	a4,69
a00055cc:	f2e51fe3          	bne	a0,a4,a000550a <__vsnprintf+0x2de>
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
a00055d0:	020ded93          	ori	s11,s11,32
a00055d4:	b7e1                	j	a000559c <__vsnprintf+0x370>
    switch (*format) {
a00055d6:	06600713          	li	a4,102
a00055da:	02e51663          	bne	a0,a4,a0005606 <__vsnprintf+0x3da>
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
a00055de:	099d                	addi	s3,s3,7
a00055e0:	ff89f993          	andi	s3,s3,-8
a00055e4:	0009a703          	lw	a4,0(s3)
a00055e8:	0049a783          	lw	a5,4(s3)
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
a00055ec:	865e                	mv	a2,s7
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_DECIMAL);
a00055ee:	88d6                	mv	a7,s5
a00055f0:	c202                	sw	zero,4(sp)
a00055f2:	c06e                	sw	s11,0(sp)
a00055f4:	8866                	mv	a6,s9
        idx = print_floating_point(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags, PRINTF_PREFER_EXPONENTIAL);
a00055f6:	86a6                	mv	a3,s1
a00055f8:	85ca                	mv	a1,s2
a00055fa:	8522                	mv	a0,s0
a00055fc:	a89ff0ef          	jal	ra,a0005084 <print_floating_point>
a0005600:	09a1                	addi	s3,s3,8
a0005602:	8baa                	mv	s7,a0
        break;
a0005604:	b169                	j	a000528e <__vsnprintf+0x62>
    switch (*format) {
a0005606:	06700713          	li	a4,103
a000560a:	3ce51e63          	bne	a0,a4,a00059e6 <__vsnprintf+0x7ba>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
a000560e:	6705                	lui	a4,0x1
a0005610:	80070713          	addi	a4,a4,-2048 # 800 <__RFTLV_SIZE_HOLE>
a0005614:	00ededb3          	or	s11,s11,a4
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
a0005618:	b751                	j	a000559c <__vsnprintf+0x370>
        flags |= FLAGS_LEFT;    // reverse padding
a000561a:	002ded93          	ori	s11,s11,2
        width = (unsigned int)-w;
a000561e:	41500ab3          	neg	s5,s5
a0005622:	b3d1                	j	a00053e6 <__vsnprintf+0x1ba>
        if (*format == 'h') {
a0005624:	001b4503          	lbu	a0,1(s6)
a0005628:	1ad50763          	beq	a0,a3,a00057d6 <__vsnprintf+0x5aa>
        flags |= FLAGS_SHORT;
a000562c:	080ded93          	ori	s11,s11,128
        format++;
a0005630:	00170b13          	addi	s6,a4,1
a0005634:	b329                	j	a000533e <__vsnprintf+0x112>
  if ((!buffer) && (out != out_console)) {
a0005636:	1ee50563          	beq	a0,a4,a0005820 <__vsnprintf+0x5f4>
    out = out_discard;
a000563a:	a0004437          	lui	s0,0xa0004
a000563e:	19c40413          	addi	s0,s0,412 # a000419c <__psram_limit+0xf7c0419c>
  while (*format)
a0005642:	c20793e3          	bnez	a5,a0005268 <__vsnprintf+0x3c>
a0005646:	4981                	li	s3,0
a0005648:	4b81                	li	s7,0
a000564a:	bbb9                	j	a00053a8 <__vsnprintf+0x17c>
        uintptr_t value = (uintptr_t)va_arg(va, void*);
a000564c:	5849c70b          	lwia	a4,(s3),4,0
          out_rev_(out, buffer, idx, maxlen, ")lin(", 5, width, flags) :
a0005650:	10070863          	beqz	a4,a0005760 <__vsnprintf+0x534>
        flags |= FLAGS_ZEROPAD | FLAGS_POINTER;
a0005654:	6785                	lui	a5,0x1
a0005656:	0785                	addi	a5,a5,1
a0005658:	00fdeeb3          	or	t4,s11,a5
          print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) value, false, BASE_HEX, precision, width, flags);
a000565c:	47a9                	li	a5,10
a000565e:	c23e                	sw	a5,4(sp)
a0005660:	c476                	sw	t4,8(sp)
a0005662:	c066                	sw	s9,0(sp)
a0005664:	48c1                	li	a7,16
a0005666:	4801                	li	a6,0
a0005668:	4781                	li	a5,0
a000566a:	865e                	mv	a2,s7
a000566c:	86a6                	mv	a3,s1
a000566e:	85ca                	mv	a1,s2
a0005670:	8522                	mv	a0,s0
a0005672:	bdffe0ef          	jal	ra,a0004250 <print_integer>
a0005676:	8baa                	mv	s7,a0
a0005678:	b919                	j	a000528e <__vsnprintf+0x62>
        const char* p = va_arg(va, char*);
a000567a:	87ce                	mv	a5,s3
a000567c:	5847c88b          	lwia	a7,(a5),4,0
a0005680:	d43e                	sw	a5,40(sp)
        if (p == NULL) {
a0005682:	0a088f63          	beqz	a7,a0005740 <__vsnprintf+0x514>
  for (s = str; *s && maxsize--; ++s);
a0005686:	0008c503          	lbu	a0,0(a7)
          unsigned int l = strnlen_s_(p, precision ? precision : (size_t)-1);
a000568a:	180c9663          	bnez	s9,a0005816 <__vsnprintf+0x5ea>
  for (s = str; *s && maxsize--; ++s);
a000568e:	56f9                	li	a3,-2
a0005690:	cd11                	beqz	a0,a00056ac <__vsnprintf+0x480>
a0005692:	00168713          	addi	a4,a3,1
a0005696:	00e88c33          	add	s8,a7,a4
a000569a:	8746                	mv	a4,a7
a000569c:	a019                	j	a00056a2 <__vsnprintf+0x476>
a000569e:	18ec0563          	beq	s8,a4,a0005828 <__vsnprintf+0x5fc>
a00056a2:	8817468b          	lbuib	a3,(a4),1,0
a00056a6:	fee5                	bnez	a3,a000569e <__vsnprintf+0x472>
  return (unsigned int)(s - str);
a00056a8:	41170c33          	sub	s8,a4,a7
            l = (l < precision ? l : precision);
a00056ac:	018cb633          	sltu	a2,s9,s8
a00056b0:	86e6                	mv	a3,s9
          if (!(flags & FLAGS_LEFT)) {
a00056b2:	002df793          	andi	a5,s11,2
          if (flags & FLAGS_PRECISION) {
a00056b6:	400dfd13          	andi	s10,s11,1024
            l = (l < precision ? l : precision);
a00056ba:	40cc168b          	mveqz	a3,s8,a2
          if (!(flags & FLAGS_LEFT)) {
a00056be:	d63e                	sw	a5,44(sp)
            l = (l < precision ? l : precision);
a00056c0:	43a69c0b          	mvnez	s8,a3,s10
          if (!(flags & FLAGS_LEFT)) {
a00056c4:	22078a63          	beqz	a5,a00058f8 <__vsnprintf+0x6cc>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a00056c8:	1c050f63          	beqz	a0,a00058a6 <__vsnprintf+0x67a>
a00056cc:	41788db3          	sub	s11,a7,s7
            out(*(p++), buffer, idx++, maxlen);
a00056d0:	001b8993          	addi	s3,s7,1
a00056d4:	865e                	mv	a2,s7
a00056d6:	86a6                	mv	a3,s1
a00056d8:	85ca                	mv	a1,s2
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a00056da:	000d0763          	beqz	s10,a00056e8 <__vsnprintf+0x4bc>
a00056de:	fffc8e93          	addi	t4,s9,-1
a00056e2:	000c8863          	beqz	s9,a00056f2 <__vsnprintf+0x4c6>
a00056e6:	8cf6                	mv	s9,t4
            out(*(p++), buffer, idx++, maxlen);
a00056e8:	9402                	jalr	s0
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a00056ea:	813dc50b          	lrbu	a0,s11,s3,0
            out(*(p++), buffer, idx++, maxlen);
a00056ee:	8bce                	mv	s7,s3
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a00056f0:	f165                	bnez	a0,a00056d0 <__vsnprintf+0x4a4>
          if (flags & FLAGS_LEFT) {
a00056f2:	57b2                	lw	a5,44(sp)
a00056f4:	1a079963          	bnez	a5,a00058a6 <__vsnprintf+0x67a>
        const char* p = va_arg(va, char*);
a00056f8:	59a2                	lw	s3,40(sp)
        break;
a00056fa:	be51                	j	a000528e <__vsnprintf+0x62>
  unsigned int i = 0U;
a00056fc:	4c81                	li	s9,0
a00056fe:	0001                	nop
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
a0005700:	059c980b          	addsl	a6,s9,s9,2
a0005704:	0305180b          	addsl	a6,a0,a6,1
a0005708:	85ba                	mv	a1,a4
  while (is_digit_(**str)) {
a000570a:	8817450b          	lbuib	a0,(a4),1,0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
a000570e:	fd080c93          	addi	s9,a6,-48
  return (ch >= '0') && (ch <= '9');
a0005712:	fd050693          	addi	a3,a0,-48
  while (is_digit_(**str)) {
a0005716:	0ff6f693          	andi	a3,a3,255
a000571a:	fed673e3          	bgeu	a2,a3,a0005700 <__vsnprintf+0x4d4>
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
a000571e:	8b3a                	mv	s6,a4
        format++;
a0005720:	00258713          	addi	a4,a1,2
a0005724:	becd                	j	a0005316 <__vsnprintf+0xea>
        precision = precision_ > 0 ? (unsigned int)precision_ : 0U;
a0005726:	5849cc8b          	lwia	s9,(s3),4,0
    switch (*format) {
a000572a:	002b4503          	lbu	a0,2(s6)
        format++;
a000572e:	003b0713          	addi	a4,s6,3
        precision = precision_ > 0 ? (unsigned int)precision_ : 0U;
a0005732:	fffcc693          	not	a3,s9
a0005736:	86fd                	srai	a3,a3,0x1f
a0005738:	00dcfcb3          	and	s9,s9,a3
        format++;
a000573c:	0b09                	addi	s6,s6,2
a000573e:	bee1                	j	a0005316 <__vsnprintf+0xea>
          idx = out_rev_(out, buffer, idx, maxlen, ")llun(", 6, width, flags);
a0005740:	a0008737          	lui	a4,0xa0008
a0005744:	865e                	mv	a2,s7
a0005746:	88ee                	mv	a7,s11
a0005748:	8856                	mv	a6,s5
a000574a:	4799                	li	a5,6
a000574c:	61470713          	addi	a4,a4,1556 # a0008614 <__psram_limit+0xf7c08614>
a0005750:	86a6                	mv	a3,s1
a0005752:	85ca                	mv	a1,s2
a0005754:	8522                	mv	a0,s0
a0005756:	a4bfe0ef          	jal	ra,a00041a0 <out_rev_>
a000575a:	8baa                	mv	s7,a0
        const char* p = va_arg(va, char*);
a000575c:	59a2                	lw	s3,40(sp)
a000575e:	be05                	j	a000528e <__vsnprintf+0x62>
a0005760:	4d15                	li	s10,5
a0005762:	005b8c13          	addi	s8,s7,5
a0005766:	0001                	nop
    out(buf[--len], buffer, idx++, maxlen);
a0005768:	47f2                	lw	a5,28(sp)
a000576a:	41ac0633          	sub	a2,s8,s10
a000576e:	86a6                	mv	a3,s1
a0005770:	81a7c50b          	lrbu	a0,a5,s10,0
a0005774:	85ca                	mv	a1,s2
  while (len) {
a0005776:	1d7d                	addi	s10,s10,-1
a0005778:	8ae2                	mv	s5,s8
    out(buf[--len], buffer, idx++, maxlen);
a000577a:	9402                	jalr	s0
  while (len) {
a000577c:	fe0d16e3          	bnez	s10,a0005768 <__vsnprintf+0x53c>
  if (flags & FLAGS_LEFT) {
a0005780:	002dfe93          	andi	t4,s11,2
a0005784:	100e8f63          	beqz	t4,a00058a2 <__vsnprintf+0x676>
    while (idx - start_idx < width) {
a0005788:	0ba9                	addi	s7,s7,10
a000578a:	0001                	nop
      out(' ', buffer, idx++, maxlen);
a000578c:	8656                	mv	a2,s5
a000578e:	86a6                	mv	a3,s1
a0005790:	0a85                	addi	s5,s5,1
a0005792:	85ca                	mv	a1,s2
a0005794:	02000513          	li	a0,32
a0005798:	9402                	jalr	s0
    while (idx - start_idx < width) {
a000579a:	ff5b99e3          	bne	s7,s5,a000578c <__vsnprintf+0x560>
a000579e:	bcc5                	j	a000528e <__vsnprintf+0x62>
          while (l++ < width) {
a00057a0:	4685                	li	a3,1
a00057a2:	1d56fd63          	bgeu	a3,s5,a000597c <__vsnprintf+0x750>
a00057a6:	fffb8c13          	addi	s8,s7,-1
a00057aa:	9c56                	add	s8,s8,s5
a00057ac:	a011                	j	a00057b0 <__vsnprintf+0x584>
a00057ae:	0c85                	addi	s9,s9,1
            out(' ', buffer, idx++, maxlen);
a00057b0:	865e                	mv	a2,s7
a00057b2:	86a6                	mv	a3,s1
a00057b4:	85ca                	mv	a1,s2
a00057b6:	02000513          	li	a0,32
a00057ba:	8be6                	mv	s7,s9
a00057bc:	9402                	jalr	s0
          while (l++ < width) {
a00057be:	ff8c98e3          	bne	s9,s8,a00057ae <__vsnprintf+0x582>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
a00057c2:	001c8b93          	addi	s7,s9,1
a00057c6:	0009c503          	lbu	a0,0(s3)
a00057ca:	86a6                	mv	a3,s1
a00057cc:	8662                	mv	a2,s8
a00057ce:	85ca                	mv	a1,s2
a00057d0:	9402                	jalr	s0
        break;
a00057d2:	89ea                	mv	s3,s10
a00057d4:	b6d1                	j	a0005398 <__vsnprintf+0x16c>
    switch (*format) {
a00057d6:	002b4503          	lbu	a0,2(s6)
          flags |= FLAGS_CHAR;
a00057da:	0c0ded93          	ori	s11,s11,192
        format++;
a00057de:	0b0d                	addi	s6,s6,3
a00057e0:	beb9                	j	a000533e <__vsnprintf+0x112>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
a00057e2:	020ded93          	ori	s11,s11,32
a00057e6:	bbe5                	j	a00055de <__vsnprintf+0x3b2>
        if (*format == 'x' || *format == 'X') {
a00057e8:	07800713          	li	a4,120
a00057ec:	c6e519e3          	bne	a0,a4,a000545e <__vsnprintf+0x232>
        if (flags & FLAGS_PRECISION) {
a00057f0:	400df713          	andi	a4,s11,1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
a00057f4:	ff3df593          	andi	a1,s11,-13
        if (flags & FLAGS_PRECISION) {
a00057f8:	cf65                	beqz	a4,a00058f0 <__vsnprintf+0x6c4>
          base = BASE_HEX;
a00057fa:	48c1                	li	a7,16
a00057fc:	b381                	j	a000553c <__vsnprintf+0x310>
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
a00057fe:	ff3df593          	andi	a1,s11,-13
        if (flags & FLAGS_PRECISION) {
a0005802:	400df713          	andi	a4,s11,1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
a0005806:	0205e593          	ori	a1,a1,32
          base = BASE_HEX;
a000580a:	48c1                	li	a7,16
        if (flags & FLAGS_PRECISION) {
a000580c:	d20718e3          	bnez	a4,a000553c <__vsnprintf+0x310>
        if ((*format == 'i') || (*format == 'd')) {
a0005810:	200dfe93          	andi	t4,s11,512
a0005814:	bb3d                	j	a0005552 <__vsnprintf+0x326>
  for (s = str; *s && maxsize--; ++s);
a0005816:	e8050be3          	beqz	a0,a00056ac <__vsnprintf+0x480>
a000581a:	fffc8693          	addi	a3,s9,-1
a000581e:	bd95                	j	a0005692 <__vsnprintf+0x466>
  while (*format)
a0005820:	a40794e3          	bnez	a5,a0005268 <__vsnprintf+0x3c>
a0005824:	4981                	li	s3,0
a0005826:	be61                	j	a00053be <__vsnprintf+0x192>
  return (unsigned int)(s - str);
a0005828:	411c0c33          	sub	s8,s8,a7
a000582c:	b541                	j	a00056ac <__vsnprintf+0x480>
  while (*format)
a000582e:	4981                	li	s3,0
a0005830:	4b81                	li	s7,0
a0005832:	be85                	j	a00053a2 <__vsnprintf+0x176>
            const int value = (flags & FLAGS_CHAR) ? (signed char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
a0005834:	0405f713          	andi	a4,a1,64
a0005838:	ef41                	bnez	a4,a00058d0 <__vsnprintf+0x6a4>
a000583a:	0805f713          	andi	a4,a1,128
a000583e:	12070c63          	beqz	a4,a0005976 <__vsnprintf+0x74a>
a0005842:	00099803          	lh	a6,0(s3)
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
a0005846:	11005b63          	blez	a6,a000595c <__vsnprintf+0x730>
a000584a:	41f85793          	srai	a5,a6,0x1f
a000584e:	c4c2                	sw	a6,72(sp)
a0005850:	c6be                	sw	a5,76(sp)
a0005852:	4726                	lw	a4,72(sp)
a0005854:	47b6                	lw	a5,76(sp)
a0005856:	c42e                	sw	a1,8(sp)
a0005858:	c256                	sw	s5,4(sp)
a000585a:	c066                	sw	s9,0(sp)
a000585c:	01f85813          	srli	a6,a6,0x1f
a0005860:	b1b9                	j	a00054ae <__vsnprintf+0x282>
            const long long value = va_arg(va, long long);
a0005862:	099d                	addi	s3,s3,7
a0005864:	ff89f993          	andi	s3,s3,-8
a0005868:	0049a803          	lw	a6,4(s3)
a000586c:	5889c68b          	lwia	a3,(s3),8,0
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
a0005870:	c42e                	sw	a1,8(sp)
a0005872:	41f85793          	srai	a5,a6,0x1f
a0005876:	d83e                	sw	a5,48(sp)
a0005878:	5742                	lw	a4,48(sp)
a000587a:	da3e                	sw	a5,52(sp)
a000587c:	57d2                	lw	a5,52(sp)
a000587e:	8eb9                	xor	a3,a3,a4
a0005880:	dc36                	sw	a3,56(sp)
a0005882:	0107c6b3          	xor	a3,a5,a6
a0005886:	de36                	sw	a3,60(sp)
a0005888:	5662                	lw	a2,56(sp)
a000588a:	56f2                	lw	a3,60(sp)
a000588c:	c256                	sw	s5,4(sp)
a000588e:	c066                	sw	s9,0(sp)
a0005890:	01f85813          	srli	a6,a6,0x1f
a0005894:	c2e61777          	sub64	a4,a2,a4
a0005898:	bbc9                	j	a000566a <__vsnprintf+0x43e>
          base = BASE_DECIMAL;
a000589a:	48a9                	li	a7,10
a000589c:	b145                	j	a000553c <__vsnprintf+0x310>
          base =  BASE_OCTAL;
a000589e:	48a1                	li	a7,8
a00058a0:	b161                	j	a0005528 <__vsnprintf+0x2fc>
a00058a2:	8be2                	mv	s7,s8
        break;
a00058a4:	b2ed                	j	a000528e <__vsnprintf+0x62>
a00058a6:	8d5e                	mv	s10,s7
            while (l++ < width) {
a00058a8:	e55c78e3          	bgeu	s8,s5,a00056f8 <__vsnprintf+0x4cc>
a00058ac:	015b8e33          	add	t3,s7,s5
a00058b0:	418e0bb3          	sub	s7,t3,s8
              out(' ', buffer, idx++, maxlen);
a00058b4:	866a                	mv	a2,s10
a00058b6:	86a6                	mv	a3,s1
a00058b8:	0d05                	addi	s10,s10,1
a00058ba:	85ca                	mv	a1,s2
a00058bc:	02000513          	li	a0,32
a00058c0:	9402                	jalr	s0
            while (l++ < width) {
a00058c2:	ffab99e3          	bne	s7,s10,a00058b4 <__vsnprintf+0x688>
        const char* p = va_arg(va, char*);
a00058c6:	59a2                	lw	s3,40(sp)
a00058c8:	b2d9                	j	a000528e <__vsnprintf+0x62>
a00058ca:	0009c703          	lbu	a4,0(s3)
a00058ce:	b175                	j	a000557a <__vsnprintf+0x34e>
            const int value = (flags & FLAGS_CHAR) ? (signed char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
a00058d0:	00098803          	lb	a6,0(s3)
a00058d4:	bf8d                	j	a0005846 <__vsnprintf+0x61a>
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
a00058d6:	41f85793          	srai	a5,a6,0x1f
a00058da:	cabe                	sw	a5,84(sp)
a00058dc:	c8c2                	sw	a6,80(sp)
a00058de:	4646                	lw	a2,80(sp)
a00058e0:	46d6                	lw	a3,84(sp)
a00058e2:	4701                	li	a4,0
a00058e4:	4781                	li	a5,0
a00058e6:	c2c71777          	sub64	a4,a4,a2
a00058ea:	c0ba                	sw	a4,64(sp)
a00058ec:	c2be                	sw	a5,68(sp)
a00058ee:	be4d                	j	a00054a0 <__vsnprintf+0x274>
          if (flags & FLAGS_LONG_LONG) {
a00058f0:	200dfe93          	andi	t4,s11,512
          base = BASE_HEX;
a00058f4:	48c1                	li	a7,16
a00058f6:	b991                	j	a000554a <__vsnprintf+0x31e>
            while (l++ < width) {
a00058f8:	001c0693          	addi	a3,s8,1
a00058fc:	095c7663          	bgeu	s8,s5,a0005988 <__vsnprintf+0x75c>
a0005900:	015b87b3          	add	a5,s7,s5
a0005904:	41878c33          	sub	s8,a5,s8
a0005908:	d246                	sw	a7,36(sp)
              out(' ', buffer, idx++, maxlen);
a000590a:	865e                	mv	a2,s7
a000590c:	86a6                	mv	a3,s1
a000590e:	85ca                	mv	a1,s2
a0005910:	02000513          	li	a0,32
a0005914:	9402                	jalr	s0
a0005916:	0b85                	addi	s7,s7,1
            while (l++ < width) {
a0005918:	5892                	lw	a7,36(sp)
a000591a:	ff7c17e3          	bne	s8,s7,a0005908 <__vsnprintf+0x6dc>
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a000591e:	0008c503          	lbu	a0,0(a7)
            while (l++ < width) {
a0005922:	001a8c13          	addi	s8,s5,1
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a0005926:	da0513e3          	bnez	a0,a00056cc <__vsnprintf+0x4a0>
        const char* p = va_arg(va, char*);
a000592a:	59a2                	lw	s3,40(sp)
a000592c:	b28d                	j	a000528e <__vsnprintf+0x62>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
a000592e:	0009a703          	lw	a4,0(s3)
a0005932:	b1a1                	j	a000557a <__vsnprintf+0x34e>
            idx = print_integer(out, buffer, idx, maxlen, (printf_unsigned_value_t) va_arg(va, unsigned long long), false, base, precision, width, flags);
a0005934:	099d                	addi	s3,s3,7
a0005936:	ff89f993          	andi	s3,s3,-8
a000593a:	0009a703          	lw	a4,0(s3)
a000593e:	0049a783          	lw	a5,4(s3)
a0005942:	865e                	mv	a2,s7
a0005944:	c42e                	sw	a1,8(sp)
a0005946:	c256                	sw	s5,4(sp)
a0005948:	c066                	sw	s9,0(sp)
a000594a:	4801                	li	a6,0
a000594c:	86a6                	mv	a3,s1
a000594e:	85ca                	mv	a1,s2
a0005950:	8522                	mv	a0,s0
a0005952:	8fffe0ef          	jal	ra,a0004250 <print_integer>
a0005956:	09a1                	addi	s3,s3,8
a0005958:	8baa                	mv	s7,a0
a000595a:	ba15                	j	a000528e <__vsnprintf+0x62>
            idx = print_integer(out, buffer, idx, maxlen, ABS_FOR_PRINTING(value), value < 0, base, precision, width, flags);
a000595c:	41f85793          	srai	a5,a6,0x1f
a0005960:	cebe                	sw	a5,92(sp)
a0005962:	ccc2                	sw	a6,88(sp)
a0005964:	4666                	lw	a2,88(sp)
a0005966:	46f6                	lw	a3,92(sp)
a0005968:	4701                	li	a4,0
a000596a:	4781                	li	a5,0
a000596c:	c2c71777          	sub64	a4,a4,a2
a0005970:	c4ba                	sw	a4,72(sp)
a0005972:	c6be                	sw	a5,76(sp)
a0005974:	bdf9                	j	a0005852 <__vsnprintf+0x626>
            const int value = (flags & FLAGS_CHAR) ? (signed char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
a0005976:	0009a803          	lw	a6,0(s3)
a000597a:	b5f1                	j	a0005846 <__vsnprintf+0x61a>
          while (l++ < width) {
a000597c:	8c5e                	mv	s8,s7
a000597e:	8be6                	mv	s7,s9
a0005980:	b599                	j	a00057c6 <__vsnprintf+0x59a>
          while (l++ < width) {
a0005982:	8be6                	mv	s7,s9
        break;
a0005984:	89ea                	mv	s3,s10
a0005986:	bc09                	j	a0005398 <__vsnprintf+0x16c>
            while (l++ < width) {
a0005988:	8c36                	mv	s8,a3
          while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
a000598a:	d40511e3          	bnez	a0,a00056cc <__vsnprintf+0x4a0>
a000598e:	bf71                	j	a000592a <__vsnprintf+0x6fe>
    switch (*format) {
a0005990:	07800693          	li	a3,120
a0005994:	8b3a                	mv	s6,a4
a0005996:	b4a6f9e3          	bgeu	a3,a0,a00054e8 <__vsnprintf+0x2bc>
a000599a:	be85                	j	a000550a <__vsnprintf+0x2de>
          base = BASE_DECIMAL;
a000599c:	48a9                	li	a7,10
a000599e:	b671                	j	a000552a <__vsnprintf+0x2fe>
    switch (*format) {
a00059a0:	8b3a                	mv	s6,a4
a00059a2:	ba71                	j	a000533e <__vsnprintf+0x112>
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
a00059a4:	99cd                	andi	a1,a1,-13
        if (flags & FLAGS_PRECISION) {
a00059a6:	b8070ce3          	beqz	a4,a000553e <__vsnprintf+0x312>
a00059aa:	be49                	j	a000553c <__vsnprintf+0x310>
  return (ch >= '0') && (ch <= '9');
a00059ac:	fd050793          	addi	a5,a0,-48
    if (is_digit_(*format)) {
a00059b0:	0ff7f793          	andi	a5,a5,255
a00059b4:	4625                	li	a2,9
  unsigned int i = 0U;
a00059b6:	4a81                	li	s5,0
    if (is_digit_(*format)) {
a00059b8:	a2f66ce3          	bltu	a2,a5,a00053f0 <__vsnprintf+0x1c4>
  while (is_digit_(**str)) {
a00059bc:	45a5                	li	a1,9
a00059be:	a011                	j	a00059c2 <__vsnprintf+0x796>
a00059c0:	0685                	addi	a3,a3,1
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
a00059c2:	055a9c0b          	addsl	s8,s5,s5,2
a00059c6:	03851c0b          	addsl	s8,a0,s8,1
  while (is_digit_(**str)) {
a00059ca:	0006c503          	lbu	a0,0(a3)
a00059ce:	875a                	mv	a4,s6
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
a00059d0:	fd0c0a93          	addi	s5,s8,-48
  return (ch >= '0') && (ch <= '9');
a00059d4:	fd050613          	addi	a2,a0,-48
  while (is_digit_(**str)) {
a00059d8:	0ff67613          	andi	a2,a2,255
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
a00059dc:	8b36                	mv	s6,a3
  while (is_digit_(**str)) {
a00059de:	fec5f1e3          	bgeu	a1,a2,a00059c0 <__vsnprintf+0x794>
      format++;
a00059e2:	0709                	addi	a4,a4,2
a00059e4:	b431                	j	a00053f0 <__vsnprintf+0x1c4>
    switch (*format) {
a00059e6:	06800513          	li	a0,104
a00059ea:	b605                	j	a000550a <__vsnprintf+0x2de>

a00059ec <console_vsnprintf>:
{
  return __vsnprintf(out_buffer, buf, size, fmt, args);
}

int console_vsnprintf(const char *fmt, va_list args)
{
a00059ec:	86aa                	mv	a3,a0
  return __vsnprintf(out_console, NULL, 0, fmt, args);
a00059ee:	a0004537          	lui	a0,0xa0004
{
a00059f2:	872e                	mv	a4,a1
  return __vsnprintf(out_console, NULL, 0, fmt, args);
a00059f4:	4601                	li	a2,0
a00059f6:	4581                	li	a1,0
a00059f8:	69a50513          	addi	a0,a0,1690 # a000469a <__psram_limit+0xf7c0469a>
a00059fc:	831ff06f          	j	a000522c <__vsnprintf>

a0005a00 <printf>:
int printf(const char *fmt, ...)
{
    int len;
    va_list ap;

    if (console == NULL) {
a0005a00:	c101a303          	lw	t1,-1008(gp) # 62fc9410 <console>
{
a0005a04:	7139                	addi	sp,sp,-64
a0005a06:	ce06                	sw	ra,28(sp)
a0005a08:	d22e                	sw	a1,36(sp)
a0005a0a:	d432                	sw	a2,40(sp)
a0005a0c:	d636                	sw	a3,44(sp)
a0005a0e:	d83a                	sw	a4,48(sp)
a0005a10:	da3e                	sw	a5,52(sp)
a0005a12:	dc42                	sw	a6,56(sp)
a0005a14:	de46                	sw	a7,60(sp)
    if (console == NULL) {
a0005a16:	00030863          	beqz	t1,a0005a26 <printf+0x26>
        return 0;
    }

    va_start(ap, fmt);
a0005a1a:	104c                	addi	a1,sp,36
a0005a1c:	c62e                	sw	a1,12(sp)
    len = console_vsnprintf(fmt, ap);
a0005a1e:	37f9                	jal	a00059ec <console_vsnprintf>
    va_end(ap);

    return len;
}
a0005a20:	40f2                	lw	ra,28(sp)
a0005a22:	6121                	addi	sp,sp,64
a0005a24:	8082                	ret
a0005a26:	40f2                	lw	ra,28(sp)
        return 0;
a0005a28:	4501                	li	a0,0
}
a0005a2a:	6121                	addi	sp,sp,64
a0005a2c:	8082                	ret

a0005a2e <bflb_uart_set_console>:
    return 0;
}

void bflb_uart_set_console(struct bflb_device_s *dev)
{
    console = dev;
a0005a2e:	c0a1a823          	sw	a0,-1008(gp) # 62fc9410 <console>
a0005a32:	8082                	ret

a0005a34 <kmem_init>:
 * Input Parameters:
 *
 ****************************************************************************/

void kmem_init(void *heapstart, size_t heapsize)
{
a0005a34:	862e                	mv	a2,a1
    MEM_LOG("Heap: start=%p size=%u\r\n", heapstart, heapsize);

    bflb_mem_init(KMEM_HEAP, heapstart, heapsize);
a0005a36:	85aa                	mv	a1,a0
a0005a38:	c1418513          	addi	a0,gp,-1004 # 62fc9414 <g_kmemheap>
a0005a3c:	a281                	j	a0005b7c <bflb_mem_init>

a0005a3e <tlsf_size>:
** Size of the TLSF structures in a given memory block passed to
** tlsf_create, equal to the size of a control_t
*/
size_t tlsf_size(void)
{
    return sizeof(control_t);
a0005a3e:	6505                	lui	a0,0x1
}
a0005a40:	c7450513          	addi	a0,a0,-908 # c74 <__RFTLV_SIZE_HOLE+0x474>
a0005a44:	8082                	ret

a0005a46 <tlsf_add_pool>:
{
    return block_header_overhead;
}

pool_t tlsf_add_pool(tlsf_t tlsf, void *mem, size_t bytes)
{
a0005a46:	1101                	addi	sp,sp,-32
a0005a48:	ce06                	sw	ra,28(sp)
a0005a4a:	cc22                	sw	s0,24(sp)
a0005a4c:	ca26                	sw	s1,20(sp)
a0005a4e:	c84a                	sw	s2,16(sp)
    block_header_t *next;

    const size_t pool_overhead = tlsf_pool_overhead();
    const size_t pool_bytes = align_down(bytes - pool_overhead, ALIGN_SIZE);

    if (((ptrdiff_t)mem % ALIGN_SIZE) != 0)
a0005a50:	0035f793          	andi	a5,a1,3
a0005a54:	e3f1                	bnez	a5,a0005b18 <tlsf_add_pool+0xd2>
a0005a56:	ff860413          	addi	s0,a2,-8
a0005a5a:	9871                	andi	s0,s0,-4
        printf("tlsf_add_pool: Memory must be aligned by %u bytes.\n",
               (unsigned int)ALIGN_SIZE);
        return 0;
    }

    if (pool_bytes < block_size_min || pool_bytes > block_size_max)
a0005a5c:	40000637          	lui	a2,0x40000
a0005a60:	ff440793          	addi	a5,s0,-12
a0005a64:	ff460713          	addi	a4,a2,-12 # 3ffffff4 <__wifi_bss_end+0x1cfefff4>
a0005a68:	08f76a63          	bltu	a4,a5,a0005afc <tlsf_add_pool+0xb6>
    return tlsf_cast(block_header_t *, tlsf_cast(tlsfptr_t, ptr) + size);
a0005a6c:	84ae                	mv	s1,a1
    block->size = size | (oldsize & (block_header_free_bit | block_header_prev_free_bit));
a0005a6e:	59c4c78b          	lwia	a5,(s1),-4,0
    block->size &= ~block_header_prev_free_bit;
a0005a72:	892a                	mv	s2,a0
a0005a74:	00146793          	ori	a5,s0,1
a0005a78:	c0dc                	sw	a5,4(s1)
    if (size < SMALL_BLOCK_SIZE)
a0005a7a:	07f00793          	li	a5,127
a0005a7e:	0687fa63          	bgeu	a5,s0,a0005af2 <tlsf_add_pool+0xac>
    const int bit = word ? 32 - __builtin_clz(word) : 0;
a0005a82:	8522                	mv	a0,s0
a0005a84:	c62e                	sw	a1,12(sp)
a0005a86:	97afb0ef          	jal	ra,a0000c00 <__clzsi2>
        sl = tlsf_cast(int, size >> (fl - SL_INDEX_COUNT_LOG2)) ^ (1 << SL_INDEX_COUNT_LOG2);
a0005a8a:	46e9                	li	a3,26
a0005a8c:	8e89                	sub	a3,a3,a0
        fl -= (FL_INDEX_SHIFT - 1);
a0005a8e:	47e5                	li	a5,25
    control->fl_bitmap |= (1U << fl);
a0005a90:	45b2                	lw	a1,12(sp)
        fl -= (FL_INDEX_SHIFT - 1);
a0005a92:	8f89                	sub	a5,a5,a0
        sl = tlsf_cast(int, size >> (fl - SL_INDEX_COUNT_LOG2)) ^ (1 << SL_INDEX_COUNT_LOG2);
a0005a94:	00d456b3          	srl	a3,s0,a3
    control->fl_bitmap |= (1U << fl);
a0005a98:	4505                	li	a0,1
        sl = tlsf_cast(int, size >> (fl - SL_INDEX_COUNT_LOG2)) ^ (1 << SL_INDEX_COUNT_LOG2);
a0005a9a:	0206c693          	xori	a3,a3,32
    control->fl_bitmap |= (1U << fl);
a0005a9e:	00f51533          	sll	a0,a0,a5
    block_header_t *current = control->blocks[fl][sl];
a0005aa2:	00579713          	slli	a4,a5,0x5
a0005aa6:	9736                	add	a4,a4,a3
a0005aa8:	04e9170b          	addsl	a4,s2,a4,2
a0005aac:	5b70                	lw	a2,116(a4)
    block->prev_free = &control->block_null;
a0005aae:	0124a623          	sw	s2,12(s1)
a0005ab2:	04f9178b          	addsl	a5,s2,a5,2
    block->next_free = current;
a0005ab6:	c490                	sw	a2,8(s1)
    current->prev_free = block;
a0005ab8:	c644                	sw	s1,12(a2)
    control->blocks[fl][sl] = block;
a0005aba:	db64                	sw	s1,116(a4)
    control->fl_bitmap |= (1U << fl);
a0005abc:	01092603          	lw	a2,16(s2) # 800010 <nocache_min_size+0x7fb010>
    control->sl_bitmap[fl] |= (1U << sl);
a0005ac0:	4705                	li	a4,1
a0005ac2:	00d71733          	sll	a4,a4,a3
    control->fl_bitmap |= (1U << fl);
a0005ac6:	00a666b3          	or	a3,a2,a0
a0005aca:	00d92823          	sw	a3,16(s2)
    control->sl_bitmap[fl] |= (1U << sl);
a0005ace:	4bd4                	lw	a3,20(a5)
    return tlsf_cast(block_header_t *, tlsf_cast(tlsfptr_t, ptr) + size);
a0005ad0:	00448613          	addi	a2,s1,4
a0005ad4:	00860533          	add	a0,a2,s0
    control->sl_bitmap[fl] |= (1U << sl);
a0005ad8:	8ed9                	or	a3,a3,a4
a0005ada:	cbd4                	sw	a3,20(a5)
    next->prev_phys_block = block;
a0005adc:	4086548b          	srw	s1,a2,s0,0
    block->size |= block_header_prev_free_bit;
a0005ae0:	4789                	li	a5,2
a0005ae2:	c15c                	sw	a5,4(a0)
    next = block_link_next(block);
    block_set_size(next, 0);
    block_set_used(next);
    block_set_prev_free(next);

    return mem;
a0005ae4:	852e                	mv	a0,a1
}
a0005ae6:	40f2                	lw	ra,28(sp)
a0005ae8:	4462                	lw	s0,24(sp)
a0005aea:	44d2                	lw	s1,20(sp)
a0005aec:	4942                	lw	s2,16(sp)
a0005aee:	6105                	addi	sp,sp,32
a0005af0:	8082                	ret
        sl = tlsf_cast(int, size) / (SMALL_BLOCK_SIZE / SL_INDEX_COUNT);
a0005af2:	40245693          	srai	a3,s0,0x2
a0005af6:	4505                	li	a0,1
        fl = 0;
a0005af8:	4781                	li	a5,0
a0005afa:	b765                	j	a0005aa2 <tlsf_add_pool+0x5c>
        printf("tlsf_add_pool: Memory size must be between %u and %u bytes.\n",
a0005afc:	a0008537          	lui	a0,0xa0008
a0005b00:	0621                	addi	a2,a2,8
a0005b02:	45d1                	li	a1,20
a0005b04:	77450513          	addi	a0,a0,1908 # a0008774 <__psram_limit+0xf7c08774>
a0005b08:	3de5                	jal	a0005a00 <printf>
}
a0005b0a:	40f2                	lw	ra,28(sp)
a0005b0c:	4462                	lw	s0,24(sp)
a0005b0e:	44d2                	lw	s1,20(sp)
a0005b10:	4942                	lw	s2,16(sp)
        return 0;
a0005b12:	4501                	li	a0,0
}
a0005b14:	6105                	addi	sp,sp,32
a0005b16:	8082                	ret
        printf("tlsf_add_pool: Memory must be aligned by %u bytes.\n",
a0005b18:	a0008537          	lui	a0,0xa0008
a0005b1c:	4591                	li	a1,4
a0005b1e:	74050513          	addi	a0,a0,1856 # a0008740 <__psram_limit+0xf7c08740>
a0005b22:	3df9                	jal	a0005a00 <printf>
a0005b24:	4501                	li	a0,0
a0005b26:	b7c1                	j	a0005ae6 <tlsf_add_pool+0xa0>

a0005b28 <tlsf_create>:
    {
        return 0;
    }
#endif

    if (((tlsfptr_t)mem % ALIGN_SIZE) != 0)
a0005b28:	00357793          	andi	a5,a0,3
a0005b2c:	ef85                	bnez	a5,a0005b64 <tlsf_create+0x3c>
    control->block_null.next_free = &control->block_null;
a0005b2e:	6605                	lui	a2,0x1
a0005b30:	cf460613          	addi	a2,a2,-780 # cf4 <__RFTLV_SIZE_HOLE+0x4f4>
a0005b34:	c508                	sw	a0,8(a0)
    control->block_null.prev_free = &control->block_null;
a0005b36:	c548                	sw	a0,12(a0)
    control->fl_bitmap = 0;
a0005b38:	00052823          	sw	zero,16(a0)
    for (i = 0; i < FL_INDEX_COUNT; ++i)
a0005b3c:	01450693          	addi	a3,a0,20
a0005b40:	0f450713          	addi	a4,a0,244
a0005b44:	962a                	add	a2,a2,a0
a0005b46:	0001                	nop
        control->sl_bitmap[i] = 0;
a0005b48:	0006a023          	sw	zero,0(a3)
        for (j = 0; j < SL_INDEX_COUNT; ++j)
a0005b4c:	f8070793          	addi	a5,a4,-128
            control->blocks[i][j] = &control->block_null;
a0005b50:	5847d50b          	swia	a0,(a5),4,0
        for (j = 0; j < SL_INDEX_COUNT; ++j)
a0005b54:	fee79ee3          	bne	a5,a4,a0005b50 <tlsf_create+0x28>
    for (i = 0; i < FL_INDEX_COUNT; ++i)
a0005b58:	08070713          	addi	a4,a4,128
a0005b5c:	0691                	addi	a3,a3,4
a0005b5e:	fec715e3          	bne	a4,a2,a0005b48 <tlsf_create+0x20>
a0005b62:	8082                	ret
    {
        printf("tlsf_create: Memory must be aligned to %u bytes.\n",
a0005b64:	a0008537          	lui	a0,0xa0008
{
a0005b68:	1141                	addi	sp,sp,-16
        printf("tlsf_create: Memory must be aligned to %u bytes.\n",
a0005b6a:	4591                	li	a1,4
a0005b6c:	7b450513          	addi	a0,a0,1972 # a00087b4 <__psram_limit+0xf7c087b4>
{
a0005b70:	c606                	sw	ra,12(sp)
        printf("tlsf_create: Memory must be aligned to %u bytes.\n",
a0005b72:	3579                	jal	a0005a00 <printf>
    }

    control_construct(tlsf_cast(control_t *, mem));

    return tlsf_cast(tlsf_t, mem);
}
a0005b74:	40b2                	lw	ra,12(sp)
        printf("tlsf_create: Memory must be aligned to %u bytes.\n",
a0005b76:	4501                	li	a0,0
}
a0005b78:	0141                	addi	sp,sp,16
a0005b7a:	8082                	ret

a0005b7c <bflb_mem_init>:
/****************************************************************************
 * Functions
 ****************************************************************************/

void bflb_mem_init(struct mem_heap_s *heap, void *heapstart, size_t heapsize)
{
a0005b7c:	1141                	addi	sp,sp,-16
a0005b7e:	c606                	sw	ra,12(sp)
a0005b80:	c422                	sw	s0,8(sp)
a0005b82:	c226                	sw	s1,4(sp)
a0005b84:	c04a                	sw	s2,0(sp)
    struct mem_heap_impl_s *impl;

    /* Reserve a block space for mem_heap_impl_s context */

    MEM_ASSERT(heapsize > sizeof(struct mem_heap_impl_s));
a0005b86:	4731                	li	a4,12
a0005b88:	02c76063          	bltu	a4,a2,a0005ba8 <bflb_mem_init+0x2c>
a0005b8c:	a00095b7          	lui	a1,0xa0009
a0005b90:	a0008537          	lui	a0,0xa0008
a0005b94:	86c58593          	addi	a1,a1,-1940 # a000886c <__psram_limit+0xf7c0886c>
a0005b98:	7e850513          	addi	a0,a0,2024 # a00087e8 <__psram_limit+0xf7c087e8>
a0005b9c:	3595                	jal	a0005a00 <printf>
a0005b9e:	c2fbb097          	auipc	ra,0xc2fbb
a0005ba2:	99c080e7          	jalr	-1636(ra) # 62fc053a <bflb_irq_save>
a0005ba6:	a001                	j	a0005ba6 <bflb_mem_init+0x2a>
a0005ba8:	84ae                	mv	s1,a1

    heap->mem_impl = (struct mem_heap_impl_s *)heapstart;
a0005baa:	8432                	mv	s0,a2
    heapsize -= sizeof(struct mem_heap_impl_s);

    /* Zero implmeentation context */

    impl = heap->mem_impl;
    memset(impl, 0, sizeof(struct mem_heap_impl_s));
a0005bac:	4581                	li	a1,0
a0005bae:	4631                	li	a2,12
    heap->mem_impl = (struct mem_heap_impl_s *)heapstart;
a0005bb0:	c104                	sw	s1,0(a0)
    memset(impl, 0, sizeof(struct mem_heap_impl_s));
a0005bb2:	8526                	mv	a0,s1
    heapsize -= sizeof(struct mem_heap_impl_s);
a0005bb4:	1451                	addi	s0,s0,-12
    memset(impl, 0, sizeof(struct mem_heap_impl_s));
a0005bb6:	daefe0ef          	jal	ra,a0004164 <memset>

    /* Allocate and create TLSF context */

    MEM_ASSERT(heapsize > tlsf_size());
a0005bba:	3551                	jal	a0005a3e <tlsf_size>
a0005bbc:	02856063          	bltu	a0,s0,a0005bdc <bflb_mem_init+0x60>
a0005bc0:	a00095b7          	lui	a1,0xa0009
a0005bc4:	a0009537          	lui	a0,0xa0009
a0005bc8:	86c58593          	addi	a1,a1,-1940 # a000886c <__psram_limit+0xf7c0886c>
a0005bcc:	83450513          	addi	a0,a0,-1996 # a0008834 <__psram_limit+0xf7c08834>
a0005bd0:	3d05                	jal	a0005a00 <printf>
a0005bd2:	c2fbb097          	auipc	ra,0xc2fbb
a0005bd6:	968080e7          	jalr	-1688(ra) # 62fc053a <bflb_irq_save>
a0005bda:	a001                	j	a0005bda <bflb_mem_init+0x5e>
    heapstart += sizeof(struct mem_heap_impl_s);
a0005bdc:	00c48913          	addi	s2,s1,12

    impl->mem_tlsf = tlsf_create(heapstart);
a0005be0:	854a                	mv	a0,s2
a0005be2:	3799                	jal	a0005b28 <tlsf_create>
a0005be4:	c088                	sw	a0,0(s1)
    heapstart += tlsf_size();
a0005be6:	3da1                	jal	a0005a3e <tlsf_size>
a0005be8:	992a                	add	s2,s2,a0
    heapsize -= tlsf_size();
a0005bea:	3d91                	jal	a0005a3e <tlsf_size>
a0005bec:	862a                	mv	a2,a0
a0005bee:	40c40633          	sub	a2,s0,a2
    impl->heapsize = heapsize;

    /* Add the initial region of memory to the heap */

    tlsf_add_pool(impl->mem_tlsf, heapstart, heapsize);
}
a0005bf2:	4422                	lw	s0,8(sp)
    impl->heapstart = heapstart;
a0005bf4:	0124a223          	sw	s2,4(s1)
    tlsf_add_pool(impl->mem_tlsf, heapstart, heapsize);
a0005bf8:	4088                	lw	a0,0(s1)
}
a0005bfa:	40b2                	lw	ra,12(sp)
    impl->heapsize = heapsize;
a0005bfc:	c490                	sw	a2,8(s1)
    tlsf_add_pool(impl->mem_tlsf, heapstart, heapsize);
a0005bfe:	85ca                	mv	a1,s2
}
a0005c00:	4492                	lw	s1,4(sp)
a0005c02:	4902                	lw	s2,0(sp)
a0005c04:	0141                	addi	sp,sp,16
    tlsf_add_pool(impl->mem_tlsf, heapstart, heapsize);
a0005c06:	b581                	j	a0005a46 <tlsf_add_pool>

a0005c08 <log_start>:
    bflog_direct_resume(direct);

    /*!< resume record */
    bflog_resume(record);
#endif
}
a0005c08:	8082                	ret

a0005c0a <bflb_gpio_init>:
    mode = (cfgset & GPIO_MODE_MASK);
    drive = (cfgset & GPIO_DRV_MASK) >> GPIO_DRV_SHIFT;

#if defined(BL616)
    /* disable muxed to be xtal32k */
    if (pin == GPIO_PIN_16) {
a0005c0a:	4741                	li	a4,16
    reg_base = dev->reg_base;
a0005c0c:	4154                	lw	a3,4(a0)
    drive = (cfgset & GPIO_DRV_MASK) >> GPIO_DRV_SHIFT;
a0005c0e:	2ca6378b          	extu	a5,a2,11,10
    mode = (cfgset & GPIO_MODE_MASK);
a0005c12:	06067513          	andi	a0,a2,96
    if (pin == GPIO_PIN_16) {
a0005c16:	08e58d63          	beq	a1,a4,a0005cb0 <bflb_gpio_init+0xa6>
        *(volatile uint32_t *)(0x2000f000 + 0x38) &= ~(1 << 20);
    } else if (pin == GPIO_PIN_17) {
a0005c1a:	4745                	li	a4,17
a0005c1c:	06e58e63          	beq	a1,a4,a0005c98 <bflb_gpio_init+0x8e>
        regval |= (function << (is_odd * 16 + 8));
        putreg32(regval, reg_base + GLB_GPIO_CFGCTL0_OFFSET + (pin / 2 * 4));
    }
#endif
#elif defined(BL616) || defined(BL808) || defined(BL606P) || defined(BL628)
    cfg_address = reg_base + GLB_GPIO_CFG0_OFFSET + (pin << 2);
a0005c20:	6705                	lui	a4,0x1
a0005c22:	04b6958b          	addsl	a1,a3,a1,2
a0005c26:	8c470813          	addi	a6,a4,-1852 # 8c4 <__RFTLV_SIZE_HOLE+0xc4>
    cfg = 0;
    cfg |= GLB_REG_GPIO_0_INT_MASK;

    if (mode == GPIO_INPUT) {
a0005c2a:	cd15                	beqz	a0,a0005c66 <bflb_gpio_init+0x5c>
        cfg |= GLB_REG_GPIO_0_IE;
        function = 11;
    } else if (mode == GPIO_OUTPUT) {
a0005c2c:	02000693          	li	a3,32
a0005c30:	08d50c63          	beq	a0,a3,a0005cc8 <bflb_gpio_init+0xbe>
        cfg |= GLB_REG_GPIO_0_OE;
        function = 11;
    } else if (mode == GPIO_ANALOG) {
a0005c34:	04000693          	li	a3,64
a0005c38:	08d50f63          	beq	a0,a3,a0005cd6 <bflb_gpio_init+0xcc>
        function = 10;
    } else if (mode == GPIO_ALTERNATE) {
        cfg |= GLB_REG_GPIO_0_IE;
a0005c3c:	004008b7          	lui	a7,0x400
a0005c40:	fa050513          	addi	a0,a0,-96
a0005c44:	00188713          	addi	a4,a7,1 # 400001 <nocache_min_size+0x3fb001>
    if (cfgset & GPIO_SMT_EN) {
        cfg |= GLB_REG_GPIO_0_SMT;
    }

    cfg |= (drive << GLB_REG_GPIO_0_DRV_SHIFT);
    cfg |= (function << GLB_REG_GPIO_0_FUNC_SEL_SHIFT);
a0005c48:	01f67693          	andi	a3,a2,31
        cfg |= GLB_REG_GPIO_0_IE;
a0005c4c:	42a8970b          	mvnez	a4,a7,a0
    if (cfgset & GPIO_PULLUP) {
a0005c50:	08067513          	andi	a0,a2,128
    cfg |= (function << GLB_REG_GPIO_0_FUNC_SEL_SHIFT);
a0005c54:	06a2                	slli	a3,a3,0x8
    if (cfgset & GPIO_PULLUP) {
a0005c56:	e105                	bnez	a0,a0005c76 <bflb_gpio_init+0x6c>
    } else if (cfgset & GPIO_PULLDOWN) {
a0005c58:	10067513          	andi	a0,a2,256
        cfg |= GLB_REG_GPIO_0_PD;
a0005c5c:	02076893          	ori	a7,a4,32
a0005c60:	42a8970b          	mvnez	a4,a7,a0
a0005c64:	a819                	j	a0005c7a <bflb_gpio_init+0x70>
a0005c66:	b0070693          	addi	a3,a4,-1280
        cfg |= GLB_REG_GPIO_0_IE;
a0005c6a:	00400737          	lui	a4,0x400
a0005c6e:	0705                	addi	a4,a4,1
    if (cfgset & GPIO_PULLUP) {
a0005c70:	08067513          	andi	a0,a2,128
a0005c74:	d175                	beqz	a0,a0005c58 <bflb_gpio_init+0x4e>
        cfg |= GLB_REG_GPIO_0_PU;
a0005c76:	01076713          	ori	a4,a4,16
    if (cfgset & GPIO_SMT_EN) {
a0005c7a:	20067613          	andi	a2,a2,512
        cfg |= GLB_REG_GPIO_0_SMT;
a0005c7e:	00276513          	ori	a0,a4,2
a0005c82:	42c5170b          	mvnez	a4,a0,a2
    cfg |= (drive << GLB_REG_GPIO_0_DRV_SHIFT);
a0005c86:	078a                	slli	a5,a5,0x2
a0005c88:	8fd9                	or	a5,a5,a4
    cfg |= (function << GLB_REG_GPIO_0_FUNC_SEL_SHIFT);
a0005c8a:	8fd5                	or	a5,a5,a3

    /* configure output mode:set and clr mode */
    cfg |= 0x1 << GLB_REG_GPIO_0_MODE_SHIFT;
a0005c8c:	40000737          	lui	a4,0x40000
a0005c90:	8fd9                	or	a5,a5,a4
#endif
    putreg32(cfg, cfg_address);
a0005c92:	4105d78b          	srw	a5,a1,a6,0
}
a0005c96:	8082                	ret
        *(volatile uint32_t *)(0x2000f000 + 0x38) &= ~(1 << 21);
a0005c98:	2000f8b7          	lui	a7,0x2000f
a0005c9c:	0388a703          	lw	a4,56(a7) # 2000f038 <nocache_min_size+0x2000a038>
a0005ca0:	ffe00837          	lui	a6,0xffe00
a0005ca4:	187d                	addi	a6,a6,-1
a0005ca6:	01077733          	and	a4,a4,a6
a0005caa:	02e8ac23          	sw	a4,56(a7)
a0005cae:	bf8d                	j	a0005c20 <bflb_gpio_init+0x16>
        *(volatile uint32_t *)(0x2000f000 + 0x38) &= ~(1 << 20);
a0005cb0:	2000f8b7          	lui	a7,0x2000f
a0005cb4:	0388a703          	lw	a4,56(a7) # 2000f038 <nocache_min_size+0x2000a038>
a0005cb8:	fff00837          	lui	a6,0xfff00
a0005cbc:	187d                	addi	a6,a6,-1
a0005cbe:	01077733          	and	a4,a4,a6
a0005cc2:	02e8ac23          	sw	a4,56(a7)
a0005cc6:	bfa9                	j	a0005c20 <bflb_gpio_init+0x16>
a0005cc8:	b0070693          	addi	a3,a4,-1280 # 3ffffb00 <__wifi_bss_end+0x1cfefb00>
        cfg |= GLB_REG_GPIO_0_OE;
a0005ccc:	00400737          	lui	a4,0x400
a0005cd0:	04070713          	addi	a4,a4,64 # 400040 <nocache_min_size+0x3fb040>
a0005cd4:	bf71                	j	a0005c70 <bflb_gpio_init+0x66>
a0005cd6:	a0070693          	addi	a3,a4,-1536
    cfg |= GLB_REG_GPIO_0_INT_MASK;
a0005cda:	00400737          	lui	a4,0x400
a0005cde:	bf49                	j	a0005c70 <bflb_gpio_init+0x66>

a0005ce0 <bflb_gpio_set>:
    putreg32(regval | 1 << (pin & 0x1f), dev->reg_base + GLB_GPIO_CFGCTL32_OFFSET);
#elif defined(BL702L)
    uint32_t regval = getreg32(dev->reg_base + GLB_GPIO_CFGCTL35_OFFSET);
    putreg32(regval | 1 << (pin & 0x1f), dev->reg_base + GLB_GPIO_CFGCTL35_OFFSET);
#elif defined(BL616) || defined(BL808) || defined(BL606P) || defined(BL628)
    putreg32(1 << (pin & 0x1f), dev->reg_base + GLB_GPIO_CFG138_OFFSET + ((pin >> 5) << 2));
a0005ce0:	415c                	lw	a5,4(a0)
a0005ce2:	6685                	lui	a3,0x1
a0005ce4:	aec68693          	addi	a3,a3,-1300 # aec <__RFTLV_SIZE_HOLE+0x2ec>
a0005ce8:	4705                	li	a4,1
a0005cea:	0055d613          	srli	a2,a1,0x5
a0005cee:	97b6                	add	a5,a5,a3
a0005cf0:	00b71733          	sll	a4,a4,a1
a0005cf4:	44c7d70b          	srw	a4,a5,a2,2
#endif
}
a0005cf8:	8082                	ret

a0005cfa <bflb_gpio_reset>:
    putreg32(regval & ~(1 << (pin & 0x1f)), dev->reg_base + GLB_GPIO_CFGCTL32_OFFSET);
#elif defined(BL702L)
    uint32_t regval = getreg32(dev->reg_base + GLB_GPIO_CFGCTL36_OFFSET);
    putreg32(regval & ~(1 << (pin & 0x1f)), dev->reg_base + GLB_GPIO_CFGCTL36_OFFSET);
#elif defined(BL616) || defined(BL808) || defined(BL606P) || defined(BL628)
    putreg32(1 << (pin & 0x1f), dev->reg_base + GLB_GPIO_CFG140_OFFSET + ((pin >> 5) << 2));
a0005cfa:	415c                	lw	a5,4(a0)
a0005cfc:	6685                	lui	a3,0x1
a0005cfe:	af468693          	addi	a3,a3,-1292 # af4 <__RFTLV_SIZE_HOLE+0x2f4>
a0005d02:	4705                	li	a4,1
a0005d04:	0055d613          	srli	a2,a1,0x5
a0005d08:	97b6                	add	a5,a5,a3
a0005d0a:	00b71733          	sll	a4,a4,a1
a0005d0e:	44c7d70b          	srw	a4,a5,a2,2
#endif
}
a0005d12:	8082                	ret

a0005d14 <bflb_gpio_uart_init>:
    putreg32(regval, reg_base + GLB_UART_SIG_SEL_0_OFFSET);
#elif defined(BL616) || defined(BL808) || defined(BL606P) || defined(BL628)
#define GLB_UART_CFG1_OFFSET (0x154)
#define GLB_UART_CFG2_OFFSET (0x158)
    uint32_t regval2;
    sig = pin % 12;
a0005d14:	4e31                	li	t3,12
a0005d16:	03c5fe33          	remu	t3,a1,t3

    if (sig < 8) {
a0005d1a:	479d                	li	a5,7
    reg_base = dev->reg_base;
a0005d1c:	00452e83          	lw	t4,4(a0)
    if (sig < 8) {
a0005d20:	0bc7ee63          	bltu	a5,t3,a0005ddc <bflb_gpio_uart_init+0xc8>
        sig_pos = sig << 2;

        regval = getreg32(reg_base + GLB_UART_CFG1_OFFSET);
        regval &= (~(0x0f << sig_pos));
a0005d24:	002e1713          	slli	a4,t3,0x2
        regval = getreg32(reg_base + GLB_UART_CFG1_OFFSET);
a0005d28:	154ea803          	lw	a6,340(t4)
        regval &= (~(0x0f << sig_pos));
a0005d2c:	47bd                	li	a5,15
a0005d2e:	00e797b3          	sll	a5,a5,a4
a0005d32:	fff7c793          	not	a5,a5
a0005d36:	0107f7b3          	and	a5,a5,a6
        regval |= (uart_func << sig_pos);
a0005d3a:	00e61833          	sll	a6,a2,a4
a0005d3e:	00f86833          	or	a6,a6,a5
a0005d42:	4701                	li	a4,0

        for (uint8_t i = 0; i < 8; i++) {
            /* reset other sigs which are the same with uart_func */
            sig_pos = i << 2;
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d44:	433d                	li	t1,15
        for (uint8_t i = 0; i < 8; i++) {
a0005d46:	4f21                	li	t5,8
a0005d48:	a021                	j	a0005d50 <bflb_gpio_uart_init+0x3c>
a0005d4a:	0705                	addi	a4,a4,1
a0005d4c:	03e70d63          	beq	a4,t5,a0005d86 <bflb_gpio_uart_init+0x72>
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d50:	00271793          	slli	a5,a4,0x2
a0005d54:	00f316b3          	sll	a3,t1,a5
a0005d58:	0106f8b3          	and	a7,a3,a6
a0005d5c:	00f617b3          	sll	a5,a2,a5
a0005d60:	fef895e3          	bne	a7,a5,a0005d4a <bflb_gpio_uart_init+0x36>
                regval &= (~(0x0f << sig_pos));
                regval |= (0x0f << sig_pos);
a0005d64:	fff6c893          	not	a7,a3
a0005d68:	0108f8b3          	and	a7,a7,a6
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d6c:	0ff77793          	andi	a5,a4,255
                regval |= (0x0f << sig_pos);
a0005d70:	0116e6b3          	or	a3,a3,a7
a0005d74:	406608b3          	sub	a7,a2,t1
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d78:	fcfe09e3          	beq	t3,a5,a0005d4a <bflb_gpio_uart_init+0x36>
        for (uint8_t i = 0; i < 8; i++) {
a0005d7c:	0705                	addi	a4,a4,1
                regval |= (0x0f << sig_pos);
a0005d7e:	4316980b          	mvnez	a6,a3,a7
        for (uint8_t i = 0; i < 8; i++) {
a0005d82:	fde717e3          	bne	a4,t5,a0005d50 <bflb_gpio_uart_init+0x3c>
            }
        }
        regval2 = getreg32(reg_base + GLB_UART_CFG2_OFFSET);
a0005d86:	158ea683          	lw	a3,344(t4)
a0005d8a:	4781                	li	a5,0

        for (uint8_t i = 8; i < 12; i++) {
            /* reset other sigs which are the same with uart_func */
            sig_pos = (i - 8) << 2;
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d8c:	4e3d                	li	t3,15
        for (uint8_t i = 8; i < 12; i++) {
a0005d8e:	4f41                	li	t5,16
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d90:	00fe1733          	sll	a4,t3,a5
a0005d94:	00f618b3          	sll	a7,a2,a5
a0005d98:	00d77333          	and	t1,a4,a3
        for (uint8_t i = 8; i < 12; i++) {
a0005d9c:	0791                	addi	a5,a5,4
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005d9e:	11130c63          	beq	t1,a7,a0005eb6 <bflb_gpio_uart_init+0x1a2>
        for (uint8_t i = 8; i < 12; i++) {
a0005da2:	ffe797e3          	bne	a5,t5,a0005d90 <bflb_gpio_uart_init+0x7c>
                regval2 &= (~(0x0f << sig_pos));
                regval2 |= (0x0f << sig_pos);
            }
        }
        putreg32(regval, reg_base + GLB_UART_CFG1_OFFSET);
a0005da6:	150eaa23          	sw	a6,340(t4)
        putreg32(regval2, reg_base + GLB_UART_CFG2_OFFSET);
a0005daa:	14deac23          	sw	a3,344(t4)
    if (pin == GPIO_PIN_16) {
a0005dae:	4741                	li	a4,16
    reg_base = dev->reg_base;
a0005db0:	415c                	lw	a5,4(a0)
    if (pin == GPIO_PIN_16) {
a0005db2:	0ae59263          	bne	a1,a4,a0005e56 <bflb_gpio_uart_init+0x142>
        *(volatile uint32_t *)(0x2000f000 + 0x38) &= ~(1 << 20);
a0005db6:	2000f637          	lui	a2,0x2000f
a0005dba:	5e18                	lw	a4,56(a2)
a0005dbc:	fff006b7          	lui	a3,0xfff00
a0005dc0:	16fd                	addi	a3,a3,-1
a0005dc2:	8f75                	and	a4,a4,a3
a0005dc4:	de18                	sw	a4,56(a2)
    cfg_address = reg_base + GLB_GPIO_CFG0_OFFSET + (pin << 2);
a0005dc6:	6705                	lui	a4,0x1
a0005dc8:	8c470713          	addi	a4,a4,-1852 # 8c4 <__RFTLV_SIZE_HOLE+0xc4>
a0005dcc:	97ba                	add	a5,a5,a4
    putreg32(cfg, cfg_address);
a0005dce:	40400737          	lui	a4,0x40400
a0005dd2:	71770713          	addi	a4,a4,1815 # 40400717 <__wifi_bss_end+0x1d3f0717>
a0005dd6:	44b7d70b          	srw	a4,a5,a1,2
        putreg32(regval, reg_base + GLB_UART_CFG2_OFFSET);
        putreg32(regval2, reg_base + GLB_UART_CFG1_OFFSET);
    }
#endif
    bflb_gpio_init(dev, pin, (7 << GPIO_FUNC_SHIFT) | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);
}
a0005dda:	8082                	ret
        sig_pos = (sig - 8) << 2;
a0005ddc:	ff8e0793          	addi	a5,t3,-8 # fff8 <nocache_min_size+0xaff8>
a0005de0:	078a                	slli	a5,a5,0x2
        regval = getreg32(reg_base + GLB_UART_CFG2_OFFSET);
a0005de2:	158ea703          	lw	a4,344(t4)
        regval &= (~(0x0f << sig_pos));
a0005de6:	0ff7f793          	andi	a5,a5,255
a0005dea:	46bd                	li	a3,15
a0005dec:	00f696b3          	sll	a3,a3,a5
a0005df0:	fff6c693          	not	a3,a3
a0005df4:	8ef9                	and	a3,a3,a4
        regval |= (uart_func << sig_pos);
a0005df6:	00f617b3          	sll	a5,a2,a5
a0005dfa:	8edd                	or	a3,a3,a5
        for (uint8_t i = 8; i < 12; i++) {
a0005dfc:	4721                	li	a4,8
        regval |= (uart_func << sig_pos);
a0005dfe:	4781                	li	a5,0
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005e00:	4fbd                	li	t6,15
        for (uint8_t i = 8; i < 12; i++) {
a0005e02:	42b1                	li	t0,12
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005e04:	00ff9833          	sll	a6,t6,a5
a0005e08:	00d87f33          	and	t5,a6,a3
a0005e0c:	00f61333          	sll	t1,a2,a5
        for (uint8_t i = 8; i < 12; i++) {
a0005e10:	00170893          	addi	a7,a4,1
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005e14:	086f0463          	beq	t5,t1,a0005e9c <bflb_gpio_uart_init+0x188>
        for (uint8_t i = 8; i < 12; i++) {
a0005e18:	0ff8f713          	andi	a4,a7,255
a0005e1c:	0791                	addi	a5,a5,4
a0005e1e:	fe5713e3          	bne	a4,t0,a0005e04 <bflb_gpio_uart_init+0xf0>
        regval2 = getreg32(reg_base + GLB_UART_CFG1_OFFSET);
a0005e22:	154ea803          	lw	a6,340(t4)
a0005e26:	4781                	li	a5,0
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005e28:	4e3d                	li	t3,15
        for (uint8_t i = 0; i < 8; i++) {
a0005e2a:	02000f13          	li	t5,32
a0005e2e:	0001                	nop
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005e30:	00fe1733          	sll	a4,t3,a5
a0005e34:	00f618b3          	sll	a7,a2,a5
a0005e38:	01077333          	and	t1,a4,a6
        for (uint8_t i = 0; i < 8; i++) {
a0005e3c:	0791                	addi	a5,a5,4
            if (((regval2 & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005e3e:	05130263          	beq	t1,a7,a0005e82 <bflb_gpio_uart_init+0x16e>
        for (uint8_t i = 0; i < 8; i++) {
a0005e42:	ffe797e3          	bne	a5,t5,a0005e30 <bflb_gpio_uart_init+0x11c>
        putreg32(regval, reg_base + GLB_UART_CFG2_OFFSET);
a0005e46:	14deac23          	sw	a3,344(t4)
        putreg32(regval2, reg_base + GLB_UART_CFG1_OFFSET);
a0005e4a:	150eaa23          	sw	a6,340(t4)
    if (pin == GPIO_PIN_16) {
a0005e4e:	4741                	li	a4,16
    reg_base = dev->reg_base;
a0005e50:	415c                	lw	a5,4(a0)
    if (pin == GPIO_PIN_16) {
a0005e52:	f6e582e3          	beq	a1,a4,a0005db6 <bflb_gpio_uart_init+0xa2>
    } else if (pin == GPIO_PIN_17) {
a0005e56:	4745                	li	a4,17
a0005e58:	f6e597e3          	bne	a1,a4,a0005dc6 <bflb_gpio_uart_init+0xb2>
        *(volatile uint32_t *)(0x2000f000 + 0x38) &= ~(1 << 21);
a0005e5c:	2000f637          	lui	a2,0x2000f
a0005e60:	5e18                	lw	a4,56(a2)
a0005e62:	ffe006b7          	lui	a3,0xffe00
a0005e66:	16fd                	addi	a3,a3,-1
a0005e68:	8f75                	and	a4,a4,a3
a0005e6a:	de18                	sw	a4,56(a2)
    cfg_address = reg_base + GLB_GPIO_CFG0_OFFSET + (pin << 2);
a0005e6c:	6705                	lui	a4,0x1
a0005e6e:	8c470713          	addi	a4,a4,-1852 # 8c4 <__RFTLV_SIZE_HOLE+0xc4>
a0005e72:	97ba                	add	a5,a5,a4
    putreg32(cfg, cfg_address);
a0005e74:	40400737          	lui	a4,0x40400
a0005e78:	71770713          	addi	a4,a4,1815 # 40400717 <__wifi_bss_end+0x1d3f0717>
a0005e7c:	44b7d70b          	srw	a4,a5,a1,2
}
a0005e80:	8082                	ret
                regval2 |= (0x0f << sig_pos);
a0005e82:	fff74893          	not	a7,a4
a0005e86:	0108f8b3          	and	a7,a7,a6
a0005e8a:	01176733          	or	a4,a4,a7
a0005e8e:	41c608b3          	sub	a7,a2,t3
a0005e92:	4317180b          	mvnez	a6,a4,a7
        for (uint8_t i = 0; i < 8; i++) {
a0005e96:	f9e79de3          	bne	a5,t5,a0005e30 <bflb_gpio_uart_init+0x11c>
a0005e9a:	b775                	j	a0005e46 <bflb_gpio_uart_init+0x132>
                regval |= (0x0f << sig_pos);
a0005e9c:	fff84313          	not	t1,a6
a0005ea0:	00d37333          	and	t1,t1,a3
a0005ea4:	00686833          	or	a6,a6,t1
a0005ea8:	41f60333          	sub	t1,a2,t6
            if (((regval & (0x0f << sig_pos)) == (uart_func << sig_pos)) && (i != sig) && (uart_func != 0x0f)) {
a0005eac:	f6ee06e3          	beq	t3,a4,a0005e18 <bflb_gpio_uart_init+0x104>
                regval |= (0x0f << sig_pos);
a0005eb0:	4268168b          	mvnez	a3,a6,t1
a0005eb4:	b795                	j	a0005e18 <bflb_gpio_uart_init+0x104>
                regval2 |= (0x0f << sig_pos);
a0005eb6:	fff74893          	not	a7,a4
a0005eba:	00d8f8b3          	and	a7,a7,a3
a0005ebe:	01176733          	or	a4,a4,a7
a0005ec2:	41c608b3          	sub	a7,a2,t3
a0005ec6:	4317168b          	mvnez	a3,a4,a7
        for (uint8_t i = 8; i < 12; i++) {
a0005eca:	ede793e3          	bne	a5,t5,a0005d90 <bflb_gpio_uart_init+0x7c>
a0005ece:	bde1                	j	a0005da6 <bflb_gpio_uart_init+0x92>

a0005ed0 <bflb_i2c_init>:
void bflb_i2c_init(struct bflb_device_s *dev, uint32_t frequency)
{
    uint32_t regval;
    uint32_t reg_base;

    reg_base = dev->reg_base;
a0005ed0:	415c                	lw	a5,4(a0)
{
a0005ed2:	1141                	addi	sp,sp,-16
a0005ed4:	c422                	sw	s0,8(sp)
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0005ed6:	4394                	lw	a3,0(a5)
{
a0005ed8:	c226                	sw	s1,4(sp)
a0005eda:	c04a                	sw	s2,0(sp)
a0005edc:	c606                	sw	ra,12(sp)
    regval &= ~I2C_CR_I2C_M_EN;
a0005ede:	9af9                	andi	a3,a3,-2
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0005ee0:	c394                	sw	a3,0(a5)
    regval = getreg32(reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a0005ee2:	0807a683          	lw	a3,128(a5) # 1080 <HeapMinSize+0x80>
    regval |= I2C_CR_I2C_ARB_CLR;
a0005ee6:	00190637          	lui	a2,0x190
{
a0005eea:	872a                	mv	a4,a0
    regval |= I2C_RX_FIFO_CLR;
a0005eec:	00c6e693          	ori	a3,a3,12
    putreg32(regval, reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a0005ef0:	08d7a023          	sw	a3,128(a5)
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a0005ef4:	43d4                	lw	a3,4(a5)
{
a0005ef6:	892e                	mv	s2,a1
    phase = bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_I2C, dev->idx) / (freq * 4) - 1;
a0005ef8:	451d                	li	a0,7
    regval |= I2C_CR_I2C_ARB_CLR;
a0005efa:	8ed1                	or	a3,a3,a2
    putreg32(regval, reg_base + I2C_INT_STS_OFFSET);
a0005efc:	c3d4                	sw	a3,4(a5)

    bflb_i2c_disable(dev);

    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a0005efe:	43d4                	lw	a3,4(a5)

    regval |= (I2C_CR_I2C_END_MASK |
a0005f00:	6611                	lui	a2,0x4
a0005f02:	f0060613          	addi	a2,a2,-256 # 3f00 <HeapMinSize+0x2f00>
a0005f06:	8ed1                	or	a3,a3,a2
               I2C_CR_I2C_RXF_MASK |
               I2C_CR_I2C_NAK_MASK |
               I2C_CR_I2C_ARB_MASK |
               I2C_CR_I2C_FER_MASK);

    putreg32(regval, reg_base + I2C_INT_STS_OFFSET);
a0005f08:	c3d4                	sw	a3,4(a5)
    phase = bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_I2C, dev->idx) / (freq * 4) - 1;
a0005f0a:	00974583          	lbu	a1,9(a4)
a0005f0e:	4344                	lw	s1,4(a4)
a0005f10:	00291413          	slli	s0,s2,0x2
a0005f14:	613000ef          	jal	ra,a0006d26 <bflb_clk_get_peripheral_clock>
a0005f18:	02855433          	divu	s0,a0,s0
    if (freq > 100000) {
a0005f1c:	67e1                	lui	a5,0x18
a0005f1e:	6a078793          	addi	a5,a5,1696 # 186a0 <nocache_min_size+0x136a0>
    phase = bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_I2C, dev->idx) / (freq * 4) - 1;
a0005f22:	147d                	addi	s0,s0,-1
        tmp = (phase / 4);
a0005f24:	00245513          	srli	a0,s0,0x2
    if (freq > 100000) {
a0005f28:	0127fa63          	bgeu	a5,s2,a0005f3c <bflb_i2c_init+0x6c>
        tmp = ((phase / 4) / 0.5);
a0005f2c:	c59fd0ef          	jal	ra,a0003b84 <__floatunsidf>
a0005f30:	862a                	mv	a2,a0
a0005f32:	86ae                	mv	a3,a1
a0005f34:	ac7fb0ef          	jal	ra,a00019fa <__adddf3>
a0005f38:	b4bfd0ef          	jal	ra,a0003a82 <__fixunsdfsi>
    regval |= (phase + tmp) << I2C_CR_I2C_PRD_S_PH_1_SHIFT;
a0005f3c:	00a40733          	add	a4,s0,a0
a0005f40:	00871793          	slli	a5,a4,0x8
    regval = (phase - tmp) << I2C_CR_I2C_PRD_S_PH_0_SHIFT;
a0005f44:	40a40533          	sub	a0,s0,a0
    regval |= (phase) << I2C_CR_I2C_PRD_S_PH_2_SHIFT;
a0005f48:	01041693          	slli	a3,s0,0x10
    regval |= (phase) << I2C_CR_I2C_PRD_S_PH_3_SHIFT;
a0005f4c:	0462                	slli	s0,s0,0x18
    regval |= (phase + tmp) << I2C_CR_I2C_PRD_S_PH_1_SHIFT;
a0005f4e:	8fc9                	or	a5,a5,a0
    regval |= (phase) << I2C_CR_I2C_PRD_S_PH_3_SHIFT;
a0005f50:	8c55                	or	s0,s0,a3
a0005f52:	8c5d                	or	s0,s0,a5
    putreg32(regval, reg_base + I2C_PRD_START_OFFSET);
a0005f54:	c880                	sw	s0,16(s1)
    regval |= (phase + tmp) << I2C_CR_I2C_PRD_D_PH_2_SHIFT;
a0005f56:	0742                	slli	a4,a4,0x10
    regval |= (phase - tmp) << I2C_CR_I2C_PRD_D_PH_3_SHIFT;
a0005f58:	0562                	slli	a0,a0,0x18
    putreg32(regval, reg_base + I2C_PRD_STOP_OFFSET);
a0005f5a:	c8c0                	sw	s0,20(s1)

    bflb_i2c_set_frequence(dev, frequency);
}
a0005f5c:	40b2                	lw	ra,12(sp)
a0005f5e:	4422                	lw	s0,8(sp)
a0005f60:	8d59                	or	a0,a0,a4
    regval |= (phase - tmp) << I2C_CR_I2C_PRD_D_PH_3_SHIFT;
a0005f62:	8fc9                	or	a5,a5,a0
    putreg32(regval, reg_base + I2C_PRD_DATA_OFFSET);
a0005f64:	cc9c                	sw	a5,24(s1)
}
a0005f66:	4902                	lw	s2,0(sp)
a0005f68:	4492                	lw	s1,4(sp)
a0005f6a:	0141                	addi	sp,sp,16
a0005f6c:	8082                	ret
	...

a0005f70 <bflb_i2c_transfer>:
    uint16_t subaddr = 0;
    uint16_t subaddr_size = 0;
    bool is_addr_10bit = false;
    int ret = 0;

    bflb_i2c_disable(dev);
a0005f70:	415c                	lw	a5,4(a0)
    regval |= I2C_CR_I2C_ARB_CLR;
a0005f72:	001906b7          	lui	a3,0x190
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0005f76:	4398                	lw	a4,0(a5)
    regval &= ~I2C_CR_I2C_M_EN;
a0005f78:	9b79                	andi	a4,a4,-2
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0005f7a:	c398                	sw	a4,0(a5)
    regval = getreg32(reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a0005f7c:	0807a703          	lw	a4,128(a5)
    regval |= I2C_RX_FIFO_CLR;
a0005f80:	00c76713          	ori	a4,a4,12
    putreg32(regval, reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a0005f84:	08e7a023          	sw	a4,128(a5)
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a0005f88:	43d8                	lw	a4,4(a5)
    regval |= I2C_CR_I2C_ARB_CLR;
a0005f8a:	8f55                	or	a4,a4,a3
    putreg32(regval, reg_base + I2C_INT_STS_OFFSET);
a0005f8c:	c3d8                	sw	a4,4(a5)

    for (uint16_t i = 0; i < count; i++) {
a0005f8e:	3ec05c63          	blez	a2,a0006386 <bflb_i2c_transfer+0x416>
{
a0005f92:	715d                	addi	sp,sp,-80
    regval &= ~I2C_CR_I2C_SLV_ADDR_MASK;
a0005f94:	fffc07b7          	lui	a5,0xfffc0
{
a0005f98:	d266                	sw	s9,36(sp)
    regval &= ~I2C_CR_I2C_SLV_ADDR_MASK;
a0005f9a:	0ff78793          	addi	a5,a5,255 # fffc00ff <__psram_limit+0x57bc00ff>
    regval &= ~I2C_CR_I2C_PKT_LEN_MASK;
a0005f9e:	f0100cb7          	lui	s9,0xf0100
{
a0005fa2:	c4a2                	sw	s0,72(sp)
a0005fa4:	c2a6                	sw	s1,68(sp)
a0005fa6:	c0ca                	sw	s2,64(sp)
a0005fa8:	d65e                	sw	s7,44(sp)
a0005faa:	d462                	sw	s8,40(sp)
a0005fac:	c686                	sw	ra,76(sp)
a0005fae:	de4e                	sw	s3,60(sp)
a0005fb0:	dc52                	sw	s4,56(sp)
a0005fb2:	da56                	sw	s5,52(sp)
a0005fb4:	d85a                	sw	s6,48(sp)
a0005fb6:	d06a                	sw	s10,32(sp)
a0005fb8:	ce6e                	sw	s11,28(sp)
a0005fba:	4401                	li	s0,0
a0005fbc:	8bae                	mv	s7,a1
a0005fbe:	8c32                	mv	s8,a2
a0005fc0:	892a                	mv	s2,a0
    regval &= ~I2C_CR_I2C_SLV_ADDR_MASK;
a0005fc2:	c43e                	sw	a5,8(sp)
    regval &= ~I2C_CR_I2C_PKT_LEN_MASK;
a0005fc4:	1cfd                	addi	s9,s9,-1
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a0005fc6:	06400493          	li	s1,100
a0005fca:	a015                	j	a0005fee <bflb_i2c_transfer+0x7e>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0005fcc:	421c                	lw	a5,0(a2)
        regval |= I2C_CR_I2C_PKT_DIR;
a0005fce:	0027e793          	ori	a5,a5,2
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0005fd2:	c21c                	sw	a5,0(a2)
            return -EINVAL;
        }
        bflb_i2c_set_datalen(dev, msgs[i].length);
        if (msgs[i].flags & I2C_M_READ) {
            bflb_i2c_set_dir(dev, 1);
            if ((msgs[i].flags & I2C_M_DMA) == 0) {
a0005fd4:	24068963          	beqz	a3,a0006226 <bflb_i2c_transfer+0x2b6>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0005fd8:	00492703          	lw	a4,4(s2)
a0005fdc:	431c                	lw	a5,0(a4)
    regval |= I2C_CR_I2C_M_EN;
a0005fde:	0017e793          	ori	a5,a5,1
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0005fe2:	c31c                	sw	a5,0(a4)
    for (uint16_t i = 0; i < count; i++) {
a0005fe4:	0405                	addi	s0,s0,1
a0005fe6:	3c04340b          	extu	s0,s0,15,0
a0005fea:	1d845263          	bge	s0,s8,a00061ae <bflb_i2c_transfer+0x23e>
        if (msgs[i].flags & I2C_M_TEN) {
a0005fee:	0284178b          	addsl	a5,s0,s0,1
a0005ff2:	04fb970b          	addsl	a4,s7,a5,2
a0005ff6:	00275503          	lhu	a0,2(a4)
    regval |= (slaveaddr << I2C_CR_I2C_SLV_ADDR_SHIFT);
a0005ffa:	a4fbc78b          	lrhu	a5,s7,a5,2
a0005ffe:	00492583          	lw	a1,4(s2)
        if (msgs[i].flags & I2C_M_NOSTOP) {
a0006002:	04057693          	andi	a3,a0,64
            for (uint8_t j = 0; j < msgs[i].length; j++) {
a0006006:	00875983          	lhu	s3,8(a4)
a000600a:	8909                	andi	a0,a0,2
    regval |= (slaveaddr << I2C_CR_I2C_SLV_ADDR_SHIFT);
a000600c:	00879813          	slli	a6,a5,0x8
        if (msgs[i].flags & I2C_M_NOSTOP) {
a0006010:	1a069163          	bnez	a3,a00061b2 <bflb_i2c_transfer+0x242>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0006014:	419c                	lw	a5,0(a1)
    regval &= ~I2C_CR_I2C_SLV_ADDR_MASK;
a0006016:	fffc06b7          	lui	a3,0xfffc0
a000601a:	0ef68693          	addi	a3,a3,239 # fffc00ef <__psram_limit+0x57bc00ef>
a000601e:	8ff5                	and	a5,a5,a3
    regval |= (slaveaddr << I2C_CR_I2C_SLV_ADDR_SHIFT);
a0006020:	0107e7b3          	or	a5,a5,a6
        regval |= I2C_CR_I2C_10B_ADDR_EN;
a0006024:	0807e693          	ori	a3,a5,128
a0006028:	f7f7f793          	andi	a5,a5,-129
a000602c:	42a6978b          	mvnez	a5,a3,a0
    regval &= ~I2C_CR_I2C_SCL_SYNC_EN;
a0006030:	9bdd                	andi	a5,a5,-9
    putreg32(subaddr, reg_base + I2C_SUB_ADDR_OFFSET);
a0006032:	0005a423          	sw	zero,8(a1)
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0006036:	c19c                	sw	a5,0(a1)
        if (msgs[i].length > 256) {
a0006038:	10000793          	li	a5,256
a000603c:	1f37e363          	bltu	a5,s3,a0006222 <bflb_i2c_transfer+0x2b2>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0006040:	00492583          	lw	a1,4(s2)
    regval |= ((data_len - 1) << I2C_CR_I2C_PKT_LEN_SHIFT) & I2C_CR_I2C_PKT_LEN_MASK;
a0006044:	fff98793          	addi	a5,s3,-1
        if (msgs[i].flags & I2C_M_READ) {
a0006048:	00275683          	lhu	a3,2(a4)
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a000604c:	4190                	lw	a2,0(a1)
    regval |= ((data_len - 1) << I2C_CR_I2C_PKT_LEN_SHIFT) & I2C_CR_I2C_PKT_LEN_MASK;
a000604e:	07d2                	slli	a5,a5,0x14
a0006050:	0ff00537          	lui	a0,0xff00
    regval &= ~I2C_CR_I2C_PKT_LEN_MASK;
a0006054:	01967633          	and	a2,a2,s9
    regval |= ((data_len - 1) << I2C_CR_I2C_PKT_LEN_SHIFT) & I2C_CR_I2C_PKT_LEN_MASK;
a0006058:	8fe9                	and	a5,a5,a0
a000605a:	8fd1                	or	a5,a5,a2
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a000605c:	c19c                	sw	a5,0(a1)
        if (msgs[i].flags & I2C_M_READ) {
a000605e:	0016f793          	andi	a5,a3,1
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0006062:	00492603          	lw	a2,4(s2)
a0006066:	8a91                	andi	a3,a3,4
        if (msgs[i].flags & I2C_M_READ) {
a0006068:	f3b5                	bnez	a5,a0005fcc <bflb_i2c_transfer+0x5c>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a000606a:	421c                	lw	a5,0(a2)
        regval &= ~I2C_CR_I2C_PKT_DIR;
a000606c:	9bf5                	andi	a5,a5,-3
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a000606e:	c21c                	sw	a5,0(a2)
            } else {
                bflb_i2c_enable(dev);
            }
        } else {
            bflb_i2c_set_dir(dev, 0);
            if ((msgs[i].flags & I2C_M_DMA) == 0) {
a0006070:	f6a5                	bnez	a3,a0005fd8 <bflb_i2c_transfer+0x68>
                ret = bflb_i2c_write_bytes(dev, msgs[i].buffer, msgs[i].length);
a0006072:	00472d03          	lw	s10,4(a4)
    reg_base = dev->reg_base;
a0006076:	00492703          	lw	a4,4(s2)
                ret = bflb_i2c_write_bytes(dev, msgs[i].buffer, msgs[i].length);
a000607a:	c24e                	sw	s3,4(sp)
    while (len >= 4) {
a000607c:	478d                	li	a5,3
    reg_base = dev->reg_base;
a000607e:	c63a                	sw	a4,12(sp)
    while (len >= 4) {
a0006080:	0737f963          	bgeu	a5,s3,a00060f2 <bflb_i2c_transfer+0x182>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_TX_FIFO_CNT_MASK) == 0) {
a0006084:	08470993          	addi	s3,a4,132
        for (uint8_t i = 0; i < 4; i++) {
a0006088:	4d91                	li	s11,4
        for (uint8_t i = 0; i < len; i++) {
a000608a:	4781                	li	a5,0
a000608c:	4b01                	li	s6,0
            temp += (tmp_buf[i] << ((i % 4) * 8));
a000608e:	80fd470b          	lrbu	a4,s10,a5,0
a0006092:	00379693          	slli	a3,a5,0x3
        for (uint8_t i = 0; i < 4; i++) {
a0006096:	0785                	addi	a5,a5,1
            temp += (tmp_buf[i] << ((i % 4) * 8));
a0006098:	00d71733          	sll	a4,a4,a3
a000609c:	9b3a                	add	s6,s6,a4
        for (uint8_t i = 0; i < 4; i++) {
a000609e:	ffb798e3          	bne	a5,s11,a000608e <bflb_i2c_transfer+0x11e>
        start_time = bflb_mtimer_get_time_ms();
a00060a2:	c2fba097          	auipc	ra,0xc2fba
a00060a6:	526080e7          	jalr	1318(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a00060aa:	8a2a                	mv	s4,a0
a00060ac:	8aae                	mv	s5,a1
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_TX_FIFO_CNT_MASK) == 0) {
a00060ae:	a819                	j	a00060c4 <bflb_i2c_transfer+0x154>
            if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a00060b0:	c2fba097          	auipc	ra,0xc2fba
a00060b4:	518080e7          	jalr	1304(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a00060b8:	c3451577          	sub64	a0,a0,s4
a00060bc:	20059a63          	bnez	a1,a00062d0 <bflb_i2c_transfer+0x360>
a00060c0:	20a4e863          	bltu	s1,a0,a00062d0 <bflb_i2c_transfer+0x360>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_TX_FIFO_CNT_MASK) == 0) {
a00060c4:	0009a783          	lw	a5,0(s3)
a00060c8:	8b8d                	andi	a5,a5,3
a00060ca:	d3fd                	beqz	a5,a00060b0 <bflb_i2c_transfer+0x140>
        putreg32(temp, reg_base + I2C_FIFO_WDATA_OFFSET);
a00060cc:	47b2                	lw	a5,12(sp)
a00060ce:	0967a423          	sw	s6,136(a5)
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a00060d2:	00492703          	lw	a4,4(s2)
a00060d6:	431c                	lw	a5,0(a4)
        if (!bflb_i2c_isenable(dev)) {
a00060d8:	8b85                	andi	a5,a5,1
a00060da:	e789                	bnez	a5,a00060e4 <bflb_i2c_transfer+0x174>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a00060dc:	431c                	lw	a5,0(a4)
    regval |= I2C_CR_I2C_M_EN;
a00060de:	0017e793          	ori	a5,a5,1
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a00060e2:	c31c                	sw	a5,0(a4)
        len -= 4;
a00060e4:	4792                	lw	a5,4(sp)
    while (len >= 4) {
a00060e6:	470d                	li	a4,3
        tmp_buf += 4;
a00060e8:	0d11                	addi	s10,s10,4
        len -= 4;
a00060ea:	17f1                	addi	a5,a5,-4
a00060ec:	c23e                	sw	a5,4(sp)
    while (len >= 4) {
a00060ee:	f8f76ee3          	bltu	a4,a5,a000608a <bflb_i2c_transfer+0x11a>
    if (len > 0) {
a00060f2:	4792                	lw	a5,4(sp)
a00060f4:	c7a5                	beqz	a5,a000615c <bflb_i2c_transfer+0x1ec>
a00060f6:	4981                	li	s3,0
        for (uint8_t i = 0; i < len; i++) {
a00060f8:	4781                	li	a5,0
a00060fa:	4701                	li	a4,0
            temp += (tmp_buf[i] << ((i % 4) * 8));
a00060fc:	80ed470b          	lrbu	a4,s10,a4,0
a0006100:	0037f693          	andi	a3,a5,3
a0006104:	068e                	slli	a3,a3,0x3
a0006106:	00d71733          	sll	a4,a4,a3
        for (uint8_t i = 0; i < len; i++) {
a000610a:	4692                	lw	a3,4(sp)
a000610c:	0785                	addi	a5,a5,1
a000610e:	0ff7f793          	andi	a5,a5,255
            temp += (tmp_buf[i] << ((i % 4) * 8));
a0006112:	99ba                	add	s3,s3,a4
        for (uint8_t i = 0; i < len; i++) {
a0006114:	873e                	mv	a4,a5
a0006116:	fed7e3e3          	bltu	a5,a3,a00060fc <bflb_i2c_transfer+0x18c>
        start_time = bflb_mtimer_get_time_ms();
a000611a:	c2fba097          	auipc	ra,0xc2fba
a000611e:	4ae080e7          	jalr	1198(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_TX_FIFO_CNT_MASK) == 0) {
a0006122:	47b2                	lw	a5,12(sp)
        start_time = bflb_mtimer_get_time_ms();
a0006124:	8a2a                	mv	s4,a0
a0006126:	8aae                	mv	s5,a1
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_TX_FIFO_CNT_MASK) == 0) {
a0006128:	08478b13          	addi	s6,a5,132
a000612c:	a819                	j	a0006142 <bflb_i2c_transfer+0x1d2>
            if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a000612e:	c2fba097          	auipc	ra,0xc2fba
a0006132:	49a080e7          	jalr	1178(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a0006136:	c3451577          	sub64	a0,a0,s4
a000613a:	18059b63          	bnez	a1,a00062d0 <bflb_i2c_transfer+0x360>
a000613e:	18a4e963          	bltu	s1,a0,a00062d0 <bflb_i2c_transfer+0x360>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_TX_FIFO_CNT_MASK) == 0) {
a0006142:	000b2783          	lw	a5,0(s6)
a0006146:	8b8d                	andi	a5,a5,3
a0006148:	d3fd                	beqz	a5,a000612e <bflb_i2c_transfer+0x1be>
        putreg32(temp, reg_base + I2C_FIFO_WDATA_OFFSET);
a000614a:	47b2                	lw	a5,12(sp)
a000614c:	0937a423          	sw	s3,136(a5)
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0006150:	00492783          	lw	a5,4(s2)
a0006154:	4398                	lw	a4,0(a5)
        if (!bflb_i2c_isenable(dev)) {
a0006156:	8b05                	andi	a4,a4,1
a0006158:	22070263          	beqz	a4,a000637c <bflb_i2c_transfer+0x40c>
    start_time = bflb_mtimer_get_time_ms();
a000615c:	c2fba097          	auipc	ra,0xc2fba
a0006160:	46c080e7          	jalr	1132(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a0006164:	8a2a                	mv	s4,a0
a0006166:	8aae                	mv	s5,a1
    reg_base = dev->reg_base;
a0006168:	00492783          	lw	a5,4(s2)
    regval = getreg32(reg_base + I2C_BUS_BUSY_OFFSET);
a000616c:	47d8                	lw	a4,12(a5)
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a000616e:	00478693          	addi	a3,a5,4
    while (bflb_i2c_isbusy(dev) || !bflb_i2c_isend(dev) || bflb_i2c_isnak(dev)) {
a0006172:	8b05                	andi	a4,a4,1
a0006174:	1c071b63          	bnez	a4,a000634a <bflb_i2c_transfer+0x3da>
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a0006178:	43d8                	lw	a4,4(a5)
    while (bflb_i2c_isbusy(dev) || !bflb_i2c_isend(dev) || bflb_i2c_isnak(dev)) {
a000617a:	8b05                	andi	a4,a4,1
a000617c:	1c070763          	beqz	a4,a000634a <bflb_i2c_transfer+0x3da>
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a0006180:	43d8                	lw	a4,4(a5)
    if (regval & I2C_NAK_INT) {
a0006182:	8b21                	andi	a4,a4,8
a0006184:	1c071363          	bnez	a4,a000634a <bflb_i2c_transfer+0x3da>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0006188:	4398                	lw	a4,0(a5)
    for (uint16_t i = 0; i < count; i++) {
a000618a:	0405                	addi	s0,s0,1
a000618c:	3c04340b          	extu	s0,s0,15,0
    regval &= ~I2C_CR_I2C_M_EN;
a0006190:	9b79                	andi	a4,a4,-2
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0006192:	c398                	sw	a4,0(a5)
    regval = getreg32(reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a0006194:	0807a703          	lw	a4,128(a5)
    regval |= I2C_RX_FIFO_CLR;
a0006198:	00c76713          	ori	a4,a4,12
    putreg32(regval, reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a000619c:	08e7a023          	sw	a4,128(a5)
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a00061a0:	43dc                	lw	a5,4(a5)
    regval |= I2C_CR_I2C_ARB_CLR;
a00061a2:	00190737          	lui	a4,0x190
a00061a6:	8fd9                	or	a5,a5,a4
    putreg32(regval, reg_base + I2C_INT_STS_OFFSET);
a00061a8:	c29c                	sw	a5,0(a3)
    for (uint16_t i = 0; i < count; i++) {
a00061aa:	e58442e3          	blt	s0,s8,a0005fee <bflb_i2c_transfer+0x7e>
                bflb_i2c_enable(dev);
            }
        }
    }

    return 0;
a00061ae:	4501                	li	a0,0
a00061b0:	a215                	j	a00062d4 <bflb_i2c_transfer+0x364>
            for (uint8_t j = 0; j < msgs[i].length; j++) {
a00061b2:	14098063          	beqz	s3,a00062f2 <bflb_i2c_transfer+0x382>
                subaddr += msgs[i].buffer[j] << (j * 8);
a00061b6:	00472883          	lw	a7,4(a4) # 190004 <nocache_min_size+0x18b004>
            for (uint8_t j = 0; j < msgs[i].length; j++) {
a00061ba:	4781                	li	a5,0
            subaddr = 0;
a00061bc:	4701                	li	a4,0
a00061be:	0001                	nop
                subaddr += msgs[i].buffer[j] << (j * 8);
a00061c0:	80f8c68b          	lrbu	a3,a7,a5,0
a00061c4:	00379613          	slli	a2,a5,0x3
            for (uint8_t j = 0; j < msgs[i].length; j++) {
a00061c8:	0785                	addi	a5,a5,1
                subaddr += msgs[i].buffer[j] << (j * 8);
a00061ca:	00c696b3          	sll	a3,a3,a2
a00061ce:	9736                	add	a4,a4,a3
            for (uint8_t j = 0; j < msgs[i].length; j++) {
a00061d0:	0ff7f793          	andi	a5,a5,255
                subaddr += msgs[i].buffer[j] << (j * 8);
a00061d4:	3c07370b          	extu	a4,a4,15,0
            for (uint8_t j = 0; j < msgs[i].length; j++) {
a00061d8:	ff37e4e3          	bltu	a5,s3,a00061c0 <bflb_i2c_transfer+0x250>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a00061dc:	4194                	lw	a3,0(a1)
        regval |= ((subaddr_size - 1) << I2C_CR_I2C_SUB_ADDR_BC_SHIFT);
a00061de:	19fd                	addi	s3,s3,-1
a00061e0:	00599793          	slli	a5,s3,0x5
a00061e4:	f9f6f693          	andi	a3,a3,-97
a00061e8:	8fd5                	or	a5,a5,a3
a00061ea:	0107e793          	ori	a5,a5,16
    regval &= ~I2C_CR_I2C_SLV_ADDR_MASK;
a00061ee:	46a2                	lw	a3,8(sp)
            i++;
a00061f0:	0405                	addi	s0,s0,1
a00061f2:	3c04340b          	extu	s0,s0,15,0
    regval &= ~I2C_CR_I2C_SLV_ADDR_MASK;
a00061f6:	8ff5                	and	a5,a5,a3
    regval |= (slaveaddr << I2C_CR_I2C_SLV_ADDR_SHIFT);
a00061f8:	0107e7b3          	or	a5,a5,a6
        regval |= I2C_CR_I2C_10B_ADDR_EN;
a00061fc:	0807e693          	ori	a3,a5,128
a0006200:	f7f7f793          	andi	a5,a5,-129
a0006204:	42a6978b          	mvnez	a5,a3,a0
        if (msgs[i].length > 256) {
a0006208:	0284168b          	addsl	a3,s0,s0,1
    putreg32(subaddr, reg_base + I2C_SUB_ADDR_OFFSET);
a000620c:	c598                	sw	a4,8(a1)
        if (msgs[i].length > 256) {
a000620e:	04db970b          	addsl	a4,s7,a3,2
a0006212:	00875983          	lhu	s3,8(a4)
    regval &= ~I2C_CR_I2C_SCL_SYNC_EN;
a0006216:	9bdd                	andi	a5,a5,-9
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0006218:	c19c                	sw	a5,0(a1)
        if (msgs[i].length > 256) {
a000621a:	10000793          	li	a5,256
a000621e:	e337f1e3          	bgeu	a5,s3,a0006040 <bflb_i2c_transfer+0xd0>
            return -EINVAL;
a0006222:	5529                	li	a0,-22
a0006224:	a845                	j	a00062d4 <bflb_i2c_transfer+0x364>
    reg_base = dev->reg_base;
a0006226:	00492d83          	lw	s11,4(s2)
                ret = bflb_i2c_read_bytes(dev, msgs[i].buffer, msgs[i].length);
a000622a:	00472d03          	lw	s10,4(a4)
    while (len >= 4) {
a000622e:	470d                	li	a4,3
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a0006230:	000da783          	lw	a5,0(s11)
    regval |= I2C_CR_I2C_M_EN;
a0006234:	0017e793          	ori	a5,a5,1
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0006238:	00fda023          	sw	a5,0(s11)
    while (len >= 4) {
a000623c:	05377e63          	bgeu	a4,s3,a0006298 <bflb_i2c_transfer+0x328>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_RX_FIFO_CNT_MASK) == 0) {
a0006240:	084d8b13          	addi	s6,s11,132
        start_time = bflb_mtimer_get_time_ms();
a0006244:	c2fba097          	auipc	ra,0xc2fba
a0006248:	384080e7          	jalr	900(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a000624c:	8a2a                	mv	s4,a0
a000624e:	8aae                	mv	s5,a1
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_RX_FIFO_CNT_MASK) == 0) {
a0006250:	a811                	j	a0006264 <bflb_i2c_transfer+0x2f4>
            if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a0006252:	c2fba097          	auipc	ra,0xc2fba
a0006256:	376080e7          	jalr	886(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a000625a:	c3451577          	sub64	a0,a0,s4
a000625e:	e9ad                	bnez	a1,a00062d0 <bflb_i2c_transfer+0x360>
a0006260:	06a4e863          	bltu	s1,a0,a00062d0 <bflb_i2c_transfer+0x360>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_RX_FIFO_CNT_MASK) == 0) {
a0006264:	000b2783          	lw	a5,0(s6)
a0006268:	3007f793          	andi	a5,a5,768
a000626c:	d3fd                	beqz	a5,a0006252 <bflb_i2c_transfer+0x2e2>
        temp = getreg32(reg_base + I2C_FIFO_RDATA_OFFSET);
a000626e:	08cda783          	lw	a5,140(s11)
        len -= 4;
a0006272:	19f1                	addi	s3,s3,-4
        tmp_buf += 4;
a0006274:	0d11                	addi	s10,s10,4
        PUT_UINT32_LE(tmp_buf, temp);
a0006276:	0087d613          	srli	a2,a5,0x8
a000627a:	0107d693          	srli	a3,a5,0x10
a000627e:	0187d713          	srli	a4,a5,0x18
a0006282:	fefd0e23          	sb	a5,-4(s10)
a0006286:	fecd0ea3          	sb	a2,-3(s10)
a000628a:	fedd0f23          	sb	a3,-2(s10)
a000628e:	feed0fa3          	sb	a4,-1(s10)
    while (len >= 4) {
a0006292:	478d                	li	a5,3
a0006294:	fb37e8e3          	bltu	a5,s3,a0006244 <bflb_i2c_transfer+0x2d4>
    if (len > 0) {
a0006298:	06099163          	bnez	s3,a00062fa <bflb_i2c_transfer+0x38a>
    start_time = bflb_mtimer_get_time_ms();
a000629c:	c2fba097          	auipc	ra,0xc2fba
a00062a0:	32c080e7          	jalr	812(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a00062a4:	8a2a                	mv	s4,a0
a00062a6:	8aae                	mv	s5,a1
    while (bflb_i2c_isbusy(dev) || !bflb_i2c_isend(dev)) {
a00062a8:	a019                	j	a00062ae <bflb_i2c_transfer+0x33e>
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a00062aa:	02a4e363          	bltu	s1,a0,a00062d0 <bflb_i2c_transfer+0x360>
    reg_base = dev->reg_base;
a00062ae:	00492703          	lw	a4,4(s2)
    regval = getreg32(reg_base + I2C_BUS_BUSY_OFFSET);
a00062b2:	475c                	lw	a5,12(a4)
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a00062b4:	00470693          	addi	a3,a4,4
    while (bflb_i2c_isbusy(dev) || !bflb_i2c_isend(dev)) {
a00062b8:	8b85                	andi	a5,a5,1
a00062ba:	e781                	bnez	a5,a00062c2 <bflb_i2c_transfer+0x352>
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a00062bc:	435c                	lw	a5,4(a4)
    while (bflb_i2c_isbusy(dev) || !bflb_i2c_isend(dev)) {
a00062be:	8b85                	andi	a5,a5,1
a00062c0:	efd9                	bnez	a5,a000635e <bflb_i2c_transfer+0x3ee>
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a00062c2:	c2fba097          	auipc	ra,0xc2fba
a00062c6:	306080e7          	jalr	774(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a00062ca:	c3451577          	sub64	a0,a0,s4
a00062ce:	ddf1                	beqz	a1,a00062aa <bflb_i2c_transfer+0x33a>
        for (uint8_t i = 0; i < len; i++) {
a00062d0:	f8c00513          	li	a0,-116
}
a00062d4:	40b6                	lw	ra,76(sp)
a00062d6:	4426                	lw	s0,72(sp)
a00062d8:	4496                	lw	s1,68(sp)
a00062da:	4906                	lw	s2,64(sp)
a00062dc:	59f2                	lw	s3,60(sp)
a00062de:	5a62                	lw	s4,56(sp)
a00062e0:	5ad2                	lw	s5,52(sp)
a00062e2:	5b42                	lw	s6,48(sp)
a00062e4:	5bb2                	lw	s7,44(sp)
a00062e6:	5c22                	lw	s8,40(sp)
a00062e8:	5c92                	lw	s9,36(sp)
a00062ea:	5d02                	lw	s10,32(sp)
a00062ec:	4df2                	lw	s11,28(sp)
a00062ee:	6161                	addi	sp,sp,80
a00062f0:	8082                	ret
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a00062f2:	419c                	lw	a5,0(a1)
        regval &= ~I2C_CR_I2C_SUB_ADDR_EN;
a00062f4:	4701                	li	a4,0
a00062f6:	9bbd                	andi	a5,a5,-17
a00062f8:	bddd                	j	a00061ee <bflb_i2c_transfer+0x27e>
        start_time = bflb_mtimer_get_time_ms();
a00062fa:	c2fba097          	auipc	ra,0xc2fba
a00062fe:	2ce080e7          	jalr	718(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a0006302:	8a2a                	mv	s4,a0
a0006304:	8aae                	mv	s5,a1
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_RX_FIFO_CNT_MASK) == 0) {
a0006306:	084d8b13          	addi	s6,s11,132
a000630a:	a811                	j	a000631e <bflb_i2c_transfer+0x3ae>
            if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a000630c:	c2fba097          	auipc	ra,0xc2fba
a0006310:	2bc080e7          	jalr	700(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a0006314:	c3451577          	sub64	a0,a0,s4
a0006318:	fdc5                	bnez	a1,a00062d0 <bflb_i2c_transfer+0x360>
a000631a:	faa4ebe3          	bltu	s1,a0,a00062d0 <bflb_i2c_transfer+0x360>
        while ((getreg32(reg_base + I2C_FIFO_CONFIG_1_OFFSET) & I2C_RX_FIFO_CNT_MASK) == 0) {
a000631e:	000b2783          	lw	a5,0(s6)
a0006322:	3007f793          	andi	a5,a5,768
a0006326:	d3fd                	beqz	a5,a000630c <bflb_i2c_transfer+0x39c>
        temp = getreg32(reg_base + I2C_FIFO_RDATA_OFFSET);
a0006328:	08cda603          	lw	a2,140(s11)
        for (uint8_t i = 0; i < len; i++) {
a000632c:	4681                	li	a3,0
a000632e:	4781                	li	a5,0
            tmp_buf[i] = (temp >> (i * 8)) & 0xff;
a0006330:	00379713          	slli	a4,a5,0x3
a0006334:	00e65733          	srl	a4,a2,a4
        for (uint8_t i = 0; i < len; i++) {
a0006338:	0785                	addi	a5,a5,1
            tmp_buf[i] = (temp >> (i * 8)) & 0xff;
a000633a:	00dd570b          	srb	a4,s10,a3,0
        for (uint8_t i = 0; i < len; i++) {
a000633e:	0ff7f793          	andi	a5,a5,255
a0006342:	86be                	mv	a3,a5
a0006344:	ff37e6e3          	bltu	a5,s3,a0006330 <bflb_i2c_transfer+0x3c0>
a0006348:	bf91                	j	a000629c <bflb_i2c_transfer+0x32c>
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
a000634a:	c2fba097          	auipc	ra,0xc2fba
a000634e:	27e080e7          	jalr	638(ra) # 62fc05c8 <bflb_mtimer_get_time_ms>
a0006352:	c3451577          	sub64	a0,a0,s4
a0006356:	fdad                	bnez	a1,a00062d0 <bflb_i2c_transfer+0x360>
a0006358:	e0a4f8e3          	bgeu	s1,a0,a0006168 <bflb_i2c_transfer+0x1f8>
a000635c:	bf95                	j	a00062d0 <bflb_i2c_transfer+0x360>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a000635e:	431c                	lw	a5,0(a4)
    regval &= ~I2C_CR_I2C_M_EN;
a0006360:	9bf9                	andi	a5,a5,-2
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0006362:	c31c                	sw	a5,0(a4)
    regval = getreg32(reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a0006364:	08072783          	lw	a5,128(a4)
    regval |= I2C_RX_FIFO_CLR;
a0006368:	00c7e793          	ori	a5,a5,12
    putreg32(regval, reg_base + I2C_FIFO_CONFIG_0_OFFSET);
a000636c:	08f72023          	sw	a5,128(a4)
    regval = getreg32(reg_base + I2C_INT_STS_OFFSET);
a0006370:	435c                	lw	a5,4(a4)
    regval |= I2C_CR_I2C_ARB_CLR;
a0006372:	00190737          	lui	a4,0x190
a0006376:	8fd9                	or	a5,a5,a4
    putreg32(regval, reg_base + I2C_INT_STS_OFFSET);
a0006378:	c29c                	sw	a5,0(a3)
                if (ret < 0) {
a000637a:	b1ad                	j	a0005fe4 <bflb_i2c_transfer+0x74>
    regval = getreg32(reg_base + I2C_CONFIG_OFFSET);
a000637c:	4398                	lw	a4,0(a5)
    regval |= I2C_CR_I2C_M_EN;
a000637e:	00176713          	ori	a4,a4,1
    putreg32(regval, reg_base + I2C_CONFIG_OFFSET);
a0006382:	c398                	sw	a4,0(a5)
}
a0006384:	bbe1                	j	a000615c <bflb_i2c_transfer+0x1ec>
    return 0;
a0006386:	4501                	li	a0,0
}
a0006388:	8082                	ret
	...

a000638c <bflb_uart_init>:
#include "hardware/uart_reg.h"

#define UART_TX_TIMEOUT_COUNT (160 * 1000)

void bflb_uart_init(struct bflb_device_s *dev, const struct bflb_uart_config_s *config)
{
a000638c:	1141                	addi	sp,sp,-16
a000638e:	c422                	sw	s0,8(sp)
a0006390:	c226                	sw	s1,4(sp)
a0006392:	c606                	sw	ra,12(sp)
a0006394:	84ae                	mv	s1,a1
    uint32_t reg_base;
    uint32_t regval;

    reg_base = dev->reg_base;
    /* Cal the baud rate divisor */
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
a0006396:	00954583          	lbu	a1,9(a0) # ff00009 <nocache_min_size+0xfefb009>
{
a000639a:	87aa                	mv	a5,a0
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
a000639c:	4515                	li	a0,5
    reg_base = dev->reg_base;
a000639e:	43c0                	lw	s0,4(a5)
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
a00063a0:	187000ef          	jal	ra,a0006d26 <bflb_clk_get_peripheral_clock>
a00063a4:	4098                	lw	a4,0(s1)
a00063a6:	04a5150b          	addsl	a0,a0,a0,2
a00063aa:	00151793          	slli	a5,a0,0x1
a00063ae:	02e7d7b3          	divu	a5,a5,a4

    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
a00063b2:	4014                	lw	a3,0(s0)
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
a00063b4:	4058                	lw	a4,4(s0)
    /* configure parity type */

    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);

    switch (config->parity) {
a00063b6:	4585                	li	a1,1
    tx_cfg &= ~UART_CR_UTX_EN;
a00063b8:	9af9                	andi	a3,a3,-2
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
a00063ba:	c014                	sw	a3,0(s0)
    rx_cfg &= ~UART_CR_URX_EN;
a00063bc:	9b79                	andi	a4,a4,-2
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
a00063be:	c058                	sw	a4,4(s0)
    div = (bflb_clk_get_peripheral_clock(BFLB_DEVICE_TYPE_UART, dev->idx) * 10 / config->baudrate + 5) / 10;
a00063c0:	4729                	li	a4,10
a00063c2:	0795                	addi	a5,a5,5
a00063c4:	02e7d7b3          	divu	a5,a5,a4
    putreg32(((div - 1) << 0x10) | ((div - 1) & 0xFFFF), reg_base + UART_BIT_PRD_OFFSET);
a00063c8:	17fd                	addi	a5,a5,-1
a00063ca:	0ef797f7          	pkbb16	a5,a5,a5
a00063ce:	c41c                	sw	a5,8(s0)
    switch (config->parity) {
a00063d0:	0074c783          	lbu	a5,7(s1)
    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
a00063d4:	4014                	lw	a3,0(s0)
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
a00063d6:	4050                	lw	a2,4(s0)
    switch (config->parity) {
a00063d8:	0ab78e63          	beq	a5,a1,a0006494 <bflb_uart_init+0x108>
a00063dc:	4709                	li	a4,2
a00063de:	0ce78363          	beq	a5,a4,a00064a4 <bflb_uart_init+0x118>
a00063e2:	0a078e63          	beqz	a5,a000649e <bflb_uart_init+0x112>
            break;
    }

    /* Configure data bits */
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_D_MASK;
    tx_cfg |= (config->data_bits + 4) << UART_CR_UTX_BIT_CNT_D_SHIFT;
a00063e6:	0054c783          	lbu	a5,5(s1)
    rx_cfg &= ~UART_CR_URX_BIT_CNT_D_MASK;
    rx_cfg |= (config->data_bits + 4) << UART_CR_URX_BIT_CNT_D_SHIFT;

    /* Configure tx stop bits */
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
    tx_cfg |= config->stop_bits << UART_CR_UTX_BIT_CNT_P_SHIFT;
a00063ea:	0064c703          	lbu	a4,6(s1)
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_D_MASK;
a00063ee:	8ff6f693          	andi	a3,a3,-1793
    tx_cfg |= (config->data_bits + 4) << UART_CR_UTX_BIT_CNT_D_SHIFT;
a00063f2:	0791                	addi	a5,a5,4
a00063f4:	07a2                	slli	a5,a5,0x8
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
a00063f6:	7579                	lui	a0,0xffffe

    /* Configure tx cts flow control function */
    if (config->flow_ctrl & UART_FLOWCTRL_CTS) {
a00063f8:	0094c583          	lbu	a1,9(s1)
    tx_cfg |= (config->data_bits + 4) << UART_CR_UTX_BIT_CNT_D_SHIFT;
a00063fc:	8edd                	or	a3,a3,a5
    tx_cfg &= ~UART_CR_UTX_BIT_CNT_P_MASK;
a00063fe:	7ff50513          	addi	a0,a0,2047 # ffffe7ff <__psram_limit+0x57bfe7ff>
a0006402:	8ee9                	and	a3,a3,a0
    tx_cfg |= config->stop_bits << UART_CR_UTX_BIT_CNT_P_SHIFT;
a0006404:	072e                	slli	a4,a4,0xb
a0006406:	8f55                	or	a4,a4,a3
    if (config->flow_ctrl & UART_FLOWCTRL_CTS) {
a0006408:	0025f693          	andi	a3,a1,2
        tx_cfg |= UART_CR_UTX_CTS_EN;
a000640c:	00276593          	ori	a1,a4,2
a0006410:	9b75                	andi	a4,a4,-3
a0006412:	42d5970b          	mvnez	a4,a1,a3
    }

    rx_cfg &= ~UART_CR_URX_DEG_EN;

    /* Write back */
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
a0006416:	c018                	sw	a4,0(s0)
    rx_cfg &= ~UART_CR_URX_BIT_CNT_D_MASK;
a0006418:	8ff67613          	andi	a2,a2,-1793
    rx_cfg &= ~UART_CR_URX_DEG_EN;
a000641c:	777d                	lui	a4,0xfffff
    rx_cfg |= (config->data_bits + 4) << UART_CR_URX_BIT_CNT_D_SHIFT;
a000641e:	8fd1                	or	a5,a5,a2
    rx_cfg &= ~UART_CR_URX_DEG_EN;
a0006420:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__psram_limit+0x57bff7ff>
a0006424:	8ff9                	and	a5,a5,a4
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
a0006426:	c05c                	sw	a5,4(s0)
    regval = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
    regval &= ~UART_CR_URX_RTS_SW_MODE;
    putreg32(regval, reg_base + UART_URX_CONFIG_OFFSET);

#else
    regval = getreg32(reg_base + UART_SW_MODE_OFFSET);
a0006428:	4c5c                	lw	a5,28(s0)

    /* Configure FIFO thresholds */
    regval = getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET);
    regval &= ~UART_TX_FIFO_TH_MASK;
    regval &= ~UART_RX_FIFO_TH_MASK;
    regval |= (config->tx_fifo_threshold << UART_TX_FIFO_TH_SHIFT) & UART_TX_FIFO_TH_MASK;
a000642a:	001f0637          	lui	a2,0x1f0
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
    tx_cfg |= UART_CR_UTX_EN;
    rx_cfg |= UART_CR_URX_EN;
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
}
a000642e:	40b2                	lw	ra,12(sp)
    regval &= ~UART_CR_URX_RTS_SW_MODE;
a0006430:	9bed                	andi	a5,a5,-5
    putreg32(regval, reg_base + UART_SW_MODE_OFFSET);
a0006432:	cc5c                	sw	a5,28(s0)
    regval = getreg32(reg_base + UART_DATA_CONFIG_OFFSET);
a0006434:	445c                	lw	a5,12(s0)
    regval &= ~UART_CR_UART_BIT_INV;
a0006436:	9bf9                	andi	a5,a5,-2
    putreg32(regval, reg_base + UART_DATA_CONFIG_OFFSET);
a0006438:	c45c                	sw	a5,12(s0)
    regval = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
a000643a:	401c                	lw	a5,0(s0)
    regval |= UART_CR_UTX_FRM_EN;
a000643c:	0047e793          	ori	a5,a5,4
    putreg32(regval, reg_base + UART_UTX_CONFIG_OFFSET);
a0006440:	c01c                	sw	a5,0(s0)
    regval |= (config->tx_fifo_threshold << UART_TX_FIFO_TH_SHIFT) & UART_TX_FIFO_TH_MASK;
a0006442:	00a4c783          	lbu	a5,10(s1)
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
a0006446:	00b4c703          	lbu	a4,11(s1)
    regval = getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET);
a000644a:	08442683          	lw	a3,132(s0)
    regval |= (config->tx_fifo_threshold << UART_TX_FIFO_TH_SHIFT) & UART_TX_FIFO_TH_MASK;
a000644e:	07c2                	slli	a5,a5,0x10
a0006450:	8ff1                	and	a5,a5,a2
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
a0006452:	0762                	slli	a4,a4,0x18
a0006454:	1f000637          	lui	a2,0x1f000
a0006458:	8f71                	and	a4,a4,a2
    regval &= ~UART_RX_FIFO_TH_MASK;
a000645a:	e0e10637          	lui	a2,0xe0e10
a000645e:	167d                	addi	a2,a2,-1
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
a0006460:	8fd9                	or	a5,a5,a4
    regval &= ~UART_RX_FIFO_TH_MASK;
a0006462:	8ef1                	and	a3,a3,a2
    regval |= (config->rx_fifo_threshold << UART_RX_FIFO_TH_SHIFT) & UART_RX_FIFO_TH_MASK;
a0006464:	8fd5                	or	a5,a5,a3
    putreg32(regval, reg_base + UART_FIFO_CONFIG_1_OFFSET);
a0006466:	08f42223          	sw	a5,132(s0)
    regval = getreg32(reg_base + UART_FIFO_CONFIG_0_OFFSET);
a000646a:	08042783          	lw	a5,128(s0)
}
a000646e:	4492                	lw	s1,4(sp)
a0006470:	9bf1                	andi	a5,a5,-4
    regval &= ~UART_DMA_RX_EN;
a0006472:	00c7e793          	ori	a5,a5,12
    putreg32(regval, reg_base + UART_FIFO_CONFIG_0_OFFSET);
a0006476:	08f42023          	sw	a5,128(s0)
    putreg32(0xFFFFFFFF, reg_base + UART_INT_MASK_OFFSET);
a000647a:	57fd                	li	a5,-1
a000647c:	d05c                	sw	a5,36(s0)
    tx_cfg = getreg32(reg_base + UART_UTX_CONFIG_OFFSET);
a000647e:	4018                	lw	a4,0(s0)
    rx_cfg = getreg32(reg_base + UART_URX_CONFIG_OFFSET);
a0006480:	405c                	lw	a5,4(s0)
    tx_cfg |= UART_CR_UTX_EN;
a0006482:	00176713          	ori	a4,a4,1
    putreg32(tx_cfg, reg_base + UART_UTX_CONFIG_OFFSET);
a0006486:	c018                	sw	a4,0(s0)
    rx_cfg |= UART_CR_URX_EN;
a0006488:	0017e793          	ori	a5,a5,1
    putreg32(rx_cfg, reg_base + UART_URX_CONFIG_OFFSET);
a000648c:	c05c                	sw	a5,4(s0)
}
a000648e:	4422                	lw	s0,8(sp)
a0006490:	0141                	addi	sp,sp,16
a0006492:	8082                	ret
            tx_cfg |= UART_CR_UTX_PRT_SEL;
a0006494:	0306e693          	ori	a3,a3,48
            rx_cfg |= UART_CR_URX_PRT_SEL;
a0006498:	03066613          	ori	a2,a2,48
            break;
a000649c:	b7a9                	j	a00063e6 <bflb_uart_init+0x5a>
            tx_cfg &= ~UART_CR_UTX_PRT_EN;
a000649e:	9abd                	andi	a3,a3,-17
            rx_cfg &= ~UART_CR_URX_PRT_EN;
a00064a0:	9a3d                	andi	a2,a2,-17
            break;
a00064a2:	b791                	j	a00063e6 <bflb_uart_init+0x5a>
            tx_cfg &= ~UART_CR_UTX_PRT_SEL;
a00064a4:	fdf6f693          	andi	a3,a3,-33
a00064a8:	fdf67613          	andi	a2,a2,-33
a00064ac:	0106e693          	ori	a3,a3,16
            rx_cfg &= ~UART_CR_URX_PRT_SEL;
a00064b0:	01066613          	ori	a2,a2,16
            break;
a00064b4:	bf0d                	j	a00063e6 <bflb_uart_init+0x5a>

a00064b6 <bflb_flash_get_jedec_id>:

uint32_t bflb_flash_get_jedec_id(void)
{
    uint32_t jid = 0;

    jid = ((g_jedec_id & 0xff) << 16) + (g_jedec_id & 0xff00) + ((g_jedec_id & 0xff0000) >> 16);
a00064b6:	c1c1a783          	lw	a5,-996(gp) # 62fc941c <g_jedec_id>
a00064ba:	00ff0737          	lui	a4,0xff0
a00064be:	01079513          	slli	a0,a5,0x10
a00064c2:	8d79                	and	a0,a0,a4
a00064c4:	6741                	lui	a4,0x10
a00064c6:	f0070713          	addi	a4,a4,-256 # ff00 <nocache_min_size+0xaf00>
a00064ca:	8f7d                	and	a4,a4,a5
a00064cc:	8d59                	or	a0,a0,a4
a00064ce:	5d07b78b          	extu	a5,a5,23,16
    return jid;
}
a00064d2:	953e                	add	a0,a0,a5
a00064d4:	8082                	ret

a00064d6 <bflb_flash_get_cfg>:
#endif
#endif

void bflb_flash_get_cfg(uint8_t **cfg_addr, uint32_t *len)
{
    *cfg_addr = (uint8_t *)&g_flash_cfg;
a00064d6:	85c18793          	addi	a5,gp,-1956 # 62fc905c <g_flash_cfg>
a00064da:	c11c                	sw	a5,0(a0)
    *len = sizeof(spi_flash_cfg_type);
a00064dc:	05400793          	li	a5,84
a00064e0:	c19c                	sw	a5,0(a1)
}
a00064e2:	8082                	ret

a00064e4 <irq_unexpected_isr>:
#endif

extern struct bflb_irq_info_s g_irqvector[];

static void irq_unexpected_isr(int irq, void *arg)
{
a00064e4:	85aa                	mv	a1,a0
    printf("irq :%d unregistered\r\n", irq);
a00064e6:	a0009537          	lui	a0,0xa0009
a00064ea:	87c50513          	addi	a0,a0,-1924 # a000887c <__psram_limit+0xf7c0887c>
a00064ee:	d12ff06f          	j	a0005a00 <printf>
	...

a00064f4 <bflb_irq_initialize>:
void bflb_irq_initialize(void)
{
    int i;

    /* Point all interrupt vectors to the unexpected interrupt */
    for (i = 0; i < CONFIG_IRQ_NUM; i++) {
a00064f4:	03018793          	addi	a5,gp,48 # 62fc9830 <g_irqvector>
a00064f8:	a0006737          	lui	a4,0xa0006
a00064fc:	28078693          	addi	a3,a5,640
a0006500:	4e470713          	addi	a4,a4,1252 # a00064e4 <__psram_limit+0xf7c064e4>
        g_irqvector[i].handler = irq_unexpected_isr;
a0006504:	c398                	sw	a4,0(a5)
        g_irqvector[i].arg = NULL;
a0006506:	0007a223          	sw	zero,4(a5)
    for (i = 0; i < CONFIG_IRQ_NUM; i++) {
a000650a:	07a1                	addi	a5,a5,8
a000650c:	fed79ce3          	bne	a5,a3,a0006504 <bflb_irq_initialize+0x10>
    }
}
a0006510:	8082                	ret

a0006512 <bflb_device_get_by_name>:
      .dev_type = BFLB_DEVICE_TYPE_PLFMDMA,
      .user_data = NULL },
};

struct bflb_device_s *bflb_device_get_by_name(const char *name)
{
a0006512:	1101                	addi	sp,sp,-32
a0006514:	c84a                	sw	s2,16(sp)
a0006516:	cc22                	sw	s0,24(sp)
a0006518:	c64e                	sw	s3,12(sp)
a000651a:	c452                	sw	s4,8(sp)
a000651c:	ce06                	sw	ra,28(sp)
a000651e:	ca26                	sw	s1,20(sp)
a0006520:	89aa                	mv	s3,a0
a0006522:	4401                	li	s0,0
a0006524:	8b018913          	addi	s2,gp,-1872 # 62fc90b0 <bl616_device_table>
    for (uint8_t i = 0; i < sizeof(bl616_device_table) / sizeof(bl616_device_table[0]); i++) {
a0006528:	02a00a13          	li	s4,42
a000652c:	a019                	j	a0006532 <bflb_device_get_by_name+0x20>
a000652e:	03440563          	beq	s0,s4,a0006558 <bflb_device_get_by_name+0x46>
        if (strcmp(bl616_device_table[i].name, name) == 0) {
a0006532:	00441493          	slli	s1,s0,0x4
a0006536:	4099450b          	lrw	a0,s2,s1,0
a000653a:	85ce                	mv	a1,s3
    for (uint8_t i = 0; i < sizeof(bl616_device_table) / sizeof(bl616_device_table[0]); i++) {
a000653c:	0405                	addi	s0,s0,1
        if (strcmp(bl616_device_table[i].name, name) == 0) {
a000653e:	c3dfd0ef          	jal	ra,a000417a <strcmp>
a0006542:	f575                	bnez	a0,a000652e <bflb_device_get_by_name+0x1c>
            return &bl616_device_table[i];
        }
    }
    return NULL;
}
a0006544:	40f2                	lw	ra,28(sp)
a0006546:	4462                	lw	s0,24(sp)
            return &bl616_device_table[i];
a0006548:	00990533          	add	a0,s2,s1
}
a000654c:	49b2                	lw	s3,12(sp)
a000654e:	44d2                	lw	s1,20(sp)
a0006550:	4942                	lw	s2,16(sp)
a0006552:	4a22                	lw	s4,8(sp)
a0006554:	6105                	addi	sp,sp,32
a0006556:	8082                	ret
a0006558:	40f2                	lw	ra,28(sp)
a000655a:	4462                	lw	s0,24(sp)
a000655c:	44d2                	lw	s1,20(sp)
a000655e:	4942                	lw	s2,16(sp)
a0006560:	49b2                	lw	s3,12(sp)
a0006562:	4a22                	lw	s4,8(sp)
    return NULL;
a0006564:	4501                	li	a0,0
}
a0006566:	6105                	addi	sp,sp,32
a0006568:	8082                	ret
	...

a0006580 <default_interrupt_handler>:
    .weak   default_interrupt_handler
    /* FreeRTOS will define tspend_handler for context switch */
    .type   default_interrupt_handler, %function
default_interrupt_handler:
    /* ipush */
    addi  sp, sp, -76
a0006580:	fb410113          	addi	sp,sp,-76

    /* save x5 x6 then save mepc mcause */
    sw    x5, 4(sp)
a0006584:	c216                	sw	t0,4(sp)
    sw    x6, 8(sp)
a0006586:	c41a                	sw	t1,8(sp)
    csrr  t0, mepc
a0006588:	341022f3          	csrr	t0,mepc
    csrr  t1, mcause
a000658c:	34202373          	csrr	t1,mcause
    sw    t1, 64(sp)
a0006590:	c09a                	sw	t1,64(sp)
    sw    t0, 68(sp)
a0006592:	c296                	sw	t0,68(sp)
    csrr  t0, mscratch
a0006594:	340022f3          	csrr	t0,mscratch
    sw    t0, 72(sp)
a0006598:	c496                	sw	t0,72(sp)
    /* save regs */
    sw      x1, 0(sp)
a000659a:	c006                	sw	ra,0(sp)
    sw      x7, 12(sp)
a000659c:	c61e                	sw	t2,12(sp)
    sw      x10, 16(sp)
a000659e:	c82a                	sw	a0,16(sp)
    sw      x11, 20(sp)
a00065a0:	ca2e                	sw	a1,20(sp)
    sw      x12, 24(sp)
a00065a2:	cc32                	sw	a2,24(sp)
    sw      x13, 28(sp)
a00065a4:	ce36                	sw	a3,28(sp)
    sw      x14, 32(sp)
a00065a6:	d03a                	sw	a4,32(sp)
    sw      x15, 36(sp)
a00065a8:	d23e                	sw	a5,36(sp)
    sw      x16, 40(sp)
a00065aa:	d442                	sw	a6,40(sp)
    sw      x17, 44(sp)
a00065ac:	d646                	sw	a7,44(sp)
    sw      x28, 48(sp)
a00065ae:	d872                	sw	t3,48(sp)
    sw      x29, 52(sp)
a00065b0:	da76                	sw	t4,52(sp)
    sw      x30, 56(sp)
a00065b2:	dc7a                	sw	t5,56(sp)
    sw      x31, 60(sp)
a00065b4:	de7e                	sw	t6,60(sp)
     * - 68:  x30 (t5)
     * - 72:  x31 (t6)   <--- current IRQ sp
     * ~mem addr low:
     */
    /* WARNING: global IRQ enabled by ipush */
    csrs    mstatus, 8
a00065b6:	30046073          	csrsi	mstatus,8

    /* keep stack 16bytes aligned */
    addi    sp, sp, -88
a00065ba:	fa810113          	addi	sp,sp,-88

    /* - 76:  mstatus  */
    csrr    t1, mstatus
a00065be:	30002373          	csrr	t1,mstatus
    sw      t1, 84(sp)
a00065c2:	ca9a                	sw	t1,84(sp)
    srli    t2, t1, 13
a00065c4:	00d35393          	srli	t2,t1,0xd
    andi    t2, t2, 0x3
a00065c8:	0033f393          	andi	t2,t2,3
    li      t0, 0x3
a00065cc:	428d                	li	t0,3
    bne     t2, t0,  .F_RegNotSave1
a00065ce:	02539663          	bne	t2,t0,a00065fa <.F_RegNotSave1>

    fsw     ft0, 0(sp)
a00065d2:	e002                	fsw	ft0,0(sp)
    fsw     ft1, 4(sp)
a00065d4:	e206                	fsw	ft1,4(sp)
    fsw     ft2, 8(sp)
a00065d6:	e40a                	fsw	ft2,8(sp)
    fsw     ft3, 12(sp)
a00065d8:	e60e                	fsw	ft3,12(sp)
    fsw     ft4, 16(sp)
a00065da:	e812                	fsw	ft4,16(sp)
    fsw     ft5, 20(sp)
a00065dc:	ea16                	fsw	ft5,20(sp)
    fsw     ft6, 24(sp)
a00065de:	ec1a                	fsw	ft6,24(sp)
    fsw     ft7, 28(sp)
a00065e0:	ee1e                	fsw	ft7,28(sp)
    fsw     fa0, 32(sp)
a00065e2:	f02a                	fsw	fa0,32(sp)
    fsw     fa1, 36(sp)
a00065e4:	f22e                	fsw	fa1,36(sp)
    fsw     fa2, 40(sp)
a00065e6:	f432                	fsw	fa2,40(sp)
    fsw     fa3, 44(sp)
a00065e8:	f636                	fsw	fa3,44(sp)
    fsw     fa4, 48(sp)
a00065ea:	f83a                	fsw	fa4,48(sp)
    fsw     fa5, 52(sp)
a00065ec:	fa3e                	fsw	fa5,52(sp)
    fsw     fa6, 56(sp)
a00065ee:	fc42                	fsw	fa6,56(sp)
    fsw     fa7, 60(sp)
a00065f0:	fe46                	fsw	fa7,60(sp)
    fsw     ft8, 64(sp)
a00065f2:	e0f2                	fsw	ft8,64(sp)
    fsw     ft9, 68(sp)
a00065f4:	e2f6                	fsw	ft9,68(sp)
    fsw     ft10,72(sp)
a00065f6:	e4fa                	fsw	ft10,72(sp)
    fsw     ft11,76(sp)
a00065f8:	e6fe                	fsw	ft11,76(sp)

a00065fa <.F_RegNotSave1>:
.F_RegNotSave1:

    csrr    a0, mcause
a00065fa:	34202573          	csrr	a0,mcause
    andi    t1, a0, 0x3FF
a00065fe:	3ff57313          	andi	t1,a0,1023
    /* get ISR */
    la      t2, interrupt_entry
a0006602:	00000397          	auipc	t2,0x0
a0006606:	54238393          	addi	t2,t2,1346 # a0006b44 <interrupt_entry>
    jalr    t2
a000660a:	9382                	jalr	t2

    lw      t1, 84(sp)
a000660c:	4356                	lw	t1,84(sp)
    srli    t2, t1, 13
a000660e:	00d35393          	srli	t2,t1,0xd
    andi    t2, t2, 0x3
a0006612:	0033f393          	andi	t2,t2,3
    li      t0, 0x3
a0006616:	428d                	li	t0,3
    bne     t2, t0,  .F_RegNotLoad
a0006618:	02539663          	bne	t2,t0,a0006644 <.F_RegNotLoad>

    flw     ft0, 0(sp)
a000661c:	6002                	flw	ft0,0(sp)
    flw     ft1, 4(sp)
a000661e:	6092                	flw	ft1,4(sp)
    flw     ft2, 8(sp)
a0006620:	6122                	flw	ft2,8(sp)
    flw     ft3, 12(sp)
a0006622:	61b2                	flw	ft3,12(sp)
    flw     ft4, 16(sp)
a0006624:	6242                	flw	ft4,16(sp)
    flw     ft5, 20(sp)
a0006626:	62d2                	flw	ft5,20(sp)
    flw     ft6, 24(sp)
a0006628:	6362                	flw	ft6,24(sp)
    flw     ft7, 28(sp)
a000662a:	63f2                	flw	ft7,28(sp)
    flw     fa0, 32(sp)
a000662c:	7502                	flw	fa0,32(sp)
    flw     fa1, 36(sp)
a000662e:	7592                	flw	fa1,36(sp)
    flw     fa2, 40(sp)
a0006630:	7622                	flw	fa2,40(sp)
    flw     fa3, 44(sp)
a0006632:	76b2                	flw	fa3,44(sp)
    flw     fa4, 48(sp)
a0006634:	7742                	flw	fa4,48(sp)
    flw     fa5, 52(sp)
a0006636:	77d2                	flw	fa5,52(sp)
    flw     fa6, 56(sp)
a0006638:	7862                	flw	fa6,56(sp)
    flw     fa7, 60(sp)
a000663a:	78f2                	flw	fa7,60(sp)
    flw     ft8, 64(sp)
a000663c:	6e06                	flw	ft8,64(sp)
    flw     ft9, 68(sp)
a000663e:	6e96                	flw	ft9,68(sp)
    flw     ft10,72(sp)
a0006640:	6f26                	flw	ft10,72(sp)
    flw     ft11,76(sp)
a0006642:	6fb6                	flw	ft11,76(sp)

a0006644 <.F_RegNotLoad>:

.F_RegNotLoad:
    addi    sp, sp, 88
a0006644:	05810113          	addi	sp,sp,88
    /* mret included, and IRQ tail-chain may happen */
    /* ipop */

    csrc    mstatus, 8
a0006648:	30047073          	csrci	mstatus,8
    /* restore mepc mcause mscrath */
    lw      t0, 68(sp)
a000664c:	4296                	lw	t0,68(sp)
    csrw    mepc, t0
a000664e:	34129073          	csrw	mepc,t0
    lw      t0, 64(sp)
a0006652:	4286                	lw	t0,64(sp)
    csrw    mcause, t0
a0006654:	34229073          	csrw	mcause,t0
    lw      t0, 72(sp)
a0006658:	42a6                	lw	t0,72(sp)
    csrw    mscratch, t0
a000665a:	34029073          	csrw	mscratch,t0
    /* restore regs */
    lw      x1, 0(sp)
a000665e:	4082                	lw	ra,0(sp)
    lw      x5, 4(sp)
a0006660:	4292                	lw	t0,4(sp)
    lw      x6, 8(sp)
a0006662:	4322                	lw	t1,8(sp)
    lw      x7, 12(sp)
a0006664:	43b2                	lw	t2,12(sp)
    lw      x10, 16(sp)
a0006666:	4542                	lw	a0,16(sp)
    lw      x11, 20(sp)
a0006668:	45d2                	lw	a1,20(sp)
    lw      x12, 24(sp)
a000666a:	4662                	lw	a2,24(sp)
    lw      x13, 28(sp)
a000666c:	46f2                	lw	a3,28(sp)
    lw      x14, 32(sp)
a000666e:	5702                	lw	a4,32(sp)
    lw      x15, 36(sp)
a0006670:	5792                	lw	a5,36(sp)
    lw      x16, 40(sp)
a0006672:	5822                	lw	a6,40(sp)
    lw      x17, 44(sp)
a0006674:	58b2                	lw	a7,44(sp)
    lw      x28, 48(sp)
a0006676:	5e42                	lw	t3,48(sp)
    lw      x29, 52(sp)
a0006678:	5ed2                	lw	t4,52(sp)
    lw      x30, 56(sp)
a000667a:	5f62                	lw	t5,56(sp)
    lw      x31, 60(sp)
a000667c:	5ff2                	lw	t6,60(sp)

    addi    sp, sp, 76
a000667e:	04c10113          	addi	sp,sp,76
    mret
a0006682:	30200073          	mret
	...

a0006700 <trap>:
    .global default_trap_handler
    .type   default_trap_handler, %function
default_trap_handler:
trap:
    /* Check for interrupt */
    sw      t0, -4(sp)
a0006700:	fe512e23          	sw	t0,-4(sp)
    csrr    t0, mcause
a0006704:	342022f3          	csrr	t0,mcause

    /* IRQ, but in non-vector mode */
    blt     t0, x0, .Lirq
a0006708:	0e02c863          	bltz	t0,a00067f8 <trap+0xf8>

    la      t0, g_trap_sp
a000670c:	03018293          	addi	t0,gp,48 # 62fc9830 <g_irqvector>
    addi    t0, t0, -XCPTCONTEXT_SIZE
a0006710:	ef828293          	addi	t0,t0,-264
    sw      x1, REG_X1(t0)
a0006714:	0012a223          	sw	ra,4(t0)
    sw      x2, REG_X2(t0)
a0006718:	0022a423          	sw	sp,8(t0)
    sw      x3, REG_X3(t0)
a000671c:	0032a623          	sw	gp,12(t0)
    sw      x4, REG_X4(t0)
a0006720:	0042a823          	sw	tp,16(t0)
    sw      x6, REG_X6(t0)
a0006724:	0062ac23          	sw	t1,24(t0)
    sw      x7, REG_X7(t0)
a0006728:	0072ae23          	sw	t2,28(t0)
    sw      x8, REG_X8(t0)
a000672c:	0282a023          	sw	s0,32(t0)
    sw      x9, REG_X9(t0)
a0006730:	0292a223          	sw	s1,36(t0)
    sw      x10, REG_X10(t0)
a0006734:	02a2a423          	sw	a0,40(t0)
    sw      x11, REG_X11(t0)
a0006738:	02b2a623          	sw	a1,44(t0)
    sw      x12, REG_X12(t0)
a000673c:	02c2a823          	sw	a2,48(t0)
    sw      x13, REG_X13(t0)
a0006740:	02d2aa23          	sw	a3,52(t0)
    sw      x14, REG_X14(t0)
a0006744:	02e2ac23          	sw	a4,56(t0)
    sw      x15, REG_X15(t0)
a0006748:	02f2ae23          	sw	a5,60(t0)
    sw      x16, REG_X16(t0)
a000674c:	0502a023          	sw	a6,64(t0)
    sw      x17, REG_X17(t0)
a0006750:	0512a223          	sw	a7,68(t0)
    sw      x18, REG_X18(t0)
a0006754:	0522a423          	sw	s2,72(t0)
    sw      x19, REG_X19(t0)
a0006758:	0532a623          	sw	s3,76(t0)
    sw      x20, REG_X20(t0)
a000675c:	0542a823          	sw	s4,80(t0)
    sw      x21, REG_X21(t0)
a0006760:	0552aa23          	sw	s5,84(t0)
    sw      x22, REG_X22(t0)
a0006764:	0562ac23          	sw	s6,88(t0)
    sw      x23, REG_X23(t0)
a0006768:	0572ae23          	sw	s7,92(t0)
    sw      x24, REG_X24(t0)
a000676c:	0782a023          	sw	s8,96(t0)
    sw      x25, REG_X25(t0)
a0006770:	0792a223          	sw	s9,100(t0)
    sw      x26, REG_X26(t0)
a0006774:	07a2a423          	sw	s10,104(t0)
    sw      x27, REG_X27(t0)
a0006778:	07b2a623          	sw	s11,108(t0)
    sw      x28, REG_X28(t0)
a000677c:	07c2a823          	sw	t3,112(t0)
    sw      x29, REG_X29(t0)
a0006780:	07d2aa23          	sw	t4,116(t0)
    sw      x30, REG_X30(t0)
a0006784:	07e2ac23          	sw	t5,120(t0)
    sw      x31, REG_X31(t0)
a0006788:	07f2ae23          	sw	t6,124(t0)
    csrr    a0, mepc
a000678c:	34102573          	csrr	a0,mepc
    sw      a0, REG_EPC(t0)
a0006790:	00a2a023          	sw	a0,0(t0)
    csrr    a0, mstatus
a0006794:	30002573          	csrr	a0,mstatus
    sw      a0, REG_INT_CTX(t0)
a0006798:	08a2a023          	sw	a0,128(t0)

    mv      a0, t0
a000679c:	8516                	mv	a0,t0
    lw      t0, -4(sp)
a000679e:	ffc12283          	lw	t0,-4(sp)
    mv      sp, a0
a00067a2:	812a                	mv	sp,a0
    sw      t0, REG_X5(sp)
a00067a4:	ca16                	sw	t0,20(sp)

    jal     exception_entry
a00067a6:	2f8000ef          	jal	ra,a0006a9e <exception_entry>

    lw      t0, REG_INT_CTX(sp)
a00067aa:	428a                	lw	t0,128(sp)
    csrw    mstatus, t0
a00067ac:	30029073          	csrw	mstatus,t0
    lw      t0, REG_EPC(sp)
a00067b0:	4282                	lw	t0,0(sp)
    csrw    mepc, t0
a00067b2:	34129073          	csrw	mepc,t0

    lw      x31, REG_X31(sp)
a00067b6:	5ff6                	lw	t6,124(sp)
    lw      x30, REG_X30(sp)
a00067b8:	5f66                	lw	t5,120(sp)
    lw      x29, REG_X29(sp)
a00067ba:	5ed6                	lw	t4,116(sp)
    lw      x28, REG_X28(sp)
a00067bc:	5e46                	lw	t3,112(sp)
    lw      x27, REG_X27(sp)
a00067be:	5db6                	lw	s11,108(sp)
    lw      x26, REG_X26(sp)
a00067c0:	5d26                	lw	s10,104(sp)
    lw      x25, REG_X25(sp)
a00067c2:	5c96                	lw	s9,100(sp)
    lw      x24, REG_X24(sp)
a00067c4:	5c06                	lw	s8,96(sp)
    lw      x23, REG_X23(sp)
a00067c6:	4bf6                	lw	s7,92(sp)
    lw      x22, REG_X22(sp)
a00067c8:	4b66                	lw	s6,88(sp)
    lw      x21, REG_X21(sp)
a00067ca:	4ad6                	lw	s5,84(sp)
    lw      x20, REG_X20(sp)
a00067cc:	4a46                	lw	s4,80(sp)
    lw      x19, REG_X19(sp)
a00067ce:	49b6                	lw	s3,76(sp)
    lw      x18, REG_X18(sp)
a00067d0:	4926                	lw	s2,72(sp)
    lw      x17, REG_X17(sp)
a00067d2:	4896                	lw	a7,68(sp)
    lw      x16, REG_X16(sp)
a00067d4:	4806                	lw	a6,64(sp)
    lw      x15, REG_X15(sp)
a00067d6:	57f2                	lw	a5,60(sp)
    lw      x14, REG_X14(sp)
a00067d8:	5762                	lw	a4,56(sp)
    lw      x13, REG_X13(sp)
a00067da:	56d2                	lw	a3,52(sp)
    lw      x12, REG_X12(sp)
a00067dc:	5642                	lw	a2,48(sp)
    lw      x11, REG_X11(sp)
a00067de:	55b2                	lw	a1,44(sp)
    lw      x10, REG_X10(sp)
a00067e0:	5522                	lw	a0,40(sp)
    lw      x9,  REG_X9(sp)
a00067e2:	5492                	lw	s1,36(sp)
    lw      x8,  REG_X8(sp)
a00067e4:	5402                	lw	s0,32(sp)
    lw      x7,  REG_X7(sp)
a00067e6:	43f2                	lw	t2,28(sp)
    lw      x6,  REG_X6(sp)
a00067e8:	4362                	lw	t1,24(sp)
    lw      x5,  REG_X5(sp)
a00067ea:	42d2                	lw	t0,20(sp)
    lw      x4,  REG_X4(sp)
a00067ec:	4242                	lw	tp,16(sp)
    lw      x3,  REG_X3(sp)
a00067ee:	41b2                	lw	gp,12(sp)
    lw      x1,  REG_X1(sp)
a00067f0:	4092                	lw	ra,4(sp)
    lw      x2,  REG_X2(sp)
a00067f2:	4122                	lw	sp,8(sp)

    mret
a00067f4:	30200073          	mret

.Lirq:
    lw      t0, -4(sp)
a00067f8:	ffc12283          	lw	t0,-4(sp)
/* MSOFT IRQ for FreeRTOS context switch
 * Config MSOFT IRQ to non-vector mode
 * tspend_handler is a weak alias to default_interrupt_handler
 */
    j       default_interrupt_handler
a00067fc:	d85ff06f          	j	a0006580 <default_interrupt_handler>
	...

a0006840 <start_load>:

    /* Copy ITCM code */
    pSrc = &__itcm_load_addr;
    pDest = &__tcm_code_start__;

    for (; pDest < &__tcm_code_end__;) {
a0006840:	62fc05b7          	lui	a1,0x62fc0
a0006844:	62fc1737          	lui	a4,0x62fc1
a0006848:	00058593          	mv	a1,a1
a000684c:	e6c70713          	addi	a4,a4,-404 # 62fc0e6c <__tcm_code_end__>
a0006850:	02e5f263          	bgeu	a1,a4,a0006874 <start_load+0x34>
a0006854:	177d                	addi	a4,a4,-1
a0006856:	8f0d                	sub	a4,a4,a1
a0006858:	a000c537          	lui	a0,0xa000c
a000685c:	8309                	srli	a4,a4,0x2
a000685e:	4781                	li	a5,0
a0006860:	67050513          	addi	a0,a0,1648 # a000c670 <__psram_limit+0xf7c0c670>
        *pDest++ = *pSrc++;
a0006864:	44f5460b          	lrw	a2,a0,a5,2
a0006868:	86be                	mv	a3,a5
a000686a:	44f5d60b          	srw	a2,a1,a5,2
    for (; pDest < &__tcm_code_end__;) {
a000686e:	0785                	addi	a5,a5,1
a0006870:	fee69ae3          	bne	a3,a4,a0006864 <start_load+0x24>

    /* Copy DTCM code */
    pSrc = &__dtcm_load_addr;
    pDest = &__tcm_data_start__;

    for (; pDest < &__tcm_data_end__;) {
a0006874:	62fc35b7          	lui	a1,0x62fc3
a0006878:	62fc3737          	lui	a4,0x62fc3
a000687c:	00058593          	mv	a1,a1
a0006880:	00070713          	mv	a4,a4
a0006884:	02e5f263          	bgeu	a1,a4,a00068a8 <start_load+0x68>
a0006888:	177d                	addi	a4,a4,-1
a000688a:	8f0d                	sub	a4,a4,a1
a000688c:	a000d537          	lui	a0,0xa000d
a0006890:	8309                	srli	a4,a4,0x2
a0006892:	4781                	li	a5,0
a0006894:	4dc50513          	addi	a0,a0,1244 # a000d4dc <__psram_limit+0xf7c0d4dc>
        *pDest++ = *pSrc++;
a0006898:	44f5460b          	lrw	a2,a0,a5,2
a000689c:	86be                	mv	a3,a5
a000689e:	44f5d60b          	srw	a2,a1,a5,2
    for (; pDest < &__tcm_data_end__;) {
a00068a2:	0785                	addi	a5,a5,1
a00068a4:	fee69ae3          	bne	a3,a4,a0006898 <start_load+0x58>

    /* BF Add OCARAM data copy */
    pSrc = &__ram_load_addr;
    pDest = &__ram_data_start__;

    for (; pDest < &__ram_data_end__;) {
a00068a8:	62fc95b7          	lui	a1,0x62fc9
a00068ac:	00058593          	mv	a1,a1
a00068b0:	b5018713          	addi	a4,gp,-1200 # 62fc9350 <buf_idx.1>
a00068b4:	02e5f263          	bgeu	a1,a4,a00068d8 <start_load+0x98>
a00068b8:	177d                	addi	a4,a4,-1
a00068ba:	8f0d                	sub	a4,a4,a1
a00068bc:	a000d537          	lui	a0,0xa000d
a00068c0:	8309                	srli	a4,a4,0x2
a00068c2:	4781                	li	a5,0
a00068c4:	4dc50513          	addi	a0,a0,1244 # a000d4dc <__psram_limit+0xf7c0d4dc>
        *pDest++ = *pSrc++;
a00068c8:	44f5460b          	lrw	a2,a0,a5,2
a00068cc:	86be                	mv	a3,a5
a00068ce:	44f5d60b          	srw	a2,a1,a5,2
    for (; pDest < &__ram_data_end__;) {
a00068d2:	0785                	addi	a5,a5,1
a00068d4:	fed71ae3          	bne	a4,a3,a00068c8 <start_load+0x88>
#ifndef CONIFG_DISABLE_NOCACHE_RAM_LOAD
    /* BF Add no cache ram data copy */
    pSrc = &__nocache_ram_load_addr;
    pDest = &__nocache_ram_data_start__;

    for (; pDest < &__nocache_ram_data_end__;) {
a00068d8:	22fc45b7          	lui	a1,0x22fc4
a00068dc:	22fc4737          	lui	a4,0x22fc4
a00068e0:	00058593          	mv	a1,a1
a00068e4:	00070713          	mv	a4,a4
a00068e8:	02e5f263          	bgeu	a1,a4,a000690c <start_load+0xcc>
a00068ec:	177d                	addi	a4,a4,-1
a00068ee:	8f0d                	sub	a4,a4,a1
a00068f0:	a000d537          	lui	a0,0xa000d
a00068f4:	8309                	srli	a4,a4,0x2
a00068f6:	4781                	li	a5,0
a00068f8:	4dc50513          	addi	a0,a0,1244 # a000d4dc <__psram_limit+0xf7c0d4dc>
        *pDest++ = *pSrc++;
a00068fc:	44f5460b          	lrw	a2,a0,a5,2
a0006900:	86be                	mv	a3,a5
a0006902:	44f5d60b          	srw	a2,a1,a5,2
    for (; pDest < &__nocache_ram_data_end__;) {
a0006906:	0785                	addi	a5,a5,1
a0006908:	fee69ae3          	bne	a3,a4,a00068fc <start_load+0xbc>
	 *
	 *  Both addresses must be aligned to 4 bytes boundary.
	 */
    pDest = &__bss_start__;

    for (; pDest < &__bss_end__;) {
a000690c:	b5018713          	addi	a4,gp,-1200 # 62fc9350 <buf_idx.1>
a0006910:	6b818693          	addi	a3,gp,1720 # 62fc9eb8 <__HeapBase>
a0006914:	00d77e63          	bgeu	a4,a3,a0006930 <start_load+0xf0>
a0006918:	16fd                	addi	a3,a3,-1
a000691a:	8e99                	sub	a3,a3,a4
a000691c:	9af1                	andi	a3,a3,-4
a000691e:	0691                	addi	a3,a3,4
a0006920:	9736                	add	a4,a4,a3
    pDest = &__bss_start__;
a0006922:	b5018793          	addi	a5,gp,-1200 # 62fc9350 <buf_idx.1>
a0006926:	0001                	nop
        *pDest++ = 0ul;
a0006928:	5847d00b          	swia	zero,(a5),4,0
    for (; pDest < &__bss_end__;) {
a000692c:	fef71ee3          	bne	a4,a5,a0006928 <start_load+0xe8>
	 *
	 *  Both addresses must be aligned to 4 bytes boundary.
	 */
    pDest = &__wifi_bss_start;

    for (; pDest < &__wifi_bss_end;) {
a0006930:	230107b7          	lui	a5,0x23010
a0006934:	230106b7          	lui	a3,0x23010
a0006938:	00078713          	mv	a4,a5
a000693c:	00068693          	mv	a3,a3
a0006940:	00d77e63          	bgeu	a4,a3,a000695c <start_load+0x11c>
a0006944:	16fd                	addi	a3,a3,-1
a0006946:	8e99                	sub	a3,a3,a4
a0006948:	9af1                	andi	a3,a3,-4
a000694a:	0691                	addi	a3,a3,4
a000694c:	9736                	add	a4,a4,a3
    pDest = &__wifi_bss_start;
a000694e:	00078793          	mv	a5,a5
a0006952:	0001                	nop
        *pDest++ = 0ul;
a0006954:	5847d00b          	swia	zero,(a5),4,0
    for (; pDest < &__wifi_bss_end;) {
a0006958:	fef71ee3          	bne	a4,a5,a0006954 <start_load+0x114>
    }

#endif
}
a000695c:	8082                	ret
	...

a0006960 <SystemInit>:
#ifndef CONFIG_PSRAM_COPY_CODE
static void Tzc_Sec_PSRAMB_Access_Set_Not_Lock(uint8_t region, uint32_t startAddr, uint32_t endAddr, uint8_t group)
{
    uint32_t tmpVal = 0;

    tmpVal = BL_RD_REG(TZC_SEC_BASE, TZC_SEC_TZC_PSRAMB_TZSRG_CTRL);
a0006960:	200057b7          	lui	a5,0x20005
a0006964:	3a07a703          	lw	a4,928(a5) # 200053a0 <nocache_min_size+0x200003a0>
    tmpVal &= (~(3 << (region * 2)));
    tmpVal |= (group << (region * 2));
    BL_WR_REG(TZC_SEC_BASE, TZC_SEC_TZC_PSRAMB_TZSRG_CTRL, tmpVal);

    tmpVal = ((((endAddr >> 10) & 0xffff) - 1) & 0xffff) | (((startAddr >> 10) & 0xffff) << 16);
    BL_WR_WORD(TZC_SEC_BASE + TZC_SEC_TZC_PSRAMB_TZSRG_R0_OFFSET + region * 4, tmpVal);
a0006968:	66c1                	lui	a3,0x10
a000696a:	fff68613          	addi	a2,a3,-1 # ffff <nocache_min_size+0xafff>
    tmpVal &= (~(3 << (region * 2)));
a000696e:	9b71                	andi	a4,a4,-4
    BL_WR_REG(TZC_SEC_BASE, TZC_SEC_TZC_PSRAMB_TZSRG_CTRL, tmpVal);
a0006970:	3ae7a023          	sw	a4,928(a5)
    BL_WR_WORD(TZC_SEC_BASE + TZC_SEC_TZC_PSRAMB_TZSRG_R0_OFFSET + region * 4, tmpVal);
a0006974:	3ac7a423          	sw	a2,936(a5)

    /* set enable but not lock */
    tmpVal = BL_RD_REG(TZC_SEC_BASE, TZC_SEC_TZC_PSRAMB_TZSRG_CTRL);
a0006978:	3a07a703          	lw	a4,928(a5)
    tmpVal = (((alignEnd >> 10) & 0xffff) - 1) | (((startAddr >> 10) & 0xffff) << 16);
    BL_WR_WORD(TZC_SEC_BASE + TZC_SEC_TZC_ROM_TZSRG_R0_OFFSET + region * 4, tmpVal);

    /* set enable and lock */
    tmpVal = BL_RD_REG(TZC_SEC_BASE, TZC_SEC_TZC_ROM_TZSRG_CTRL);
    tmpVal |= 1 << (region + 16);
a000697c:	00020637          	lui	a2,0x20
    tmpVal |= 1 << (region + 16);
a0006980:	8f55                	or	a4,a4,a3
    BL_WR_REG(TZC_SEC_BASE, TZC_SEC_TZC_PSRAMB_TZSRG_CTRL, tmpVal);
a0006982:	3ae7a023          	sw	a4,928(a5)
    tmpVal = BL_RD_REG(TZC_SEC_BASE, TZC_SEC_TZC_ROM_TZSRG_CTRL);
a0006986:	43b8                	lw	a4,64(a5)
static void flash_bank2_access_init(void)
{
    uint32_t reg_base = 0;
    uint32_t regval = 0;
    reg_base = BFLB_SF_CTRL_BASE;
    regval = getreg32(reg_base + SF_CTRL_2_OFFSET);
a0006988:	2000b6b7          	lui	a3,0x2000b
    tmpVal &= (~(0xf << (region * 4)));
a000698c:	f0f77713          	andi	a4,a4,-241
    BL_WR_REG(TZC_SEC_BASE, TZC_SEC_TZC_ROM_TZSRG_CTRL, tmpVal);
a0006990:	c3b8                	sw	a4,64(a5)
    BL_WR_WORD(TZC_SEC_BASE + TZC_SEC_TZC_ROM_TZSRG_R0_OFFSET + region * 4, tmpVal);
a0006992:	577d                	li	a4,-1
a0006994:	c7f8                	sw	a4,76(a5)
    tmpVal = BL_RD_REG(TZC_SEC_BASE, TZC_SEC_TZC_ROM_TZSRG_CTRL);
a0006996:	43b8                	lw	a4,64(a5)
    tmpVal |= 1 << (region + 16);
a0006998:	8f51                	or	a4,a4,a2
    BL_WR_REG(TZC_SEC_BASE, TZC_SEC_TZC_ROM_TZSRG_CTRL, tmpVal);
a000699a:	c3b8                	sw	a4,64(a5)
    regval = getreg32(reg_base + SF_CTRL_2_OFFSET);
a000699c:	5abc                	lw	a5,112(a3)
    regval |= SF_CTRL_SF_IF_BK2_EN;
    regval |= SF_CTRL_SF_IF_BK2_MODE;
a000699e:	60000737          	lui	a4,0x60000
a00069a2:	8fd9                	or	a5,a5,a4
    putreg32(regval, reg_base + SF_CTRL_2_OFFSET);
a00069a4:	dabc                	sw	a5,112(a3)
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MSTATUS(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mstatus"
a00069a6:	300027f3          	csrr	a5,mstatus
    flash_bank2_access_init();
    //pmp_init();
#endif
    /* enable mstatus FS */
    uint32_t mstatus = __get_MSTATUS();
    mstatus |= (1 << 13);
a00069aa:	6709                	lui	a4,0x2
a00069ac:	8fd9                	or	a5,a5,a4
  \details Writes the given value to the MSTATUS Register.
  \param [in]    mstatus  MSTATUS Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_MSTATUS(uint32_t mstatus)
{
    __ASM volatile("csrw mstatus, %0"
a00069ae:	30079073          	csrw	mstatus,a5
    __ASM volatile("csrr %0, mxstatus"
a00069b2:	7c0027f3          	csrr	a5,mxstatus

    /* enable mxstatus THEADISAEE */
    uint32_t mxstatus = __get_MXSTATUS();
    mxstatus |= (1 << 22);
    /* enable mxstatus MM */
    mxstatus |= (1 << 15);
a00069b6:	00408737          	lui	a4,0x408
a00069ba:	8fd9                	or	a5,a5,a4
    __ASM volatile("csrw mxstatus, %0"
a00069bc:	7c079073          	csrw	mxstatus,a5
    __set_MXSTATUS(mxstatus);

    /* get interrupt level from info */
    CLIC->CLICCFG = (((CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos) << CLIC_CLICCFG_NLBIT_Pos);
a00069c0:	e08006b7          	lui	a3,0xe0800
a00069c4:	42d8                	lw	a4,4(a3)
a00069c6:	0006c603          	lbu	a2,0(a3) # e0800000 <__psram_limit+0x38400000>

    /* Every interrupt should be clear by software*/
    for (i = 0; i < IRQn_LAST; i++) {
a00069ca:	4781                	li	a5,0
    CLIC->CLICCFG = (((CLIC->CLICINFO & CLIC_INFO_CLICINTCTLBITS_Msk) >> CLIC_INFO_CLICINTCTLBITS_Pos) << CLIC_CLICCFG_NLBIT_Pos);
a00069cc:	8351                	srli	a4,a4,0x14
a00069ce:	8b79                	andi	a4,a4,30
a00069d0:	ac070677          	insb	a2,a4,0
a00069d4:	00c68023          	sb	a2,0(a3)
    for (i = 0; i < IRQn_LAST; i++) {
a00069d8:	e0800537          	lui	a0,0xe0800
        CLIC->CLICINT[i].IE = 0;
a00069dc:	6605                	lui	a2,0x1
    for (i = 0; i < IRQn_LAST; i++) {
a00069de:	05000593          	li	a1,80
a00069e2:	0001                	nop
        CLIC->CLICINT[i].IE = 0;
a00069e4:	04f5168b          	addsl	a3,a0,a5,2
a00069e8:	00c68733          	add	a4,a3,a2
a00069ec:	000700a3          	sb	zero,1(a4) # 408001 <nocache_min_size+0x403001>
        CLIC->CLICINT[i].IP = 0;
a00069f0:	00c6d00b          	srb	zero,a3,a2,0
#ifdef CONFIG_IRQ_USE_VECTOR
        CLIC->CLICINT[i].ATTR = 1; /* use vector interrupt */
#else
        CLIC->CLICINT[i].ATTR = 0; /* use no vector interrupt */
a00069f4:	00070123          	sb	zero,2(a4)
    for (i = 0; i < IRQn_LAST; i++) {
a00069f8:	0785                	addi	a5,a5,1
a00069fa:	feb795e3          	bne	a5,a1,a00069e4 <SystemInit+0x84>
    /* tspend interrupt will be clear auto*/
    /* tspend use positive interrupt */
#ifdef CONFIG_IRQ_USE_VECTOR
    CLIC->CLICINT[MSOFT_IRQn].ATTR = 0x3;
#else
    CLIC->CLICINT[MSOFT_IRQn].ATTR = 0x2;
a00069fe:	e08017b7          	lui	a5,0xe0801
a0006a02:	4709                	li	a4,2
a0006a04:	00e78723          	sb	a4,14(a5) # e080100e <__psram_limit+0x3840100e>
  \details Acts as a special kind of Data Memory Barrier.
           It completes when all explicit memory accesses before this instruction complete.
 */
__ALWAYS_STATIC_INLINE void __DSB(void)
{
    __ASM volatile("fence");
a0006a08:	0ff0000f          	fence
    __ASM volatile("fence.i");
a0006a0c:	0000100f          	fence.i
  \brief   Invalid all dcache
  \details invalid all dcache.
 */
__ALWAYS_STATIC_INLINE void __DCACHE_IALL(void)
{
    __ASM volatile("dcache.iall");
a0006a10:	0020000b          	dcache.iall
    __ASM volatile("csrr %0, mhcr"
a0006a14:	7c1027f3          	csrr	a5,mhcr
    uint32_t cache;
    __DSB();
    __ISB();
    __DCACHE_IALL(); /* invalidate all dcache */
    cache = __get_MHCR();
    cache |= (CACHE_MHCR_DE_Msk | CACHE_MHCR_WB_Msk | CACHE_MHCR_WA_Msk | CACHE_MHCR_RS_Msk | CACHE_MHCR_BPE_Msk | CACHE_MHCR_L0BTB_Msk); /* enable all Cache */
a0006a18:	03e60613          	addi	a2,a2,62 # 103e <HeapMinSize+0x3e>
a0006a1c:	8e5d                	or	a2,a2,a5
    __ASM volatile("csrw mhcr, %0"
a0006a1e:	7c161073          	csrw	mhcr,a2
    __ASM volatile("fence");
a0006a22:	0ff0000f          	fence
    __ASM volatile("fence.i");
a0006a26:	0000100f          	fence.i
    __ASM volatile("fence");
a0006a2a:	0ff0000f          	fence
    __ASM volatile("fence.i");
a0006a2e:	0000100f          	fence.i
    __ASM volatile("icache.iall");
a0006a32:	0100000b          	icache.iall
    __ASM volatile("csrr %0, mhcr"
a0006a36:	7c1027f3          	csrr	a5,mhcr
    cache |= CACHE_MHCR_IE_Msk;
a0006a3a:	0017e793          	ori	a5,a5,1
    __ASM volatile("csrw mhcr, %0"
a0006a3e:	7c179073          	csrw	mhcr,a5
    __ASM volatile("fence");
a0006a42:	0ff0000f          	fence
    __ASM volatile("fence.i");
a0006a46:	0000100f          	fence.i
    __ASM volatile("csrr %0, mexstatus"
a0006a4a:	7e1027f3          	csrr	a5,mexstatus
    csi_dcache_enable();
    csi_icache_enable();

    /* disable mexstatus SPUSHEN and SPSWAPEN for ipush/ipop*/
    uint32_t mexstatus = __get_MEXSTATUS();
    mexstatus &= ~(0x3 << 16);
a0006a4e:	fffd0737          	lui	a4,0xfffd0
a0006a52:	177d                	addi	a4,a4,-1
a0006a54:	8ff9                	and	a5,a5,a4
    __ASM volatile("csrw mexstatus, %0"
a0006a56:	7e179073          	csrw	mexstatus,a5
    __set_MEXSTATUS(mexstatus);

    BL_WR_REG(GLB_BASE, GLB_UART_CFG1, 0xffffffff);
a0006a5a:	200007b7          	lui	a5,0x20000
a0006a5e:	577d                	li	a4,-1
a0006a60:	14e7aa23          	sw	a4,340(a5) # 20000154 <nocache_min_size+0x1fffb154>
    BL_WR_REG(GLB_BASE, GLB_UART_CFG2, 0x0000ffff);
a0006a64:	6741                	lui	a4,0x10
a0006a66:	177d                	addi	a4,a4,-1
a0006a68:	14e7ac23          	sw	a4,344(a5)

    uint32_t tmpVal = 0;
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SRAM_CFG3);
a0006a6c:	60c7a703          	lw	a4,1548(a5)
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_EM_SEL, 0x00);
a0006a70:	9b41                	andi	a4,a4,-16
    BL_WR_REG(GLB_BASE, GLB_SRAM_CFG3, tmpVal);
a0006a72:	60e7a623          	sw	a4,1548(a5)
}
a0006a76:	8082                	ret

a0006a78 <System_Post_Init>:
    __ASM volatile("fence");
a0006a78:	0ff0000f          	fence
  \brief   Clear all dcache
  \details clear all dcache.
 */
__ALWAYS_STATIC_INLINE void __DCACHE_CALL(void)
{
    __ASM volatile("dcache.call");
a0006a7c:	0010000b          	dcache.call
    __ASM volatile("fence");
a0006a80:	0ff0000f          	fence
a0006a84:	0ff0000f          	fence
    __ASM volatile("fence.i");
a0006a88:	0000100f          	fence.i
    __ASM volatile("icache.iall");
a0006a8c:	0100000b          	icache.iall
    __ASM volatile("fence");
a0006a90:	0ff0000f          	fence
    __ASM volatile("fence.i");
a0006a94:	0000100f          	fence.i
    __ASM volatile("csrs mstatus, 8");
a0006a98:	30046073          	csrsi	mstatus,8

#ifndef CONFIG_FREERTOS
    /* global IRQ enable */
    __enable_irq();
#endif
}
a0006a9c:	8082                	ret

a0006a9e <exception_entry>:
{
    unsigned long cause;
    unsigned long epc;
    unsigned long tval;

    printf("exception_entry\r\n");
a0006a9e:	a0009537          	lui	a0,0xa0009
{
a0006aa2:	715d                	addi	sp,sp,-80
    printf("exception_entry\r\n");
a0006aa4:	b6c50513          	addi	a0,a0,-1172 # a0008b6c <__psram_limit+0xf7c08b6c>
{
a0006aa8:	c686                	sw	ra,76(sp)
a0006aaa:	c4a2                	sw	s0,72(sp)
a0006aac:	c2a6                	sw	s1,68(sp)
a0006aae:	c0ca                	sw	s2,64(sp)
    printf("exception_entry\r\n");
a0006ab0:	f51fe0ef          	jal	ra,a0005a00 <printf>

    cause = READ_CSR(CSR_MCAUSE);
a0006ab4:	34202473          	csrr	s0,mcause
    printf("mcause=%08x\r\n", (int)cause);
a0006ab8:	a0009537          	lui	a0,0xa0009
a0006abc:	85a2                	mv	a1,s0
a0006abe:	b8050513          	addi	a0,a0,-1152 # a0008b80 <__psram_limit+0xf7c08b80>
a0006ac2:	f3ffe0ef          	jal	ra,a0005a00 <printf>
    epc = READ_CSR(CSR_MEPC);
a0006ac6:	341024f3          	csrr	s1,mepc
    printf("mepc:%08x\r\n", (int)epc);
a0006aca:	a0009537          	lui	a0,0xa0009
a0006ace:	85a6                	mv	a1,s1
a0006ad0:	b9050513          	addi	a0,a0,-1136 # a0008b90 <__psram_limit+0xf7c08b90>
a0006ad4:	f2dfe0ef          	jal	ra,a0005a00 <printf>
    tval = READ_CSR(CSR_MTVAL);
a0006ad8:	343025f3          	csrr	a1,mtval
    printf("mtval:%08x\r\n", (int)tval);
a0006adc:	a0009537          	lui	a0,0xa0009
a0006ae0:	b9c50513          	addi	a0,a0,-1124 # a0008b9c <__psram_limit+0xf7c08b9c>
a0006ae4:	f1dfe0ef          	jal	ra,a0005a00 <printf>

    cause = (cause & 0x3ff);

#ifndef CONFIG_TRAP_DUMP_DISABLE
    const char *mcause_str[] = {
a0006ae8:	a00097b7          	lui	a5,0xa0009
a0006aec:	bac78793          	addi	a5,a5,-1108 # a0008bac <__psram_limit+0xf7c08bac>
    cause = (cause & 0x3ff);
a0006af0:	3ff47913          	andi	s2,s0,1023
    const char *mcause_str[] = {
a0006af4:	870a                	mv	a4,sp
a0006af6:	04078813          	addi	a6,a5,64
a0006afa:	4388                	lw	a0,0(a5)
a0006afc:	43cc                	lw	a1,4(a5)
a0006afe:	4790                	lw	a2,8(a5)
a0006b00:	47d4                	lw	a3,12(a5)
a0006b02:	c308                	sw	a0,0(a4)
a0006b04:	c34c                	sw	a1,4(a4)
a0006b06:	c710                	sw	a2,8(a4)
a0006b08:	c754                	sw	a3,12(a4)
a0006b0a:	07c1                	addi	a5,a5,16
a0006b0c:	0741                	addi	a4,a4,16
a0006b0e:	ff0796e3          	bne	a5,a6,a0006afa <exception_entry+0x5c>
        "Load page fault",
        "RSVD",
        "Store/AMO page fault"
    };

    printf("%s\r\n", mcause_str[cause & 0xf]);
a0006b12:	883d                	andi	s0,s0,15
a0006b14:	4481458b          	lrw	a1,sp,s0,2
a0006b18:	a0009537          	lui	a0,0xa0009
a0006b1c:	82c50513          	addi	a0,a0,-2004 # a000882c <__psram_limit+0xf7c0882c>
a0006b20:	ee1fe0ef          	jal	ra,a0005a00 <printf>
#endif
    if ((cause == 8) || (cause == 11)) {
a0006b24:	47a1                	li	a5,8
a0006b26:	00f90663          	beq	s2,a5,a0006b32 <exception_entry+0x94>
a0006b2a:	47ad                	li	a5,11
a0006b2c:	00f90363          	beq	s2,a5,a0006b32 <exception_entry+0x94>
        epc += 4;
        WRITE_CSR(CSR_MEPC, epc);
    } else {
        while (1) {
a0006b30:	a001                	j	a0006b30 <exception_entry+0x92>
        epc += 4;
a0006b32:	0491                	addi	s1,s1,4
        WRITE_CSR(CSR_MEPC, epc);
a0006b34:	34149073          	csrw	mepc,s1
        }
    }
}
a0006b38:	40b6                	lw	ra,76(sp)
a0006b3a:	4426                	lw	s0,72(sp)
a0006b3c:	4496                	lw	s1,68(sp)
a0006b3e:	4906                	lw	s2,64(sp)
a0006b40:	6161                	addi	sp,sp,80
a0006b42:	8082                	ret

a0006b44 <interrupt_entry>:

void interrupt_entry(void)
{
a0006b44:	1141                	addi	sp,sp,-16
    irq_callback handler;
    void *arg;
    volatile uint32_t mcause = 0UL;
a0006b46:	c602                	sw	zero,12(sp)
    uint32_t irq_num;

    mcause = READ_CSR(CSR_MCAUSE);
a0006b48:	342027f3          	csrr	a5,mcause
a0006b4c:	c63e                	sw	a5,12(sp)
    irq_num = mcause & 0x3FF;
a0006b4e:	4532                	lw	a0,12(sp)

    if (irq_num < CONFIG_IRQ_NUM) {
a0006b50:	04f00793          	li	a5,79
    irq_num = mcause & 0x3FF;
a0006b54:	3ff57513          	andi	a0,a0,1023
    if (irq_num < CONFIG_IRQ_NUM) {
a0006b58:	00a7ec63          	bltu	a5,a0,a0006b70 <interrupt_entry+0x2c>
        handler = g_irqvector[irq_num].handler;
a0006b5c:	03018793          	addi	a5,gp,48 # 62fc9830 <g_irqvector>
a0006b60:	46a7c70b          	lrw	a4,a5,a0,3
        arg = g_irqvector[irq_num].arg;
        if (handler) {
a0006b64:	c711                	beqz	a4,a0006b70 <interrupt_entry+0x2c>
        arg = g_irqvector[irq_num].arg;
a0006b66:	06a7978b          	addsl	a5,a5,a0,3
            handler(irq_num, arg);
a0006b6a:	43cc                	lw	a1,4(a5)
        } else {
        }
    } else {
    }
}
a0006b6c:	0141                	addi	sp,sp,16
            handler(irq_num, arg);
a0006b6e:	8702                	jr	a4
}
a0006b70:	0141                	addi	sp,sp,16
a0006b72:	8082                	ret

a0006b74 <GLB_Set_ADC_CLK>:

    CHECK_PARAM(IS_GLB_ADC_CLK_TYPE(clkSel));
    CHECK_PARAM((div <= 0x3F));

    /* disable ADC clock first */
    tmpVal = BL_RD_REG(GLB_BASE, GLB_ADC_CFG0);
a0006b74:	200007b7          	lui	a5,0x20000
a0006b78:	1107a703          	lw	a4,272(a5) # 20000110 <nocache_min_size+0x1fffb110>
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_GPADC_32M_DIV_EN);
    BL_WR_REG(GLB_BASE, GLB_ADC_CFG0, tmpVal);

    tmpVal = BL_RD_REG(GLB_BASE, GLB_ADC_CFG0);
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_GPADC_32M_CLK_DIV, div);
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_GPADC_32M_CLK_SEL, clkSel);
a0006b7c:	059e                	slli	a1,a1,0x7
{
a0006b7e:	882a                	mv	a6,a0
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_GPADC_32M_DIV_EN);
a0006b80:	eff77713          	andi	a4,a4,-257
    BL_WR_REG(GLB_BASE, GLB_ADC_CFG0, tmpVal);
a0006b84:	10e7a823          	sw	a4,272(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_ADC_CFG0);
a0006b88:	1107a703          	lw	a4,272(a5)
    }
    BL_WR_REG(GLB_BASE, GLB_ADC_CFG0, tmpVal);
#endif

    return SUCCESS;
}
a0006b8c:	4501                	li	a0,0
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_GPADC_32M_CLK_DIV, div);
a0006b8e:	fc077713          	andi	a4,a4,-64
a0006b92:	8e59                	or	a2,a2,a4
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_GPADC_32M_CLK_SEL, clkSel);
a0006b94:	f7f67613          	andi	a2,a2,-129
a0006b98:	8dd1                	or	a1,a1,a2
    BL_WR_REG(GLB_BASE, GLB_ADC_CFG0, tmpVal);
a0006b9a:	10b7a823          	sw	a1,272(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_ADC_CFG0);
a0006b9e:	1107a703          	lw	a4,272(a5)
        tmpVal = BL_SET_REG_BIT(tmpVal, GLB_GPADC_32M_DIV_EN);
a0006ba2:	10076693          	ori	a3,a4,256
a0006ba6:	eff77713          	andi	a4,a4,-257
a0006baa:	4306970b          	mvnez	a4,a3,a6
    BL_WR_REG(GLB_BASE, GLB_ADC_CFG0, tmpVal);
a0006bae:	10e7a823          	sw	a4,272(a5)
}
a0006bb2:	8082                	ret

a0006bb4 <GLB_Set_IR_CLK>:
    CHECK_PARAM(IS_GLB_IR_CLK_SRC_TYPE(clkSel));
    CHECK_PARAM((div <= 0x3F));

    (void)clkSel;

    tmpVal = BL_RD_REG(GLB_BASE, GLB_IR_CFG0);
a0006bb4:	200007b7          	lui	a5,0x20000
a0006bb8:	1407a583          	lw	a1,320(a5) # 20000140 <nocache_min_size+0x1fffb140>
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_IR_CLK_EN);
a0006bbc:	ff800737          	lui	a4,0xff800
a0006bc0:	fff70693          	addi	a3,a4,-1 # ff7fffff <__psram_limit+0x573fffff>
a0006bc4:	00d5f733          	and	a4,a1,a3
    BL_WR_REG(GLB_BASE, GLB_IR_CFG0, tmpVal);
a0006bc8:	14e7a023          	sw	a4,320(a5)

    tmpVal = BL_RD_REG(GLB_BASE, GLB_IR_CFG0);
a0006bcc:	1407a703          	lw	a4,320(a5)
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_IR_CLK_DIV, div);
a0006bd0:	ffc105b7          	lui	a1,0xffc10
a0006bd4:	15fd                	addi	a1,a1,-1
a0006bd6:	8f6d                	and	a4,a4,a1
a0006bd8:	0642                	slli	a2,a2,0x10
a0006bda:	8e59                	or	a2,a2,a4
    BL_WR_REG(GLB_BASE, GLB_IR_CFG0, tmpVal);
a0006bdc:	14c7a023          	sw	a2,320(a5)

    tmpVal = BL_RD_REG(GLB_BASE, GLB_IR_CFG0);
a0006be0:	1407a703          	lw	a4,320(a5)
    if (enable) {
        tmpVal = BL_SET_REG_BIT(tmpVal, GLB_IR_CLK_EN);
a0006be4:	00800637          	lui	a2,0x800
a0006be8:	8e59                	or	a2,a2,a4
a0006bea:	8f75                	and	a4,a4,a3
a0006bec:	42a6170b          	mvnez	a4,a2,a0
    } else {
        tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_IR_CLK_EN);
    }
    BL_WR_REG(GLB_BASE, GLB_IR_CFG0, tmpVal);
a0006bf0:	14e7a023          	sw	a4,320(a5)
#endif
    return SUCCESS;
}
a0006bf4:	4501                	li	a0,0
a0006bf6:	8082                	ret

a0006bf8 <GLB_Set_I2C_CLK>:
#ifndef BOOTROM
    uint32_t tmpVal = 0;

    CHECK_PARAM(IS_GLB_I2C_CLK_TYPE(clkSel));

    tmpVal = BL_RD_REG(GLB_BASE, GLB_I2C_CFG0);
a0006bf8:	200007b7          	lui	a5,0x20000
a0006bfc:	1807a803          	lw	a6,384(a5) # 20000180 <nocache_min_size+0x1fffb180>
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_I2C_CLK_EN);
a0006c00:	ff000737          	lui	a4,0xff000
a0006c04:	fff70693          	addi	a3,a4,-1 # feffffff <__psram_limit+0x56bfffff>
a0006c08:	00d87733          	and	a4,a6,a3
    BL_WR_REG(GLB_BASE, GLB_I2C_CFG0, tmpVal);
a0006c0c:	18e7a023          	sw	a4,384(a5)

    tmpVal = BL_RD_REG(GLB_BASE, GLB_I2C_CFG0);
a0006c10:	1807a703          	lw	a4,384(a5)
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_I2C_CLK_SEL, clkSel);
a0006c14:	fe000837          	lui	a6,0xfe000
a0006c18:	187d                	addi	a6,a6,-1
a0006c1a:	01077733          	and	a4,a4,a6
a0006c1e:	05e6                	slli	a1,a1,0x19
a0006c20:	8dd9                	or	a1,a1,a4
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_I2C_CLK_DIV, div);
a0006c22:	ff010737          	lui	a4,0xff010
a0006c26:	177d                	addi	a4,a4,-1
a0006c28:	8df9                	and	a1,a1,a4
a0006c2a:	0642                	slli	a2,a2,0x10
a0006c2c:	8dd1                	or	a1,a1,a2
    BL_WR_REG(GLB_BASE, GLB_I2C_CFG0, tmpVal);
a0006c2e:	18b7a023          	sw	a1,384(a5)

    tmpVal = BL_RD_REG(GLB_BASE, GLB_I2C_CFG0);
a0006c32:	1807a703          	lw	a4,384(a5)
    if (enable) {
        tmpVal = BL_SET_REG_BIT(tmpVal, GLB_I2C_CLK_EN);
a0006c36:	01000637          	lui	a2,0x1000
a0006c3a:	8e59                	or	a2,a2,a4
a0006c3c:	8f75                	and	a4,a4,a3
a0006c3e:	42a6170b          	mvnez	a4,a2,a0
    } else {
        tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_I2C_CLK_EN);
    }
    BL_WR_REG(GLB_BASE, GLB_I2C_CFG0, tmpVal);
a0006c42:	18e7a023          	sw	a4,384(a5)
#endif
    return SUCCESS;
}
a0006c46:	4501                	li	a0,0
a0006c48:	8082                	ret

a0006c4a <GLB_Set_SPI_CLK>:
    uint32_t tmpVal = 0;

    CHECK_PARAM(IS_GLB_SPI_CLK_TYPE(clkSel));
    CHECK_PARAM((div <= 0x1F));

    tmpVal = BL_RD_REG(GLB_BASE, GLB_SPI_CFG0);
a0006c4a:	200007b7          	lui	a5,0x20000
a0006c4e:	1b07a683          	lw	a3,432(a5) # 200001b0 <nocache_min_size+0x1fffb1b0>
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_SPI_CLK_EN);
    BL_WR_REG(GLB_BASE, GLB_SPI_CFG0, tmpVal);

    tmpVal = BL_RD_REG(GLB_BASE, GLB_SPI_CFG0);
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_SPI_CLK_DIV, div);
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_SPI_CLK_SEL, clkSel);
a0006c52:	05a6                	slli	a1,a1,0x9
{
a0006c54:	882a                	mv	a6,a0
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_SPI_CLK_EN);
a0006c56:	eff6f693          	andi	a3,a3,-257
    BL_WR_REG(GLB_BASE, GLB_SPI_CFG0, tmpVal);
a0006c5a:	1ad7a823          	sw	a3,432(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SPI_CFG0);
a0006c5e:	1b07a703          	lw	a4,432(a5)
        tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_SPI_CLK_EN);
    }
    BL_WR_REG(GLB_BASE, GLB_SPI_CFG0, tmpVal);
#endif
    return SUCCESS;
}
a0006c62:	4501                	li	a0,0
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_SPI_CLK_DIV, div);
a0006c64:	de077713          	andi	a4,a4,-544
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_SPI_CLK_SEL, clkSel);
a0006c68:	8f51                	or	a4,a4,a2
a0006c6a:	8dd9                	or	a1,a1,a4
    BL_WR_REG(GLB_BASE, GLB_SPI_CFG0, tmpVal);
a0006c6c:	1ab7a823          	sw	a1,432(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_SPI_CFG0);
a0006c70:	1b07a703          	lw	a4,432(a5)
        tmpVal = BL_SET_REG_BIT(tmpVal, GLB_SPI_CLK_EN);
a0006c74:	10076693          	ori	a3,a4,256
a0006c78:	eff77713          	andi	a4,a4,-257
a0006c7c:	4306970b          	mvnez	a4,a3,a6
    BL_WR_REG(GLB_BASE, GLB_SPI_CFG0, tmpVal);
a0006c80:	1ae7a823          	sw	a4,432(a5)
}
a0006c84:	8082                	ret

a0006c86 <GLB_Set_DBI_CLK>:
    uint32_t tmpVal = 0;

    CHECK_PARAM(IS_GLB_DBI_CLK_TYPE(clkSel));
    CHECK_PARAM((div <= 0x1F));

    tmpVal = BL_RD_REG(GLB_BASE, GLB_DBI_CFG0);
a0006c86:	200007b7          	lui	a5,0x20000
a0006c8a:	1f07a683          	lw	a3,496(a5) # 200001f0 <nocache_min_size+0x1fffb1f0>
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_DBI_CLK_EN);
    BL_WR_REG(GLB_BASE, GLB_DBI_CFG0, tmpVal);

    tmpVal = BL_RD_REG(GLB_BASE, GLB_DBI_CFG0);
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_DBI_CLK_DIV, div);
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_DBI_CLK_SEL, clkSel);
a0006c8e:	05a6                	slli	a1,a1,0x9
{
a0006c90:	882a                	mv	a6,a0
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_DBI_CLK_EN);
a0006c92:	eff6f693          	andi	a3,a3,-257
    BL_WR_REG(GLB_BASE, GLB_DBI_CFG0, tmpVal);
a0006c96:	1ed7a823          	sw	a3,496(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DBI_CFG0);
a0006c9a:	1f07a703          	lw	a4,496(a5)
        tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_DBI_CLK_EN);
    }
    BL_WR_REG(GLB_BASE, GLB_DBI_CFG0, tmpVal);
#endif
    return SUCCESS;
}
a0006c9e:	4501                	li	a0,0
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_DBI_CLK_DIV, div);
a0006ca0:	de077713          	andi	a4,a4,-544
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_DBI_CLK_SEL, clkSel);
a0006ca4:	8f51                	or	a4,a4,a2
a0006ca6:	8dd9                	or	a1,a1,a4
    BL_WR_REG(GLB_BASE, GLB_DBI_CFG0, tmpVal);
a0006ca8:	1eb7a823          	sw	a1,496(a5)
    tmpVal = BL_RD_REG(GLB_BASE, GLB_DBI_CFG0);
a0006cac:	1f07a703          	lw	a4,496(a5)
        tmpVal = BL_SET_REG_BIT(tmpVal, GLB_DBI_CLK_EN);
a0006cb0:	10076693          	ori	a3,a4,256
a0006cb4:	eff77713          	andi	a4,a4,-257
a0006cb8:	4306970b          	mvnez	a4,a3,a6
    BL_WR_REG(GLB_BASE, GLB_DBI_CFG0, tmpVal);
a0006cbc:	1ee7a823          	sw	a4,496(a5)
}
a0006cc0:	8082                	ret

a0006cc2 <GLB_Set_CAM_CLK>:
    uint32_t tmpVal = 0;

    CHECK_PARAM(IS_GLB_CAM_CLK_TYPE(clkSel));
    CHECK_PARAM((div <= 0x3));

    tmpVal = BL_RD_REG(GLB_BASE, GLB_CAM_CFG0);
a0006cc2:	200007b7          	lui	a5,0x20000
a0006cc6:	4207a803          	lw	a6,1056(a5) # 20000420 <nocache_min_size+0x1fffb420>
    tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_REG_CAM_REF_CLK_EN);
a0006cca:	f8000737          	lui	a4,0xf8000
a0006cce:	fff70693          	addi	a3,a4,-1 # f7ffffff <__psram_limit+0x4fbfffff>
a0006cd2:	00d87733          	and	a4,a6,a3
    BL_WR_REG(GLB_BASE, GLB_CAM_CFG0, tmpVal);
a0006cd6:	42e7a023          	sw	a4,1056(a5)

    tmpVal = BL_RD_REG(GLB_BASE, GLB_CAM_CFG0);
a0006cda:	4207a703          	lw	a4,1056(a5)
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_REG_CAM_REF_CLK_SRC_SEL, clkSel);
a0006cde:	d0000837          	lui	a6,0xd0000
a0006ce2:	187d                	addi	a6,a6,-1
a0006ce4:	01077733          	and	a4,a4,a6
a0006ce8:	05f2                	slli	a1,a1,0x1c
a0006cea:	8dd9                	or	a1,a1,a4
    tmpVal = BL_SET_REG_BITS_VAL(tmpVal, GLB_REG_CAM_REF_CLK_DIV, div);
a0006cec:	40000737          	lui	a4,0x40000
a0006cf0:	177d                	addi	a4,a4,-1
a0006cf2:	8df9                	and	a1,a1,a4
a0006cf4:	067a                	slli	a2,a2,0x1e
a0006cf6:	8dd1                	or	a1,a1,a2
    BL_WR_REG(GLB_BASE, GLB_CAM_CFG0, tmpVal);
a0006cf8:	42b7a023          	sw	a1,1056(a5)

    tmpVal = BL_RD_REG(GLB_BASE, GLB_CAM_CFG0);
a0006cfc:	4207a703          	lw	a4,1056(a5)
    if (enable) {
        tmpVal = BL_SET_REG_BIT(tmpVal, GLB_REG_CAM_REF_CLK_EN);
a0006d00:	08000637          	lui	a2,0x8000
a0006d04:	8e59                	or	a2,a2,a4
a0006d06:	8f75                	and	a4,a4,a3
a0006d08:	42a6170b          	mvnez	a4,a2,a0
    } else {
        tmpVal = BL_CLR_REG_BIT(tmpVal, GLB_REG_CAM_REF_CLK_EN);
    }
    BL_WR_REG(GLB_BASE, GLB_CAM_CFG0, tmpVal);
a0006d0c:	42e7a023          	sw	a4,1056(a5)
#endif
    return SUCCESS;
}
a0006d10:	4501                	li	a0,0
a0006d12:	8082                	ret

a0006d14 <bflb_ef_ctrl_get_device_info>:
 *
 * @return None
 *
*******************************************************************************/
void bflb_ef_ctrl_get_device_info(bflb_efuse_device_info_type *deviceInfo)
{
a0006d14:	862a                	mv	a2,a0
    uint32_t *p = (uint32_t *)deviceInfo;

    bflb_ef_ctrl_read_direct(NULL, EF_DATA_EF_WIFI_MAC_HIGH_OFFSET, p, 1, 1);
a0006d16:	4705                	li	a4,1
a0006d18:	4685                	li	a3,1
a0006d1a:	45e1                	li	a1,24
a0006d1c:	4501                	li	a0,0
a0006d1e:	c2fb9317          	auipc	t1,0xc2fb9
a0006d22:	3c230067          	jr	962(t1) # 62fc00e0 <bflb_ef_ctrl_read_direct>

a0006d26 <bflb_clk_get_peripheral_clock>:
    return 0;
}

uint32_t bflb_clk_get_peripheral_clock(uint8_t type, uint8_t idx)
{
    if (type == BFLB_DEVICE_TYPE_ADC) {
a0006d26:	c531                	beqz	a0,a0006d72 <bflb_clk_get_peripheral_clock+0x4c>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_ADC);
    } else if (type == BFLB_DEVICE_TYPE_DAC) {
a0006d28:	4785                	li	a5,1
a0006d2a:	04f50e63          	beq	a0,a5,a0006d86 <bflb_clk_get_peripheral_clock+0x60>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_GPDAC);
    } else if (type == BFLB_DEVICE_TYPE_UART) {
a0006d2e:	4795                	li	a5,5
a0006d30:	06f50063          	beq	a0,a5,a0006d90 <bflb_clk_get_peripheral_clock+0x6a>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_UART0);
    } else if (type == BFLB_DEVICE_TYPE_SPI) {
a0006d34:	4799                	li	a5,6
a0006d36:	06f50263          	beq	a0,a5,a0006d9a <bflb_clk_get_peripheral_clock+0x74>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SPI);
    } else if (type == BFLB_DEVICE_TYPE_I2C) {
a0006d3a:	479d                	li	a5,7
a0006d3c:	04f50063          	beq	a0,a5,a0006d7c <bflb_clk_get_peripheral_clock+0x56>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_I2C0);
    } else if (type == BFLB_DEVICE_TYPE_FLASH) {
a0006d40:	47bd                	li	a5,15
a0006d42:	06f50163          	beq	a0,a5,a0006da4 <bflb_clk_get_peripheral_clock+0x7e>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_FLASH);
    } else if (type == BFLB_DEVICE_TYPE_IR) {
a0006d46:	47a9                	li	a5,10
a0006d48:	06f50363          	beq	a0,a5,a0006dae <bflb_clk_get_peripheral_clock+0x88>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_IR);
    } else if (type == BFLB_DEVICE_TYPE_PKA) {
a0006d4c:	02000793          	li	a5,32
a0006d50:	06f50463          	beq	a0,a5,a0006db8 <bflb_clk_get_peripheral_clock+0x92>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_PKA);
    } else if (type == BFLB_DEVICE_TYPE_SDH) {
a0006d54:	47c5                	li	a5,17
a0006d56:	06f50663          	beq	a0,a5,a0006dc2 <bflb_clk_get_peripheral_clock+0x9c>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SDH);
    } else if (type == BFLB_DEVICE_TYPE_CAMERA) {
a0006d5a:	47b9                	li	a5,14
a0006d5c:	06f50863          	beq	a0,a5,a0006dcc <bflb_clk_get_peripheral_clock+0xa6>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_CAM);
    } else if (type == BFLB_DEVICE_TYPE_DBI) {
a0006d60:	02400793          	li	a5,36
a0006d64:	06f50963          	beq	a0,a5,a0006dd6 <bflb_clk_get_peripheral_clock+0xb0>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_DBI);
    } else if (type == BFLB_DEVICE_TYPE_I2S) {
a0006d68:	47a5                	li	a5,9
a0006d6a:	06f50b63          	beq	a0,a5,a0006de0 <bflb_clk_get_peripheral_clock+0xba>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_I2S);
    }
    return 0;
}
a0006d6e:	4501                	li	a0,0
a0006d70:	8082                	ret
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_ADC);
a0006d72:	4539                	li	a0,14
a0006d74:	c2fba317          	auipc	t1,0xc2fba
a0006d78:	8f830067          	jr	-1800(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_I2C0);
a0006d7c:	4521                	li	a0,8
a0006d7e:	c2fba317          	auipc	t1,0xc2fba
a0006d82:	8ee30067          	jr	-1810(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_GPDAC);
a0006d86:	4541                	li	a0,16
a0006d88:	c2fba317          	auipc	t1,0xc2fba
a0006d8c:	8e430067          	jr	-1820(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_UART0);
a0006d90:	4501                	li	a0,0
a0006d92:	c2fba317          	auipc	t1,0xc2fba
a0006d96:	8da30067          	jr	-1830(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SPI);
a0006d9a:	450d                	li	a0,3
a0006d9c:	c2fba317          	auipc	t1,0xc2fba
a0006da0:	8d030067          	jr	-1840(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_FLASH);
a0006da4:	452d                	li	a0,11
a0006da6:	c2fba317          	auipc	t1,0xc2fba
a0006daa:	8c630067          	jr	-1850(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_IR);
a0006dae:	4535                	li	a0,13
a0006db0:	c2fba317          	auipc	t1,0xc2fba
a0006db4:	8bc30067          	jr	-1860(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_PKA);
a0006db8:	454d                	li	a0,19
a0006dba:	c2fba317          	auipc	t1,0xc2fba
a0006dbe:	8b230067          	jr	-1870(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_SDH);
a0006dc2:	4549                	li	a0,18
a0006dc4:	c2fba317          	auipc	t1,0xc2fba
a0006dc8:	8a830067          	jr	-1880(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_CAM);
a0006dcc:	4545                	li	a0,17
a0006dce:	c2fba317          	auipc	t1,0xc2fba
a0006dd2:	89e30067          	jr	-1890(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_DBI);
a0006dd6:	4515                	li	a0,5
a0006dd8:	c2fba317          	auipc	t1,0xc2fba
a0006ddc:	89430067          	jr	-1900(t1) # 62fc066c <Clock_Peripheral_Clock_Get>
        return Clock_Peripheral_Clock_Get(BL_PERIPHERAL_CLOCK_I2S);
a0006de0:	4531                	li	a0,12
a0006de2:	c2fba317          	auipc	t1,0xc2fba
a0006de6:	88a30067          	jr	-1910(t1) # 62fc066c <Clock_Peripheral_Clock_Get>

a0006dea <bl_show_flashinfo>:
    printf("Build:%s,%s\r\n", __TIME__, __DATE__);
    printf("Copyright (c) 2022 Bouffalolab team\r\n");
}

void bl_show_flashinfo(void)
{
a0006dea:	7159                	addi	sp,sp,-112
a0006dec:	d686                	sw	ra,108(sp)
a0006dee:	d4a2                	sw	s0,104(sp)
    spi_flash_cfg_type flashCfg;
    uint8_t* pFlashCfg = NULL;
a0006df0:	c202                	sw	zero,4(sp)
    uint32_t flashCfgLen = 0;
a0006df2:	c402                	sw	zero,8(sp)
    uint32_t flashJedecId = 0;

    flashJedecId = bflb_flash_get_jedec_id();
a0006df4:	ec2ff0ef          	jal	ra,a00064b6 <bflb_flash_get_jedec_id>
a0006df8:	842a                	mv	s0,a0
    bflb_flash_get_cfg(&pFlashCfg, &flashCfgLen);
a0006dfa:	002c                	addi	a1,sp,8
a0006dfc:	0048                	addi	a0,sp,4
a0006dfe:	ed8ff0ef          	jal	ra,a00064d6 <bflb_flash_get_cfg>
    arch_memcpy((void*)&flashCfg, pFlashCfg, flashCfgLen);
a0006e02:	4622                	lw	a2,8(sp)
a0006e04:	4592                	lw	a1,4(sp)
a0006e06:	0068                	addi	a0,sp,12
a0006e08:	c2fb9097          	auipc	ra,0xc2fb9
a0006e0c:	1f8080e7          	jalr	504(ra) # 62fc0000 <arch_memcpy>
    printf("=========== flash cfg ==============\r\n");
a0006e10:	a0009537          	lui	a0,0xa0009
a0006e14:	da450513          	addi	a0,a0,-604 # a0008da4 <__psram_limit+0xf7c08da4>
a0006e18:	be9fe0ef          	jal	ra,a0005a00 <printf>
    printf("jedec id   0x%06X\r\n", flashJedecId);
a0006e1c:	a0009537          	lui	a0,0xa0009
a0006e20:	85a2                	mv	a1,s0
a0006e22:	dcc50513          	addi	a0,a0,-564 # a0008dcc <__psram_limit+0xf7c08dcc>
a0006e26:	bdbfe0ef          	jal	ra,a0005a00 <printf>
    printf("mid            0x%02X\r\n", flashCfg.mid);
a0006e2a:	01914583          	lbu	a1,25(sp)
a0006e2e:	a0009537          	lui	a0,0xa0009
a0006e32:	de050513          	addi	a0,a0,-544 # a0008de0 <__psram_limit+0xf7c08de0>
a0006e36:	bcbfe0ef          	jal	ra,a0005a00 <printf>
    printf("iomode         0x%02X\r\n", flashCfg.io_mode);
a0006e3a:	00c14583          	lbu	a1,12(sp)
a0006e3e:	a0009537          	lui	a0,0xa0009
a0006e42:	df850513          	addi	a0,a0,-520 # a0008df8 <__psram_limit+0xf7c08df8>
a0006e46:	bbbfe0ef          	jal	ra,a0005a00 <printf>
    printf("clk delay      0x%02X\r\n", flashCfg.clk_delay);
a0006e4a:	00e14583          	lbu	a1,14(sp)
a0006e4e:	a0009537          	lui	a0,0xa0009
a0006e52:	e1050513          	addi	a0,a0,-496 # a0008e10 <__psram_limit+0xf7c08e10>
a0006e56:	babfe0ef          	jal	ra,a0005a00 <printf>
    printf("clk invert     0x%02X\r\n", flashCfg.clk_invert);
a0006e5a:	00f14583          	lbu	a1,15(sp)
a0006e5e:	a0009537          	lui	a0,0xa0009
a0006e62:	e2850513          	addi	a0,a0,-472 # a0008e28 <__psram_limit+0xf7c08e28>
a0006e66:	b9bfe0ef          	jal	ra,a0005a00 <printf>
    printf("read reg cmd0  0x%02X\r\n", flashCfg.read_reg_cmd[0]);
a0006e6a:	04014583          	lbu	a1,64(sp)
a0006e6e:	a0009537          	lui	a0,0xa0009
a0006e72:	e4050513          	addi	a0,a0,-448 # a0008e40 <__psram_limit+0xf7c08e40>
a0006e76:	b8bfe0ef          	jal	ra,a0005a00 <printf>
    printf("read reg cmd1  0x%02X\r\n", flashCfg.read_reg_cmd[1]);
a0006e7a:	04114583          	lbu	a1,65(sp)
a0006e7e:	a0009537          	lui	a0,0xa0009
a0006e82:	e5850513          	addi	a0,a0,-424 # a0008e58 <__psram_limit+0xf7c08e58>
a0006e86:	b7bfe0ef          	jal	ra,a0005a00 <printf>
    printf("write reg cmd0 0x%02X\r\n", flashCfg.write_reg_cmd[0]);
a0006e8a:	04414583          	lbu	a1,68(sp)
a0006e8e:	a0009537          	lui	a0,0xa0009
a0006e92:	e7050513          	addi	a0,a0,-400 # a0008e70 <__psram_limit+0xf7c08e70>
a0006e96:	b6bfe0ef          	jal	ra,a0005a00 <printf>
    printf("write reg cmd1 0x%02X\r\n", flashCfg.write_reg_cmd[1]);
a0006e9a:	04514583          	lbu	a1,69(sp)
a0006e9e:	a0009537          	lui	a0,0xa0009
a0006ea2:	e8850513          	addi	a0,a0,-376 # a0008e88 <__psram_limit+0xf7c08e88>
a0006ea6:	b5bfe0ef          	jal	ra,a0005a00 <printf>
    printf("qe write len   0x%02X\r\n", flashCfg.qe_write_reg_len);
a0006eaa:	03c14583          	lbu	a1,60(sp)
a0006eae:	a0009537          	lui	a0,0xa0009
a0006eb2:	ea050513          	addi	a0,a0,-352 # a0008ea0 <__psram_limit+0xf7c08ea0>
a0006eb6:	b4bfe0ef          	jal	ra,a0005a00 <printf>
    printf("cread support  0x%02X\r\n", flashCfg.c_read_support);
a0006eba:	00d14583          	lbu	a1,13(sp)
a0006ebe:	a0009537          	lui	a0,0xa0009
a0006ec2:	eb850513          	addi	a0,a0,-328 # a0008eb8 <__psram_limit+0xf7c08eb8>
a0006ec6:	b3bfe0ef          	jal	ra,a0005a00 <printf>
    printf("cread code     0x%02X\r\n", flashCfg.c_read_mode);
a0006eca:	04a14583          	lbu	a1,74(sp)
a0006ece:	a0009537          	lui	a0,0xa0009
a0006ed2:	ed050513          	addi	a0,a0,-304 # a0008ed0 <__psram_limit+0xf7c08ed0>
a0006ed6:	b2bfe0ef          	jal	ra,a0005a00 <printf>
    printf("burst wrap cmd 0x%02X\r\n", flashCfg.burst_wrap_cmd);
a0006eda:	04c14583          	lbu	a1,76(sp)
a0006ede:	a0009537          	lui	a0,0xa0009
a0006ee2:	ee850513          	addi	a0,a0,-280 # a0008ee8 <__psram_limit+0xf7c08ee8>
a0006ee6:	b1bfe0ef          	jal	ra,a0005a00 <printf>
    printf("=====================================\r\n");
a0006eea:	a0009537          	lui	a0,0xa0009
a0006eee:	f0050513          	addi	a0,a0,-256 # a0008f00 <__psram_limit+0xf7c08f00>
a0006ef2:	b0ffe0ef          	jal	ra,a0005a00 <printf>
}
a0006ef6:	50b6                	lw	ra,108(sp)
a0006ef8:	5426                	lw	s0,104(sp)
a0006efa:	6165                	addi	sp,sp,112
a0006efc:	8082                	ret

a0006efe <board_init>:
    bflb_uart_init(uart0, &cfg);
    bflb_uart_set_console(uart0);
}

void board_init(void)
{
a0006efe:	7159                	addi	sp,sp,-112
a0006f00:	d686                	sw	ra,108(sp)
a0006f02:	d4a2                	sw	s0,104(sp)
a0006f04:	d2a6                	sw	s1,100(sp)
a0006f06:	d0ca                	sw	s2,96(sp)
a0006f08:	cece                	sw	s3,92(sp)
    int ret = -1;
    uintptr_t flag;
    size_t heap_len;

    flag = bflb_irq_save();
a0006f0a:	c2fb9097          	auipc	ra,0xc2fb9
a0006f0e:	630080e7          	jalr	1584(ra) # 62fc053a <bflb_irq_save>
a0006f12:	892a                	mv	s2,a0

    ret = bflb_flash_init();
a0006f14:	c2fb9097          	auipc	ra,0xc2fb9
a0006f18:	426080e7          	jalr	1062(ra) # 62fc033a <bflb_flash_init>
    GLB_Power_On_XTAL_And_PLL_CLK(GLB_XTAL_40M, GLB_PLL_WIFIPLL | GLB_PLL_AUPLL);
a0006f1c:	458d                	li	a1,3
    ret = bflb_flash_init();
a0006f1e:	89aa                	mv	s3,a0
    GLB_Power_On_XTAL_And_PLL_CLK(GLB_XTAL_40M, GLB_PLL_WIFIPLL | GLB_PLL_AUPLL);
a0006f20:	4511                	li	a0,4
a0006f22:	c2fb9097          	auipc	ra,0xc2fb9
a0006f26:	75e080e7          	jalr	1886(ra) # 62fc0680 <GLB_Power_On_XTAL_And_PLL_CLK>
    GLB_Set_MCU_System_CLK(GLB_MCU_SYS_CLK_TOP_WIFIPLL_320M);
a0006f2a:	4515                	li	a0,5
a0006f2c:	c2fb9097          	auipc	ra,0xc2fb9
a0006f30:	772080e7          	jalr	1906(ra) # 62fc069e <GLB_Set_MCU_System_CLK>
    CPU_Set_MTimer_CLK(ENABLE, BL_MTIMER_SOURCE_CLOCK_MCU_XCLK, Clock_System_Clock_Get(BL_SYSTEM_CLOCK_XCLK) / 1000000 - 1);
a0006f34:	4515                	li	a0,5
a0006f36:	c2fb9097          	auipc	ra,0xc2fb9
a0006f3a:	740080e7          	jalr	1856(ra) # 62fc0676 <Clock_System_Clock_Get>
a0006f3e:	000f4637          	lui	a2,0xf4
a0006f42:	24060613          	addi	a2,a2,576 # f4240 <nocache_min_size+0xef240>
a0006f46:	02c55633          	divu	a2,a0,a2
a0006f4a:	4581                	li	a1,0
a0006f4c:	4505                	li	a0,1
    printf("\r\n");
a0006f4e:	a00094b7          	lui	s1,0xa0009
    CPU_Set_MTimer_CLK(ENABLE, BL_MTIMER_SOURCE_CLOCK_MCU_XCLK, Clock_System_Clock_Get(BL_SYSTEM_CLOCK_XCLK) / 1000000 - 1);
a0006f52:	167d                	addi	a2,a2,-1
a0006f54:	3c06360b          	extu	a2,a2,15,0
a0006f58:	c2fb9097          	auipc	ra,0xc2fb9
a0006f5c:	70a080e7          	jalr	1802(ra) # 62fc0662 <CPU_Set_MTimer_CLK>
    PERIPHERAL_CLOCK_ADC_DAC_ENABLE();
a0006f60:	200007b7          	lui	a5,0x20000
a0006f64:	5847a703          	lw	a4,1412(a5) # 20000584 <nocache_min_size+0x1fffb584>
    PERIPHERAL_CLOCK_DMA0_ENABLE();
a0006f68:	6685                	lui	a3,0x1
    PERIPHERAL_CLOCK_TIMER0_1_WDG_ENABLE();
a0006f6a:	00200837          	lui	a6,0x200
    PERIPHERAL_CLOCK_ADC_DAC_ENABLE();
a0006f6e:	c63a                	sw	a4,12(sp)
a0006f70:	4732                	lw	a4,12(sp)
    GLB_Set_UART_CLK(ENABLE, HBN_UART_CLK_XCLK, 0);
a0006f72:	4601                	li	a2,0
a0006f74:	4589                	li	a1,2
    PERIPHERAL_CLOCK_ADC_DAC_ENABLE();
a0006f76:	00476713          	ori	a4,a4,4
a0006f7a:	c63a                	sw	a4,12(sp)
a0006f7c:	4732                	lw	a4,12(sp)
    GLB_Set_UART_CLK(ENABLE, HBN_UART_CLK_XCLK, 0);
a0006f7e:	4505                	li	a0,1
    PERIPHERAL_CLOCK_ADC_DAC_ENABLE();
a0006f80:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_SEC_ENABLE();
a0006f84:	5847a703          	lw	a4,1412(a5)
a0006f88:	c83a                	sw	a4,16(sp)
a0006f8a:	4742                	lw	a4,16(sp)
a0006f8c:	01076713          	ori	a4,a4,16
a0006f90:	c83a                	sw	a4,16(sp)
a0006f92:	4742                	lw	a4,16(sp)
a0006f94:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_DMA0_ENABLE();
a0006f98:	5847a703          	lw	a4,1412(a5)
a0006f9c:	ca3a                	sw	a4,20(sp)
a0006f9e:	4752                	lw	a4,20(sp)
a0006fa0:	8f55                	or	a4,a4,a3
a0006fa2:	ca3a                	sw	a4,20(sp)
a0006fa4:	4752                	lw	a4,20(sp)
a0006fa6:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_UART0_ENABLE();
a0006faa:	5847a703          	lw	a4,1412(a5)
a0006fae:	cc3a                	sw	a4,24(sp)
a0006fb0:	46e2                	lw	a3,24(sp)
a0006fb2:	6741                	lui	a4,0x10
a0006fb4:	8ed9                	or	a3,a3,a4
a0006fb6:	cc36                	sw	a3,24(sp)
a0006fb8:	4762                	lw	a4,24(sp)
a0006fba:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_UART1_ENABLE();
a0006fbe:	5847a703          	lw	a4,1412(a5)
a0006fc2:	ce3a                	sw	a4,28(sp)
a0006fc4:	46f2                	lw	a3,28(sp)
a0006fc6:	00020737          	lui	a4,0x20
a0006fca:	8ed9                	or	a3,a3,a4
a0006fcc:	ce36                	sw	a3,28(sp)
a0006fce:	4772                	lw	a4,28(sp)
a0006fd0:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_SPI0_ENABLE();
a0006fd4:	5847a703          	lw	a4,1412(a5)
a0006fd8:	d03a                	sw	a4,32(sp)
a0006fda:	5682                	lw	a3,32(sp)
a0006fdc:	00040737          	lui	a4,0x40
a0006fe0:	8ed9                	or	a3,a3,a4
a0006fe2:	d036                	sw	a3,32(sp)
a0006fe4:	5702                	lw	a4,32(sp)
a0006fe6:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_I2C0_ENABLE();
a0006fea:	5847a703          	lw	a4,1412(a5)
a0006fee:	d23a                	sw	a4,36(sp)
a0006ff0:	5692                	lw	a3,36(sp)
a0006ff2:	00080737          	lui	a4,0x80
a0006ff6:	8ed9                	or	a3,a3,a4
a0006ff8:	d236                	sw	a3,36(sp)
a0006ffa:	5712                	lw	a4,36(sp)
a0006ffc:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_PWM0_ENABLE();
a0007000:	5847a703          	lw	a4,1412(a5)
a0007004:	d43a                	sw	a4,40(sp)
a0007006:	56a2                	lw	a3,40(sp)
a0007008:	00100737          	lui	a4,0x100
a000700c:	8ed9                	or	a3,a3,a4
a000700e:	d436                	sw	a3,40(sp)
a0007010:	5722                	lw	a4,40(sp)
a0007012:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_TIMER0_1_WDG_ENABLE();
a0007016:	5847a703          	lw	a4,1412(a5)
a000701a:	d63a                	sw	a4,44(sp)
a000701c:	56b2                	lw	a3,44(sp)
a000701e:	0106e6b3          	or	a3,a3,a6
a0007022:	d636                	sw	a3,44(sp)
a0007024:	5732                	lw	a4,44(sp)
a0007026:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_IR_ENABLE();
a000702a:	5847a703          	lw	a4,1412(a5)
a000702e:	d83a                	sw	a4,48(sp)
a0007030:	56c2                	lw	a3,48(sp)
a0007032:	00400737          	lui	a4,0x400
a0007036:	8ed9                	or	a3,a3,a4
a0007038:	d836                	sw	a3,48(sp)
a000703a:	5742                	lw	a4,48(sp)
a000703c:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_I2S_ENABLE();
a0007040:	5847a703          	lw	a4,1412(a5)
a0007044:	da3a                	sw	a4,52(sp)
a0007046:	56d2                	lw	a3,52(sp)
a0007048:	08000737          	lui	a4,0x8000
a000704c:	8ed9                	or	a3,a3,a4
a000704e:	da36                	sw	a3,52(sp)
a0007050:	5752                	lw	a4,52(sp)
a0007052:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_USB_ENABLE();
a0007056:	5847a703          	lw	a4,1412(a5)
a000705a:	dc3a                	sw	a4,56(sp)
a000705c:	56e2                	lw	a3,56(sp)
a000705e:	6709                	lui	a4,0x2
a0007060:	8ed9                	or	a3,a3,a4
a0007062:	dc36                	sw	a3,56(sp)
a0007064:	5762                	lw	a4,56(sp)
a0007066:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_CAN_ENABLE();
a000706a:	5847a703          	lw	a4,1412(a5)
a000706e:	de3a                	sw	a4,60(sp)
a0007070:	56f2                	lw	a3,60(sp)
a0007072:	04000737          	lui	a4,0x4000
a0007076:	8ed9                	or	a3,a3,a4
a0007078:	de36                	sw	a3,60(sp)
a000707a:	5772                	lw	a4,60(sp)
a000707c:	58e7a223          	sw	a4,1412(a5)
    PERIPHERAL_CLOCK_AUDIO_ENABLE();
a0007080:	5887a703          	lw	a4,1416(a5)
a0007084:	c0ba                	sw	a4,64(sp)
a0007086:	4706                	lw	a4,64(sp)
a0007088:	01076733          	or	a4,a4,a6
a000708c:	c0ba                	sw	a4,64(sp)
a000708e:	4706                	lw	a4,64(sp)
a0007090:	58e7a423          	sw	a4,1416(a5)
    GLB_Set_UART_CLK(ENABLE, HBN_UART_CLK_XCLK, 0);
a0007094:	c2fb9097          	auipc	ra,0xc2fb9
a0007098:	628080e7          	jalr	1576(ra) # 62fc06bc <GLB_Set_UART_CLK>
    GLB_Set_SPI_CLK(ENABLE, GLB_SPI_CLK_MCU_MUXPLL_160M, 0);
a000709c:	4601                	li	a2,0
a000709e:	4581                	li	a1,0
a00070a0:	4505                	li	a0,1
a00070a2:	3665                	jal	a0006c4a <GLB_Set_SPI_CLK>
    GLB_Set_DBI_CLK(ENABLE, GLB_SPI_CLK_MCU_MUXPLL_160M, 0);
a00070a4:	4601                	li	a2,0
a00070a6:	4581                	li	a1,0
a00070a8:	4505                	li	a0,1
a00070aa:	3ef1                	jal	a0006c86 <GLB_Set_DBI_CLK>
    GLB_Set_I2C_CLK(ENABLE, GLB_I2C_CLK_XCLK, 0);
a00070ac:	4601                	li	a2,0
a00070ae:	4585                	li	a1,1
a00070b0:	4505                	li	a0,1
a00070b2:	b47ff0ef          	jal	ra,a0006bf8 <GLB_Set_I2C_CLK>
    GLB_Set_ADC_CLK(ENABLE, GLB_ADC_CLK_XCLK, 1);
a00070b6:	4605                	li	a2,1
a00070b8:	4585                	li	a1,1
a00070ba:	4505                	li	a0,1
a00070bc:	ab9ff0ef          	jal	ra,a0006b74 <GLB_Set_ADC_CLK>
    GLB_Set_DIG_CLK_Sel(GLB_DIG_CLK_XCLK);
a00070c0:	4505                	li	a0,1
a00070c2:	c2fb9097          	auipc	ra,0xc2fb9
a00070c6:	5d2080e7          	jalr	1490(ra) # 62fc0694 <GLB_Set_DIG_CLK_Sel>
    GLB_Set_DIG_512K_CLK(ENABLE, ENABLE, 0x4E);
a00070ca:	04e00613          	li	a2,78
a00070ce:	4585                	li	a1,1
a00070d0:	4505                	li	a0,1
a00070d2:	c2fb9097          	auipc	ra,0xc2fb9
a00070d6:	5b8080e7          	jalr	1464(ra) # 62fc068a <GLB_Set_DIG_512K_CLK>
    GLB_Set_PWM1_IO_Sel(GLB_PWM1_IO_SINGLE_END);
a00070da:	4501                	li	a0,0
a00070dc:	c2fb9097          	auipc	ra,0xc2fb9
a00070e0:	5d6080e7          	jalr	1494(ra) # 62fc06b2 <GLB_Set_PWM1_IO_Sel>
    GLB_Set_IR_CLK(ENABLE, GLB_IR_CLK_SRC_XCLK, 19);
a00070e4:	464d                	li	a2,19
a00070e6:	4581                	li	a1,0
a00070e8:	4505                	li	a0,1
a00070ea:	acbff0ef          	jal	ra,a0006bb4 <GLB_Set_IR_CLK>
    GLB_Set_CAM_CLK(ENABLE, GLB_CAM_CLK_WIFIPLL_96M, 3);
a00070ee:	460d                	li	a2,3
a00070f0:	4585                	li	a1,1
a00070f2:	4505                	li	a0,1
a00070f4:	36f9                	jal	a0006cc2 <GLB_Set_CAM_CLK>
    GLB_Set_PKA_CLK_Sel(GLB_PKA_CLK_MCU_MUXPLL_160M);
a00070f6:	4505                	li	a0,1
a00070f8:	c2fb9097          	auipc	ra,0xc2fb9
a00070fc:	5b0080e7          	jalr	1456(ra) # 62fc06a8 <GLB_Set_PKA_CLK_Sel>
    GLB_Set_USB_CLK_From_WIFIPLL(1);
a0007100:	4505                	li	a0,1
a0007102:	c2fb9097          	auipc	ra,0xc2fb9
a0007106:	5c4080e7          	jalr	1476(ra) # 62fc06c6 <GLB_Set_USB_CLK_From_WIFIPLL>
    GLB_Swap_MCU_SPI_0_MOSI_With_MISO(0);
a000710a:	4501                	li	a0,0
a000710c:	c2fb9097          	auipc	ra,0xc2fb9
a0007110:	5c4080e7          	jalr	1476(ra) # 62fc06d0 <GLB_Swap_MCU_SPI_0_MOSI_With_MISO>

    system_clock_init();
    peripheral_clock_init();
    bflb_irq_initialize();
a0007114:	be0ff0ef          	jal	ra,a00064f4 <bflb_irq_initialize>
    gpio = bflb_device_get_by_name("gpio");
a0007118:	a0008537          	lui	a0,0xa0008
a000711c:	5e050513          	addi	a0,a0,1504 # a00085e0 <__psram_limit+0xf7c085e0>
a0007120:	bf2ff0ef          	jal	ra,a0006512 <bflb_device_get_by_name>
    bflb_gpio_uart_init(gpio, GPIO_PIN_21, GPIO_UART_FUNC_UART0_TX);
a0007124:	4609                	li	a2,2
a0007126:	45d5                	li	a1,21
    gpio = bflb_device_get_by_name("gpio");
a0007128:	842a                	mv	s0,a0
    bflb_gpio_uart_init(gpio, GPIO_PIN_21, GPIO_UART_FUNC_UART0_TX);
a000712a:	bebfe0ef          	jal	ra,a0005d14 <bflb_gpio_uart_init>
    bflb_gpio_uart_init(gpio, GPIO_PIN_22, GPIO_UART_FUNC_UART0_RX);
a000712e:	460d                	li	a2,3
a0007130:	45d9                	li	a1,22
a0007132:	8522                	mv	a0,s0
a0007134:	be1fe0ef          	jal	ra,a0005d14 <bflb_gpio_uart_init>
    cfg.baudrate = 2000000;
a0007138:	001e87b7          	lui	a5,0x1e8
a000713c:	48078793          	addi	a5,a5,1152 # 1e8480 <nocache_min_size+0x1e3480>
a0007140:	c2be                	sw	a5,68(sp)
    cfg.data_bits = UART_DATA_BITS_8;
a0007142:	478d                	li	a5,3
a0007144:	04f104a3          	sb	a5,73(sp)
    uart0 = bflb_device_get_by_name("uart0");
a0007148:	a0009537          	lui	a0,0xa0009
    cfg.stop_bits = UART_STOP_BITS_1;
a000714c:	4785                	li	a5,1
a000714e:	04f11523          	sh	a5,74(sp)
    uart0 = bflb_device_get_by_name("uart0");
a0007152:	8a450513          	addi	a0,a0,-1884 # a00088a4 <__psram_limit+0xf7c088a4>
    cfg.tx_fifo_threshold = 7;
a0007156:	70700793          	li	a5,1799
a000715a:	04f11723          	sh	a5,78(sp)
    cfg.flow_ctrl = 0;
a000715e:	040106a3          	sb	zero,77(sp)
    uart0 = bflb_device_get_by_name("uart0");
a0007162:	bb0ff0ef          	jal	ra,a0006512 <bflb_device_get_by_name>
a0007166:	2b018413          	addi	s0,gp,688 # 62fc9ab0 <uart0>
    bflb_uart_init(uart0, &cfg);
a000716a:	00cc                	addi	a1,sp,68
    uart0 = bflb_device_get_by_name("uart0");
a000716c:	c008                	sw	a0,0(s0)
    bflb_uart_init(uart0, &cfg);
a000716e:	a1eff0ef          	jal	ra,a000638c <bflb_uart_init>
    bflb_uart_set_console(uart0);
a0007172:	4008                	lw	a0,0(s0)

    heap_len = ((size_t)&__psram_limit - (size_t)&__psram_heap_base);
    pmem_init((void*)&__psram_heap_base, heap_len);
#endif

    heap_len = ((size_t)&__HeapLimit - (size_t)&__HeapBase);
a0007174:	63010437          	lui	s0,0x63010
a0007178:	00040413          	mv	s0,s0
    bflb_uart_set_console(uart0);
a000717c:	8b3fe0ef          	jal	ra,a0005a2e <bflb_uart_set_console>
    heap_len = ((size_t)&__HeapLimit - (size_t)&__HeapBase);
a0007180:	6b818793          	addi	a5,gp,1720 # 62fc9eb8 <__HeapBase>
a0007184:	8c1d                	sub	s0,s0,a5
    kmem_init((void*)&__HeapBase, heap_len);
a0007186:	85a2                	mv	a1,s0
a0007188:	6b818513          	addi	a0,gp,1720 # 62fc9eb8 <__HeapBase>
a000718c:	8a9fe0ef          	jal	ra,a0005a34 <kmem_init>
    printf("\r\n");
a0007190:	f7848513          	addi	a0,s1,-136 # a0008f78 <__psram_limit+0xf7c08f78>
a0007194:	86dfe0ef          	jal	ra,a0005a00 <printf>
    printf("  ____               __  __      _       _       _     \r\n");
a0007198:	a0009537          	lui	a0,0xa0009
a000719c:	bec50513          	addi	a0,a0,-1044 # a0008bec <__psram_limit+0xf7c08bec>
a00071a0:	861fe0ef          	jal	ra,a0005a00 <printf>
    printf(" |  _ \\             / _|/ _|    | |     | |     | |    \r\n");
a00071a4:	a0009537          	lui	a0,0xa0009
a00071a8:	c2850513          	addi	a0,a0,-984 # a0008c28 <__psram_limit+0xf7c08c28>
a00071ac:	855fe0ef          	jal	ra,a0005a00 <printf>
    printf(" | |_) | ___  _   _| |_| |_ __ _| | ___ | | __ _| |__  \r\n");
a00071b0:	a0009537          	lui	a0,0xa0009
a00071b4:	c6450513          	addi	a0,a0,-924 # a0008c64 <__psram_limit+0xf7c08c64>
a00071b8:	849fe0ef          	jal	ra,a0005a00 <printf>
    printf(" |  _ < / _ \\| | | |  _|  _/ _` | |/ _ \\| |/ _` | '_ \\ \r\n");
a00071bc:	a0009537          	lui	a0,0xa0009
a00071c0:	ca050513          	addi	a0,a0,-864 # a0008ca0 <__psram_limit+0xf7c08ca0>
a00071c4:	83dfe0ef          	jal	ra,a0005a00 <printf>
    printf(" | |_) | (_) | |_| | | | || (_| | | (_) | | (_| | |_) |\r\n");
a00071c8:	a0009537          	lui	a0,0xa0009
a00071cc:	cdc50513          	addi	a0,a0,-804 # a0008cdc <__psram_limit+0xf7c08cdc>
a00071d0:	831fe0ef          	jal	ra,a0005a00 <printf>
    printf(" |____/ \\___/ \\__,_|_| |_| \\__,_|_|\\___/|_|\\__,_|_.__/ \r\n");
a00071d4:	a0009537          	lui	a0,0xa0009
a00071d8:	d1850513          	addi	a0,a0,-744 # a0008d18 <__psram_limit+0xf7c08d18>
a00071dc:	825fe0ef          	jal	ra,a0005a00 <printf>
    printf("\r\n");
a00071e0:	f7848513          	addi	a0,s1,-136
a00071e4:	81dfe0ef          	jal	ra,a0005a00 <printf>
    printf("Build:%s,%s\r\n", __TIME__, __DATE__);
a00071e8:	a0009637          	lui	a2,0xa0009
a00071ec:	a00095b7          	lui	a1,0xa0009
a00071f0:	a0009537          	lui	a0,0xa0009
a00071f4:	d5460613          	addi	a2,a2,-684 # a0008d54 <__psram_limit+0xf7c08d54>
a00071f8:	d6058593          	addi	a1,a1,-672 # a0008d60 <__psram_limit+0xf7c08d60>
a00071fc:	d6c50513          	addi	a0,a0,-660 # a0008d6c <__psram_limit+0xf7c08d6c>
a0007200:	801fe0ef          	jal	ra,a0005a00 <printf>
    printf("Copyright (c) 2022 Bouffalolab team\r\n");
a0007204:	a0009537          	lui	a0,0xa0009
a0007208:	d7c50513          	addi	a0,a0,-644 # a0008d7c <__psram_limit+0xf7c08d7c>
a000720c:	ff4fe0ef          	jal	ra,a0005a00 <printf>

    bl_show_log();
    if (ret != 0) {
a0007210:	06099263          	bnez	s3,a0007274 <board_init+0x376>
        printf("flash init fail!!!\r\n");
    }
    bl_show_flashinfo();
a0007214:	3ed9                	jal	a0006dea <bl_show_flashinfo>
#ifdef CONFIG_PSRAM
    printf("dynamic memory init success, ocram heap size = %d Kbyte, psram heap size = %d Kbyte\r\n",
           ((size_t)&__HeapLimit - (size_t)&__HeapBase) / 1024,
           ((size_t)&__psram_limit - (size_t)&__psram_heap_base) / 1024);
#else
    printf("dynamic memory init success, ocram heap size = %d Kbyte \r\n", ((size_t)&__HeapLimit - (size_t)&__HeapBase) / 1024);
a0007216:	a0009537          	lui	a0,0xa0009
a000721a:	00a45593          	srli	a1,s0,0xa
a000721e:	f4050513          	addi	a0,a0,-192 # a0008f40 <__psram_limit+0xf7c08f40>
a0007222:	fdefe0ef          	jal	ra,a0005a00 <printf>
#endif

    printf("sig1:%08x\r\n", BL_RD_REG(GLB_BASE, GLB_UART_CFG1));
a0007226:	200004b7          	lui	s1,0x20000
a000722a:	1544a583          	lw	a1,340(s1) # 20000154 <nocache_min_size+0x1fffb154>
a000722e:	a0009537          	lui	a0,0xa0009
a0007232:	f7c50513          	addi	a0,a0,-132 # a0008f7c <__psram_limit+0xf7c08f7c>
a0007236:	fcafe0ef          	jal	ra,a0005a00 <printf>
    printf("sig2:%08x\r\n", BL_RD_REG(GLB_BASE, GLB_UART_CFG2));
a000723a:	1584a583          	lw	a1,344(s1)
a000723e:	a0009537          	lui	a0,0xa0009
a0007242:	f8850513          	addi	a0,a0,-120 # a0008f88 <__psram_limit+0xf7c08f88>
a0007246:	fbafe0ef          	jal	ra,a0005a00 <printf>
    printf("cgen1:%08x\r\n", getreg32(BFLB_GLB_CGEN1_BASE));
a000724a:	5844a583          	lw	a1,1412(s1)
a000724e:	a0009537          	lui	a0,0xa0009
a0007252:	f9450513          	addi	a0,a0,-108 # a0008f94 <__psram_limit+0xf7c08f94>
a0007256:	faafe0ef          	jal	ra,a0005a00 <printf>

    log_start();
a000725a:	9affe0ef          	jal	ra,a0005c08 <log_start>
#if (defined(CONFIG_LUA) || defined(CONFIG_BFLOG) || defined(CONFIG_FATFS))
    rtc = bflb_device_get_by_name("rtc");
#endif

    bflb_irq_restore(flag);
}
a000725e:	5426                	lw	s0,104(sp)
a0007260:	50b6                	lw	ra,108(sp)
a0007262:	5496                	lw	s1,100(sp)
a0007264:	49f6                	lw	s3,92(sp)
    bflb_irq_restore(flag);
a0007266:	854a                	mv	a0,s2
}
a0007268:	5906                	lw	s2,96(sp)
a000726a:	6165                	addi	sp,sp,112
    bflb_irq_restore(flag);
a000726c:	c2fb9317          	auipc	t1,0xc2fb9
a0007270:	2d630067          	jr	726(t1) # 62fc0542 <bflb_irq_restore>
        printf("flash init fail!!!\r\n");
a0007274:	a0009537          	lui	a0,0xa0009
a0007278:	f2850513          	addi	a0,a0,-216 # a0008f28 <__psram_limit+0xf7c08f28>
a000727c:	f84fe0ef          	jal	ra,a0005a00 <printf>
a0007280:	bf51                	j	a0007214 <board_init+0x316>

a0007282 <u8g2_send_buffer>:
  uint8_t dest_max;

  src_row = 0;
  src_max = u8g2->tile_buf_height;
  dest_row = u8g2->tile_curr_row;
  dest_max = u8g2_GetU8x8(u8g2)->display_info->tile_height;
a0007282:	411c                	lw	a5,0(a0)
{
a0007284:	1101                	addi	sp,sp,-32
a0007286:	ca26                	sw	s1,20(sp)
a0007288:	c84a                	sw	s2,16(sp)
a000728a:	ce06                	sw	ra,28(sp)
a000728c:	cc22                	sw	s0,24(sp)
a000728e:	c64e                	sw	s3,12(sp)
a0007290:	c452                	sw	s4,8(sp)
  src_max = u8g2->tile_buf_height;
a0007292:	03854983          	lbu	s3,56(a0)
  dest_row = u8g2->tile_curr_row;
a0007296:	03954403          	lbu	s0,57(a0)
  dest_max = u8g2_GetU8x8(u8g2)->display_info->tile_height;
a000729a:	0117ca03          	lbu	s4,17(a5)
{
a000729e:	892a                	mv	s2,a0
  dest_max = u8g2_GetU8x8(u8g2)->display_info->tile_height;
a00072a0:	4481                	li	s1,0
a00072a2:	a029                	j	a00072ac <u8g2_send_buffer+0x2a>
  do
  {
    u8g2_send_tile_row(u8g2, src_row, dest_row);
    src_row++;
    dest_row++;
  } while( src_row < src_max && dest_row < dest_max );
a00072a4:	03447b63          	bgeu	s0,s4,a00072da <u8g2_send_buffer+0x58>
  w = u8g2_GetU8x8(u8g2)->display_info->tile_width;
a00072a8:	00092783          	lw	a5,0(s2)
a00072ac:	0107c683          	lbu	a3,16(a5)
  ptr = u8g2->tile_buf_ptr;
a00072b0:	03492703          	lw	a4,52(s2)
  u8x8_DrawTile(u8g2_GetU8x8(u8g2), 0, dest_tile_row, w, ptr);
a00072b4:	8622                	mv	a2,s0
  offset *= 8;
a00072b6:	029687b3          	mul	a5,a3,s1
  u8x8_DrawTile(u8g2_GetU8x8(u8g2), 0, dest_tile_row, w, ptr);
a00072ba:	4581                	li	a1,0
a00072bc:	854a                	mv	a0,s2
  } while( src_row < src_max && dest_row < dest_max );
a00072be:	0485                	addi	s1,s1,1
    dest_row++;
a00072c0:	0405                	addi	s0,s0,1
a00072c2:	0ff47413          	andi	s0,s0,255
  offset *= 8;
a00072c6:	078e                	slli	a5,a5,0x3
  ptr += offset;
a00072c8:	3c07b78b          	extu	a5,a5,15,0
  u8x8_DrawTile(u8g2_GetU8x8(u8g2), 0, dest_tile_row, w, ptr);
a00072cc:	973e                	add	a4,a4,a5
a00072ce:	294010ef          	jal	ra,a0008562 <u8x8_DrawTile>
  } while( src_row < src_max && dest_row < dest_max );
a00072d2:	0ff4f793          	andi	a5,s1,255
a00072d6:	fd37e7e3          	bltu	a5,s3,a00072a4 <u8g2_send_buffer+0x22>
}
a00072da:	40f2                	lw	ra,28(sp)
a00072dc:	4462                	lw	s0,24(sp)
a00072de:	44d2                	lw	s1,20(sp)
a00072e0:	4942                	lw	s2,16(sp)
a00072e2:	49b2                	lw	s3,12(sp)
a00072e4:	4a22                	lw	s4,8(sp)
a00072e6:	6105                	addi	sp,sp,32
a00072e8:	8082                	ret

a00072ea <u8g2_ClearBuffer>:
  cnt = u8g2_GetU8x8(u8g2)->display_info->tile_width;
a00072ea:	4118                	lw	a4,0(a0)
  cnt *= u8g2->tile_buf_height;
a00072ec:	03854783          	lbu	a5,56(a0)
  memset(u8g2->tile_buf_ptr, 0, cnt);
a00072f0:	5948                	lw	a0,52(a0)
  cnt = u8g2_GetU8x8(u8g2)->display_info->tile_width;
a00072f2:	01074603          	lbu	a2,16(a4) # 4000010 <nocache_min_size+0x3ffb010>
  memset(u8g2->tile_buf_ptr, 0, cnt);
a00072f6:	4581                	li	a1,0
a00072f8:	02f60633          	mul	a2,a2,a5
a00072fc:	060e                	slli	a2,a2,0x3
a00072fe:	e67fc06f          	j	a0004164 <memset>

a0007302 <u8g2_SendBuffer>:

/* same as u8g2_send_buffer but also send the DISPLAY_REFRESH message (used by SSD1606) */
void u8g2_SendBuffer(u8g2_t *u8g2)
{
a0007302:	1141                	addi	sp,sp,-16
a0007304:	c422                	sw	s0,8(sp)
a0007306:	c606                	sw	ra,12(sp)
a0007308:	842a                	mv	s0,a0
  u8g2_send_buffer(u8g2);
a000730a:	3fa5                	jal	a0007282 <u8g2_send_buffer>
  u8x8_RefreshDisplay( u8g2_GetU8x8(u8g2) );  
a000730c:	8522                	mv	a0,s0
}
a000730e:	4422                	lw	s0,8(sp)
a0007310:	40b2                	lw	ra,12(sp)
a0007312:	0141                	addi	sp,sp,16
  u8x8_RefreshDisplay( u8g2_GetU8x8(u8g2) );  
a0007314:	2980106f          	j	a00085ac <u8x8_RefreshDisplay>

a0007318 <u8g2_m_16_8_f>:
  #ifdef U8G2_USE_DYNAMIC_ALLOC
  *page_cnt = 8;
  return 0;
  #else
  static uint8_t buf[1024];
  *page_cnt = 8;
a0007318:	47a1                	li	a5,8
a000731a:	00f50023          	sb	a5,0(a0)
  return buf;
  #endif
}
a000731e:	2b418513          	addi	a0,gp,692 # 62fc9ab4 <buf.186>
a0007322:	8082                	ret

a0007324 <u8g2_Setup_ssd1306_i2c_128x64_noname_f>:
  buf = u8g2_m_16_8_2(&tile_buf_height);
  u8g2_SetupBuffer(u8g2, buf, tile_buf_height, u8g2_ll_hvline_vertical_top_lsb, rotation);
}
/* ssd1306 f */
void u8g2_Setup_ssd1306_i2c_128x64_noname_f(u8g2_t *u8g2, const u8g2_cb_t *rotation, u8x8_msg_cb byte_cb, u8x8_msg_cb gpio_and_delay_cb)
{
a0007324:	1101                	addi	sp,sp,-32
a0007326:	ca26                	sw	s1,20(sp)
a0007328:	8736                	mv	a4,a3
a000732a:	84ae                	mv	s1,a1
  uint8_t tile_buf_height;
  uint8_t *buf;
  u8g2_SetupDisplay(u8g2, u8x8_d_ssd1306_128x64_noname, u8x8_cad_ssd13xx_fast_i2c, byte_cb, gpio_and_delay_cb);
a000732c:	86b2                	mv	a3,a2
a000732e:	a00085b7          	lui	a1,0xa0008
a0007332:	a0008637          	lui	a2,0xa0008
a0007336:	1dc60613          	addi	a2,a2,476 # a00081dc <__psram_limit+0xf7c081dc>
a000733a:	48058593          	addi	a1,a1,1152 # a0008480 <__psram_limit+0xf7c08480>
{
a000733e:	ce06                	sw	ra,28(sp)
a0007340:	cc22                	sw	s0,24(sp)
a0007342:	842a                	mv	s0,a0
  u8g2_SetupDisplay(u8g2, u8x8_d_ssd1306_128x64_noname, u8x8_cad_ssd13xx_fast_i2c, byte_cb, gpio_and_delay_cb);
a0007344:	278010ef          	jal	ra,a00085bc <u8x8_Setup>
  buf = u8g2_m_16_8_f(&tile_buf_height);
a0007348:	00f10513          	addi	a0,sp,15
a000734c:	37f1                	jal	a0007318 <u8g2_m_16_8_f>
  u8g2_SetupBuffer(u8g2, buf, tile_buf_height, u8g2_ll_hvline_vertical_top_lsb, rotation);
a000734e:	00f14603          	lbu	a2,15(sp)
a0007352:	a00086b7          	lui	a3,0xa0008
  buf = u8g2_m_16_8_f(&tile_buf_height);
a0007356:	85aa                	mv	a1,a0
  u8g2_SetupBuffer(u8g2, buf, tile_buf_height, u8g2_ll_hvline_vertical_top_lsb, rotation);
a0007358:	8726                	mv	a4,s1
a000735a:	8522                	mv	a0,s0
a000735c:	e0868693          	addi	a3,a3,-504 # a0007e08 <__psram_limit+0xf7c07e08>
a0007360:	43f000ef          	jal	ra,a0007f9e <u8g2_SetupBuffer>
}
a0007364:	40f2                	lw	ra,28(sp)
a0007366:	4462                	lw	s0,24(sp)
a0007368:	44d2                	lw	s1,20(sp)
a000736a:	6105                	addi	sp,sp,32
a000736c:	8082                	ret

a000736e <u8g2_font_get_word>:
static uint16_t u8g2_font_get_word(const uint8_t *font, uint8_t offset) U8G2_NOINLINE; 
static uint16_t u8g2_font_get_word(const uint8_t *font, uint8_t offset)
{
    uint16_t pos;
    font += offset;
    pos = u8x8_pgm_read( font );
a000736e:	80b5478b          	lrbu	a5,a0,a1,0
    font += offset;
a0007372:	952e                	add	a0,a0,a1
    font++;
    pos <<= 8;
    pos += u8x8_pgm_read( font);
a0007374:	00154503          	lbu	a0,1(a0)
    pos <<= 8;
a0007378:	07a2                	slli	a5,a5,0x8
    pos += u8x8_pgm_read( font);
a000737a:	953e                	add	a0,a0,a5
    return pos;
}
a000737c:	3c05350b          	extu	a0,a0,15,0
a0007380:	8082                	ret

a0007382 <u8g2_font_calc_vref_font>:
/* callback procedures to correct the y position */

u8g2_uint_t u8g2_font_calc_vref_font(U8X8_UNUSED u8g2_t *u8g2)
{
  return 0;
}
a0007382:	4501                	li	a0,0
a0007384:	8082                	ret

a0007386 <u8g2_add_vector_y>:
  switch(dir)
a0007386:	4785                	li	a5,1
a0007388:	00f68f63          	beq	a3,a5,a00073a6 <u8g2_add_vector_y+0x20>
a000738c:	4789                	li	a5,2
a000738e:	02f68063          	beq	a3,a5,a00073ae <u8g2_add_vector_y+0x28>
      dy -= x;
a0007392:	40b505b3          	sub	a1,a0,a1
      dy += y;
a0007396:	9532                	add	a0,a0,a2
a0007398:	3c05b58b          	extu	a1,a1,15,0
a000739c:	3c05350b          	extu	a0,a0,15,0
a00073a0:	42d5950b          	mvnez	a0,a1,a3
a00073a4:	8082                	ret
      dy += x;
a00073a6:	952e                	add	a0,a0,a1
a00073a8:	3c05350b          	extu	a0,a0,15,0
      break;
a00073ac:	8082                	ret
      dy -= y;
a00073ae:	8d11                	sub	a0,a0,a2
a00073b0:	3c05350b          	extu	a0,a0,15,0
}
a00073b4:	8082                	ret

a00073b6 <u8g2_add_vector_x>:
  switch(dir)
a00073b6:	4785                	li	a5,1
a00073b8:	00f68e63          	beq	a3,a5,a00073d4 <u8g2_add_vector_x+0x1e>
a00073bc:	4789                	li	a5,2
a00073be:	00f68f63          	beq	a3,a5,a00073dc <u8g2_add_vector_x+0x26>
      dx += y;
a00073c2:	962a                	add	a2,a2,a0
      dx += x;
a00073c4:	952e                	add	a0,a0,a1
a00073c6:	3c06360b          	extu	a2,a2,15,0
a00073ca:	3c05350b          	extu	a0,a0,15,0
a00073ce:	42d6150b          	mvnez	a0,a2,a3
a00073d2:	8082                	ret
      dx -= y;
a00073d4:	8d11                	sub	a0,a0,a2
a00073d6:	3c05350b          	extu	a0,a0,15,0
      break;
a00073da:	8082                	ret
      dx -= x;
a00073dc:	8d0d                	sub	a0,a0,a1
a00073de:	3c05350b          	extu	a0,a0,15,0
}
a00073e2:	8082                	ret

a00073e4 <u8g2_font_decode_len>:
{
a00073e4:	715d                	addi	sp,sp,-80
a00073e6:	c2a6                	sw	s1,68(sp)
a00073e8:	de4e                	sw	s3,60(sp)
a00073ea:	c686                	sw	ra,76(sp)
a00073ec:	c4a2                	sw	s0,72(sp)
a00073ee:	c0ca                	sw	s2,64(sp)
a00073f0:	dc52                	sw	s4,56(sp)
a00073f2:	da56                	sw	s5,52(sp)
a00073f4:	d85a                	sw	s6,48(sp)
a00073f6:	d65e                	sw	s7,44(sp)
a00073f8:	d462                	sw	s8,40(sp)
a00073fa:	d266                	sw	s9,36(sp)
a00073fc:	d06a                	sw	s10,32(sp)
a00073fe:	ce6e                	sw	s11,28(sp)
  lx = decode->x;
a0007400:	06854403          	lbu	s0,104(a0)
  ly = decode->y;
a0007404:	06954a03          	lbu	s4,105(a0)
{
a0007408:	84aa                	mv	s1,a0
a000740a:	89ae                	mv	s3,a1
a000740c:	c632                	sw	a2,12(sp)
a000740e:	a00d                	j	a0007430 <u8g2_font_decode_len+0x4c>
    else if ( decode->is_transparent == 0 )    
a0007410:	06d4c703          	lbu	a4,109(s1)
a0007414:	c755                	beqz	a4,a00074c0 <u8g2_font_decode_len+0xdc>
    cnt -= rem;
a0007416:	944e                	add	s0,s0,s3
a0007418:	0ff47413          	andi	s0,s0,255
    ly++;
a000741c:	0a05                	addi	s4,s4,1
    cnt -= rem;
a000741e:	41540ab3          	sub	s5,s0,s5
    if ( cnt < rem )
a0007422:	0729ec63          	bltu	s3,s2,a000749a <u8g2_font_decode_len+0xb6>
    cnt -= rem;
a0007426:	0ffaf993          	andi	s3,s5,255
    ly++;
a000742a:	0ffa7a13          	andi	s4,s4,255
    lx = 0;
a000742e:	4401                	li	s0,0
    rem = decode->glyph_width;
a0007430:	06a4ca83          	lbu	s5,106(s1)
    x = u8g2_add_vector_x(x, lx, ly, decode->dir);
a0007434:	1c042c8b          	ext	s9,s0,7,0
a0007438:	1c0a2b0b          	ext	s6,s4,7,0
    rem -= lx;
a000743c:	408a8933          	sub	s2,s5,s0
a0007440:	0ff97913          	andi	s2,s2,255
    x = u8g2_add_vector_x(x, lx, ly, decode->dir);
a0007444:	865a                	mv	a2,s6
a0007446:	85e6                	mv	a1,s9
a0007448:	87ce                	mv	a5,s3
a000744a:	01397363          	bgeu	s2,s3,a0007450 <u8g2_font_decode_len+0x6c>
a000744e:	87ca                	mv	a5,s2
a0007450:	0704cc03          	lbu	s8,112(s1)
a0007454:	0644d503          	lhu	a0,100(s1)
    y = decode->target_y;
a0007458:	0664dd83          	lhu	s11,102(s1)
    x = u8g2_add_vector_x(x, lx, ly, decode->dir);
a000745c:	86e2                	mv	a3,s8
a000745e:	0ff7fd13          	andi	s10,a5,255
a0007462:	3f91                	jal	a00073b6 <u8g2_add_vector_x>
a0007464:	8baa                	mv	s7,a0
    y = u8g2_add_vector_y(y, lx, ly, decode->dir);
a0007466:	86e2                	mv	a3,s8
a0007468:	865a                	mv	a2,s6
a000746a:	85e6                	mv	a1,s9
a000746c:	856e                	mv	a0,s11
a000746e:	3f21                	jal	a0007386 <u8g2_add_vector_y>
    if ( is_foreground )
a0007470:	47b2                	lw	a5,12(sp)
a0007472:	dfd9                	beqz	a5,a0007410 <u8g2_font_decode_len+0x2c>
      u8g2->draw_color = decode->fg_color;			/* draw_color will be restored later */
a0007474:	06e4c603          	lbu	a2,110(s1)
a0007478:	944e                	add	s0,s0,s3
      u8g2->draw_color = decode->bg_color;			/* draw_color will be restored later */
a000747a:	08c48923          	sb	a2,146(s1)
      u8g2_DrawHVLine(u8g2, 
a000747e:	8762                	mv	a4,s8
a0007480:	862a                	mv	a2,a0
a0007482:	86ea                	mv	a3,s10
a0007484:	85de                	mv	a1,s7
a0007486:	8526                	mv	a0,s1
a0007488:	0ff47413          	andi	s0,s0,255
a000748c:	04f000ef          	jal	ra,a0007cda <u8g2_DrawHVLine>
    ly++;
a0007490:	0a05                	addi	s4,s4,1
    cnt -= rem;
a0007492:	41540ab3          	sub	s5,s0,s5
    if ( cnt < rem )
a0007496:	f929f8e3          	bgeu	s3,s2,a0007426 <u8g2_font_decode_len+0x42>
  decode->x = lx;
a000749a:	06848423          	sb	s0,104(s1)
  decode->y = ly;  
a000749e:	076484a3          	sb	s6,105(s1)
}
a00074a2:	40b6                	lw	ra,76(sp)
a00074a4:	4426                	lw	s0,72(sp)
a00074a6:	4496                	lw	s1,68(sp)
a00074a8:	4906                	lw	s2,64(sp)
a00074aa:	59f2                	lw	s3,60(sp)
a00074ac:	5a62                	lw	s4,56(sp)
a00074ae:	5ad2                	lw	s5,52(sp)
a00074b0:	5b42                	lw	s6,48(sp)
a00074b2:	5bb2                	lw	s7,44(sp)
a00074b4:	5c22                	lw	s8,40(sp)
a00074b6:	5c92                	lw	s9,36(sp)
a00074b8:	5d02                	lw	s10,32(sp)
a00074ba:	4df2                	lw	s11,28(sp)
a00074bc:	6161                	addi	sp,sp,80
a00074be:	8082                	ret
      u8g2->draw_color = decode->bg_color;			/* draw_color will be restored later */
a00074c0:	06f4c603          	lbu	a2,111(s1)
a00074c4:	bf55                	j	a0007478 <u8g2_font_decode_len+0x94>
	...

a00074c8 <u8g2_font_decode_glyph>:
{
a00074c8:	715d                	addi	sp,sp,-80
a00074ca:	d266                	sw	s9,36(sp)
a00074cc:	c686                	sw	ra,76(sp)
a00074ce:	c4a2                	sw	s0,72(sp)
a00074d0:	c2a6                	sw	s1,68(sp)
a00074d2:	c0ca                	sw	s2,64(sp)
a00074d4:	de4e                	sw	s3,60(sp)
a00074d6:	dc52                	sw	s4,56(sp)
a00074d8:	da56                	sw	s5,52(sp)
a00074da:	d85a                	sw	s6,48(sp)
a00074dc:	d65e                	sw	s7,44(sp)
a00074de:	d462                	sw	s8,40(sp)
a00074e0:	d06a                	sw	s10,32(sp)
a00074e2:	ce6e                	sw	s11,28(sp)
  decode->glyph_width = u8g2_font_decode_get_unsigned_bits(decode, u8g2->font_info.bits_per_char_width);
a00074e4:	07854683          	lbu	a3,120(a0)
  decode->decode_ptr = glyph_data;
a00074e8:	d12c                	sw	a1,96(a0)
  decode->decode_bit_pos = 0;
a00074ea:	06050623          	sb	zero,108(a0)
  if ( bit_pos_plus_cnt >= 8 )
a00074ee:	471d                	li	a4,7
  val = u8x8_pgm_read( f->decode_ptr );  
a00074f0:	0005c403          	lbu	s0,0(a1)
{
a00074f4:	8caa                	mv	s9,a0
  if ( bit_pos_plus_cnt >= 8 )
a00074f6:	87b6                	mv	a5,a3
a00074f8:	00d77863          	bgeu	a4,a3,a0007508 <u8g2_font_decode_glyph+0x40>
    f->decode_ptr++;
a00074fc:	0585                	addi	a1,a1,1
    bit_pos_plus_cnt -= 8;
a00074fe:	ff868793          	addi	a5,a3,-8
    f->decode_ptr++;
a0007502:	d12c                	sw	a1,96(a0)
    bit_pos_plus_cnt -= 8;
a0007504:	0ff7f793          	andi	a5,a5,255
  val &= (1U<<cnt)-1;
a0007508:	577d                	li	a4,-1
a000750a:	00d71733          	sll	a4,a4,a3
a000750e:	fff74713          	not	a4,a4
a0007512:	8f61                	and	a4,a4,s0
  decode->glyph_width = u8g2_font_decode_get_unsigned_bits(decode, u8g2->font_info.bits_per_char_width);
a0007514:	1c07240b          	ext	s0,a4,7,0
  decode->glyph_height = u8g2_font_decode_get_unsigned_bits(decode,u8g2->font_info.bits_per_char_height);
a0007518:	079cc503          	lbu	a0,121(s9) # f0100079 <__psram_limit+0x47d00079>
  f->decode_bit_pos = bit_pos_plus_cnt;
a000751c:	06fc8623          	sb	a5,108(s9)
  decode->glyph_width = u8g2_font_decode_get_unsigned_bits(decode, u8g2->font_info.bits_per_char_width);
a0007520:	068c8523          	sb	s0,106(s9)
  val >>= bit_pos;
a0007524:	0005c703          	lbu	a4,0(a1)
  bit_pos_plus_cnt += cnt;
a0007528:	00f508b3          	add	a7,a0,a5
a000752c:	0ff8f893          	andi	a7,a7,255
  if ( bit_pos_plus_cnt >= 8 )
a0007530:	469d                	li	a3,7
  val >>= bit_pos;
a0007532:	40f75733          	sra	a4,a4,a5
  if ( bit_pos_plus_cnt >= 8 )
a0007536:	3716ec63          	bltu	a3,a7,a00078ae <u8g2_font_decode_glyph+0x3e6>
  val >>= bit_pos;
a000753a:	0ff77613          	andi	a2,a4,255
a000753e:	86ae                	mv	a3,a1
  val &= (1U<<cnt)-1;
a0007540:	57fd                	li	a5,-1
a0007542:	00a797b3          	sll	a5,a5,a0
  decode->fg_color = u8g2->draw_color;
a0007546:	092cc703          	lbu	a4,146(s9)
  val &= (1U<<cnt)-1;
a000754a:	fff7c793          	not	a5,a5
a000754e:	8e7d                	and	a2,a2,a5
  decode->glyph_height = u8g2_font_decode_get_unsigned_bits(decode,u8g2->font_info.bits_per_char_height);
a0007550:	1c06278b          	ext	a5,a2,7,0
a0007554:	85be                	mv	a1,a5
  x = u8g2_font_decode_get_signed_bits(decode, u8g2->font_info.bits_per_char_x);
a0007556:	07acc503          	lbu	a0,122(s9)
  decode->glyph_height = u8g2_font_decode_get_unsigned_bits(decode,u8g2->font_info.bits_per_char_height);
a000755a:	c43e                	sw	a5,8(sp)
  decode->bg_color = (decode->fg_color == 0 ? 1 : 0);
a000755c:	00173793          	seqz	a5,a4
  decode->glyph_height = u8g2_font_decode_get_unsigned_bits(decode,u8g2->font_info.bits_per_char_height);
a0007560:	06bc85a3          	sb	a1,107(s9)
  decode->fg_color = u8g2->draw_color;
a0007564:	06ec8723          	sb	a4,110(s9)
  f->decode_bit_pos = bit_pos_plus_cnt;
a0007568:	071c8623          	sb	a7,108(s9)
  decode->bg_color = (decode->fg_color == 0 ? 1 : 0);
a000756c:	06fc87a3          	sb	a5,111(s9)
  val >>= bit_pos;
a0007570:	0006c783          	lbu	a5,0(a3)
  bit_pos_plus_cnt += cnt;
a0007574:	01150733          	add	a4,a0,a7
a0007578:	0ff77713          	andi	a4,a4,255
  if ( bit_pos_plus_cnt >= 8 )
a000757c:	459d                	li	a1,7
  val >>= bit_pos;
a000757e:	4117d933          	sra	s2,a5,a7
  if ( bit_pos_plus_cnt >= 8 )
a0007582:	30e5e363          	bltu	a1,a4,a0007888 <u8g2_font_decode_glyph+0x3c0>
  val >>= bit_pos;
a0007586:	0ff97913          	andi	s2,s2,255
a000758a:	8836                	mv	a6,a3
  y = u8g2_font_decode_get_signed_bits(decode, u8g2->font_info.bits_per_char_y);
a000758c:	07bcc883          	lbu	a7,123(s9)
  f->decode_bit_pos = bit_pos_plus_cnt;
a0007590:	06ec8623          	sb	a4,108(s9)
  val >>= bit_pos;
a0007594:	00084683          	lbu	a3,0(a6) # 200000 <nocache_min_size+0x1fb000>
  bit_pos_plus_cnt += cnt;
a0007598:	00e887b3          	add	a5,a7,a4
a000759c:	0ff7f793          	andi	a5,a5,255
  if ( bit_pos_plus_cnt >= 8 )
a00075a0:	459d                	li	a1,7
  val >>= bit_pos;
a00075a2:	40e6d6b3          	sra	a3,a3,a4
  if ( bit_pos_plus_cnt >= 8 )
a00075a6:	2af5ef63          	bltu	a1,a5,a0007864 <u8g2_font_decode_glyph+0x39c>
  val >>= bit_pos;
a00075aa:	0ff6f593          	andi	a1,a3,255
a00075ae:	8342                	mv	t1,a6
  d = u8g2_font_decode_get_signed_bits(decode, u8g2->font_info.bits_per_delta_x);
a00075b0:	07ccc703          	lbu	a4,124(s9)
  f->decode_bit_pos = bit_pos_plus_cnt;
a00075b4:	06fc8623          	sb	a5,108(s9)
  val >>= bit_pos;
a00075b8:	00034683          	lbu	a3,0(t1)
  bit_pos_plus_cnt += cnt;
a00075bc:	00f70833          	add	a6,a4,a5
a00075c0:	0ff87e13          	andi	t3,a6,255
  val >>= bit_pos;
a00075c4:	40f6d6b3          	sra	a3,a3,a5
  if ( bit_pos_plus_cnt >= 8 )
a00075c8:	481d                	li	a6,7
  val >>= bit_pos;
a00075ca:	0ff6fb13          	andi	s6,a3,255
  if ( bit_pos_plus_cnt >= 8 )
a00075ce:	03c87563          	bgeu	a6,t3,a00075f8 <u8g2_font_decode_glyph+0x130>
    f->decode_ptr++;
a00075d2:	00130813          	addi	a6,t1,1
a00075d6:	070ca023          	sw	a6,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00075da:	00134b03          	lbu	s6,1(t1)
    s -= bit_pos;
a00075de:	4821                	li	a6,8
a00075e0:	40f807b3          	sub	a5,a6,a5
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00075e4:	00fb1b33          	sll	s6,s6,a5
a00075e8:	00db6b33          	or	s6,s6,a3
    bit_pos_plus_cnt -= 8;
a00075ec:	ff8e0813          	addi	a6,t3,-8
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00075f0:	0ffb7b13          	andi	s6,s6,255
    bit_pos_plus_cnt -= 8;
a00075f4:	0ff87e13          	andi	t3,a6,255
  val &= (1U<<cnt)-1;
a00075f8:	56fd                	li	a3,-1
a00075fa:	00e69833          	sll	a6,a3,a4
  cnt--;
a00075fe:	fff70793          	addi	a5,a4,-1
  val &= (1U<<cnt)-1;
a0007602:	fff84813          	not	a6,a6
  d <<= cnt;
a0007606:	4705                	li	a4,1
  val &= (1U<<cnt)-1;
a0007608:	010b7b33          	and	s6,s6,a6
  d <<= cnt;
a000760c:	00f717b3          	sll	a5,a4,a5
  v -= d;
a0007610:	40fb07b3          	sub	a5,s6,a5
a0007614:	1c07a78b          	ext	a5,a5,7,0
  f->decode_bit_pos = bit_pos_plus_cnt;
a0007618:	07cc8623          	sb	t3,108(s9)
  v -= d;
a000761c:	c63e                	sw	a5,12(sp)
  if ( decode->glyph_width > 0 )
a000761e:	1e805a63          	blez	s0,a0007812 <u8g2_font_decode_glyph+0x34a>
  val &= (1U<<cnt)-1;
a0007622:	011697b3          	sll	a5,a3,a7
a0007626:	00a69833          	sll	a6,a3,a0
  cnt--;
a000762a:	fff88493          	addi	s1,a7,-1
  val &= (1U<<cnt)-1;
a000762e:	fff84813          	not	a6,a6
  cnt--;
a0007632:	157d                	addi	a0,a0,-1
  d <<= cnt;
a0007634:	009714b3          	sll	s1,a4,s1
  val &= (1U<<cnt)-1;
a0007638:	fff7c793          	not	a5,a5
a000763c:	8fed                	and	a5,a5,a1
  d <<= cnt;
a000763e:	00a71733          	sll	a4,a4,a0
  val &= (1U<<cnt)-1;
a0007642:	01097933          	and	s2,s2,a6
    decode->target_x = u8g2_add_vector_x(decode->target_x, x, -(h+y), decode->dir);
a0007646:	070cca03          	lbu	s4,112(s9)
a000764a:	8c91                	sub	s1,s1,a2
a000764c:	8c9d                	sub	s1,s1,a5
  v -= d;
a000764e:	40e90933          	sub	s2,s2,a4
    decode->target_x = u8g2_add_vector_x(decode->target_x, x, -(h+y), decode->dir);
a0007652:	064cd503          	lhu	a0,100(s9)
  v -= d;
a0007656:	1c09290b          	ext	s2,s2,7,0
    decode->target_x = u8g2_add_vector_x(decode->target_x, x, -(h+y), decode->dir);
a000765a:	1c04a48b          	ext	s1,s1,7,0
a000765e:	86d2                	mv	a3,s4
a0007660:	8626                	mv	a2,s1
a0007662:	85ca                	mv	a1,s2
a0007664:	3b89                	jal	a00073b6 <u8g2_add_vector_x>
a0007666:	89aa                	mv	s3,a0
    decode->target_y = u8g2_add_vector_y(decode->target_y, x, -(h+y), decode->dir);
a0007668:	066cd503          	lhu	a0,102(s9)
a000766c:	8626                	mv	a2,s1
    decode->target_x = u8g2_add_vector_x(decode->target_x, x, -(h+y), decode->dir);
a000766e:	073c9223          	sh	s3,100(s9)
    decode->target_y = u8g2_add_vector_y(decode->target_y, x, -(h+y), decode->dir);
a0007672:	86d2                	mv	a3,s4
a0007674:	85ca                	mv	a1,s2
a0007676:	3b01                	jal	a0007386 <u8g2_add_vector_y>
a0007678:	06ac9323          	sh	a0,102(s9)
      switch(decode->dir)
a000767c:	4789                	li	a5,2
    decode->target_y = u8g2_add_vector_y(decode->target_y, x, -(h+y), decode->dir);
a000767e:	862a                	mv	a2,a0
      switch(decode->dir)
a0007680:	2afa0e63          	beq	s4,a5,a000793c <u8g2_font_decode_glyph+0x474>
a0007684:	1b47e763          	bltu	a5,s4,a0007832 <u8g2_font_decode_glyph+0x36a>
a0007688:	280a0b63          	beqz	s4,a000791e <u8g2_font_decode_glyph+0x456>
	    x0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a000768c:	47a2                	lw	a5,8(sp)
	    x1++;
a000768e:	00198693          	addi	a3,s3,1
	    y1 += decode->glyph_width;
a0007692:	00850733          	add	a4,a0,s0
	    x0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a0007696:	40f987b3          	sub	a5,s3,a5
a000769a:	00178993          	addi	s3,a5,1
	    x1++;
a000769e:	3c06b68b          	extu	a3,a3,15,0
	    y1 += decode->glyph_width;
a00076a2:	3c07370b          	extu	a4,a4,15,0
	    x0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a00076a6:	3c09b98b          	extu	s3,s3,15,0
      if ( u8g2_IsIntersection(u8g2, x0, y0, x1, y1) == 0 ) 
a00076aa:	85ce                	mv	a1,s3
a00076ac:	8566                	mv	a0,s9
a00076ae:	2f29                	jal	a0007dc8 <u8g2_IsIntersection>
a00076b0:	16050163          	beqz	a0,a0007812 <u8g2_font_decode_glyph+0x34a>
  uint8_t bit_pos = f->decode_bit_pos;
a00076b4:	06ccc703          	lbu	a4,108(s9)
    decode->x = 0;
a00076b8:	060c9423          	sh	zero,104(s9)
  val = u8x8_pgm_read( f->decode_ptr );  
a00076bc:	060ca503          	lw	a0,96(s9)
      a = u8g2_font_decode_get_unsigned_bits(decode, u8g2->font_info.bits_per_0);
a00076c0:	076cc603          	lbu	a2,118(s9)
  if ( bit_pos_plus_cnt >= 8 )
a00076c4:	459d                	li	a1,7
  val >>= bit_pos;
a00076c6:	00054983          	lbu	s3,0(a0)
  bit_pos_plus_cnt += cnt;
a00076ca:	00e607b3          	add	a5,a2,a4
a00076ce:	0ff7f793          	andi	a5,a5,255
  val >>= bit_pos;
a00076d2:	40e9d6b3          	sra	a3,s3,a4
  if ( bit_pos_plus_cnt >= 8 )
a00076d6:	22f5e163          	bltu	a1,a5,a00078f8 <u8g2_font_decode_glyph+0x430>
  val >>= bit_pos;
a00076da:	0ff6f993          	andi	s3,a3,255
a00076de:	85aa                	mv	a1,a0
  val &= (1U<<cnt)-1;
a00076e0:	577d                	li	a4,-1
      b = u8g2_font_decode_get_unsigned_bits(decode, u8g2->font_info.bits_per_1);
a00076e2:	077cc683          	lbu	a3,119(s9)
  f->decode_bit_pos = bit_pos_plus_cnt;
a00076e6:	06fc8623          	sb	a5,108(s9)
  val >>= bit_pos;
a00076ea:	0005c903          	lbu	s2,0(a1)
  val &= (1U<<cnt)-1;
a00076ee:	00c71633          	sll	a2,a4,a2
a00076f2:	fff64613          	not	a2,a2
a00076f6:	00c9f633          	and	a2,s3,a2
  bit_pos_plus_cnt += cnt;
a00076fa:	00f68733          	add	a4,a3,a5
  val &= (1U<<cnt)-1;
a00076fe:	c232                	sw	a2,4(sp)
  bit_pos_plus_cnt += cnt;
a0007700:	0ff77713          	andi	a4,a4,255
  val >>= bit_pos;
a0007704:	40f95633          	sra	a2,s2,a5
  if ( bit_pos_plus_cnt >= 8 )
a0007708:	451d                	li	a0,7
  val >>= bit_pos;
a000770a:	0ff67913          	andi	s2,a2,255
  if ( bit_pos_plus_cnt >= 8 )
a000770e:	02e57463          	bgeu	a0,a4,a0007736 <u8g2_font_decode_glyph+0x26e>
    f->decode_ptr++;
a0007712:	00158513          	addi	a0,a1,1
a0007716:	06aca023          	sw	a0,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a000771a:	0015c903          	lbu	s2,1(a1)
    s -= bit_pos;
a000771e:	45a1                	li	a1,8
a0007720:	40f587b3          	sub	a5,a1,a5
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a0007724:	00f917b3          	sll	a5,s2,a5
    bit_pos_plus_cnt -= 8;
a0007728:	1761                	addi	a4,a4,-8
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a000772a:	00c7e933          	or	s2,a5,a2
a000772e:	0ff97913          	andi	s2,s2,255
    bit_pos_plus_cnt -= 8;
a0007732:	0ff77713          	andi	a4,a4,255
  val &= (1U<<cnt)-1;
a0007736:	57fd                	li	a5,-1
a0007738:	00d797b3          	sll	a5,a5,a3
a000773c:	fff7c793          	not	a5,a5
a0007740:	00f977b3          	and	a5,s2,a5
a0007744:	c03e                	sw	a5,0(sp)
  f->decode_bit_pos = bit_pos_plus_cnt;
a0007746:	06ec8623          	sb	a4,108(s9)
a000774a:	0001                	nop
	u8g2_font_decode_len(u8g2, a, 0);
a000774c:	4592                	lw	a1,4(sp)
a000774e:	4601                	li	a2,0
a0007750:	8566                	mv	a0,s9
a0007752:	3949                	jal	a00073e4 <u8g2_font_decode_len>
  lx = decode->x;
a0007754:	068cc403          	lbu	s0,104(s9)
  ly = decode->y;
a0007758:	069ccd83          	lbu	s11,105(s9)
  cnt = len;
a000775c:	4c02                	lw	s8,0(sp)
a000775e:	a031                	j	a000776a <u8g2_font_decode_glyph+0x2a2>
    cnt -= rem;
a0007760:	0ff7fc13          	andi	s8,a5,255
    ly++;
a0007764:	0ffdfd93          	andi	s11,s11,255
    lx = 0;
a0007768:	4401                	li	s0,0
    rem = decode->glyph_width;
a000776a:	06accb83          	lbu	s7,106(s9)
    x = u8g2_add_vector_x(x, lx, ly, decode->dir);
a000776e:	1c04298b          	ext	s3,s0,7,0
a0007772:	1c0dab0b          	ext	s6,s11,7,0
    rem -= lx;
a0007776:	408b8d33          	sub	s10,s7,s0
a000777a:	0ffd7d13          	andi	s10,s10,255
    x = u8g2_add_vector_x(x, lx, ly, decode->dir);
a000777e:	865a                	mv	a2,s6
a0007780:	85ce                	mv	a1,s3
a0007782:	886a                	mv	a6,s10
a0007784:	01ac7363          	bgeu	s8,s10,a000778a <u8g2_font_decode_glyph+0x2c2>
a0007788:	8862                	mv	a6,s8
a000778a:	070cc903          	lbu	s2,112(s9)
a000778e:	064cd503          	lhu	a0,100(s9)
    y = decode->target_y;
a0007792:	066cda03          	lhu	s4,102(s9)
    x = u8g2_add_vector_x(x, lx, ly, decode->dir);
a0007796:	86ca                	mv	a3,s2
a0007798:	0ff87493          	andi	s1,a6,255
a000779c:	c1bff0ef          	jal	ra,a00073b6 <u8g2_add_vector_x>
a00077a0:	8aaa                	mv	s5,a0
    y = u8g2_add_vector_y(y, lx, ly, decode->dir);
a00077a2:	86ca                	mv	a3,s2
a00077a4:	865a                	mv	a2,s6
a00077a6:	85ce                	mv	a1,s3
a00077a8:	8552                	mv	a0,s4
a00077aa:	bddff0ef          	jal	ra,a0007386 <u8g2_add_vector_y>
      u8g2->draw_color = decode->fg_color;			/* draw_color will be restored later */
a00077ae:	06ecc583          	lbu	a1,110(s9)
    y = u8g2_add_vector_y(y, lx, ly, decode->dir);
a00077b2:	862a                	mv	a2,a0
      u8g2_DrawHVLine(u8g2, 
a00077b4:	874a                	mv	a4,s2
      u8g2->draw_color = decode->fg_color;			/* draw_color will be restored later */
a00077b6:	08bc8923          	sb	a1,146(s9)
      u8g2_DrawHVLine(u8g2, 
a00077ba:	86a6                	mv	a3,s1
a00077bc:	85d6                	mv	a1,s5
a00077be:	8566                	mv	a0,s9
a00077c0:	9462                	add	s0,s0,s8
a00077c2:	2b21                	jal	a0007cda <u8g2_DrawHVLine>
    cnt -= rem;
a00077c4:	0ff47413          	andi	s0,s0,255
    ly++;
a00077c8:	0d85                	addi	s11,s11,1
    cnt -= rem;
a00077ca:	417407b3          	sub	a5,s0,s7
    if ( cnt < rem )
a00077ce:	f9ac79e3          	bgeu	s8,s10,a0007760 <u8g2_font_decode_glyph+0x298>
  val = u8x8_pgm_read( f->decode_ptr );  
a00077d2:	060ca583          	lw	a1,96(s9)
  uint8_t bit_pos = f->decode_bit_pos;
a00077d6:	06ccc683          	lbu	a3,108(s9)
  decode->x = lx;
a00077da:	068c8423          	sb	s0,104(s9)
  decode->y = ly;  
a00077de:	076c84a3          	sb	s6,105(s9)
  val >>= bit_pos;
a00077e2:	0005c783          	lbu	a5,0(a1)
  bit_pos_plus_cnt += cnt;
a00077e6:	00168713          	addi	a4,a3,1
a00077ea:	0ff77713          	andi	a4,a4,255
  val >>= bit_pos;
a00077ee:	40d7d633          	sra	a2,a5,a3
  if ( bit_pos_plus_cnt >= 8 )
a00077f2:	479d                	li	a5,7
a00077f4:	0ce7ef63          	bltu	a5,a4,a00078d2 <u8g2_font_decode_glyph+0x40a>
  val >>= bit_pos;
a00077f8:	0ff67793          	andi	a5,a2,255
  f->decode_bit_pos = bit_pos_plus_cnt;
a00077fc:	06ec8623          	sb	a4,108(s9)
      } while( u8g2_font_decode_get_unsigned_bits(decode, 1) != 0 );
a0007800:	8b85                	andi	a5,a5,1
a0007802:	f7a9                	bnez	a5,a000774c <u8g2_font_decode_glyph+0x284>
      if ( decode->y >= h )
a0007804:	47a2                	lw	a5,8(sp)
a0007806:	eafb4be3          	blt	s6,a5,a00076bc <u8g2_font_decode_glyph+0x1f4>
    u8g2->draw_color = decode->fg_color;
a000780a:	06ecc783          	lbu	a5,110(s9)
a000780e:	08fc8923          	sb	a5,146(s9)
}
a0007812:	40b6                	lw	ra,76(sp)
a0007814:	4426                	lw	s0,72(sp)
a0007816:	4532                	lw	a0,12(sp)
a0007818:	4496                	lw	s1,68(sp)
a000781a:	4906                	lw	s2,64(sp)
a000781c:	59f2                	lw	s3,60(sp)
a000781e:	5a62                	lw	s4,56(sp)
a0007820:	5ad2                	lw	s5,52(sp)
a0007822:	5b42                	lw	s6,48(sp)
a0007824:	5bb2                	lw	s7,44(sp)
a0007826:	5c22                	lw	s8,40(sp)
a0007828:	5c92                	lw	s9,36(sp)
a000782a:	5d02                	lw	s10,32(sp)
a000782c:	4df2                	lw	s11,28(sp)
a000782e:	6161                	addi	sp,sp,80
a0007830:	8082                	ret
      switch(decode->dir)
a0007832:	478d                	li	a5,3
a0007834:	872a                	mv	a4,a0
a0007836:	86ce                	mv	a3,s3
a0007838:	e6fa19e3          	bne	s4,a5,a00076aa <u8g2_font_decode_glyph+0x1e2>
	    x1 += h;
a000783c:	4722                	lw	a4,8(sp)
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a000783e:	408507b3          	sub	a5,a0,s0
	    y1++;
a0007842:	00150613          	addi	a2,a0,1
	    x1 += h;
a0007846:	00e986b3          	add	a3,s3,a4
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a000784a:	0785                	addi	a5,a5,1
	    y1++;
a000784c:	3c06370b          	extu	a4,a2,15,0
	    x1 += h;
a0007850:	3c06b68b          	extu	a3,a3,15,0
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a0007854:	3c07b60b          	extu	a2,a5,15,0
      if ( u8g2_IsIntersection(u8g2, x0, y0, x1, y1) == 0 ) 
a0007858:	85ce                	mv	a1,s3
a000785a:	8566                	mv	a0,s9
a000785c:	23b5                	jal	a0007dc8 <u8g2_IsIntersection>
a000785e:	e4051be3          	bnez	a0,a00076b4 <u8g2_font_decode_glyph+0x1ec>
a0007862:	bf45                	j	a0007812 <u8g2_font_decode_glyph+0x34a>
    f->decode_ptr++;
a0007864:	00180313          	addi	t1,a6,1
a0007868:	066ca023          	sw	t1,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a000786c:	00184583          	lbu	a1,1(a6)
    s -= bit_pos;
a0007870:	4821                	li	a6,8
a0007872:	40e80733          	sub	a4,a6,a4
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a0007876:	00e595b3          	sll	a1,a1,a4
a000787a:	8ecd                	or	a3,a3,a1
    bit_pos_plus_cnt -= 8;
a000787c:	17e1                	addi	a5,a5,-8
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a000787e:	0ff6f593          	andi	a1,a3,255
    bit_pos_plus_cnt -= 8;
a0007882:	0ff7f793          	andi	a5,a5,255
a0007886:	b32d                	j	a00075b0 <u8g2_font_decode_glyph+0xe8>
    f->decode_ptr++;
a0007888:	00168813          	addi	a6,a3,1
a000788c:	070ca023          	sw	a6,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a0007890:	0016c783          	lbu	a5,1(a3)
    s -= bit_pos;
a0007894:	46a1                	li	a3,8
a0007896:	411688b3          	sub	a7,a3,a7
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a000789a:	011797b3          	sll	a5,a5,a7
a000789e:	0127e933          	or	s2,a5,s2
    bit_pos_plus_cnt -= 8;
a00078a2:	1761                	addi	a4,a4,-8
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078a4:	0ff97913          	andi	s2,s2,255
    bit_pos_plus_cnt -= 8;
a00078a8:	0ff77713          	andi	a4,a4,255
a00078ac:	b1c5                	j	a000758c <u8g2_font_decode_glyph+0xc4>
    f->decode_ptr++;
a00078ae:	00158693          	addi	a3,a1,1
a00078b2:	06dca023          	sw	a3,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078b6:	0015c603          	lbu	a2,1(a1)
    s -= bit_pos;
a00078ba:	45a1                	li	a1,8
a00078bc:	40f587b3          	sub	a5,a1,a5
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078c0:	00f61633          	sll	a2,a2,a5
a00078c4:	8e59                	or	a2,a2,a4
    bit_pos_plus_cnt -= 8;
a00078c6:	18e1                	addi	a7,a7,-8
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078c8:	0ff67613          	andi	a2,a2,255
    bit_pos_plus_cnt -= 8;
a00078cc:	0ff8f893          	andi	a7,a7,255
a00078d0:	b985                	j	a0007540 <u8g2_font_decode_glyph+0x78>
    f->decode_ptr++;
a00078d2:	00158793          	addi	a5,a1,1
a00078d6:	06fca023          	sw	a5,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078da:	0015c783          	lbu	a5,1(a1)
    s -= bit_pos;
a00078de:	4721                	li	a4,8
a00078e0:	40d705b3          	sub	a1,a4,a3
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078e4:	00b797b3          	sll	a5,a5,a1
    bit_pos_plus_cnt -= 8;
a00078e8:	ff968713          	addi	a4,a3,-7
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a00078ec:	8fd1                	or	a5,a5,a2
a00078ee:	0ff7f793          	andi	a5,a5,255
    bit_pos_plus_cnt -= 8;
a00078f2:	0ff77713          	andi	a4,a4,255
a00078f6:	b719                	j	a00077fc <u8g2_font_decode_glyph+0x334>
    f->decode_ptr++;
a00078f8:	00150593          	addi	a1,a0,1
a00078fc:	06bca023          	sw	a1,96(s9)
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a0007900:	00154983          	lbu	s3,1(a0)
    s -= bit_pos;
a0007904:	4521                	li	a0,8
a0007906:	40e50733          	sub	a4,a0,a4
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a000790a:	00e99733          	sll	a4,s3,a4
    bit_pos_plus_cnt -= 8;
a000790e:	17e1                	addi	a5,a5,-8
    val |= u8x8_pgm_read( f->decode_ptr ) << (s);
a0007910:	00d769b3          	or	s3,a4,a3
a0007914:	0ff9f993          	andi	s3,s3,255
    bit_pos_plus_cnt -= 8;
a0007918:	0ff7f793          	andi	a5,a5,255
a000791c:	b3d1                	j	a00076e0 <u8g2_font_decode_glyph+0x218>
	    y1 += h;
a000791e:	47a2                	lw	a5,8(sp)
	    x1 += decode->glyph_width;
a0007920:	008986b3          	add	a3,s3,s0
a0007924:	3c06b68b          	extu	a3,a3,15,0
	    y1 += h;
a0007928:	00f50733          	add	a4,a0,a5
a000792c:	3c07370b          	extu	a4,a4,15,0
      if ( u8g2_IsIntersection(u8g2, x0, y0, x1, y1) == 0 ) 
a0007930:	85ce                	mv	a1,s3
a0007932:	8566                	mv	a0,s9
a0007934:	2951                	jal	a0007dc8 <u8g2_IsIntersection>
a0007936:	d6051fe3          	bnez	a0,a00076b4 <u8g2_font_decode_glyph+0x1ec>
a000793a:	bde1                	j	a0007812 <u8g2_font_decode_glyph+0x34a>
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a000793c:	4722                	lw	a4,8(sp)
	    x0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a000793e:	4785                	li	a5,1
a0007940:	40878433          	sub	s0,a5,s0
	    x1++;
a0007944:	00198693          	addi	a3,s3,1
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a0007948:	8f99                	sub	a5,a5,a4
	    x0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a000794a:	99a2                	add	s3,s3,s0
	    y1++;
a000794c:	00150713          	addi	a4,a0,1
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a0007950:	00f50633          	add	a2,a0,a5
	    x0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a0007954:	3c09b98b          	extu	s3,s3,15,0
	    x1++;
a0007958:	3c06b68b          	extu	a3,a3,15,0
	    y1++;
a000795c:	3c07370b          	extu	a4,a4,15,0
	    y0++;	/* shift down, because of assymetric boundaries for the interseciton test */
a0007960:	3c06360b          	extu	a2,a2,15,0
      if ( u8g2_IsIntersection(u8g2, x0, y0, x1, y1) == 0 ) 
a0007964:	85ce                	mv	a1,s3
a0007966:	8566                	mv	a0,s9
a0007968:	2185                	jal	a0007dc8 <u8g2_IsIntersection>
a000796a:	d40515e3          	bnez	a0,a00076b4 <u8g2_font_decode_glyph+0x1ec>
a000796e:	b555                	j	a0007812 <u8g2_font_decode_glyph+0x34a>
a0007970:	0000                	unimp
	...

a0007974 <u8g2_font_get_glyph_data>:
{
a0007974:	1141                	addi	sp,sp,-16
a0007976:	c422                	sw	s0,8(sp)
  const uint8_t *font = u8g2->font;
a0007978:	4d20                	lw	s0,88(a0)
{
a000797a:	c606                	sw	ra,12(sp)
a000797c:	c226                	sw	s1,4(sp)
a000797e:	c04a                	sw	s2,0(sp)
  if ( encoding <= 255 )
a0007980:	0ff00793          	li	a5,255
  font += U8G2_FONT_DATA_STRUCT_SIZE;
a0007984:	045d                	addi	s0,s0,23
  if ( encoding <= 255 )
a0007986:	02b7ee63          	bltu	a5,a1,a00079c2 <u8g2_font_get_glyph_data+0x4e>
    if ( encoding >= 'a' )
a000798a:	06000793          	li	a5,96
a000798e:	0ab7f163          	bgeu	a5,a1,a0007a30 <u8g2_font_get_glyph_data+0xbc>
      font += u8g2->font_info.start_pos_lower_a;
a0007992:	08855783          	lhu	a5,136(a0)
a0007996:	943e                	add	s0,s0,a5
      if ( u8x8_pgm_read( font + 1 ) == 0 )
a0007998:	00144783          	lbu	a5,1(s0) # 63010001 <__HeapLimit+0x1>
a000799c:	cf81                	beqz	a5,a00079b4 <u8g2_font_get_glyph_data+0x40>
a000799e:	0001                	nop
      if ( u8x8_pgm_read( font ) == encoding )
a00079a0:	00044703          	lbu	a4,0(s0)
	return font+2;	/* skip encoding and glyph size */
a00079a4:	00240513          	addi	a0,s0,2
      if ( u8x8_pgm_read( font ) == encoding )
a00079a8:	00b70763          	beq	a4,a1,a00079b6 <u8g2_font_get_glyph_data+0x42>
      font += u8g2->font_info.start_pos_upper_A;
a00079ac:	943e                	add	s0,s0,a5
      if ( u8x8_pgm_read( font + 1 ) == 0 )
a00079ae:	00144783          	lbu	a5,1(s0)
a00079b2:	f7fd                	bnez	a5,a00079a0 <u8g2_font_get_glyph_data+0x2c>
  return NULL;
a00079b4:	4501                	li	a0,0
}
a00079b6:	40b2                	lw	ra,12(sp)
a00079b8:	4422                	lw	s0,8(sp)
a00079ba:	4492                	lw	s1,4(sp)
a00079bc:	4902                	lw	s2,0(sp)
a00079be:	0141                	addi	sp,sp,16
a00079c0:	8082                	ret
    font += u8g2->font_info.start_pos_unicode;
a00079c2:	08a55503          	lhu	a0,138(a0)
a00079c6:	892e                	mv	s2,a1
a00079c8:	942a                	add	s0,s0,a0
    unicode_lookup_table = font; 
a00079ca:	84a2                	mv	s1,s0
      font += u8g2_font_get_word(unicode_lookup_table, 0);
a00079cc:	4581                	li	a1,0
a00079ce:	8526                	mv	a0,s1
a00079d0:	99fff0ef          	jal	ra,a000736e <u8g2_font_get_word>
a00079d4:	87aa                	mv	a5,a0
      e = u8g2_font_get_word(unicode_lookup_table, 2);
a00079d6:	4589                	li	a1,2
a00079d8:	8526                	mv	a0,s1
      font += u8g2_font_get_word(unicode_lookup_table, 0);
a00079da:	943e                	add	s0,s0,a5
      e = u8g2_font_get_word(unicode_lookup_table, 2);
a00079dc:	993ff0ef          	jal	ra,a000736e <u8g2_font_get_word>
      unicode_lookup_table+=4;
a00079e0:	0491                	addi	s1,s1,4
    } while( e < encoding );
a00079e2:	ff2565e3          	bltu	a0,s2,a00079cc <u8g2_font_get_glyph_data+0x58>
      e = u8x8_pgm_read( font );
a00079e6:	00144783          	lbu	a5,1(s0)
a00079ea:	00044703          	lbu	a4,0(s0)
a00079ee:	07a2                	slli	a5,a5,0x8
a00079f0:	8fd9                	or	a5,a5,a4
a00079f2:	ad8787f7          	swap8	a5,a5
a00079f6:	3c07b78b          	extu	a5,a5,15,0
      if ( e == 0 )
a00079fa:	dfcd                	beqz	a5,a00079b4 <u8g2_font_get_glyph_data+0x40>
      if ( e == encoding )
a00079fc:	02f90263          	beq	s2,a5,a0007a20 <u8g2_font_get_glyph_data+0xac>
      font += u8x8_pgm_read( font + 2 );
a0007a00:	00244783          	lbu	a5,2(s0)
a0007a04:	943e                	add	s0,s0,a5
      e = u8x8_pgm_read( font );
a0007a06:	00144783          	lbu	a5,1(s0)
a0007a0a:	00044703          	lbu	a4,0(s0)
a0007a0e:	07a2                	slli	a5,a5,0x8
a0007a10:	8fd9                	or	a5,a5,a4
a0007a12:	ad8787f7          	swap8	a5,a5
a0007a16:	3c07b78b          	extu	a5,a5,15,0
      if ( e == 0 )
a0007a1a:	dfc9                	beqz	a5,a00079b4 <u8g2_font_get_glyph_data+0x40>
      if ( e == encoding )
a0007a1c:	fef912e3          	bne	s2,a5,a0007a00 <u8g2_font_get_glyph_data+0x8c>
}
a0007a20:	40b2                	lw	ra,12(sp)
	return font+3;	/* skip encoding and glyph size */
a0007a22:	00340513          	addi	a0,s0,3
}
a0007a26:	4422                	lw	s0,8(sp)
a0007a28:	4492                	lw	s1,4(sp)
a0007a2a:	4902                	lw	s2,0(sp)
a0007a2c:	0141                	addi	sp,sp,16
a0007a2e:	8082                	ret
    else if ( encoding >= 'A' )
a0007a30:	04000793          	li	a5,64
a0007a34:	f6b7f2e3          	bgeu	a5,a1,a0007998 <u8g2_font_get_glyph_data+0x24>
      font += u8g2->font_info.start_pos_upper_A;
a0007a38:	08655783          	lhu	a5,134(a0)
a0007a3c:	943e                	add	s0,s0,a5
a0007a3e:	bf85                	j	a00079ae <u8g2_font_get_glyph_data+0x3a>

a0007a40 <u8g2_DrawGlyph>:
{
a0007a40:	1101                	addi	sp,sp,-32
a0007a42:	cc22                	sw	s0,24(sp)
a0007a44:	ca26                	sw	s1,20(sp)
a0007a46:	c84a                	sw	s2,16(sp)
a0007a48:	c64e                	sw	s3,12(sp)
a0007a4a:	ce06                	sw	ra,28(sp)
  switch(u8g2->font_decode.dir)
a0007a4c:	07054783          	lbu	a5,112(a0)
a0007a50:	4709                	li	a4,2
{
a0007a52:	842a                	mv	s0,a0
a0007a54:	892e                	mv	s2,a1
a0007a56:	84b2                	mv	s1,a2
a0007a58:	89b6                	mv	s3,a3
  switch(u8g2->font_decode.dir)
a0007a5a:	04e78c63          	beq	a5,a4,a0007ab2 <u8g2_DrawGlyph+0x72>
a0007a5e:	04f76163          	bltu	a4,a5,a0007aa0 <u8g2_DrawGlyph+0x60>
a0007a62:	04078e63          	beqz	a5,a0007abe <u8g2_DrawGlyph+0x7e>
      x -= u8g2->font_calc_vref(u8g2);
a0007a66:	4d7c                	lw	a5,92(a0)
a0007a68:	9782                	jalr	a5
a0007a6a:	40a90933          	sub	s2,s2,a0
a0007a6e:	3c09390b          	extu	s2,s2,15,0
a0007a72:	0001                	nop
  const uint8_t *glyph_data = u8g2_font_get_glyph_data(u8g2, encoding);
a0007a74:	85ce                	mv	a1,s3
  u8g2->font_decode.target_x = x;
a0007a76:	07241223          	sh	s2,100(s0)
  u8g2->font_decode.target_y = y;
a0007a7a:	06941323          	sh	s1,102(s0)
  const uint8_t *glyph_data = u8g2_font_get_glyph_data(u8g2, encoding);
a0007a7e:	8522                	mv	a0,s0
a0007a80:	3dd5                	jal	a0007974 <u8g2_font_get_glyph_data>
a0007a82:	85aa                	mv	a1,a0
  u8g2_uint_t dx = 0;
a0007a84:	4501                	li	a0,0
  if ( glyph_data != NULL )
a0007a86:	c591                	beqz	a1,a0007a92 <u8g2_DrawGlyph+0x52>
    dx = u8g2_font_decode_glyph(u8g2, glyph_data);
a0007a88:	8522                	mv	a0,s0
a0007a8a:	a3fff0ef          	jal	ra,a00074c8 <u8g2_font_decode_glyph>
a0007a8e:	3c05350b          	extu	a0,a0,15,0
}
a0007a92:	40f2                	lw	ra,28(sp)
a0007a94:	4462                	lw	s0,24(sp)
a0007a96:	44d2                	lw	s1,20(sp)
a0007a98:	4942                	lw	s2,16(sp)
a0007a9a:	49b2                	lw	s3,12(sp)
a0007a9c:	6105                	addi	sp,sp,32
a0007a9e:	8082                	ret
  switch(u8g2->font_decode.dir)
a0007aa0:	470d                	li	a4,3
a0007aa2:	fce799e3          	bne	a5,a4,a0007a74 <u8g2_DrawGlyph+0x34>
      x += u8g2->font_calc_vref(u8g2);
a0007aa6:	4d7c                	lw	a5,92(a0)
a0007aa8:	9782                	jalr	a5
a0007aaa:	992a                	add	s2,s2,a0
a0007aac:	3c09390b          	extu	s2,s2,15,0
      break;
a0007ab0:	b7d1                	j	a0007a74 <u8g2_DrawGlyph+0x34>
      y -= u8g2->font_calc_vref(u8g2);
a0007ab2:	4d7c                	lw	a5,92(a0)
a0007ab4:	9782                	jalr	a5
a0007ab6:	8c89                	sub	s1,s1,a0
a0007ab8:	3c04b48b          	extu	s1,s1,15,0
      break;
a0007abc:	bf65                	j	a0007a74 <u8g2_DrawGlyph+0x34>
      y += u8g2->font_calc_vref(u8g2);
a0007abe:	4d7c                	lw	a5,92(a0)
a0007ac0:	9782                	jalr	a5
a0007ac2:	94aa                	add	s1,s1,a0
a0007ac4:	3c04b48b          	extu	s1,s1,15,0
      break;
a0007ac8:	b775                	j	a0007a74 <u8g2_DrawGlyph+0x34>
	...

a0007acc <u8g2_draw_string>:
{
a0007acc:	7179                	addi	sp,sp,-48
a0007ace:	ce4e                	sw	s3,28(sp)
    if ( e == 0x0ffff )
a0007ad0:	69c1                	lui	s3,0x10
{
a0007ad2:	d422                	sw	s0,40(sp)
a0007ad4:	d226                	sw	s1,36(sp)
a0007ad6:	d04a                	sw	s2,32(sp)
a0007ad8:	cc52                	sw	s4,24(sp)
a0007ada:	ca56                	sw	s5,20(sp)
a0007adc:	c85a                	sw	s6,16(sp)
a0007ade:	c65e                	sw	s7,12(sp)
a0007ae0:	c462                	sw	s8,8(sp)
a0007ae2:	d606                	sw	ra,44(sp)
a0007ae4:	842a                	mv	s0,a0
a0007ae6:	8a2e                	mv	s4,a1
a0007ae8:	8932                	mv	s2,a2
a0007aea:	84b6                	mv	s1,a3
    if ( e == 0x0ffff )
a0007aec:	fff98a93          	addi	s5,s3,-1 # ffff <nocache_min_size+0xafff>
  u8x8_utf8_init(u8g2_GetU8x8(u8g2));
a0007af0:	2375                	jal	a000809c <u8x8_utf8_init>
  sum = 0;
a0007af2:	4b01                	li	s6,0
    if ( e != 0x0fffe )
a0007af4:	19f9                	addi	s3,s3,-2
      switch(u8g2->font_decode.dir)
a0007af6:	4b89                	li	s7,2
a0007af8:	4c0d                	li	s8,3
a0007afa:	0001                	nop
    e = u8g2->u8x8.next_cb(u8g2_GetU8x8(u8g2), (uint8_t)*str);
a0007afc:	405c                	lw	a5,4(s0)
a0007afe:	0004c583          	lbu	a1,0(s1)
a0007b02:	8522                	mv	a0,s0
a0007b04:	9782                	jalr	a5
    if ( e == 0x0ffff )
a0007b06:	03550f63          	beq	a0,s5,a0007b44 <u8g2_draw_string+0x78>
    str++;
a0007b0a:	0485                	addi	s1,s1,1
    if ( e != 0x0fffe )
a0007b0c:	ff3508e3          	beq	a0,s3,a0007afc <u8g2_draw_string+0x30>
      delta = u8g2_DrawGlyph(u8g2, x, y, e);
a0007b10:	86aa                	mv	a3,a0
a0007b12:	864a                	mv	a2,s2
a0007b14:	85d2                	mv	a1,s4
a0007b16:	8522                	mv	a0,s0
a0007b18:	3725                	jal	a0007a40 <u8g2_DrawGlyph>
      switch(u8g2->font_decode.dir)
a0007b1a:	07044783          	lbu	a5,112(s0)
a0007b1e:	05778d63          	beq	a5,s7,a0007b78 <u8g2_draw_string+0xac>
a0007b22:	02fbee63          	bltu	s7,a5,a0007b5e <u8g2_draw_string+0x92>
a0007b26:	04078563          	beqz	a5,a0007b70 <u8g2_draw_string+0xa4>
	  y += delta;
a0007b2a:	992a                	add	s2,s2,a0
a0007b2c:	3c09390b          	extu	s2,s2,15,0
    e = u8g2->u8x8.next_cb(u8g2_GetU8x8(u8g2), (uint8_t)*str);
a0007b30:	405c                	lw	a5,4(s0)
a0007b32:	0004c583          	lbu	a1,0(s1)
      sum += delta;    
a0007b36:	9b2a                	add	s6,s6,a0
    e = u8g2->u8x8.next_cb(u8g2_GetU8x8(u8g2), (uint8_t)*str);
a0007b38:	8522                	mv	a0,s0
      sum += delta;    
a0007b3a:	3c0b3b0b          	extu	s6,s6,15,0
    e = u8g2->u8x8.next_cb(u8g2_GetU8x8(u8g2), (uint8_t)*str);
a0007b3e:	9782                	jalr	a5
    if ( e == 0x0ffff )
a0007b40:	fd5515e3          	bne	a0,s5,a0007b0a <u8g2_draw_string+0x3e>
}
a0007b44:	50b2                	lw	ra,44(sp)
a0007b46:	5422                	lw	s0,40(sp)
a0007b48:	5492                	lw	s1,36(sp)
a0007b4a:	5902                	lw	s2,32(sp)
a0007b4c:	49f2                	lw	s3,28(sp)
a0007b4e:	4a62                	lw	s4,24(sp)
a0007b50:	4ad2                	lw	s5,20(sp)
a0007b52:	4bb2                	lw	s7,12(sp)
a0007b54:	4c22                	lw	s8,8(sp)
a0007b56:	855a                	mv	a0,s6
a0007b58:	4b42                	lw	s6,16(sp)
a0007b5a:	6145                	addi	sp,sp,48
a0007b5c:	8082                	ret
	  y -= delta;
a0007b5e:	40a90733          	sub	a4,s2,a0
a0007b62:	3c07370b          	extu	a4,a4,15,0
a0007b66:	418787b3          	sub	a5,a5,s8
a0007b6a:	40f7190b          	mveqz	s2,a4,a5
a0007b6e:	b7c9                	j	a0007b30 <u8g2_draw_string+0x64>
	  x += delta;
a0007b70:	9a2a                	add	s4,s4,a0
a0007b72:	3c0a3a0b          	extu	s4,s4,15,0
	  break;
a0007b76:	bf6d                	j	a0007b30 <u8g2_draw_string+0x64>
	  x -= delta;
a0007b78:	40aa0a33          	sub	s4,s4,a0
a0007b7c:	3c0a3a0b          	extu	s4,s4,15,0
	  break;
a0007b80:	bf45                	j	a0007b30 <u8g2_draw_string+0x64>

a0007b82 <u8g2_DrawUTF8>:
  u8g2->u8x8.next_cb = u8x8_utf8_next;
a0007b82:	a00087b7          	lui	a5,0xa0008
a0007b86:	ff078793          	addi	a5,a5,-16 # a0007ff0 <__psram_limit+0xf7c07ff0>
a0007b8a:	c15c                	sw	a5,4(a0)
  return u8g2_draw_string(u8g2, x, y, str);
a0007b8c:	b781                	j	a0007acc <u8g2_draw_string>

a0007b8e <u8g2_SetFontPosBaseline>:

void u8g2_SetFontPosBaseline(u8g2_t *u8g2)
{
  u8g2->font_calc_vref = u8g2_font_calc_vref_font;
a0007b8e:	a00077b7          	lui	a5,0xa0007
a0007b92:	38278793          	addi	a5,a5,898 # a0007382 <__psram_limit+0xf7c07382>
a0007b96:	cd7c                	sw	a5,92(a0)
}
a0007b98:	8082                	ret

a0007b9a <u8g2_SetFont>:

/*===============================================*/

void u8g2_SetFont(u8g2_t *u8g2, const uint8_t  *font)
{
  if ( u8g2->font != font )
a0007b9a:	4d3c                	lw	a5,88(a0)
a0007b9c:	10b78d63          	beq	a5,a1,a0007cb6 <u8g2_SetFont+0x11c>
{
a0007ba0:	7179                	addi	sp,sp,-48
a0007ba2:	d606                	sw	ra,44(sp)
a0007ba4:	d422                	sw	s0,40(sp)
a0007ba6:	d226                	sw	s1,36(sp)
a0007ba8:	d04a                	sw	s2,32(sp)
a0007baa:	ce4e                	sw	s3,28(sp)
a0007bac:	cc52                	sw	s4,24(sp)
a0007bae:	ca56                	sw	s5,20(sp)
a0007bb0:	c65e                	sw	s7,12(sp)
a0007bb2:	c462                	sw	s8,8(sp)
a0007bb4:	c266                	sw	s9,4(sp)
a0007bb6:	c85a                	sw	s6,16(sp)
  {
//#ifdef  __unix__
//	u8g2->last_font_data = NULL;
//	u8g2->last_unicode = 0x0ffff;
//#endif 
    u8g2->font = font;
a0007bb8:	cd2c                	sw	a1,88(a0)
  return u8x8_pgm_read( font );  
a0007bba:	0005c783          	lbu	a5,0(a1)
a0007bbe:	842a                	mv	s0,a0
a0007bc0:	84ae                	mv	s1,a1
  font_info->glyph_cnt = u8g2_font_get_byte(font, 0);
a0007bc2:	06f40a23          	sb	a5,116(s0)
  return u8x8_pgm_read( font );  
a0007bc6:	0014c783          	lbu	a5,1(s1)
  font_info->start_pos_upper_A = u8g2_font_get_word(font, 17);
a0007bca:	45c5                	li	a1,17
a0007bcc:	8526                	mv	a0,s1
  font_info->bbx_mode = u8g2_font_get_byte(font, 1);
a0007bce:	06f40aa3          	sb	a5,117(s0)
  return u8x8_pgm_read( font );  
a0007bd2:	0024c783          	lbu	a5,2(s1)
  font_info->bits_per_0 = u8g2_font_get_byte(font, 2);
a0007bd6:	06f40b23          	sb	a5,118(s0)
  return u8x8_pgm_read( font );  
a0007bda:	0034c783          	lbu	a5,3(s1)
  font_info->bits_per_1 = u8g2_font_get_byte(font, 3);
a0007bde:	06f40ba3          	sb	a5,119(s0)
  return u8x8_pgm_read( font );  
a0007be2:	0044c783          	lbu	a5,4(s1)
  font_info->bits_per_char_width = u8g2_font_get_byte(font, 4);
a0007be6:	06f40c23          	sb	a5,120(s0)
  return u8x8_pgm_read( font );  
a0007bea:	0054c783          	lbu	a5,5(s1)
  font_info->bits_per_char_height = u8g2_font_get_byte(font, 5);
a0007bee:	06f40ca3          	sb	a5,121(s0)
  return u8x8_pgm_read( font );  
a0007bf2:	0064c783          	lbu	a5,6(s1)
  font_info->bits_per_char_x = u8g2_font_get_byte(font, 6);
a0007bf6:	06f40d23          	sb	a5,122(s0)
  return u8x8_pgm_read( font );  
a0007bfa:	0074c783          	lbu	a5,7(s1)
  font_info->bits_per_char_y = u8g2_font_get_byte(font, 7);
a0007bfe:	06f40da3          	sb	a5,123(s0)
  return u8x8_pgm_read( font );  
a0007c02:	0084c783          	lbu	a5,8(s1)
  font_info->bits_per_delta_x = u8g2_font_get_byte(font, 8);
a0007c06:	06f40e23          	sb	a5,124(s0)
  font_info->max_char_width = u8g2_font_get_byte(font, 9);
a0007c0a:	0094c783          	lbu	a5,9(s1)
a0007c0e:	06f40ea3          	sb	a5,125(s0)
  return u8x8_pgm_read( font );  
a0007c12:	00a4cb03          	lbu	s6,10(s1)
  font_info->max_char_height = u8g2_font_get_byte(font, 10);
a0007c16:	1c0b2a0b          	ext	s4,s6,7,0
a0007c1a:	07440f23          	sb	s4,126(s0)
  font_info->x_offset = u8g2_font_get_byte(font, 11);
a0007c1e:	00b4c783          	lbu	a5,11(s1)
a0007c22:	06f40fa3          	sb	a5,127(s0)
  return u8x8_pgm_read( font );  
a0007c26:	00c4cc83          	lbu	s9,12(s1)
  font_info->y_offset = u8g2_font_get_byte(font, 12);
a0007c2a:	1c0caa8b          	ext	s5,s9,7,0
a0007c2e:	09540023          	sb	s5,128(s0)
  font_info->ascent_A = u8g2_font_get_byte(font, 13);
a0007c32:	00d48983          	lb	s3,13(s1)
a0007c36:	093400a3          	sb	s3,129(s0)
  font_info->descent_g = u8g2_font_get_byte(font, 14);
a0007c3a:	00e48903          	lb	s2,14(s1)
a0007c3e:	09240123          	sb	s2,130(s0)
  font_info->ascent_para = u8g2_font_get_byte(font, 15);
a0007c42:	00f48c03          	lb	s8,15(s1)
a0007c46:	098401a3          	sb	s8,131(s0)
  font_info->descent_para = u8g2_font_get_byte(font, 16);
a0007c4a:	01048b83          	lb	s7,16(s1)
a0007c4e:	09740223          	sb	s7,132(s0)
  font_info->start_pos_upper_A = u8g2_font_get_word(font, 17);
a0007c52:	f1cff0ef          	jal	ra,a000736e <u8g2_font_get_word>
  font_info->start_pos_lower_a = u8g2_font_get_word(font, 19); 
a0007c56:	45cd                	li	a1,19
  font_info->start_pos_upper_A = u8g2_font_get_word(font, 17);
a0007c58:	08a41323          	sh	a0,134(s0)
  font_info->start_pos_lower_a = u8g2_font_get_word(font, 19); 
a0007c5c:	8526                	mv	a0,s1
a0007c5e:	f10ff0ef          	jal	ra,a000736e <u8g2_font_get_word>
a0007c62:	08a41423          	sh	a0,136(s0)
  font_info->start_pos_unicode = u8g2_font_get_word(font, 21); 
a0007c66:	45d5                	li	a1,21
a0007c68:	8526                	mv	a0,s1
a0007c6a:	f04ff0ef          	jal	ra,a000736e <u8g2_font_get_word>
  if ( u8g2->font_height_mode == U8G2_FONT_HEIGHT_MODE_TEXT )
a0007c6e:	08d44783          	lbu	a5,141(s0)
  font_info->start_pos_unicode = u8g2_font_get_word(font, 21); 
a0007c72:	08a41523          	sh	a0,138(s0)
  u8g2->font_ref_ascent = u8g2->font_info.ascent_A;
a0007c76:	09340723          	sb	s3,142(s0)
  u8g2->font_ref_descent = u8g2->font_info.descent_g;
a0007c7a:	092407a3          	sb	s2,143(s0)
  if ( u8g2->font_height_mode == U8G2_FONT_HEIGHT_MODE_TEXT )
a0007c7e:	ef91                	bnez	a5,a0007c9a <u8g2_SetFont+0x100>
    u8g2_read_font_info(&(u8g2->font_info), font);
    u8g2_UpdateRefHeight(u8g2);
    /* u8g2_SetFontPosBaseline(u8g2); */ /* removed with issue 195 */
  }
}
a0007c80:	50b2                	lw	ra,44(sp)
a0007c82:	5422                	lw	s0,40(sp)
a0007c84:	5492                	lw	s1,36(sp)
a0007c86:	5902                	lw	s2,32(sp)
a0007c88:	49f2                	lw	s3,28(sp)
a0007c8a:	4a62                	lw	s4,24(sp)
a0007c8c:	4ad2                	lw	s5,20(sp)
a0007c8e:	4b42                	lw	s6,16(sp)
a0007c90:	4bb2                	lw	s7,12(sp)
a0007c92:	4c22                	lw	s8,8(sp)
a0007c94:	4c92                	lw	s9,4(sp)
a0007c96:	6145                	addi	sp,sp,48
a0007c98:	8082                	ret
  else if ( u8g2->font_height_mode == U8G2_FONT_HEIGHT_MODE_XTEXT )
a0007c9a:	4705                	li	a4,1
a0007c9c:	00e78e63          	beq	a5,a4,a0007cb8 <u8g2_SetFont+0x11e>
    if ( u8g2->font_ref_ascent < u8g2->font_info.max_char_height+u8g2->font_info.y_offset )
a0007ca0:	9a56                	add	s4,s4,s5
a0007ca2:	0149d563          	bge	s3,s4,a0007cac <u8g2_SetFont+0x112>
      u8g2->font_ref_ascent = u8g2->font_info.max_char_height+u8g2->font_info.y_offset;
a0007ca6:	9b66                	add	s6,s6,s9
a0007ca8:	09640723          	sb	s6,142(s0)
    if ( u8g2->font_ref_descent > u8g2->font_info.y_offset )
a0007cac:	fd2adae3          	bge	s5,s2,a0007c80 <u8g2_SetFont+0xe6>
      u8g2->font_ref_descent = u8g2->font_info.y_offset;
a0007cb0:	095407a3          	sb	s5,143(s0)
}
a0007cb4:	b7f1                	j	a0007c80 <u8g2_SetFont+0xe6>
a0007cb6:	8082                	ret
    if ( u8g2->font_ref_ascent < u8g2->font_info.ascent_para )
a0007cb8:	0189d463          	bge	s3,s8,a0007cc0 <u8g2_SetFont+0x126>
      u8g2->font_ref_ascent = u8g2->font_info.ascent_para;
a0007cbc:	09840723          	sb	s8,142(s0)
    if ( u8g2->font_ref_descent > u8g2->font_info.descent_para )
a0007cc0:	fd2bd0e3          	bge	s7,s2,a0007c80 <u8g2_SetFont+0xe6>
      u8g2->font_ref_descent = u8g2->font_info.descent_para;
a0007cc4:	097407a3          	sb	s7,143(s0)
a0007cc8:	bf65                	j	a0007c80 <u8g2_SetFont+0xe6>

a0007cca <u8g2_draw_hv_line_2dir>:
{

  /* clipping happens before the display rotation */

  /* transform to pixel buffer coordinates */
  y -= u8g2->pixel_curr_row;
a0007cca:	03e55803          	lhu	a6,62(a0)
  
  u8g2->ll_hvline(u8g2, x, y, len, dir);
a0007cce:	555c                	lw	a5,44(a0)
  y -= u8g2->pixel_curr_row;
a0007cd0:	41060633          	sub	a2,a2,a6
  u8g2->ll_hvline(u8g2, x, y, len, dir);
a0007cd4:	3c06360b          	extu	a2,a2,15,0
a0007cd8:	8782                	jr	a5

a0007cda <u8g2_DrawHVLine>:
  /* Make a call to the callback function (e.g. u8g2_draw_l90_r0). */
  /* The callback may rotate the hv line */
  /* after rotation this will call u8g2_draw_hv_line_4dir() */
  
#ifdef U8G2_WITH_CLIP_WINDOW_SUPPORT
  if ( u8g2->is_page_clip_window_intersection != 0 )
a0007cda:	08c54783          	lbu	a5,140(a0)
a0007cde:	cb85                	beqz	a5,a0007d0e <u8g2_DrawHVLine+0x34>
#endif /* U8G2_WITH_CLIP_WINDOW_SUPPORT */
    if ( len != 0 )
a0007ce0:	02068763          	beqz	a3,a0007d0e <u8g2_DrawHVLine+0x34>
    {
    
      /* convert to two directions */    
      if ( len > 1 )
a0007ce4:	4785                	li	a5,1
	{
	  y -= len;
	  y++;
	}
      }
      dir &= 1;  
a0007ce6:	00177813          	andi	a6,a4,1
      if ( len > 1 )
a0007cea:	00f68863          	beq	a3,a5,a0007cfa <u8g2_DrawHVLine+0x20>
	if ( dir == 2 )
a0007cee:	4789                	li	a5,2
a0007cf0:	02f70063          	beq	a4,a5,a0007d10 <u8g2_DrawHVLine+0x36>
	else if ( dir == 3 )
a0007cf4:	478d                	li	a5,3
a0007cf6:	0af70c63          	beq	a4,a5,a0007dae <u8g2_DrawHVLine+0xd4>
      
      /* clip against the user window */
      if ( dir == 0 )
a0007cfa:	00080f63          	beqz	a6,a0007d18 <u8g2_DrawHVLine+0x3e>
	if ( u8g2_clip_intersection2(&x, &len, u8g2->user_x0, u8g2->user_x1) == 0 )
	  return;
      }
      else
      {
	if ( x < u8g2->user_x0 )
a0007cfe:	04855783          	lhu	a5,72(a0)
a0007d02:	00f5e663          	bltu	a1,a5,a0007d0e <u8g2_DrawHVLine+0x34>
	  return;
	if ( x >= u8g2->user_x1 )
a0007d06:	04a55783          	lhu	a5,74(a0)
a0007d0a:	06f5e263          	bltu	a1,a5,a0007d6e <u8g2_DrawHVLine+0x94>
      }
      
      
      u8g2->cb->draw_l90(u8g2, x, y, len, dir);
    }
}
a0007d0e:	8082                	ret
	  x++;
a0007d10:	0585                	addi	a1,a1,1
a0007d12:	8d95                	sub	a1,a1,a3
a0007d14:	3c05b58b          	extu	a1,a1,15,0
	if ( y < u8g2->user_y0 )
a0007d18:	04c55783          	lhu	a5,76(a0)
a0007d1c:	fef669e3          	bltu	a2,a5,a0007d0e <u8g2_DrawHVLine+0x34>
	if ( y >= u8g2->user_y1 )
a0007d20:	04e55783          	lhu	a5,78(a0)
a0007d24:	fef675e3          	bgeu	a2,a5,a0007d0e <u8g2_DrawHVLine+0x34>
  b += *len;
a0007d28:	96ae                	add	a3,a3,a1
a0007d2a:	3c06b68b          	extu	a3,a3,15,0
	if ( u8g2_clip_intersection2(&x, &len, u8g2->user_x0, u8g2->user_x1) == 0 )
a0007d2e:	04855783          	lhu	a5,72(a0)
a0007d32:	04a55703          	lhu	a4,74(a0)
  if ( a > b )
a0007d36:	08b6f263          	bgeu	a3,a1,a0007dba <u8g2_DrawHVLine+0xe0>
    if ( a < d )
a0007d3a:	06e5ff63          	bgeu	a1,a4,a0007db8 <u8g2_DrawHVLine+0xde>
      b--;
a0007d3e:	fff70693          	addi	a3,a4,-1
a0007d42:	3c06b68b          	extu	a3,a3,15,0
  if ( b <= c )
a0007d46:	fcd7f4e3          	bgeu	a5,a3,a0007d0e <u8g2_DrawHVLine+0x34>
  if ( a < c )		
a0007d4a:	88be                	mv	a7,a5
a0007d4c:	00b7f363          	bgeu	a5,a1,a0007d52 <u8g2_DrawHVLine+0x78>
a0007d50:	88ae                	mv	a7,a1
a0007d52:	3c08b58b          	extu	a1,a7,15,0
  if ( b > d )
a0007d56:	87ba                	mv	a5,a4
a0007d58:	00e6f363          	bgeu	a3,a4,a0007d5e <u8g2_DrawHVLine+0x84>
a0007d5c:	87b6                	mv	a5,a3
  b -= a;
a0007d5e:	40b786b3          	sub	a3,a5,a1
a0007d62:	3c06b68b          	extu	a3,a3,15,0
      u8g2->cb->draw_l90(u8g2, x, y, len, dir);
a0007d66:	591c                	lw	a5,48(a0)
a0007d68:	8742                	mv	a4,a6
a0007d6a:	479c                	lw	a5,8(a5)
a0007d6c:	8782                	jr	a5
  b += *len;
a0007d6e:	96b2                	add	a3,a3,a2
a0007d70:	3c06b68b          	extu	a3,a3,15,0
	if ( u8g2_clip_intersection2(&y, &len, u8g2->user_y0, u8g2->user_y1) == 0 )
a0007d74:	04c55783          	lhu	a5,76(a0)
a0007d78:	04e55703          	lhu	a4,78(a0)
  if ( a > b )
a0007d7c:	04c6f363          	bgeu	a3,a2,a0007dc2 <u8g2_DrawHVLine+0xe8>
    if ( a < d )
a0007d80:	04e67063          	bgeu	a2,a4,a0007dc0 <u8g2_DrawHVLine+0xe6>
      b--;
a0007d84:	fff70693          	addi	a3,a4,-1
a0007d88:	3c06b68b          	extu	a3,a3,15,0
  if ( b <= c )
a0007d8c:	f8d7f1e3          	bgeu	a5,a3,a0007d0e <u8g2_DrawHVLine+0x34>
  if ( a < c )		
a0007d90:	88be                	mv	a7,a5
a0007d92:	00c7f363          	bgeu	a5,a2,a0007d98 <u8g2_DrawHVLine+0xbe>
a0007d96:	88b2                	mv	a7,a2
a0007d98:	3c08b60b          	extu	a2,a7,15,0
  if ( b > d )
a0007d9c:	87ba                	mv	a5,a4
a0007d9e:	00e6f363          	bgeu	a3,a4,a0007da4 <u8g2_DrawHVLine+0xca>
a0007da2:	87b6                	mv	a5,a3
  b -= a;
a0007da4:	40c786b3          	sub	a3,a5,a2
a0007da8:	3c06b68b          	extu	a3,a3,15,0
  return 1;
a0007dac:	bf6d                	j	a0007d66 <u8g2_DrawHVLine+0x8c>
	  y++;
a0007dae:	0605                	addi	a2,a2,1
a0007db0:	8e15                	sub	a2,a2,a3
a0007db2:	3c06360b          	extu	a2,a2,15,0
      if ( dir == 0 )
a0007db6:	b7a1                	j	a0007cfe <u8g2_DrawHVLine+0x24>
	if ( u8g2_clip_intersection2(&x, &len, u8g2->user_x0, u8g2->user_x1) == 0 )
a0007db8:	85be                	mv	a1,a5
  if ( a >= d )
a0007dba:	f8e5e6e3          	bltu	a1,a4,a0007d46 <u8g2_DrawHVLine+0x6c>
}
a0007dbe:	8082                	ret
	if ( u8g2_clip_intersection2(&y, &len, u8g2->user_y0, u8g2->user_y1) == 0 )
a0007dc0:	863e                	mv	a2,a5
  if ( a >= d )
a0007dc2:	fce665e3          	bltu	a2,a4,a0007d8c <u8g2_DrawHVLine+0xb2>
}
a0007dc6:	8082                	ret

a0007dc8 <u8g2_IsIntersection>:
  a1 and v1 are excluded
  v0 == v1 is not support end return 1
*/
uint8_t u8g2_is_intersection_decision_tree(u8g2_uint_t a0, u8g2_uint_t a1, u8g2_uint_t v0, u8g2_uint_t v1)
{
  if ( v0 < a1 )		// v0 <= a1
a0007dc8:	04e55803          	lhu	a6,78(a0)


/* upper limits are not included (asymetric boundaries) */
uint8_t u8g2_IsIntersection(u8g2_t *u8g2, u8g2_uint_t x0, u8g2_uint_t y0, u8g2_uint_t x1, u8g2_uint_t y1)
{
  if ( u8g2_is_intersection_decision_tree(u8g2->user_y0, u8g2->user_y1, y0, y1) == 0 )
a0007dcc:	04c55783          	lhu	a5,76(a0)
  if ( v0 < a1 )		// v0 <= a1
a0007dd0:	03067263          	bgeu	a2,a6,a0007df4 <u8g2_IsIntersection+0x2c>
    if ( v1 > a0 )	// v1 >= a0
a0007dd4:	00e7e463          	bltu	a5,a4,a0007ddc <u8g2_IsIntersection+0x14>
      if ( v0 > v1 )	// v0 > v1
a0007dd8:	02c77063          	bgeu	a4,a2,a0007df8 <u8g2_IsIntersection+0x30>
  if ( v0 < a1 )		// v0 <= a1
a0007ddc:	04a55703          	lhu	a4,74(a0)
    return 0; 
  
  return u8g2_is_intersection_decision_tree(u8g2->user_x0, u8g2->user_x1, x0, x1);
a0007de0:	04855783          	lhu	a5,72(a0)
  if ( v0 < a1 )		// v0 <= a1
a0007de4:	00e5fc63          	bgeu	a1,a4,a0007dfc <u8g2_IsIntersection+0x34>
      return 1;
a0007de8:	4505                	li	a0,1
    if ( v1 > a0 )	// v1 >= a0
a0007dea:	00d7e863          	bltu	a5,a3,a0007dfa <u8g2_IsIntersection+0x32>
    return 0; 
a0007dee:	00b6b533          	sltu	a0,a3,a1
a0007df2:	8082                	ret
    if ( v1 > a0 )	// v1 >= a0
a0007df4:	fee7e2e3          	bltu	a5,a4,a0007dd8 <u8g2_IsIntersection+0x10>
    return 0; 
a0007df8:	4501                	li	a0,0
}
a0007dfa:	8082                	ret
    if ( v1 > a0 )	// v1 >= a0
a0007dfc:	fed7fee3          	bgeu	a5,a3,a0007df8 <u8g2_IsIntersection+0x30>
    return 0; 
a0007e00:	00b6b533          	sltu	a0,a3,a1
a0007e04:	8082                	ret
	...

a0007e08 <u8g2_ll_hvline_vertical_top_lsb>:
  mask = 1;
  mask <<= bit_pos;

  or_mask = 0;
  xor_mask = 0;
  if ( u8g2->draw_color <= 1 )
a0007e08:	09254e03          	lbu	t3,146(a0)
  bit_pos &= 7; 	/* ... because only the lowest 3 bits are needed */
a0007e0c:	00767893          	andi	a7,a2,7
  mask <<= bit_pos;
a0007e10:	4785                	li	a5,1
a0007e12:	01179833          	sll	a6,a5,a7
a0007e16:	0ff87813          	andi	a6,a6,255
  or_mask = 0;
a0007e1a:	4301                	li	t1,0
  if ( u8g2->draw_color <= 1 )
a0007e1c:	09c7fc63          	bgeu	a5,t3,a0007eb4 <u8g2_ll_hvline_vertical_top_lsb+0xac>
    xor_mask = mask;


  offset = y;		/* y might be 8 or 16 bit, but we need 16 bit, so use a 16 bit variable */
  offset &= ~7;
  offset *= u8g2_GetU8x8(u8g2)->display_info->tile_width;
a0007e20:	00052e03          	lw	t3,0(a0)
  offset &= ~7;
a0007e24:	9a61                	andi	a2,a2,-8
  ptr = u8g2->tile_buf_ptr;
a0007e26:	595c                	lw	a5,52(a0)
  offset *= u8g2_GetU8x8(u8g2)->display_info->tile_width;
a0007e28:	010e4e03          	lbu	t3,16(t3)
a0007e2c:	03c60633          	mul	a2,a2,t3
  ptr += offset;
a0007e30:	3c06360b          	extu	a2,a2,15,0
  ptr += x;
a0007e34:	95b2                	add	a1,a1,a2
a0007e36:	95be                	add	a1,a1,a5

      if ( bit_pos == 0 )
      {
	ptr+=u8g2->pixel_buf_width;	/* 6 Jan 17: Changed u8g2->width to u8g2->pixel_buf_width, issue #148 */
		
	if ( u8g2->draw_color <= 1 )
a0007e38:	4605                	li	a2,1
  if ( dir == 0 )
a0007e3a:	e71d                	bnez	a4,a0007e68 <u8g2_ll_hvline_vertical_top_lsb+0x60>
a0007e3c:	fff68713          	addi	a4,a3,-1
a0007e40:	3c07370b          	extu	a4,a4,15,0
a0007e44:	0705                	addi	a4,a4,1
a0007e46:	972e                	add	a4,a4,a1
	*ptr |= or_mask;
a0007e48:	0005c783          	lbu	a5,0(a1)
a0007e4c:	00f367b3          	or	a5,t1,a5
	*ptr ^= xor_mask;
a0007e50:	00f847b3          	xor	a5,a6,a5
a0007e54:	1815d78b          	sbia	a5,(a1),1,0
      } while( len != 0 );
a0007e58:	fee598e3          	bne	a1,a4,a0007e48 <u8g2_ll_hvline_vertical_top_lsb+0x40>
a0007e5c:	8082                	ret
	if ( u8g2->draw_color != 1 )
	  xor_mask = 1;
      }
      else
      {
	or_mask <<= 1;
a0007e5e:	0ff77313          	andi	t1,a4,255
	xor_mask <<= 1;
a0007e62:	0ff7f813          	andi	a6,a5,255
      }
    } while( len != 0 );
a0007e66:	c2a1                	beqz	a3,a0007ea6 <u8g2_ll_hvline_vertical_top_lsb+0x9e>
      *ptr |= or_mask;
a0007e68:	0005c783          	lbu	a5,0(a1)
      bit_pos++;
a0007e6c:	0885                	addi	a7,a7,1
      len--;
a0007e6e:	16fd                	addi	a3,a3,-1
      *ptr |= or_mask;
a0007e70:	00f367b3          	or	a5,t1,a5
      *ptr ^= xor_mask;
a0007e74:	00f847b3          	xor	a5,a6,a5
a0007e78:	00f58023          	sb	a5,0(a1)
      bit_pos &= 7;
a0007e7c:	0078f893          	andi	a7,a7,7
	or_mask <<= 1;
a0007e80:	00131713          	slli	a4,t1,0x1
	xor_mask <<= 1;
a0007e84:	00181793          	slli	a5,a6,0x1
      len--;
a0007e88:	3c06b68b          	extu	a3,a3,15,0
      if ( bit_pos == 0 )
a0007e8c:	fc0899e3          	bnez	a7,a0007e5e <u8g2_ll_hvline_vertical_top_lsb+0x56>
	ptr+=u8g2->pixel_buf_width;	/* 6 Jan 17: Changed u8g2->width to u8g2->pixel_buf_width, issue #148 */
a0007e90:	03a55703          	lhu	a4,58(a0)
	if ( u8g2->draw_color <= 1 )
a0007e94:	09254783          	lbu	a5,146(a0)
	ptr+=u8g2->pixel_buf_width;	/* 6 Jan 17: Changed u8g2->width to u8g2->pixel_buf_width, issue #148 */
a0007e98:	95ba                	add	a1,a1,a4
	  xor_mask = 1;
a0007e9a:	40c78e33          	sub	t3,a5,a2
	if ( u8g2->draw_color <= 1 )
a0007e9e:	00f67563          	bgeu	a2,a5,a0007ea8 <u8g2_ll_hvline_vertical_top_lsb+0xa0>
	  xor_mask = 1;
a0007ea2:	4805                	li	a6,1
    } while( len != 0 );
a0007ea4:	f2f1                	bnez	a3,a0007e68 <u8g2_ll_hvline_vertical_top_lsb+0x60>
  }
}
a0007ea6:	8082                	ret
	  xor_mask = 1;
a0007ea8:	4785                	li	a5,1
	  or_mask  = 1;
a0007eaa:	4305                	li	t1,1
	  xor_mask = 1;
a0007eac:	43c7980b          	mvnez	a6,a5,t3
    } while( len != 0 );
a0007eb0:	fec5                	bnez	a3,a0007e68 <u8g2_ll_hvline_vertical_top_lsb+0x60>
a0007eb2:	bfd5                	j	a0007ea6 <u8g2_ll_hvline_vertical_top_lsb+0x9e>
    or_mask  = mask;
a0007eb4:	8342                	mv	t1,a6
  if ( u8g2->draw_color != 1 )
a0007eb6:	f6fe15e3          	bne	t3,a5,a0007e20 <u8g2_ll_hvline_vertical_top_lsb+0x18>
  xor_mask = 0;
a0007eba:	4801                	li	a6,0
a0007ebc:	b795                	j	a0007e20 <u8g2_ll_hvline_vertical_top_lsb+0x18>

a0007ebe <u8g2_draw_l90_r0>:
void u8g2_draw_l90_r0(u8g2_t *u8g2, u8g2_uint_t x, u8g2_uint_t y, u8g2_uint_t len, uint8_t dir)
{
#ifdef __unix
  assert( dir <= 1 );
#endif
  u8g2_draw_hv_line_2dir(u8g2, x, y, len, dir);
a0007ebe:	b531                	j	a0007cca <u8g2_draw_hv_line_2dir>

a0007ec0 <u8g2_update_dimension_r0>:
  t = u8g2->tile_buf_height;
a0007ec0:	03854683          	lbu	a3,56(a0)
  const u8x8_display_info_t *display_info = u8g2_GetU8x8(u8g2)->display_info;
a0007ec4:	4110                	lw	a2,0(a0)
  t = u8g2->tile_curr_row;
a0007ec6:	03954783          	lbu	a5,57(a0)
  t *= 8;
a0007eca:	00369713          	slli	a4,a3,0x3
  u8g2->pixel_buf_height = t;
a0007ece:	02e51e23          	sh	a4,60(a0)
  t = display_info->tile_width;
a0007ed2:	01064803          	lbu	a6,16(a2)
  t *= 8;
a0007ed6:	00379593          	slli	a1,a5,0x3
  u8g2->pixel_curr_row = t;
a0007eda:	02b51f23          	sh	a1,62(a0)
  t *= 8;
a0007ede:	080e                	slli	a6,a6,0x3
  u8g2->pixel_buf_width = t;
a0007ee0:	03051d23          	sh	a6,58(a0)
  if ( t + u8g2->tile_curr_row > display_info->tile_height )
a0007ee4:	01164803          	lbu	a6,17(a2)
a0007ee8:	96be                	add	a3,a3,a5
  u8g2->width = display_info->pixel_width;
a0007eea:	01465883          	lhu	a7,20(a2)
  t *= 8;
a0007eee:	40f807b3          	sub	a5,a6,a5
a0007ef2:	078e                	slli	a5,a5,0x3
  u8g2->height = display_info->pixel_height;
a0007ef4:	01665603          	lhu	a2,22(a2)
  t *= 8;
a0007ef8:	3c07b78b          	extu	a5,a5,15,0
a0007efc:	00d826b3          	slt	a3,a6,a3
a0007f00:	42d7970b          	mvnez	a4,a5,a3
  u8g2->buf_y1 += t;
a0007f04:	972e                	add	a4,a4,a1
  u8g2->buf_y0 = u8g2->pixel_curr_row;   
a0007f06:	04b51023          	sh	a1,64(a0)
  u8g2->buf_y1 += t;
a0007f0a:	04e51123          	sh	a4,66(a0)
  u8g2->width = display_info->pixel_width;
a0007f0e:	05151223          	sh	a7,68(a0)
  u8g2->height = display_info->pixel_height;
a0007f12:	04c51323          	sh	a2,70(a0)
}
a0007f16:	8082                	ret

a0007f18 <u8g2_update_page_win_r0>:
  u8g2->user_x1 = u8g2->width;			/* pixel_buf_width replaced with width */
a0007f18:	04455803          	lhu	a6,68(a0)
  u8g2->user_y0 = u8g2->buf_y0;
a0007f1c:	413c                	lw	a5,64(a0)
{
a0007f1e:	1141                	addi	sp,sp,-16
  if ( u8g2_IsIntersection(u8g2, u8g2->clip_x0, u8g2->clip_y0, u8g2->clip_x1, u8g2->clip_y1) == 0 ) 
a0007f20:	05655703          	lhu	a4,86(a0)
a0007f24:	05255683          	lhu	a3,82(a0)
a0007f28:	05455603          	lhu	a2,84(a0)
a0007f2c:	05055583          	lhu	a1,80(a0)
{
a0007f30:	c422                	sw	s0,8(sp)
a0007f32:	c606                	sw	ra,12(sp)
  u8g2->user_x0 = 0;
a0007f34:	04051423          	sh	zero,72(a0)
  u8g2->user_x1 = u8g2->width;			/* pixel_buf_width replaced with width */
a0007f38:	05051523          	sh	a6,74(a0)
  u8g2->user_y0 = u8g2->buf_y0;
a0007f3c:	c57c                	sw	a5,76(a0)
{
a0007f3e:	842a                	mv	s0,a0
  if ( u8g2_IsIntersection(u8g2, u8g2->clip_x0, u8g2->clip_y0, u8g2->clip_x1, u8g2->clip_y1) == 0 ) 
a0007f40:	3561                	jal	a0007dc8 <u8g2_IsIntersection>
a0007f42:	e519                	bnez	a0,a0007f50 <u8g2_update_page_win_r0+0x38>
    u8g2->is_page_clip_window_intersection = 0;
a0007f44:	08040623          	sb	zero,140(s0)
}
a0007f48:	40b2                	lw	ra,12(sp)
a0007f4a:	4422                	lw	s0,8(sp)
a0007f4c:	0141                	addi	sp,sp,16
a0007f4e:	8082                	ret
    if ( u8g2->user_x0 < u8g2->clip_x0 )
a0007f50:	05045783          	lhu	a5,80(s0)
a0007f54:	04845703          	lhu	a4,72(s0)
    u8g2->is_page_clip_window_intersection = 1;
a0007f58:	4685                	li	a3,1
a0007f5a:	08d40623          	sb	a3,140(s0)
    if ( u8g2->user_x0 < u8g2->clip_x0 )
a0007f5e:	00f77463          	bgeu	a4,a5,a0007f66 <u8g2_update_page_win_r0+0x4e>
      u8g2->user_x0 = u8g2->clip_x0;
a0007f62:	04f41423          	sh	a5,72(s0)
    if ( u8g2->user_x1 > u8g2->clip_x1 )
a0007f66:	05245783          	lhu	a5,82(s0)
a0007f6a:	04a45703          	lhu	a4,74(s0)
a0007f6e:	00e7f463          	bgeu	a5,a4,a0007f76 <u8g2_update_page_win_r0+0x5e>
      u8g2->user_x1 = u8g2->clip_x1;
a0007f72:	04f41523          	sh	a5,74(s0)
    if ( u8g2->user_y0 < u8g2->clip_y0 )
a0007f76:	05445783          	lhu	a5,84(s0)
a0007f7a:	04c45703          	lhu	a4,76(s0)
a0007f7e:	00f77463          	bgeu	a4,a5,a0007f86 <u8g2_update_page_win_r0+0x6e>
      u8g2->user_y0 = u8g2->clip_y0;
a0007f82:	04f41623          	sh	a5,76(s0)
    if ( u8g2->user_y1 > u8g2->clip_y1 )
a0007f86:	05645783          	lhu	a5,86(s0)
a0007f8a:	04e45703          	lhu	a4,78(s0)
a0007f8e:	fae7fde3          	bgeu	a5,a4,a0007f48 <u8g2_update_page_win_r0+0x30>
}
a0007f92:	40b2                	lw	ra,12(sp)
      u8g2->user_y1 = u8g2->clip_y1;
a0007f94:	04f41723          	sh	a5,78(s0)
}
a0007f98:	4422                	lw	s0,8(sp)
a0007f9a:	0141                	addi	sp,sp,16
a0007f9c:	8082                	ret

a0007f9e <u8g2_SetupBuffer>:
{
a0007f9e:	1141                	addi	sp,sp,-16
a0007fa0:	c606                	sw	ra,12(sp)
a0007fa2:	c422                	sw	s0,8(sp)
  u8g2->draw_color = 1;
a0007fa4:	10100793          	li	a5,257
  u8g2->tile_buf_height = tile_buf_height;
a0007fa8:	02c50c23          	sb	a2,56(a0)
  u8g2->tile_curr_row = 0;
a0007fac:	02050ca3          	sb	zero,57(a0)
  u8g2->font_decode.is_transparent = 0; /* issue 443 */
a0007fb0:	060506a3          	sb	zero,109(a0)
  u8g2->font_height_mode = 0; /* issue 2046 */
a0007fb4:	080506a3          	sb	zero,141(a0)
  u8g2->bitmap_transparency = 0;
a0007fb8:	080508a3          	sb	zero,145(a0)
  u8g2->draw_color = 1;
a0007fbc:	08f51923          	sh	a5,146(a0)
  u8g2->cb->update_dimension(u8g2);
a0007fc0:	431c                	lw	a5,0(a4)
  u8g2->ll_hvline = ll_hvline_cb;
a0007fc2:	d554                	sw	a3,44(a0)
  u8g2->tile_buf_ptr = buf;
a0007fc4:	d94c                	sw	a1,52(a0)
  u8g2->cb = u8g2_cb;
a0007fc6:	d918                	sw	a4,48(a0)
  u8g2->font = NULL;
a0007fc8:	04052c23          	sw	zero,88(a0)
{
a0007fcc:	842a                	mv	s0,a0
  u8g2->cb->update_dimension(u8g2);
a0007fce:	9782                	jalr	a5
  u8g2->cb->update_page_win(u8g2);
a0007fd0:	5818                	lw	a4,48(s0)
  u8g2->clip_x0 = 0;
a0007fd2:	77c1                	lui	a5,0xffff0
a0007fd4:	c83c                	sw	a5,80(s0)
  u8g2->cb->update_page_win(u8g2);
a0007fd6:	4358                	lw	a4,4(a4)
a0007fd8:	8522                	mv	a0,s0
  u8g2->clip_y0 = 0;
a0007fda:	c87c                	sw	a5,84(s0)
  u8g2->cb->update_page_win(u8g2);
a0007fdc:	9702                	jalr	a4
  u8g2_SetFontPosBaseline(u8g2);  /* issue 195 */
a0007fde:	8522                	mv	a0,s0
a0007fe0:	bafff0ef          	jal	ra,a0007b8e <u8g2_SetFontPosBaseline>
  u8g2->font_decode.dir = 0;
a0007fe4:	06040823          	sb	zero,112(s0)
}
a0007fe8:	40b2                	lw	ra,12(sp)
a0007fea:	4422                	lw	s0,8(sp)
a0007fec:	0141                	addi	sp,sp,16
a0007fee:	8082                	ret

a0007ff0 <u8x8_utf8_next>:
    0x0ffff: end of string
    anything else: The decoded encoding
*/
uint16_t u8x8_utf8_next(u8x8_t *u8x8, uint8_t b)
{
  if ( b == 0 || b == '\n' )	/* '\n' terminates the string to support the string list procedures */
a0007ff0:	c9ad                	beqz	a1,a0008062 <u8x8_utf8_next+0x72>
a0007ff2:	47a9                	li	a5,10
a0007ff4:	06f58763          	beq	a1,a5,a0008062 <u8x8_utf8_next+0x72>
    return 0x0ffff;	/* end of string detected, pending UTF8 is discarded */
  if ( u8x8->utf8_state == 0 )
a0007ff8:	02654783          	lbu	a5,38(a0)
a0007ffc:	ef85                	bnez	a5,a0008034 <u8x8_utf8_next+0x44>
  {
    if ( b >= 0xfc )	/* 6 byte sequence */
a0007ffe:	0fb00793          	li	a5,251
a0008002:	06b7e463          	bltu	a5,a1,a000806a <u8x8_utf8_next+0x7a>
    {
      u8x8->utf8_state = 5;
      b &= 1;
    }
    else if ( b >= 0xf8 )
a0008006:	0f700793          	li	a5,247
a000800a:	06b7ea63          	bltu	a5,a1,a000807e <u8x8_utf8_next+0x8e>
    {
      u8x8->utf8_state = 4;
      b &= 3;
    }
    else if ( b >= 0xf0 )
a000800e:	0ef00793          	li	a5,239
a0008012:	06b7eb63          	bltu	a5,a1,a0008088 <u8x8_utf8_next+0x98>
    {
      u8x8->utf8_state = 3;
      b &= 7;      
    }
    else if ( b >= 0xe0 )
a0008016:	0df00793          	li	a5,223
a000801a:	06b7ec63          	bltu	a5,a1,a0008092 <u8x8_utf8_next+0xa2>
    {
      u8x8->utf8_state = 2;
      b &= 15;
    }
    else if ( b >= 0xc0 )
a000801e:	0bf00713          	li	a4,191
      b &= 0x01f;
    }
    else
    {
      /* do nothing, just use the value as encoding */
      return b;
a0008022:	3c05b78b          	extu	a5,a1,15,0
    else if ( b >= 0xc0 )
a0008026:	02b77c63          	bgeu	a4,a1,a000805e <u8x8_utf8_next+0x6e>
      u8x8->utf8_state = 1;
a000802a:	4785                	li	a5,1
a000802c:	02f50323          	sb	a5,38(a0)
      b &= 0x01f;
a0008030:	89fd                	andi	a1,a1,31
a0008032:	a081                	j	a0008072 <u8x8_utf8_next+0x82>
  }
  else
  {
    u8x8->utf8_state--;
    /* The case b < 0x080 (an illegal UTF8 encoding) is not checked here. */
    u8x8->encoding<<=6;
a0008034:	02055703          	lhu	a4,32(a0)
    u8x8->utf8_state--;
a0008038:	fff78693          	addi	a3,a5,-1 # fffeffff <__psram_limit+0x57beffff>
    b &= 0x03f;
a000803c:	03f5f593          	andi	a1,a1,63
    u8x8->encoding<<=6;
a0008040:	00671793          	slli	a5,a4,0x6
    u8x8->encoding |= b;
a0008044:	8fcd                	or	a5,a5,a1
    u8x8->utf8_state--;
a0008046:	0ff6f713          	andi	a4,a3,255
    if ( u8x8->utf8_state != 0 )
      return 0x0fffe;	/* nothing to do yet */
a000804a:	66c1                	lui	a3,0x10
    u8x8->encoding |= b;
a000804c:	3c07b78b          	extu	a5,a5,15,0
      return 0x0fffe;	/* nothing to do yet */
a0008050:	16f9                	addi	a3,a3,-2
    u8x8->encoding |= b;
a0008052:	02f51023          	sh	a5,32(a0)
    u8x8->utf8_state--;
a0008056:	02e50323          	sb	a4,38(a0)
      return 0x0fffe;	/* nothing to do yet */
a000805a:	42e6978b          	mvnez	a5,a3,a4
  }
  return u8x8->encoding;
}
a000805e:	853e                	mv	a0,a5
a0008060:	8082                	ret
    return 0x0ffff;	/* end of string detected, pending UTF8 is discarded */
a0008062:	67c1                	lui	a5,0x10
a0008064:	17fd                	addi	a5,a5,-1
}
a0008066:	853e                	mv	a0,a5
a0008068:	8082                	ret
      u8x8->utf8_state = 5;
a000806a:	4795                	li	a5,5
a000806c:	02f50323          	sb	a5,38(a0)
      b &= 1;
a0008070:	8985                	andi	a1,a1,1
    return 0x0fffe;
a0008072:	67c1                	lui	a5,0x10
a0008074:	17f9                	addi	a5,a5,-2
    u8x8->encoding = b;
a0008076:	02b51023          	sh	a1,32(a0)
}
a000807a:	853e                	mv	a0,a5
a000807c:	8082                	ret
      u8x8->utf8_state = 4;
a000807e:	4791                	li	a5,4
a0008080:	02f50323          	sb	a5,38(a0)
      b &= 3;
a0008084:	898d                	andi	a1,a1,3
a0008086:	b7f5                	j	a0008072 <u8x8_utf8_next+0x82>
      u8x8->utf8_state = 3;
a0008088:	478d                	li	a5,3
a000808a:	02f50323          	sb	a5,38(a0)
      b &= 7;      
a000808e:	899d                	andi	a1,a1,7
a0008090:	b7cd                	j	a0008072 <u8x8_utf8_next+0x82>
      u8x8->utf8_state = 2;
a0008092:	4789                	li	a5,2
a0008094:	02f50323          	sb	a5,38(a0)
      b &= 15;
a0008098:	89bd                	andi	a1,a1,15
a000809a:	bfe1                	j	a0008072 <u8x8_utf8_next+0x82>

a000809c <u8x8_utf8_init>:
  u8x8->utf8_state = 0;	/* also reset during u8x8_SetupDefaults() */
a000809c:	02050323          	sb	zero,38(a0)
}
a00080a0:	8082                	ret

a00080a2 <u8x8_byte_SendBytes>:
  return u8x8->byte_cb(u8x8, U8X8_MSG_BYTE_SET_DC, dc, NULL);
}

uint8_t u8x8_byte_SendBytes(u8x8_t *u8x8, uint8_t cnt, uint8_t *data)
{
  return u8x8->byte_cb(u8x8, U8X8_MSG_BYTE_SEND, cnt, (void *)data);
a00080a2:	491c                	lw	a5,16(a0)
{
a00080a4:	86b2                	mv	a3,a2
  return u8x8->byte_cb(u8x8, U8X8_MSG_BYTE_SEND, cnt, (void *)data);
a00080a6:	862e                	mv	a2,a1
a00080a8:	45dd                	li	a1,23
a00080aa:	8782                	jr	a5

a00080ac <u8x8_byte_SendByte>:
}

uint8_t u8x8_byte_SendByte(u8x8_t *u8x8, uint8_t byte)
{
a00080ac:	1101                	addi	sp,sp,-32
a00080ae:	87ae                	mv	a5,a1
  return u8x8_byte_SendBytes(u8x8, 1, &byte);
a00080b0:	00f10613          	addi	a2,sp,15
a00080b4:	4585                	li	a1,1
{
a00080b6:	ce06                	sw	ra,28(sp)
a00080b8:	00f107a3          	sb	a5,15(sp)
  return u8x8_byte_SendBytes(u8x8, 1, &byte);
a00080bc:	37dd                	jal	a00080a2 <u8x8_byte_SendBytes>
}
a00080be:	40f2                	lw	ra,28(sp)
a00080c0:	6105                	addi	sp,sp,32
a00080c2:	8082                	ret

a00080c4 <u8x8_byte_StartTransfer>:

uint8_t u8x8_byte_StartTransfer(u8x8_t *u8x8)
{
  return u8x8->byte_cb(u8x8, U8X8_MSG_BYTE_START_TRANSFER, 0, NULL);
a00080c4:	491c                	lw	a5,16(a0)
a00080c6:	4681                	li	a3,0
a00080c8:	4601                	li	a2,0
a00080ca:	45e1                	li	a1,24
a00080cc:	8782                	jr	a5

a00080ce <u8x8_byte_EndTransfer>:
}

uint8_t u8x8_byte_EndTransfer(u8x8_t *u8x8)
{
  return u8x8->byte_cb(u8x8, U8X8_MSG_BYTE_END_TRANSFER, 0, NULL);
a00080ce:	491c                	lw	a5,16(a0)
a00080d0:	4681                	li	a3,0
a00080d2:	4601                	li	a2,0
a00080d4:	45e5                	li	a1,25
a00080d6:	8782                	jr	a5

a00080d8 <u8x8_i2c_data_transfer>:
/* U8X8_MSG_BYTE_START_TRANSFER starts i2c transfer, U8X8_MSG_BYTE_END_TRANSFER stops transfer */
/* After transfer start, a full byte indicates command or data mode */

static void u8x8_i2c_data_transfer(u8x8_t *u8x8, uint8_t arg_int, void *arg_ptr) U8X8_NOINLINE;
static void u8x8_i2c_data_transfer(u8x8_t *u8x8, uint8_t arg_int, void *arg_ptr)
{
a00080d8:	1141                	addi	sp,sp,-16
a00080da:	c606                	sw	ra,12(sp)
a00080dc:	c422                	sw	s0,8(sp)
a00080de:	c226                	sw	s1,4(sp)
a00080e0:	c04a                	sw	s2,0(sp)
a00080e2:	842a                	mv	s0,a0
a00080e4:	8932                	mv	s2,a2
a00080e6:	84ae                	mv	s1,a1
    u8x8_byte_StartTransfer(u8x8);    
a00080e8:	3ff1                	jal	a00080c4 <u8x8_byte_StartTransfer>
    u8x8_byte_SendByte(u8x8, 0x040);
a00080ea:	04000593          	li	a1,64
a00080ee:	8522                	mv	a0,s0
a00080f0:	3f75                	jal	a00080ac <u8x8_byte_SendByte>
    u8x8->byte_cb(u8x8, U8X8_MSG_CAD_SEND_DATA, arg_int, arg_ptr);
a00080f2:	481c                	lw	a5,16(s0)
a00080f4:	86ca                	mv	a3,s2
a00080f6:	8626                	mv	a2,s1
a00080f8:	8522                	mv	a0,s0
a00080fa:	45dd                	li	a1,23
a00080fc:	9782                	jalr	a5
    u8x8_byte_EndTransfer(u8x8);
a00080fe:	8522                	mv	a0,s0
}
a0008100:	4422                	lw	s0,8(sp)
a0008102:	40b2                	lw	ra,12(sp)
a0008104:	4492                	lw	s1,4(sp)
a0008106:	4902                	lw	s2,0(sp)
a0008108:	0141                	addi	sp,sp,16
    u8x8_byte_EndTransfer(u8x8);
a000810a:	b7d1                	j	a00080ce <u8x8_byte_EndTransfer>

a000810c <u8x8_cad_SendCmd>:
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_SEND_CMD, cmd, NULL);
a000810c:	455c                	lw	a5,12(a0)
{
a000810e:	862e                	mv	a2,a1
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_SEND_CMD, cmd, NULL);
a0008110:	4681                	li	a3,0
a0008112:	45d5                	li	a1,21
a0008114:	8782                	jr	a5

a0008116 <u8x8_cad_SendArg>:
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_SEND_ARG, arg, NULL);
a0008116:	455c                	lw	a5,12(a0)
{
a0008118:	862e                	mv	a2,a1
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_SEND_ARG, arg, NULL);
a000811a:	4681                	li	a3,0
a000811c:	45d9                	li	a1,22
a000811e:	8782                	jr	a5

a0008120 <u8x8_cad_SendData>:
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_SEND_DATA, cnt, data);
a0008120:	455c                	lw	a5,12(a0)
{
a0008122:	86b2                	mv	a3,a2
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_SEND_DATA, cnt, data);
a0008124:	862e                	mv	a2,a1
a0008126:	45dd                	li	a1,23
a0008128:	8782                	jr	a5

a000812a <u8x8_cad_StartTransfer>:
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_START_TRANSFER, 0, NULL);
a000812a:	455c                	lw	a5,12(a0)
a000812c:	4681                	li	a3,0
a000812e:	4601                	li	a2,0
a0008130:	45e1                	li	a1,24
a0008132:	8782                	jr	a5

a0008134 <u8x8_cad_EndTransfer>:
  return u8x8->cad_cb(u8x8, U8X8_MSG_CAD_END_TRANSFER, 0, NULL);
a0008134:	455c                	lw	a5,12(a0)
a0008136:	4681                	li	a3,0
a0008138:	4601                	li	a2,0
a000813a:	45e5                	li	a1,25
a000813c:	8782                	jr	a5

a000813e <u8x8_cad_SendSequence>:
{
a000813e:	7179                	addi	sp,sp,-48
a0008140:	d422                	sw	s0,40(sp)
a0008142:	d226                	sw	s1,36(sp)
a0008144:	d04a                	sw	s2,32(sp)
a0008146:	ce4e                	sw	s3,28(sp)
a0008148:	cc52                	sw	s4,24(sp)
a000814a:	ca56                	sw	s5,20(sp)
a000814c:	d606                	sw	ra,44(sp)
a000814e:	84aa                	mv	s1,a0
a0008150:	842e                	mv	s0,a1
    switch( cmd )
a0008152:	4ae5                	li	s5,25
a0008154:	0fe00a13          	li	s4,254
a0008158:	495d                	li	s2,23
a000815a:	49d1                	li	s3,20
    cmd = *data;
a000815c:	00044783          	lbu	a5,0(s0)
    switch( cmd )
a0008160:	02fae463          	bltu	s5,a5,a0008188 <u8x8_cad_SendSequence+0x4a>
a0008164:	06f96363          	bltu	s2,a5,a00081ca <u8x8_cad_SendSequence+0x8c>
	  u8x8_cad_SendData(u8x8, 1, &v);
a0008168:	00f10613          	addi	a2,sp,15
a000816c:	4585                	li	a1,1
a000816e:	8526                	mv	a0,s1
    switch( cmd )
a0008170:	03279863          	bne	a5,s2,a00081a0 <u8x8_cad_SendSequence+0x62>
	  v = *data;
a0008174:	00144783          	lbu	a5,1(s0)
	  data++;
a0008178:	0409                	addi	s0,s0,2
	  v = *data;
a000817a:	00f107a3          	sb	a5,15(sp)
	  u8x8_cad_SendData(u8x8, 1, &v);
a000817e:	374d                	jal	a0008120 <u8x8_cad_SendData>
    cmd = *data;
a0008180:	00044783          	lbu	a5,0(s0)
    switch( cmd )
a0008184:	fefaf0e3          	bgeu	s5,a5,a0008164 <u8x8_cad_SendSequence+0x26>
	  u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, v);	    
a0008188:	02900593          	li	a1,41
a000818c:	8526                	mv	a0,s1
    switch( cmd )
a000818e:	01479b63          	bne	a5,s4,a00081a4 <u8x8_cad_SendSequence+0x66>
	  v = *data;
a0008192:	00144603          	lbu	a2,1(s0)
	  data++;
a0008196:	0409                	addi	s0,s0,2
	  v = *data;
a0008198:	00c107a3          	sb	a2,15(sp)
	  u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, v);	    
a000819c:	2929                	jal	a00085b6 <u8x8_gpio_call>
	  break;
a000819e:	bf7d                	j	a000815c <u8x8_cad_SendSequence+0x1e>
    switch( cmd )
a00081a0:	00f9eb63          	bltu	s3,a5,a00081b6 <u8x8_cad_SendSequence+0x78>
}
a00081a4:	50b2                	lw	ra,44(sp)
a00081a6:	5422                	lw	s0,40(sp)
a00081a8:	5492                	lw	s1,36(sp)
a00081aa:	5902                	lw	s2,32(sp)
a00081ac:	49f2                	lw	s3,28(sp)
a00081ae:	4a62                	lw	s4,24(sp)
a00081b0:	4ad2                	lw	s5,20(sp)
a00081b2:	6145                	addi	sp,sp,48
a00081b4:	8082                	ret
	  v = *data;
a00081b6:	00144603          	lbu	a2,1(s0)
	  u8x8->cad_cb(u8x8, cmd, v, NULL);
a00081ba:	44d8                	lw	a4,12(s1)
a00081bc:	4681                	li	a3,0
	  v = *data;
a00081be:	00c107a3          	sb	a2,15(sp)
	  u8x8->cad_cb(u8x8, cmd, v, NULL);
a00081c2:	85be                	mv	a1,a5
a00081c4:	9702                	jalr	a4
	  data++;
a00081c6:	0409                	addi	s0,s0,2
	  break;
a00081c8:	bf51                	j	a000815c <u8x8_cad_SendSequence+0x1e>
	  u8x8->cad_cb(u8x8, cmd, 0, NULL);
a00081ca:	44d8                	lw	a4,12(s1)
a00081cc:	4681                	li	a3,0
a00081ce:	4601                	li	a2,0
a00081d0:	85be                	mv	a1,a5
a00081d2:	8526                	mv	a0,s1
    data++;
a00081d4:	0405                	addi	s0,s0,1
	  u8x8->cad_cb(u8x8, cmd, 0, NULL);
a00081d6:	9702                	jalr	a4
	  break;
a00081d8:	b751                	j	a000815c <u8x8_cad_SendSequence+0x1e>
	...

a00081dc <u8x8_cad_ssd13xx_fast_i2c>:
}


/* fast version with reduced data start/stops, issue 735 */
uint8_t u8x8_cad_ssd13xx_fast_i2c(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{
a00081dc:	1101                	addi	sp,sp,-32
a00081de:	cc22                	sw	s0,24(sp)
a00081e0:	ca26                	sw	s1,20(sp)
a00081e2:	c84a                	sw	s2,16(sp)
a00081e4:	ce06                	sw	ra,28(sp)
a00081e6:	c64e                	sw	s3,12(sp)
  static uint8_t in_transfer = 0;
  uint8_t *p;
  switch(msg)
a00081e8:	47dd                	li	a5,23
{
a00081ea:	892a                	mv	s2,a0
a00081ec:	8432                	mv	s0,a2
a00081ee:	84b6                	mv	s1,a3
  switch(msg)
a00081f0:	0af58163          	beq	a1,a5,a0008292 <u8x8_cad_ssd13xx_fast_i2c+0xb6>
a00081f4:	04b7e863          	bltu	a5,a1,a0008244 <u8x8_cad_ssd13xx_fast_i2c+0x68>
a00081f8:	47d5                	li	a5,21
a00081fa:	0cf58e63          	beq	a1,a5,a00082d6 <u8x8_cad_ssd13xx_fast_i2c+0xfa>
a00081fe:	47d9                	li	a5,22
a0008200:	00f59c63          	bne	a1,a5,a0008218 <u8x8_cad_ssd13xx_fast_i2c+0x3c>
	//   in_transfer = 1;
	// }
	//u8x8_byte_SendByte(u8x8, arg_int);
      break;
    case U8X8_MSG_CAD_SEND_ARG:
      u8x8_byte_SendByte(u8x8, arg_int);
a0008204:	85b2                	mv	a1,a2
a0008206:	355d                	jal	a00080ac <u8x8_byte_SendByte>
      break;
    default:
      return 0;
  }
  return 1;
}
a0008208:	40f2                	lw	ra,28(sp)
a000820a:	4462                	lw	s0,24(sp)
a000820c:	44d2                	lw	s1,20(sp)
a000820e:	4942                	lw	s2,16(sp)
a0008210:	49b2                	lw	s3,12(sp)
  return 1;
a0008212:	4505                	li	a0,1
}
a0008214:	6105                	addi	sp,sp,32
a0008216:	8082                	ret
  switch(msg)
a0008218:	47d1                	li	a5,20
a000821a:	04f59a63          	bne	a1,a5,a000826e <u8x8_cad_ssd13xx_fast_i2c+0x92>
      if ( u8x8->i2c_address == 255 )
a000821e:	02454703          	lbu	a4,36(a0)
a0008222:	0ff00793          	li	a5,255
a0008226:	0ef70063          	beq	a4,a5,a0008306 <u8x8_cad_ssd13xx_fast_i2c+0x12a>
      return u8x8->byte_cb(u8x8, msg, arg_int, arg_ptr);
a000822a:	8622                	mv	a2,s0
}
a000822c:	4462                	lw	s0,24(sp)
      return u8x8->byte_cb(u8x8, msg, arg_int, arg_ptr);
a000822e:	01092783          	lw	a5,16(s2)
}
a0008232:	40f2                	lw	ra,28(sp)
a0008234:	49b2                	lw	s3,12(sp)
      return u8x8->byte_cb(u8x8, msg, arg_int, arg_ptr);
a0008236:	86a6                	mv	a3,s1
a0008238:	854a                	mv	a0,s2
}
a000823a:	44d2                	lw	s1,20(sp)
a000823c:	4942                	lw	s2,16(sp)
      return u8x8->byte_cb(u8x8, msg, arg_int, arg_ptr);
a000823e:	45d1                	li	a1,20
}
a0008240:	6105                	addi	sp,sp,32
      return u8x8->byte_cb(u8x8, msg, arg_int, arg_ptr);
a0008242:	8782                	jr	a5
  switch(msg)
a0008244:	47e1                	li	a5,24
a0008246:	02f58c63          	beq	a1,a5,a000827e <u8x8_cad_ssd13xx_fast_i2c+0xa2>
a000824a:	47e5                	li	a5,25
a000824c:	02f59163          	bne	a1,a5,a000826e <u8x8_cad_ssd13xx_fast_i2c+0x92>
      if ( in_transfer != 0 )
a0008250:	6b418993          	addi	s3,gp,1716 # 62fc9eb4 <in_transfer.5>
a0008254:	0009c783          	lbu	a5,0(s3)
a0008258:	efc5                	bnez	a5,a0008310 <u8x8_cad_ssd13xx_fast_i2c+0x134>
}
a000825a:	40f2                	lw	ra,28(sp)
a000825c:	4462                	lw	s0,24(sp)
      in_transfer = 0;
a000825e:	00098023          	sb	zero,0(s3)
}
a0008262:	44d2                	lw	s1,20(sp)
a0008264:	4942                	lw	s2,16(sp)
a0008266:	49b2                	lw	s3,12(sp)
  return 1;
a0008268:	4505                	li	a0,1
}
a000826a:	6105                	addi	sp,sp,32
a000826c:	8082                	ret
a000826e:	40f2                	lw	ra,28(sp)
a0008270:	4462                	lw	s0,24(sp)
a0008272:	44d2                	lw	s1,20(sp)
a0008274:	4942                	lw	s2,16(sp)
a0008276:	49b2                	lw	s3,12(sp)
  switch(msg)
a0008278:	4501                	li	a0,0
}
a000827a:	6105                	addi	sp,sp,32
a000827c:	8082                	ret
a000827e:	40f2                	lw	ra,28(sp)
a0008280:	4462                	lw	s0,24(sp)
      in_transfer = 0;
a0008282:	6a018a23          	sb	zero,1716(gp) # 62fc9eb4 <in_transfer.5>
}
a0008286:	44d2                	lw	s1,20(sp)
a0008288:	4942                	lw	s2,16(sp)
a000828a:	49b2                	lw	s3,12(sp)
  return 1;
a000828c:	4505                	li	a0,1
}
a000828e:	6105                	addi	sp,sp,32
a0008290:	8082                	ret
      if ( in_transfer != 0 )
a0008292:	6b418993          	addi	s3,gp,1716 # 62fc9eb4 <in_transfer.5>
a0008296:	0009c783          	lbu	a5,0(s3)
a000829a:	efbd                	bnez	a5,a0008318 <u8x8_cad_ssd13xx_fast_i2c+0x13c>
       while( arg_int > 24 )
a000829c:	47e1                	li	a5,24
a000829e:	0087fe63          	bgeu	a5,s0,a00082ba <u8x8_cad_ssd13xx_fast_i2c+0xde>
a00082a2:	0001                	nop
	u8x8_i2c_data_transfer(u8x8, 24, p);
a00082a4:	8626                	mv	a2,s1
a00082a6:	45e1                	li	a1,24
a00082a8:	854a                	mv	a0,s2
a00082aa:	353d                	jal	a00080d8 <u8x8_i2c_data_transfer>
	arg_int-=24;
a00082ac:	1421                	addi	s0,s0,-24
a00082ae:	0ff47413          	andi	s0,s0,255
       while( arg_int > 24 )
a00082b2:	47e1                	li	a5,24
	p+=24;
a00082b4:	04e1                	addi	s1,s1,24
       while( arg_int > 24 )
a00082b6:	fe87e7e3          	bltu	a5,s0,a00082a4 <u8x8_cad_ssd13xx_fast_i2c+0xc8>
      u8x8_i2c_data_transfer(u8x8, arg_int, p);
a00082ba:	854a                	mv	a0,s2
a00082bc:	8626                	mv	a2,s1
a00082be:	85a2                	mv	a1,s0
a00082c0:	3d21                	jal	a00080d8 <u8x8_i2c_data_transfer>
}
a00082c2:	40f2                	lw	ra,28(sp)
a00082c4:	4462                	lw	s0,24(sp)
      in_transfer = 0;
a00082c6:	00098023          	sb	zero,0(s3)
}
a00082ca:	44d2                	lw	s1,20(sp)
a00082cc:	4942                	lw	s2,16(sp)
a00082ce:	49b2                	lw	s3,12(sp)
  return 1;
a00082d0:	4505                	li	a0,1
}
a00082d2:	6105                	addi	sp,sp,32
a00082d4:	8082                	ret
      if ( in_transfer != 0 )
a00082d6:	6b418993          	addi	s3,gp,1716 # 62fc9eb4 <in_transfer.5>
a00082da:	0009c783          	lbu	a5,0(s3)
a00082de:	eb9d                	bnez	a5,a0008314 <u8x8_cad_ssd13xx_fast_i2c+0x138>
      u8x8_byte_StartTransfer(u8x8);
a00082e0:	854a                	mv	a0,s2
a00082e2:	33cd                	jal	a00080c4 <u8x8_byte_StartTransfer>
      u8x8_byte_SendByte(u8x8, 0x000);	/* cmd byte for ssd13xx controller */
a00082e4:	4581                	li	a1,0
a00082e6:	854a                	mv	a0,s2
a00082e8:	33d1                	jal	a00080ac <u8x8_byte_SendByte>
      u8x8_byte_SendByte(u8x8, arg_int);
a00082ea:	85a2                	mv	a1,s0
a00082ec:	854a                	mv	a0,s2
a00082ee:	3b7d                	jal	a00080ac <u8x8_byte_SendByte>
}
a00082f0:	40f2                	lw	ra,28(sp)
a00082f2:	4462                	lw	s0,24(sp)
      in_transfer = 1;
a00082f4:	4785                	li	a5,1
a00082f6:	00f98023          	sb	a5,0(s3)
}
a00082fa:	44d2                	lw	s1,20(sp)
a00082fc:	4942                	lw	s2,16(sp)
a00082fe:	49b2                	lw	s3,12(sp)
  return 1;
a0008300:	4505                	li	a0,1
}
a0008302:	6105                	addi	sp,sp,32
a0008304:	8082                	ret
	u8x8->i2c_address = 0x078;
a0008306:	07800793          	li	a5,120
a000830a:	02f50223          	sb	a5,36(a0)
a000830e:	bf31                	j	a000822a <u8x8_cad_ssd13xx_fast_i2c+0x4e>
	u8x8_byte_EndTransfer(u8x8); 
a0008310:	3b7d                	jal	a00080ce <u8x8_byte_EndTransfer>
a0008312:	b7a1                	j	a000825a <u8x8_cad_ssd13xx_fast_i2c+0x7e>
	 u8x8_byte_EndTransfer(u8x8); 
a0008314:	3b6d                	jal	a00080ce <u8x8_byte_EndTransfer>
a0008316:	b7e9                	j	a00082e0 <u8x8_cad_ssd13xx_fast_i2c+0x104>
	u8x8_byte_EndTransfer(u8x8); 
a0008318:	3b5d                	jal	a00080ce <u8x8_byte_EndTransfer>
a000831a:	b749                	j	a000829c <u8x8_cad_ssd13xx_fast_i2c+0xc0>
a000831c:	0000                	unimp
	...

a0008320 <u8x8_d_ssd1306_sh1106_generic>:
  U8X8_END_TRANSFER(),             	/* disable chip */
  U8X8_END()             			/* end of sequence */
};

static uint8_t u8x8_d_ssd1306_sh1106_generic(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{
a0008320:	1101                	addi	sp,sp,-32
a0008322:	cc22                	sw	s0,24(sp)
a0008324:	c84a                	sw	s2,16(sp)
a0008326:	ce06                	sw	ra,28(sp)
a0008328:	ca26                	sw	s1,20(sp)
a000832a:	c64e                	sw	s3,12(sp)
  uint8_t x, c;
  uint8_t *ptr;
  switch(msg)
a000832c:	47b9                	li	a5,14
{
a000832e:	892a                	mv	s2,a0
a0008330:	8432                	mv	s0,a2
  switch(msg)
a0008332:	0cf58e63          	beq	a1,a5,a000840e <u8x8_d_ssd1306_sh1106_generic+0xee>
a0008336:	02b7ed63          	bltu	a5,a1,a0008370 <u8x8_d_ssd1306_sh1106_generic+0x50>
a000833a:	47ad                	li	a5,11
a000833c:	0af58a63          	beq	a1,a5,a00083f0 <u8x8_d_ssd1306_sh1106_generic+0xd0>
a0008340:	47b5                	li	a5,13
a0008342:	08f59f63          	bne	a1,a5,a00083e0 <u8x8_d_ssd1306_sh1106_generic+0xc0>
	u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_powersave0_seq);
      else
	u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_powersave1_seq);
      break;
    case U8X8_MSG_DISPLAY_SET_FLIP_MODE:
      if ( arg_int == 0 )
a0008346:	10061863          	bnez	a2,a0008456 <u8x8_d_ssd1306_sh1106_generic+0x136>
      {
	u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_flip0_seq);
a000834a:	a000c5b7          	lui	a1,0xa000c
a000834e:	48858593          	addi	a1,a1,1160 # a000c488 <__psram_limit+0xf7c0c488>
a0008352:	33f5                	jal	a000813e <u8x8_cad_SendSequence>
	u8x8->x_offset = u8x8->display_info->default_x_offset;
a0008354:	00092783          	lw	a5,0(s2)
      u8x8_cad_EndTransfer(u8x8);
      break;
    default:
      return 0;
  }
  return 1;
a0008358:	4505                	li	a0,1
	u8x8->x_offset = u8x8->display_info->default_x_offset;
a000835a:	0127c783          	lbu	a5,18(a5) # 10012 <nocache_min_size+0xb012>
a000835e:	02f90123          	sb	a5,34(s2)
}
a0008362:	40f2                	lw	ra,28(sp)
a0008364:	4462                	lw	s0,24(sp)
a0008366:	44d2                	lw	s1,20(sp)
a0008368:	4942                	lw	s2,16(sp)
a000836a:	49b2                	lw	s3,12(sp)
a000836c:	6105                	addi	sp,sp,32
a000836e:	8082                	ret
  switch(msg)
a0008370:	47bd                	li	a5,15
a0008372:	06f59763          	bne	a1,a5,a00083e0 <u8x8_d_ssd1306_sh1106_generic+0xc0>
      u8x8_cad_StartTransfer(u8x8);
a0008376:	84b6                	mv	s1,a3
a0008378:	3b4d                	jal	a000812a <u8x8_cad_StartTransfer>
      x = ((u8x8_tile_t *)arg_ptr)->x_pos;    
a000837a:	0054c783          	lbu	a5,5(s1)
      x += u8x8->x_offset;
a000837e:	02294983          	lbu	s3,34(s2)
      u8x8_cad_SendCmd(u8x8, 0x040 );	/* set line offset to 0 */
a0008382:	04000593          	li	a1,64
a0008386:	854a                	mv	a0,s2
      x += u8x8->x_offset;
a0008388:	06f9998b          	addsl	s3,s3,a5,3
a000838c:	0ff9f993          	andi	s3,s3,255
      u8x8_cad_SendCmd(u8x8, 0x040 );	/* set line offset to 0 */
a0008390:	3bb5                	jal	a000810c <u8x8_cad_SendCmd>
      u8x8_cad_SendCmd(u8x8, 0x010 | (x>>4) );
a0008392:	0049d593          	srli	a1,s3,0x4
a0008396:	0105e593          	ori	a1,a1,16
a000839a:	854a                	mv	a0,s2
a000839c:	3b85                	jal	a000810c <u8x8_cad_SendCmd>
      u8x8_cad_SendArg(u8x8, 0x000 | ((x&15)));					/* probably wrong, should be SendCmd */
a000839e:	00f9f593          	andi	a1,s3,15
a00083a2:	854a                	mv	a0,s2
a00083a4:	3b8d                	jal	a0008116 <u8x8_cad_SendArg>
      u8x8_cad_SendArg(u8x8, 0x0b0 | (((u8x8_tile_t *)arg_ptr)->y_pos));	/* probably wrong, should be SendCmd */
a00083a6:	0064c583          	lbu	a1,6(s1)
a00083aa:	854a                	mv	a0,s2
a00083ac:	0b05e593          	ori	a1,a1,176
a00083b0:	339d                	jal	a0008116 <u8x8_cad_SendArg>
a00083b2:	0001                	nop
	u8x8_cad_SendData(u8x8, c*8, ptr); 	/* note: SendData can not handle more than 255 bytes */
a00083b4:	0044c583          	lbu	a1,4(s1)
a00083b8:	4090                	lw	a2,0(s1)
	arg_int--;
a00083ba:	147d                	addi	s0,s0,-1
	u8x8_cad_SendData(u8x8, c*8, ptr); 	/* note: SendData can not handle more than 255 bytes */
a00083bc:	058e                	slli	a1,a1,0x3
a00083be:	854a                	mv	a0,s2
a00083c0:	0f85f593          	andi	a1,a1,248
	arg_int--;
a00083c4:	0ff47413          	andi	s0,s0,255
	u8x8_cad_SendData(u8x8, c*8, ptr); 	/* note: SendData can not handle more than 255 bytes */
a00083c8:	3ba1                	jal	a0008120 <u8x8_cad_SendData>
      } while( arg_int > 0 );
a00083ca:	f46d                	bnez	s0,a00083b4 <u8x8_d_ssd1306_sh1106_generic+0x94>
      u8x8_cad_EndTransfer(u8x8);
a00083cc:	854a                	mv	a0,s2
a00083ce:	339d                	jal	a0008134 <u8x8_cad_EndTransfer>
}
a00083d0:	40f2                	lw	ra,28(sp)
a00083d2:	4462                	lw	s0,24(sp)
a00083d4:	44d2                	lw	s1,20(sp)
a00083d6:	4942                	lw	s2,16(sp)
a00083d8:	49b2                	lw	s3,12(sp)
  return 1;
a00083da:	4505                	li	a0,1
}
a00083dc:	6105                	addi	sp,sp,32
a00083de:	8082                	ret
a00083e0:	40f2                	lw	ra,28(sp)
a00083e2:	4462                	lw	s0,24(sp)
a00083e4:	44d2                	lw	s1,20(sp)
a00083e6:	4942                	lw	s2,16(sp)
a00083e8:	49b2                	lw	s3,12(sp)
  switch(msg)
a00083ea:	4501                	li	a0,0
}
a00083ec:	6105                	addi	sp,sp,32
a00083ee:	8082                	ret
      if ( arg_int == 0 )
a00083f0:	e629                	bnez	a2,a000843a <u8x8_d_ssd1306_sh1106_generic+0x11a>
	u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_powersave0_seq);
a00083f2:	a000c5b7          	lui	a1,0xa000c
a00083f6:	4d058593          	addi	a1,a1,1232 # a000c4d0 <__psram_limit+0xf7c0c4d0>
a00083fa:	d45ff0ef          	jal	ra,a000813e <u8x8_cad_SendSequence>
}
a00083fe:	40f2                	lw	ra,28(sp)
a0008400:	4462                	lw	s0,24(sp)
a0008402:	44d2                	lw	s1,20(sp)
a0008404:	4942                	lw	s2,16(sp)
a0008406:	49b2                	lw	s3,12(sp)
  return 1;
a0008408:	4505                	li	a0,1
}
a000840a:	6105                	addi	sp,sp,32
a000840c:	8082                	ret
      u8x8_cad_StartTransfer(u8x8);
a000840e:	d1dff0ef          	jal	ra,a000812a <u8x8_cad_StartTransfer>
      u8x8_cad_SendCmd(u8x8, 0x081 );
a0008412:	08100593          	li	a1,129
a0008416:	854a                	mv	a0,s2
a0008418:	cf5ff0ef          	jal	ra,a000810c <u8x8_cad_SendCmd>
      u8x8_cad_SendArg(u8x8, arg_int );	/* ssd1306 has range from 0 to 255 */
a000841c:	85a2                	mv	a1,s0
a000841e:	854a                	mv	a0,s2
a0008420:	cf7ff0ef          	jal	ra,a0008116 <u8x8_cad_SendArg>
      u8x8_cad_EndTransfer(u8x8);
a0008424:	854a                	mv	a0,s2
a0008426:	d0fff0ef          	jal	ra,a0008134 <u8x8_cad_EndTransfer>
}
a000842a:	40f2                	lw	ra,28(sp)
a000842c:	4462                	lw	s0,24(sp)
a000842e:	44d2                	lw	s1,20(sp)
a0008430:	4942                	lw	s2,16(sp)
a0008432:	49b2                	lw	s3,12(sp)
  return 1;
a0008434:	4505                	li	a0,1
}
a0008436:	6105                	addi	sp,sp,32
a0008438:	8082                	ret
	u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_powersave1_seq);
a000843a:	a000c5b7          	lui	a1,0xa000c
a000843e:	4d858593          	addi	a1,a1,1240 # a000c4d8 <__psram_limit+0xf7c0c4d8>
a0008442:	cfdff0ef          	jal	ra,a000813e <u8x8_cad_SendSequence>
}
a0008446:	40f2                	lw	ra,28(sp)
a0008448:	4462                	lw	s0,24(sp)
a000844a:	44d2                	lw	s1,20(sp)
a000844c:	4942                	lw	s2,16(sp)
a000844e:	49b2                	lw	s3,12(sp)
  return 1;
a0008450:	4505                	li	a0,1
}
a0008452:	6105                	addi	sp,sp,32
a0008454:	8082                	ret
	u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_flip1_seq);
a0008456:	a000c5b7          	lui	a1,0xa000c
a000845a:	49058593          	addi	a1,a1,1168 # a000c490 <__psram_limit+0xf7c0c490>
a000845e:	ce1ff0ef          	jal	ra,a000813e <u8x8_cad_SendSequence>
	u8x8->x_offset = u8x8->display_info->flipmode_x_offset;
a0008462:	00092783          	lw	a5,0(s2)
  return 1;
a0008466:	4505                	li	a0,1
	u8x8->x_offset = u8x8->display_info->flipmode_x_offset;
a0008468:	0137c783          	lbu	a5,19(a5)
a000846c:	02f90123          	sb	a5,34(s2)
}
a0008470:	40f2                	lw	ra,28(sp)
a0008472:	4462                	lw	s0,24(sp)
a0008474:	44d2                	lw	s1,20(sp)
a0008476:	4942                	lw	s2,16(sp)
a0008478:	49b2                	lw	s3,12(sp)
a000847a:	6105                	addi	sp,sp,32
a000847c:	8082                	ret
	...

a0008480 <u8x8_d_ssd1306_128x64_noname>:
  /* pixel_width = */ 128,
  /* pixel_height = */ 64
};

uint8_t u8x8_d_ssd1306_128x64_noname(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{
a0008480:	1141                	addi	sp,sp,-16
a0008482:	c422                	sw	s0,8(sp)
a0008484:	c226                	sw	s1,4(sp)
a0008486:	c606                	sw	ra,12(sp)
a0008488:	84aa                	mv	s1,a0
a000848a:	842e                	mv	s0,a1
    
  if ( u8x8_d_ssd1306_sh1106_generic(u8x8, msg, arg_int, arg_ptr) != 0 )
a000848c:	3d51                	jal	a0008320 <u8x8_d_ssd1306_sh1106_generic>
a000848e:	e539                	bnez	a0,a00084dc <u8x8_d_ssd1306_128x64_noname+0x5c>
    return 1;
  
  switch(msg)
a0008490:	47a5                	li	a5,9
a0008492:	02f40963          	beq	s0,a5,a00084c4 <u8x8_d_ssd1306_128x64_noname+0x44>
a0008496:	47a9                	li	a5,10
a0008498:	00f40763          	beq	s0,a5,a00084a6 <u8x8_d_ssd1306_128x64_noname+0x26>
      break;
    default:
      return 0;
  }
  return 1;
}
a000849c:	40b2                	lw	ra,12(sp)
a000849e:	4422                	lw	s0,8(sp)
a00084a0:	4492                	lw	s1,4(sp)
a00084a2:	0141                	addi	sp,sp,16
a00084a4:	8082                	ret
      u8x8_d_helper_display_init(u8x8);
a00084a6:	8526                	mv	a0,s1
a00084a8:	20b1                	jal	a00084f4 <u8x8_d_helper_display_init>
      u8x8_cad_SendSequence(u8x8, u8x8_d_ssd1306_128x64_noname_init_seq);    
a00084aa:	a000c5b7          	lui	a1,0xa000c
a00084ae:	8526                	mv	a0,s1
a00084b0:	49858593          	addi	a1,a1,1176 # a000c498 <__psram_limit+0xf7c0c498>
a00084b4:	c8bff0ef          	jal	ra,a000813e <u8x8_cad_SendSequence>
}
a00084b8:	40b2                	lw	ra,12(sp)
a00084ba:	4422                	lw	s0,8(sp)
a00084bc:	4492                	lw	s1,4(sp)
  return 1;
a00084be:	4505                	li	a0,1
}
a00084c0:	0141                	addi	sp,sp,16
a00084c2:	8082                	ret
      u8x8_d_helper_display_setup_memory(u8x8, &u8x8_ssd1306_128x64_noname_display_info);
a00084c4:	a000c5b7          	lui	a1,0xa000c
a00084c8:	8526                	mv	a0,s1
a00084ca:	4e058593          	addi	a1,a1,1248 # a000c4e0 <__psram_limit+0xf7c0c4e0>
a00084ce:	2829                	jal	a00084e8 <u8x8_d_helper_display_setup_memory>
}
a00084d0:	40b2                	lw	ra,12(sp)
a00084d2:	4422                	lw	s0,8(sp)
a00084d4:	4492                	lw	s1,4(sp)
  return 1;
a00084d6:	4505                	li	a0,1
}
a00084d8:	0141                	addi	sp,sp,16
a00084da:	8082                	ret
a00084dc:	40b2                	lw	ra,12(sp)
a00084de:	4422                	lw	s0,8(sp)
a00084e0:	4492                	lw	s1,4(sp)
    return 1;
a00084e2:	4505                	li	a0,1
}
a00084e4:	0141                	addi	sp,sp,16
a00084e6:	8082                	ret

a00084e8 <u8x8_d_helper_display_setup_memory>:
  
*/
void u8x8_d_helper_display_setup_memory(u8x8_t *u8x8, const u8x8_display_info_t *display_info)
{
      /* 1) set display info struct */
      u8x8->display_info = display_info;
a00084e8:	c10c                	sw	a1,0(a0)
      u8x8->x_offset = u8x8->display_info->default_x_offset;
a00084ea:	0125c783          	lbu	a5,18(a1)
a00084ee:	02f50123          	sb	a5,34(a0)
}
a00084f2:	8082                	ret

a00084f4 <u8x8_d_helper_display_init>:
  
*/
void u8x8_d_helper_display_init(u8x8_t *u8x8)
{
      /* 2) apply port directions to the GPIO lines and apply default values for the IO lines*/
      u8x8_gpio_Init(u8x8);
a00084f4:	495c                	lw	a5,20(a0)
{
a00084f6:	1141                	addi	sp,sp,-16
a00084f8:	c606                	sw	ra,12(sp)
a00084fa:	c422                	sw	s0,8(sp)
      u8x8_gpio_Init(u8x8);
a00084fc:	4681                	li	a3,0
a00084fe:	4601                	li	a2,0
a0008500:	02800593          	li	a1,40
{
a0008504:	842a                	mv	s0,a0
      u8x8_gpio_Init(u8x8);
a0008506:	9782                	jalr	a5
      u8x8_cad_Init(u8x8);              /* this will also call U8X8_MSG_BYTE_INIT, byte init will NOT call GPIO_INIT */
a0008508:	445c                	lw	a5,12(s0)
a000850a:	4681                	li	a3,0
a000850c:	4601                	li	a2,0
a000850e:	45d1                	li	a1,20
a0008510:	8522                	mv	a0,s0
a0008512:	9782                	jalr	a5

      /* 3) do reset */
      u8x8_gpio_SetReset(u8x8, 1);
a0008514:	8522                	mv	a0,s0
a0008516:	4605                	li	a2,1
a0008518:	04b00593          	li	a1,75
a000851c:	2869                	jal	a00085b6 <u8x8_gpio_call>
      u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, u8x8->display_info->reset_pulse_width_ms);
a000851e:	401c                	lw	a5,0(s0)
a0008520:	8522                	mv	a0,s0
a0008522:	02900593          	li	a1,41
a0008526:	0047c603          	lbu	a2,4(a5)
a000852a:	2071                	jal	a00085b6 <u8x8_gpio_call>
      u8x8_gpio_SetReset(u8x8, 0);
a000852c:	8522                	mv	a0,s0
a000852e:	4601                	li	a2,0
a0008530:	04b00593          	li	a1,75
a0008534:	2049                	jal	a00085b6 <u8x8_gpio_call>
      u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, u8x8->display_info->reset_pulse_width_ms);
a0008536:	401c                	lw	a5,0(s0)
a0008538:	8522                	mv	a0,s0
a000853a:	02900593          	li	a1,41
a000853e:	0047c603          	lbu	a2,4(a5)
a0008542:	2895                	jal	a00085b6 <u8x8_gpio_call>
      u8x8_gpio_SetReset(u8x8, 1);
a0008544:	8522                	mv	a0,s0
a0008546:	4605                	li	a2,1
a0008548:	04b00593          	li	a1,75
a000854c:	20ad                	jal	a00085b6 <u8x8_gpio_call>
      u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, u8x8->display_info->post_reset_wait_ms);
a000854e:	401c                	lw	a5,0(s0)
a0008550:	8522                	mv	a0,s0
}    
a0008552:	4422                	lw	s0,8(sp)
a0008554:	40b2                	lw	ra,12(sp)
      u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, u8x8->display_info->post_reset_wait_ms);
a0008556:	0057c603          	lbu	a2,5(a5)
a000855a:	02900593          	li	a1,41
}    
a000855e:	0141                	addi	sp,sp,16
      u8x8_gpio_Delay(u8x8, U8X8_MSG_DELAY_MILLI, u8x8->display_info->post_reset_wait_ms);
a0008560:	a899                	j	a00085b6 <u8x8_gpio_call>

a0008562 <u8x8_DrawTile>:
  u8x8_tile_t tile;
  tile.x_pos = x;
  tile.y_pos = y;
  tile.cnt = cnt;
  tile.tile_ptr = tile_ptr;
  return u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_DRAW_TILE, 1, (void *)&tile);
a0008562:	451c                	lw	a5,8(a0)
{
a0008564:	1101                	addi	sp,sp,-32
a0008566:	ce06                	sw	ra,28(sp)
  tile.x_pos = x;
a0008568:	00b106a3          	sb	a1,13(sp)
  tile.y_pos = y;
a000856c:	00c10723          	sb	a2,14(sp)
  tile.cnt = cnt;
a0008570:	00d10623          	sb	a3,12(sp)
  tile.tile_ptr = tile_ptr;
a0008574:	c43a                	sw	a4,8(sp)
  return u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_DRAW_TILE, 1, (void *)&tile);
a0008576:	0034                	addi	a3,sp,8
a0008578:	4605                	li	a2,1
a000857a:	45bd                	li	a1,15
a000857c:	9782                	jalr	a5
}
a000857e:	40f2                	lw	ra,28(sp)
a0008580:	6105                	addi	sp,sp,32
a0008582:	8082                	ret

a0008584 <u8x8_SetupMemory>:

/* should be implemented as macro */
void u8x8_SetupMemory(u8x8_t *u8x8)
{
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SETUP_MEMORY, 0, NULL);  
a0008584:	451c                	lw	a5,8(a0)
a0008586:	4681                	li	a3,0
a0008588:	4601                	li	a2,0
a000858a:	45a5                	li	a1,9
a000858c:	8782                	jr	a5

a000858e <u8x8_InitDisplay>:
  Then InitDisplay can be skipped, but u8x8_InitInterface()  (== u8x8_gpio_Init() and u8x8_cad_Init()) need to be executed.

*/
void u8x8_InitDisplay(u8x8_t *u8x8)
{
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_INIT, 0, NULL);       /* this will call u8x8_d_helper_display_init() and send the init seqence to the display */
a000858e:	451c                	lw	a5,8(a0)
a0008590:	4681                	li	a3,0
a0008592:	4601                	li	a2,0
a0008594:	45a9                	li	a1,10
a0008596:	8782                	jr	a5

a0008598 <u8x8_SetPowerSave>:
  /* u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SET_FLIP_MODE, 0, NULL);  */ /* It would make sense to call flip mode 0 here after U8X8_MSG_DISPLAY_INIT */
}

void u8x8_SetPowerSave(u8x8_t *u8x8, uint8_t is_enable)
{
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SET_POWER_SAVE, is_enable, NULL);  
a0008598:	451c                	lw	a5,8(a0)
{
a000859a:	862e                	mv	a2,a1
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SET_POWER_SAVE, is_enable, NULL);  
a000859c:	4681                	li	a3,0
a000859e:	45ad                	li	a1,11
a00085a0:	8782                	jr	a5

a00085a2 <u8x8_SetContrast>:
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SET_FLIP_MODE, mode, NULL);  
}

void u8x8_SetContrast(u8x8_t *u8x8, uint8_t value)
{
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SET_CONTRAST, value, NULL);  
a00085a2:	451c                	lw	a5,8(a0)
{
a00085a4:	862e                	mv	a2,a1
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_SET_CONTRAST, value, NULL);  
a00085a6:	4681                	li	a3,0
a00085a8:	45b9                	li	a1,14
a00085aa:	8782                	jr	a5

a00085ac <u8x8_RefreshDisplay>:
}

void u8x8_RefreshDisplay(u8x8_t *u8x8)
{
  u8x8->display_cb(u8x8, U8X8_MSG_DISPLAY_REFRESH, 0, NULL);  
a00085ac:	451c                	lw	a5,8(a0)
a00085ae:	4681                	li	a3,0
a00085b0:	4601                	li	a2,0
a00085b2:	45c1                	li	a1,16
a00085b4:	8782                	jr	a5

a00085b6 <u8x8_gpio_call>:
#include "u8x8.h"


void u8x8_gpio_call(u8x8_t *u8x8, uint8_t msg, uint8_t arg)
{
  u8x8->gpio_and_delay_cb(u8x8, msg, arg, NULL);
a00085b6:	495c                	lw	a5,20(a0)
a00085b8:	4681                	li	a3,0
a00085ba:	8782                	jr	a5

a00085bc <u8x8_Setup>:
    u8x8->gpio_and_delay_cb = u8x8_dummy_cb;
    u8x8->is_font_inverse_mode = 0;
    //u8x8->device_address = 0;
    u8x8->utf8_state = 0;		/* also reset by u8x8_utf8_init */
    u8x8->bus_clock = 0;		/* issue 769 */
    u8x8->i2c_address = 255;
a00085bc:	57fd                	li	a5,-1
    u8x8->display_info = NULL;
a00085be:	00052023          	sw	zero,0(a0)
    u8x8->is_font_inverse_mode = 0;
a00085c2:	020501a3          	sb	zero,35(a0)
    u8x8->utf8_state = 0;		/* also reset by u8x8_utf8_init */
a00085c6:	02050323          	sb	zero,38(a0)
    u8x8->bus_clock = 0;		/* issue 769 */
a00085ca:	00052c23          	sw	zero,24(a0)
    u8x8->i2c_address = 255;
a00085ce:	02f50223          	sb	a5,36(a0)
    u8x8->debounce_default_pin_state = 255;	/* assume all low active buttons */
a00085d2:	02f50423          	sb	a5,40(a0)
{
  /* setup defaults and reset pins to U8X8_PIN_NONE */
  u8x8_SetupDefaults(u8x8);

  /* setup specific callbacks */
  u8x8->display_cb = display_cb;
a00085d6:	c50c                	sw	a1,8(a0)
  u8x8->cad_cb = cad_cb;
a00085d8:	c550                	sw	a2,12(a0)
  u8x8->byte_cb = byte_cb;
a00085da:	c914                	sw	a3,16(a0)
  u8x8->gpio_and_delay_cb = gpio_and_delay_cb;
a00085dc:	c958                	sw	a4,20(a0)

  /* setup display info */
  u8x8_SetupMemory(u8x8);
a00085de:	b75d                	j	a0008584 <u8x8_SetupMemory>

a00085e0 <__fsymtab_end>:
a00085e0:	6f697067          	0x6f697067
a00085e4:	0000                	unimp
a00085e6:	0000                	unimp
a00085e8:	3269                	jal	a0007f72 <u8g2_update_page_win_r0+0x5a>
a00085ea:	00003063          	0x3063
a00085ee:	0000                	unimp
a00085f0:	aee5                	j	a00089e8 <__FUNCTION__.6+0x17c>
a00085f2:	e489                	bnez	s1,a00085fc <__fsymtab_end+0x1c>
a00085f4:	8fe5a1bf 000000af 	0xaf8fe5a1bf
a00085fc:	6e66                	flw	ft8,88(sp)
a00085fe:	0069                	c.nop	26
a0008600:	6e66                	flw	ft8,88(sp)
a0008602:	2b69                	jal	a0008b9c <__FUNCTION__.6+0x330>
a0008604:	0000                	unimp
a0008606:	0000                	unimp
a0008608:	616e                	flw	ft2,216(sp)
a000860a:	006e                	c.slli	zero,0x1b
a000860c:	6e66                	flw	ft8,88(sp)
a000860e:	2d69                	jal	a0008ca8 <__FUNCTION__.6+0x43c>
a0008610:	0000                	unimp
a0008612:	0000                	unimp
a0008614:	6c29                	lui	s8,0xa
a0008616:	756c                	flw	fa1,108(a0)
a0008618:	286e                	fld	fa6,216(sp)
a000861a:	0000                	unimp
a000861c:	6c29                	lui	s8,0xa
a000861e:	6e69                	lui	t3,0x1a
a0008620:	0028                	addi	a0,sp,8
	...
a000862e:	3fe0                	fld	fs0,248(a5)
a0008630:	509f79fb          	0x509f79fb
a0008634:	3fd34413          	xori	s0,t1,1021
a0008638:	8b60c8b3          	0x8b60c8b3
a000863c:	8a28                	0x8a28
a000863e:	3fc6                	fld	ft11,112(sp)
a0008640:	0000                	unimp
a0008642:	0000                	unimp
a0008644:	0000                	unimp
a0008646:	3ff8                	fld	fa4,248(a5)
a0008648:	4361                	li	t1,24
a000864a:	87a7636f          	jal	t1,9ff7e6c4 <BOOT2_PT_ADDR+0x3cf56ac4>
a000864e:	3fd2                	fld	ft11,304(sp)
a0008650:	a371                	j	a0008bdc <__FUNCTION__.6+0x370>
a0008652:	0979                	addi	s2,s2,30
a0008654:	400a934f          	fnmadd.s	ft6,fs5,ft0,fs0,rtz
a0008658:	5516                	lw	a0,100(sp)
a000865a:	bbb5                	j	a00083d6 <u8x8_d_ssd1306_sh1106_generic+0xb6>
a000865c:	6bb1                	lui	s7,0xc
a000865e:	4002                	0x4002
a0008660:	fefa39ef          	jal	s3,9ffac64e <BOOT2_PT_ADDR+0x3cf84a4e>
a0008664:	2e42                	fld	ft8,16(sp)
a0008666:	3fe6                	fld	ft11,120(sp)
a0008668:	0000                	unimp
a000866a:	0000                	unimp
a000866c:	0000                	unimp
a000866e:	402c                	lw	a1,64(s0)
a0008670:	0000                	unimp
a0008672:	0000                	unimp
a0008674:	0000                	unimp
a0008676:	4024                	lw	s1,64(s0)
a0008678:	0000                	unimp
a000867a:	0000                	unimp
a000867c:	0000                	unimp
a000867e:	4018                	lw	a4,0(s0)
a0008680:	0000                	unimp
a0008682:	0000                	unimp
a0008684:	0000                	unimp
a0008686:	4000                	lw	s0,0(s0)
a0008688:	0000                	unimp
a000868a:	0000                	unimp
a000868c:	0000                	unimp
a000868e:	3ff0                	fld	fa2,248(a5)
a0008690:	ffffffff          	0xffffffff
a0008694:	ffefffff          	0xffefffff
a0008698:	ffffffff          	0xffffffff
a000869c:	7fefffff          	0x7fefffff
a00086a0:	0000                	unimp
a00086a2:	0000                	unimp
a00086a4:	cd65                	beqz	a0,a000879c <powers_of_10+0xec>
a00086a6:	41cd                	li	gp,19
a00086a8:	0000                	unimp
a00086aa:	0000                	unimp
a00086ac:	cd65                	beqz	a0,a00087a4 <powers_of_10+0xf4>
a00086ae:	c1cd                	beqz	a1,a0008750 <powers_of_10+0xa0>

a00086b0 <powers_of_10>:
a00086b0:	0000 0000 0000 3ff0 0000 0000 0000 4024     .......?......$@
a00086c0:	0000 0000 0000 4059 0000 0000 4000 408f     ......Y@.....@.@
a00086d0:	0000 0000 8800 40c3 0000 0000 6a00 40f8     .......@.....j.@
a00086e0:	0000 0000 8480 412e 0000 0000 12d0 4163     .......A......cA
a00086f0:	0000 0000 d784 4197 0000 0000 cd65 41cd     .......A....e..A
a0008700:	0000 2000 a05f 4202 0000 e800 4876 4237     ... _..B....vH7B
a0008710:	0000 a200 1a94 426d 0000 e540 309c 42a2     ......mB..@..0.B
a0008720:	0000 1e90 bcc4 42d6 0000 2634 6bf5 430c     .......B..4&.k.C
a0008730:	8000 37e0 c379 4341 a000 85d8 3457 4376     ...7y.AC....W4vC
a0008740:	6c74 6673 615f 6464 705f 6f6f 3a6c 4d20     tlsf_add_pool: M
a0008750:	6d65 726f 2079 756d 7473 6220 2065 6c61     emory must be al
a0008760:	6769 656e 2064 7962 2520 2075 7962 6574     igned by %u byte
a0008770:	2e73 000a 6c74 6673 615f 6464 705f 6f6f     s...tlsf_add_poo
a0008780:	3a6c 4d20 6d65 726f 2079 6973 657a 6d20     l: Memory size m
a0008790:	7375 2074 6562 6220 7465 6577 6e65 2520     ust be between %
a00087a0:	2075 6e61 2064 7525 6220 7479 7365 0a2e     u and %u bytes..
a00087b0:	0000 0000 6c74 6673 635f 6572 7461 3a65     ....tlsf_create:
a00087c0:	4d20 6d65 726f 2079 756d 7473 6220 2065      Memory must be 
a00087d0:	6c61 6769 656e 2064 6f74 2520 2075 7962     aligned to %u by
a00087e0:	6574 2e73 000a 0000 6568 7061 6973 657a     tes.....heapsize
a00087f0:	3e20 7320 7a69 6f65 2866 7473 7572 7463      > sizeof(struct
a0008800:	6d20 6d65 685f 6165 5f70 6d69 6c70 735f      mem_heap_impl_s
a0008810:	2029 7361 6573 7472 6620 6961 656c 2064     ) assert failed 
a0008820:	7461 6620 6e75 7463 6f69 206e 7325 0a0d     at function %s..
a0008830:	0000 0000 6568 7061 6973 657a 3e20 7420     ....heapsize > t
a0008840:	736c 5f66 6973 657a 2928 6120 7373 7265     lsf_size() asser
a0008850:	2074 6166 6c69 6465 6120 2074 7566 636e     t failed at func
a0008860:	6974 6e6f 2520 0d73 000a 0000               tion %s.....

a000886c <__FUNCTION__.6>:
a000886c:	6662 626c 6d5f 6d65 695f 696e 0074 0000     bflb_mem_init...
a000887c:	7269 2071 253a 2064 6e75 6572 6967 7473     irq :%d unregist
a000888c:	7265 6465 0a0d 0000 6461 0063 6164 0063     ered....adc.dac.
a000889c:	6665 635f 7274 006c 6175 7472 0030 0000     ef_ctrl.uart0...
a00088ac:	6175 7472 0031 0000 7073 3069 0000 0000     uart1...spi0....
a00088bc:	7770 5f6d 3276 305f 0000 0000 6d64 3061     pwm_v2_0....dma0
a00088cc:	635f 3068 0000 0000 6d64 3061 635f 3168     _ch0....dma0_ch1
a00088dc:	0000 0000 6d64 3061 635f 3268 0000 0000     ....dma0_ch2....
a00088ec:	6d64 3061 635f 3368 0000 0000 6d64 3061     dma0_ch3....dma0
a00088fc:	635f 3468 0000 0000 6d64 3061 635f 3568     _ch4....dma0_ch5
a000890c:	0000 0000 6d64 3061 635f 3668 0000 0000     ....dma0_ch6....
a000891c:	6d64 3061 635f 3768 0000 0000 3269 3163     dma0_ch7....i2c1
a000892c:	0000 0000 3269 3073 0000 0000 6974 656d     ....i2s0....time
a000893c:	3072 0000 6974 656d 3172 0000 7472 0063     r0..timer1..rtc.
a000894c:	6561 0073 6873 0061 7274 676e 0000 0000     aes.sha.trng....
a000895c:	6b70 0061 6d65 6361 0030 0000 6177 6374     pka.emac0...watc
a000896c:	6468 676f 0000 0000 6b63 0073 6a6d 6570     hdog....cks.mjpe
a000897c:	0067 0000 7269 7872 0000 0000 6163 306d     g...irrx....cam0
a000898c:	0000 0000 6163 316d 0000 0000 7561 6461     ....cam1....auad
a000899c:	0063 0000 7561 6164 0063 0000 6473 6f69     c...audac...sdio
a00089ac:	0032 0000 6264 0069 6c70 6d66 645f 616d     2...dbi.plfm_dma
a00089bc:	635f 3068 0000 0000 6c70 6d66 645f 616d     _ch0....plfm_dma
a00089cc:	635f 3168 0000 0000 6c70 6d66 645f 616d     _ch1....plfm_dma
a00089dc:	635f 3268 0000 0000 6c70 6d66 645f 616d     _ch2....plfm_dma
a00089ec:	635f 3368 0000 0000 6c70 6d66 645f 616d     _ch3....plfm_dma
a00089fc:	635f 3468 0000 0000 6e49 7473 7572 7463     _ch4....Instruct
a0008a0c:	6f69 206e 6461 7264 7365 2073 696d 6173     ion address misa
a0008a1c:	696c 6e67 6465 0000 6e49 7473 7572 7463     ligned..Instruct
a0008a2c:	6f69 206e 6361 6563 7373 6620 7561 746c     ion access fault
a0008a3c:	0000 0000 6c49 656c 6167 206c 6e69 7473     ....Illegal inst
a0008a4c:	7572 7463 6f69 006e 7242 6165 706b 696f     ruction.Breakpoi
a0008a5c:	746e 0000 6f4c 6461 6120 6464 6572 7373     nt..Load address
a0008a6c:	6d20 7369 6c61 6769 656e 0064 6f4c 6461      misaligned.Load
a0008a7c:	6120 6363 7365 2073 6166 6c75 0074 0000      access fault...
a0008a8c:	7453 726f 2f65 4d41 204f 6461 7264 7365     Store/AMO addres
a0008a9c:	2073 696d 6173 696c 6e67 6465 0000 0000     s misaligned....
a0008aac:	7453 726f 2f65 4d41 204f 6361 6563 7373     Store/AMO access
a0008abc:	6620 7561 746c 0000 6e45 6976 6f72 6d6e      fault..Environm
a0008acc:	6e65 2074 6163 6c6c 6620 6f72 206d 2d55     ent call from U-
a0008adc:	6f6d 6564 0000 0000 6e45 6976 6f72 6d6e     mode....Environm
a0008aec:	6e65 2074 6163 6c6c 6620 6f72 206d 2d53     ent call from S-
a0008afc:	6f6d 6564 0000 0000 5352 4456 0000 0000     mode....RSVD....
a0008b0c:	6e45 6976 6f72 6d6e 6e65 2074 6163 6c6c     Environment call
a0008b1c:	6620 6f72 206d 2d4d 6f6d 6564 0000 0000      from M-mode....
a0008b2c:	6e49 7473 7572 7463 6f69 206e 6170 6567     Instruction page
a0008b3c:	6620 7561 746c 0000 6f4c 6461 7020 6761      fault..Load pag
a0008b4c:	2065 6166 6c75 0074 7453 726f 2f65 4d41     e fault.Store/AM
a0008b5c:	204f 6170 6567 6620 7561 746c 0000 0000     O page fault....
a0008b6c:	7865 6563 7470 6f69 5f6e 6e65 7274 0d79     exception_entry.
a0008b7c:	000a 0000 636d 7561 6573 253d 3830 0d78     ....mcause=%08x.
a0008b8c:	000a 0000 656d 6370 253a 3830 0d78 000a     ....mepc:%08x...
a0008b9c:	746d 6176 3a6c 3025 7838 0a0d 0000 0000     mtval:%08x......
a0008bac:	8a04 a000 8a24 a000 8a40 a000 8a54 a000     ....$...@...T...
a0008bbc:	8a60 a000 8a78 a000 8a8c a000 8aac a000     `...x...........
a0008bcc:	8ac4 a000 8ae4 a000 8b04 a000 8b0c a000     ................
a0008bdc:	8b2c a000 8b44 a000 8b04 a000 8b54 a000     ,...D.......T...
a0008bec:	2020 5f5f 5f5f 2020 2020 2020 2020 2020       ____          
a0008bfc:	2020 2020 5f20 205f 5f20 205f 2020 2020          __  __     
a0008c0c:	5f20 2020 2020 2020 5f20 2020 2020 2020      _       _      
a0008c1c:	5f20 2020 2020 0d20 000a 0000 7c20 2020      _     ..... |  
a0008c2c:	205f 205c 2020 2020 2020 2020 2020 2020     _ \             
a0008c3c:	202f 7c5f 202f 7c5f 2020 2020 207c 207c     / _|/ _|    | | 
a0008c4c:	2020 2020 207c 207c 2020 2020 207c 207c         | |     | | 
a0008c5c:	2020 0d20 000a 0000 7c20 7c20 295f 7c20        ..... | |_) |
a0008c6c:	5f20 5f5f 2020 205f 2020 7c5f 7c20 7c5f      ___  _   _| |_|
a0008c7c:	7c20 205f 5f5f 5f20 207c 207c 5f5f 205f      |_ __ _| | ___ 
a0008c8c:	207c 207c 5f5f 5f20 207c 5f7c 205f 0d20     | | __ _| |__  .
a0008c9c:	000a 0000 7c20 2020 205f 203c 202f 205f     .... |  _ < / _ 
a0008cac:	7c5c 7c20 7c20 7c20 2020 7c5f 2020 2f5f     \| | | |  _|  _/
a0008cbc:	5f20 2060 207c 2f7c 5f20 5c20 207c 2f7c      _` | |/ _ \| |/
a0008ccc:	5f20 2060 207c 5f27 5c20 0d20 000a 0000      _` | '_ \ .....
a0008cdc:	7c20 7c20 295f 7c20 2820 295f 7c20 7c20      | |_) | (_) | |
a0008cec:	7c5f 7c20 7c20 7c20 7c20 207c 5f28 207c     _| | | | || (_| 
a0008cfc:	207c 207c 5f28 2029 207c 207c 5f28 207c     | | (_) | | (_| 
a0008d0c:	207c 5f7c 2029 0d7c 000a 0000 7c20 5f5f     | |_) |..... |__
a0008d1c:	5f5f 202f 5f5c 5f5f 202f 5f5c 2c5f 7c5f     __/ \___/ \__,_|
a0008d2c:	7c5f 7c20 7c5f 5c20 5f5f 5f2c 5f7c 5c7c     _| |_| \__,_|_|\
a0008d3c:	5f5f 2f5f 5f7c 5c7c 5f5f 5f2c 5f7c 5f2e     ___/|_|\__,_|_._
a0008d4c:	2f5f 0d20 000a 0000 6544 2063 3731 3220     _/ .....Dec 17 2
a0008d5c:	3230 0033 3331 323a 3a37 3633 0000 0000     023.13:27:36....
a0008d6c:	7542 6c69 3a64 7325 252c 0d73 000a 0000     Build:%s,%s.....
a0008d7c:	6f43 7970 6972 6867 2074 6328 2029 3032     Copyright (c) 20
a0008d8c:	3232 4220 756f 6666 6c61 6c6f 6261 7420     22 Bouffalolab t
a0008d9c:	6165 0d6d 000a 0000 3d3d 3d3d 3d3d 3d3d     eam.....========
a0008dac:	3d3d 203d 6c66 7361 2068 6663 2067 3d3d     === flash cfg ==
a0008dbc:	3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 0a0d 0000     ============....
a0008dcc:	656a 6564 2063 6469 2020 3020 2578 3630     jedec id   0x%06
a0008ddc:	0d58 000a 696d 2064 2020 2020 2020 2020     X...mid         
a0008dec:	2020 3020 2578 3230 0d58 000a 6f69 6f6d        0x%02X...iomo
a0008dfc:	6564 2020 2020 2020 2020 3020 2578 3230     de         0x%02
a0008e0c:	0d58 000a 6c63 206b 6564 616c 2079 2020     X...clk delay   
a0008e1c:	2020 3020 2578 3230 0d58 000a 6c63 206b        0x%02X...clk 
a0008e2c:	6e69 6576 7472 2020 2020 3020 2578 3230     invert     0x%02
a0008e3c:	0d58 000a 6572 6461 7220 6765 6320 646d     X...read reg cmd
a0008e4c:	2030 3020 2578 3230 0d58 000a 6572 6461     0  0x%02X...read
a0008e5c:	7220 6765 6320 646d 2031 3020 2578 3230      reg cmd1  0x%02
a0008e6c:	0d58 000a 7277 7469 2065 6572 2067 6d63     X...write reg cm
a0008e7c:	3064 3020 2578 3230 0d58 000a 7277 7469     d0 0x%02X...writ
a0008e8c:	2065 6572 2067 6d63 3164 3020 2578 3230     e reg cmd1 0x%02
a0008e9c:	0d58 000a 6571 7720 6972 6574 6c20 6e65     X...qe write len
a0008eac:	2020 3020 2578 3230 0d58 000a 7263 6165        0x%02X...crea
a0008ebc:	2064 7573 7070 726f 2074 3020 2578 3230     d support  0x%02
a0008ecc:	0d58 000a 7263 6165 2064 6f63 6564 2020     X...cread code  
a0008edc:	2020 3020 2578 3230 0d58 000a 7562 7372        0x%02X...burs
a0008eec:	2074 7277 7061 6320 646d 3020 2578 3230     t wrap cmd 0x%02
a0008efc:	0d58 000a 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d     X...============
a0008f0c:	3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d 3d3d     ================
a0008f1c:	3d3d 3d3d 3d3d 3d3d 0d3d 000a 6c66 7361     =========...flas
a0008f2c:	2068 6e69 7469 6620 6961 216c 2121 0a0d     h init fail!!!..
a0008f3c:	0000 0000 7964 616e 696d 2063 656d 6f6d     ....dynamic memo
a0008f4c:	7972 6920 696e 2074 7573 6363 7365 2c73     ry init success,
a0008f5c:	6f20 7263 6d61 6820 6165 2070 6973 657a      ocram heap size
a0008f6c:	3d20 2520 2064 624b 7479 2065 0a0d 0000      = %d Kbyte ....
a0008f7c:	6973 3167 253a 3830 0d78 000a 6973 3267     sig1:%08x...sig2
a0008f8c:	253a 3830 0d78 000a 6763 6e65 3a31 3025     :%08x...cgen1:%0
a0008f9c:	7838 0a0d 0000 0000                         8x......

a0008fa4 <u8g2_font_wqy12_t_chinese3>:
a0008fa4:	003e 0203 0404 0403 0c05 000d 08fe 0afe     >...............
a0008fb4:	01ff 0261 04ce 2017 0005 0b4c 0721 4691     ..a.... ..L.!..F
a0008fc4:	538b 2200 3407 8b7d 14c8 0e23 c496 a89b     .S.".4}...#.....
a0008fd4:	5865 5ea2 2586 016a 0f24 3ca5 6cab 28a9     eX.^.%j.$..<.l.(
a0008fe4:	a899 4a25 8b65 2500 9610 9b3c e928 25a2     ..%Je..%..<.(..%
a0008ff4:	9a61 4944 2d17 2601 850e ab44 892c ac92     a.DI.-.&..D.,...
a0009004:	2532 a451 2704 3106 8afe 2801 b30b ab3d     2%Q..'.1...(..=.
a0009014:	4a24 6ea2 1651 0c29 3db3 2c8b a2ca 512e     $J.nQ.)..=.,...Q
a0009024:	0112 0c2a 4475 4aab a0e5 4d2c 0011 0b2b     ..*.uD.J..,M..+.
a0009034:	4477 b8bc 0c36 5c59 2c03 3207 0b3e 0145     wD..6.Y\.,.2>.E.
a0009044:	062d 6415 418b 062e c621 010a 0c2f 3cc4     -..d.A..!.../..<
a0009054:	a6bb 94ac b295 001a 0a30 4485 259b 2df3     ........0..D.%.-
a0009064:	0059 0931 4485 b18b 834f 3200 850b 9b44     Y.1..D..O..2..D.
a0009074:	0b25 6d6b 0083 0c33 4485 218b 930d 0c35     %.km..3..D.!..5.
a0009084:	0507 0e34 c486 2d3b ba89 c964 a630 0009     ..4...;-..d.0...
a0009094:	0d35 4485 218b c309 0d21 41c3 3601 850d     5..D.!..!..A.6..
a00090a4:	9b44 0c25 2487 25b3 000b 0b37 4485 418b     D.%..$.%..7..D.A
a00090b4:	85ac 5859 3802 850d 9b44 d325 2592 25b3     ..YX.8..D.%..%.%
a00090c4:	000b 0d39 4485 259b 25b3 a843 0b25 3a00     ..9..D.%.%C.%..:
a00090d4:	6106 0944 3b49 8209 8b3e 5621 0014 083c     .aD.I;..>.!V..<.
a00090e4:	4495 accb 076b 083d 5c35 418b 041d 093e     .D..k.=.5\.A..>.
a00090f4:	4495 b48b 475b 3f00 950d 9b44 d325 48c2     .D..[G.?..D.%..H
a0009104:	a1cb 0230 1440 3ca7 adac 4892 225a 4a29     ..0.@..<...HZ")J
a0009114:	a945 8948 6592 0013 0e41 4487 38bc c24d     E.H..e..A..D.8M.
a0009124:	2b24 4a0d 06aa 0d42 c486 418b c509 0961     $+.J..B....A..a.
a0009134:	c38d 4302 860c 9bc4 0921 8ed5 90c9 4400     ...C....!......D
a0009144:	870d 8c44 0a41 d493 3263 0048 0a45 4485     ..D.A...c2H.E..D
a0009154:	638b 8c38 41c5 0b46 4485 638b 2438 2361     .c8..AF..D.c8$a#
a0009164:	4700 860d 9bc4 0921 dad5 2628 0083 0b48     .G....!...(&..H.
a0009174:	c486 d08b 0c38 63a2 4900 8308 8a44 ea25     ....8..c.I..D.%.
a0009184:	4a65 a308 aa34 b4fe 4b00 850d 8b44 4a4c     eJ..4....K..D.LJ
a0009194:	9a4a 4496 2c95 094c 4485 b08b 838f 4d00     J..D.,L..D.....M
a00091a4:	8710 0c44 c86d 8a96 9152 2922 d552 4e00     ..D.m...R.")R..N
a00091b4:	860d 8bc4 5370 2922 46d1 0063 0c4f 4487     ....pS").Fc.O..D
a00091c4:	adac ba92 5926 0136 0c50 4485 218b 6cc9     ....&Y6.P..D.!.l
a00091d4:	1283 0116 0d51 3c97 adac ba92 5926 27b6     ....Q..<....&Y.'
a00091e4:	5200 8610 8bc4 ca21 2c92 92c9 6a21 c24b     .R....!..,..!jK.
a00091f4:	5300 850c 9b44 4c41 30d7 141c 5400 8709     .S..D.AL.0...T..
a0009204:	8c44 1643 0df7 0a55 c486 d08b c98f 0090     D.C...U.........
a0009214:	0f56 4487 548c b24d ab28 4984 671a 5700     V..D.TM.(..I.g.W
a0009224:	8911 8d44 d32c ad32 29d2 4a69 8ada 0459     ..D.,.2..)iJ..Y.
a0009234:	0d58 c486 508b a24c 8b4c 425a 5931 870b     X....PL.L.ZB1Y..
a0009244:	8c44 c934 692a 0ddc 0a5a 4487 438c e7da     D.4.*i..Z..D.C..
a0009254:	0861 095b 3eb3 218b 4fea 5c03 a50c 8b3c     a.[..>.!.O.\..<.
a0009264:	0d30 30d3 d30d 5d30 b309 8b3d 3fa9 010d     0..0..0]..=..?..
a0009274:	085e 7435 2cab 05a9 065f 3c15 418b 0760     ^.5t.,.._..<.A`.
a0009284:	fd32 248a 610a 650c 9b44 4b25 4d06 864b     2..$.a.eD.%K.MK.
a0009294:	6200 850c 8b44 1c30 cc92 506d 6300 6408     .b..D.0...mP.c.d
a00092a4:	9ac4 6b21 641c 850b cb44 a0ca 25b9 0043     ..!k.d..D....%C.
a00092b4:	0b65 4465 259b 861b 1d30 6602 8309 9a44     e.eD.%..0..f..D.
a00092c4:	8869 013a 0c67 3485 419b 4b73 3086 0059     i.:.g..4.AsK.0Y.
a00092d4:	0b68 4485 308b 921c 5bcc 6900 8107 8944     h..D.0...[.i..D.
a00092e4:	1864 086a b4a2 2c99 65e9 0d6b 4485 b08b     d.j....,.ek..D..
a00092f4:	9494 24b4 64aa 6c01 8107 8944 0083 0e6d     ...$.d.l..D...m.
a0009304:	4467 458c 2289 9229 2922 0a92 096e 4465     gD.E.").")..n.eD
a0009314:	218b bcc9 6f05 650a 9b44 7325 164b 7000     .!...o.eD.%sK..p
a0009324:	850c 8b34 c921 06dc 0c25 7101 850b 9b34     ..4.!...%..q..4.
a0009334:	7341 864b 00b0 0872 4463 218a 04ea 0c73     AsK...r.cD.!..s.
a0009344:	4465 259b d44b 4b24 0016 0a74 4483 288a     eD.%K.$K..t..D.(
a0009354:	a21a 0136 0975 4465 cc8b 325b 7604 650c     ..6.u.eD..[2.v.e
a0009364:	8b44 4b4c 494a 4616 7700 670e 8c44 9228     D.LKJI.F.w.gD.(.
a0009374:	a522 74a2 b28b 7804 650b 8b44 a92c 6a55     "..t...x.eD.,.Uj
a0009384:	005a 0d79 3485 4c8b 4a4b 1649 6166 7a06     Z.y..4.LKJI.fa.z
a0009394:	650a 8b44 cc41 06da 7b01 a30b aa3c aa24     .eD.A....{..<.$.
a00093a4:	5164 005b 077c beb1 078a 7d01 a30b 8a3c     dQ[.|......}..<.
a00093b4:	aa2c 5125 044b 077e dc26 c91b 8002 950f     ,.%QK.~.&.......
a00093c4:	2b44 92a9 510d 4436 1461 0029 0000 1000     D+...Q6Da.).....
a00093d4:	4353 9a09 745e f209 e86c a30a ffff 1320     SC..^t..l..... .
a00093e4:	1b08 8e65 0107 004e 2b0a 7e64 1928 020e     ..e...N..+d~(...
a00093f4:	034e ba16 ce3d ca1c 1ca1 c4ca 1a21 2874     N...=.......!.t(
a0009404:	7287 6c28 041d 074e ab15 8e3c 3107 72c7     .r(l..N...<..1.r
a0009414:	906c 38b3 c34b ac34 a166 4e06 0f09 3cab     l..8K.4.f..N...<
a0009424:	e19e cbce e430 1c7c 020e 0a4e bb17 de3c     ....0.|...N...<.
a0009434:	cb1c 1cb1 b1cb ce41 1cb1 b1cb 4b1c 8387     ......A......K..
a0009444:	4e00 160b 3cab 078e c735 4c72 9287 891c     .N...<..5.rL....
a0009454:	28f2 b1cf 4b1c 4e01 190d 3cbb 078e c739     .(...K.N...<..9.
a0009464:	2872 9487 8938 28c2 b28b cc50 1cb1 014b     r(..8..(..P...K.
a0009474:	0e4e bb19 be3c cb1c 61b1 72d0 c72c 2186     N...<....a.r,..!
a0009484:	92c7 8861 2c72 f2c7 4e09 1816 3cbb 28de     ..a.r,...N...<.(
a0009494:	8a8c 6951 4838 518d 2a31 4346 6398 3639     ..Qi8H.Q1*FC.c96
a00094a4:	4e1c 1b1a 3cbb 28ce f28f d228 4aa2 c954     .N...<.(..(..JT.
a00094b4:	2892 92c9 8e48 28f2 b28f 20e1 1c4e ba18     .(..H..(... N...
a00094c4:	ce3d 4a1c 4387 c496 3a51 720c c929 494a     =..J.C..Q:.r).JI
a00094d4:	6598 0023 244e bb1a 8e3c 2d07 a3ca 3874     .e#.N$..<..-..t8
a00094e4:	5125 d44b 8962 48a4 462a 1479 002b 2a4e     %QK.b..H*Fy.+.N*
a00094f4:	ba16 ce3d ca1c 7291 4616 996d 4398 9439     ..=....r.Fm..C9.
a0009504:	3943 0294 2d4e b916 ce3d 091c 4387 6996     C9..N-..=....C.i
a0009514:	9699 070d 98ad 3923 0212 3a4e b919 9e3d     ......#9..N:..=.
a0009524:	4e28 2472 8e1c 2859 5165 4592 9449 5926     (Nr$..Y(eQ.EI.&Y
a0009534:	2aa4 4e00 163b 3cbb 1cce 874c 9a83 3963     .*.N;..<..L...c9
a0009544:	0f16 1ce7 b1cb 3874 4e08 1548 3cbb 1cde     ......t8.NH..<..
a0009554:	a1cb ca1c b0d2 2877 4b4b 21c3 03ca 4b4e     ......w(KK.!..NK
a0009564:	bb17 ce3c 8c1c 3b87 4394 9439 3943 2394     ..<....;.C9.C9.#
a0009574:	123a e1c5 4e30 175d 3dba 1cbe a1ca 1878     :...0N]..=....x.
a0009584:	28e2 e28e cd28 2cd2 c24a 1e48 5f4e bb1b     .(..(..,J.H.N_..
a0009594:	de3c cb1c 48a3 968b c86c 2992 252b a8b5     <....H..l..)+%..
a00095a4:	8518 9e51 830d 4e00 1a66 3cbb 2cce 950e     ..Q....Nf..<.,..
a00095b4:	5061 2cc2 a2ce 20e1 61a6 461a 9a49 31c5     aP.,... .a.FI..1
a00095c4:	4e00 1286 3db9 f78e 9eb2 3923 2392 1239     .N...=....#9.#9.
a00095d4:	7927 4e0a 178b 3cbb 74de 4838 518d 386d     'y.N...<.t8H.Qm8
a00095e4:	c967 5070 68b3 e738 0ac8 8c4e 8b0c 9e44     g.pP.h8...N...D.
a00095f4:	cee1 0e3f 0107 8e4e bb17 9e3c 9ce1 3963     ..?...N...<...c9
a0009604:	0e96 3507 72c7 c72c 2c72 5647 4e00 1491     ...5.r,.r,GV.N..
a0009614:	3cbb 61ae b9c8 070f 8731 ac72 1b5a 716e     .<.a....1.r.Z.nq
a0009624:	4e02 1892 3cbb 078e c731 6c72 c350 4c34     .N...<..1.rlP.4L
a0009634:	70c3 b1d8 cb1c 8386 4e00 1694 3cab e19e     .p.......N...<..
a0009644:	639c 9639 430f c59c 9c59 59c5 1c34 4e04     .c9..C..Y..Y4..N
a0009654:	1c9b 3cbb 28be 5a8f 5a94 4912 2949 124b     ...<.(.Z.Z.II)K.
a0009664:	1b25 21c2 8787 8721 8387 4e00 17a4 3cbb     %..!..!....N...<
a0009674:	74de e838 9678 92d6 092c 3cb3 a1c9 311c     .t8.x...,..<...1
a0009684:	03aa a74e bb17 de3c 3878 6164 a51c 29c3     ..N...<.x8da...)
a0009694:	72c7 872c 2c72 7287 4e0c 16ac 3cbb 74de     .r,.r,.r.N...<.t
a00096a4:	e838 30f0 6984 8698 90c3 6a97 992d 4e18     8..0.i.....j-..N
a00096b4:	16b2 3cbb 78de 6638 1279 070e 1e35 79ce     ...<.x8fy...5..y
a00096c4:	6b54 c4c9 4e00 16ba 3cbb 1cde b1cb cb1c     Tk...N...<......
a00096d4:	1cb1 a1cb 4724 59ea d25a 4e05 18c0 3cbb     ....$G.YZ..N...<
a00096e4:	72be 8696 1869 c32a 84a0 9869 6986 8698     .r..i.*...i..i..
a00096f4:	9869 4e01 16ce 3cbb 72be 6716 1671 7167     i..N...<.r.gq.gq
a0009704:	2696 498d 4b5b 9616 4e03 1dd6 3cbb 72be     .&.I[K...N...<.r
a0009714:	4696 2d49 264a 4865 929a 945a a2d4 8c44     .FI-J&eH..Z...D.
a0009724:	a892 ca31 0106 e34e bb19 be3c 4928 5aa3     ..1...N...<.(I.Z
a0009734:	1b39 6514 b24c 8b38 34c3 aa8c 1449 4e0b     9..eL.8..4..I..N
a0009744:	18e5 3dba 28fe 6a8e 1651 a2d5 5472 928b     ...=.(.jQ...rT..
a0009754:	1230 6293 8996 4e01 1cea 3cbb 28be 92cf     0..b...N...<.(..
a0009764:	892c 2c92 2309 4b29 c54a 092c 59ab 4612     ,..,.#)KJ.,..Y.F
a0009774:	2559 4e0d 1dec 3cbb 7aae 2c96 9251 5125     Y%.N...<.z.,Q.%Q
a0009784:	a53a 9449 5126 449a 1269 49a5 2694 2851     :.I.&Q.Di..I.&Q(
a0009794:	f64e bb1a be3c 5272 928d 1934 ada6 a612     N...<.rR..4.....
a00097a4:	30c9 6144 a61a 1a61 0066 f74e bb19 be3c     .0Da..a.f.N...<.
a00097b4:	8f28 a8d4 2a38 4b52 8c54 518a 2a31 5926     (...8*RKT..Q1*&Y
a00097c4:	4628 4e00 1cfd 3cbb 30be 928d 8b30 28b2     (F.N...<.0..0..(
a00097d4:	948b 8954 ad06 9594 52b2 6516 4c95 4f01     ..T......R.e.L.O
a00097e4:	1701 3cbb 1cde 91d3 0e28 d16b e610 1ad1     ...<....(.k.....
a00097f4:	51e5 a51e 21c3 184f bb1b be3c 18a8 5165     .Q...!O...<...eQ
a0009804:	0f16 2d17 324c 5335 24a3 928d 12a8 c495     ...-L25S.$......
a0009814:	4f01 171a 3cbb 1cde f24a 2d2c 8329 33a2     .O...<..J.,-)..3
a0009824:	d70d 0a1c 61c3 0050 204f bb18 be3c 9672     .....aP.O ..<.r.
a0009834:	c346 8614 30ca 5928 0d1c 9c53 c255 096a     F....0(Y..S.U.j.
a0009844:	464f bb1b be3c 4b1c 2d06 4aca 2459 4a0d     OF..<..K.-.JY$.J
a0009854:	2b29 a565 cb41 1cb1 864b 4f21 194d 3cbb     )+e.A...K.!OM..<
a0009864:	28be d2cf 4b1c 2186 91d1 d652 5594 34c2     .(...K.!..R..U.4
a0009874:	26ac 10c3 534f bb1b ae3c ce2c 64d2 a218     .&..OS..<.,..d..
a0009884:	d430 28c6 25a9 4951 44ab 1683 61a6 4f08     0..(.%QI.D...a.O
a0009894:	1a5c 3cbb 24be ea47 30d1 d525 4c29 21b2     \..<.$G..0%.)L.!
a00098a4:	672b 3671 5948 859c 4f00 1c60 3cbb 24be     +gq6HY...O`..<.$
a00098b4:	ea47 30d1 6925 6622 9449 a2d4 96a4 2544     G..0%i"fI.....D%
a00098c4:	2a2d 3546 4f0d 1d7f 3cbb f2be 4830 9a61     -*F5.O...<..0Ha.
a00098d4:	430c 44a2 9291 430c 4494 9469 59a4 251c     .C.D...C.Di..Y.%
a00098e4:	28e2 bf4f bb1e ae3c 1864 30a2 864d 4a21     .(O...<.d..0M.!J
a00098f4:	8aa2 0c32 a94a 1865 4aa2 c59a 9251 036e     ..2.J.e..J..Q.n.
a0009904:	dd4f bb1c be3c 1064 ac93 9594 4906 92cc     O...<.d......I..
a0009914:	1864 30a2 c6cd a928 5125 0663 e14f bb1c     d..0..(.%Qc.O...
a0009924:	be3c cf28 64d2 a218 921c a506 458e 9683     <.(..d.......E..
a0009934:	d163 45a0 6959 0050 5a50 bb1d ae3c 0b24     c..EYiP.PZ..<.$.
a0009944:	ac93 6594 53c3 aa25 5128 94b2 4e92 2949     ...e.S%.(Q...NI)
a0009954:	964b 9852 5005 21a8 3cbb 311e 2a4a 9483     K.R..P.!.<.1J*..
a0009964:	d126 0c32 164a d126 2510 5489 8689 5128     &.2.J.&..%.T..(Q
a0009974:	4aa2 38d4 0024 cf50 bb1f be3c 0868 2893     .J.8$.P...<.h..(
a0009984:	864c 5221 894a 0c34 5649 944a 255a 944c     L.!RJ.4.IVJ.Z%L.
a0009994:	52ad 4c4a 5100 173f 3cbb 72be 6716 1671     .RJL.Q?..<.r.gq.
a00099a4:	7167 6716 9671 5186 4692 00fa 4351 aa15     gq.gq..Q.F..QC..
a00099b4:	9e3d d061 c3e9 8b21 28e2 d2cd 4a2c 48c2     =.a...!..(..,J.H
a00099c4:	511e 1845 3dba 70de 8438 9239 c365 4620     .QE..=.p8.9.e. F
a00099d4:	1849 51c5 459a 68b5 511d 1a46 3dba 28be     I..Q.E.h.QF..=.(
a00099e4:	5a8b 494a 4494 946a 534a 4512 3552 928b     .ZJI.Dj.JS.ER5..
a00099f4:	9230 5107 1948 3cbb 3cde 87ca ca41 30d2     0..QH..<.<..A..0
a0009a04:	0e1d 945a 7947 4594 b659 010e 4951 bb17     ..Z.Gy.EY...QI..
a0009a14:	de3c 6b38 a7aa 41c3 f28b 8f28 52b2 6516     <.8k...A..(..R.e
a0009a24:	3ad9 5104 194b 3cbb 74de a838 30f9 6984     .:.QK..<.t8..0.i
a0009a34:	8698 10c3 7927 4594 b659 010e 6551 bb17     ....'y.EY...Qe..
a0009a44:	3e3c cc1d 1cb1 a1cb 4724 59ea a59c 3cb5     <>......$G.Y...<
a0009a54:	a1c9 5100 1868 3cbb 1cde f24a 2d2c 8329     ...Qh..<..J.,-).
a0009a64:	e6a2 8e58 3a0c 6392 70f1 5101 146b 44ab     ..X..:.c.p.Qk..D
a0009a74:	3cee a3ca ca3c 38b3 8b4b 9669 3927 5114     .<..<..8K.i.'9.Q
a0009a84:	186c 3cbb 38fe c38b 186a 5165 6a16 1639     l..<.8..j.eQ.j9.
a0009a94:	61c5 0c38 9a62 5100 1573 3cbb b4ae 0e16     .a8.b..Qs..<....
a0009aa4:	1ce7 874b 9c43 4943 a59e 5d25 7651 bb16     ..K.C.CI..%]Qv..
a0009ab4:	be3c 70e2 e2cc ce41 41e2 b2ce a0e1 4b55     <..p..A..A....UK
a0009ac4:	027a 8551 ba16 ce3d 4a1c 8387 6a16 66a1     z.Q...=..J...j.f
a0009ad4:	292a a261 3a23 0f22 8c51 bb1e 9e3c 1921     *)a.#:".Q...<.!.
a0009ae4:	4aa2 12d4 44b5 70c9 a250 6a24 5a89 96a2     .J...D.pP.$j.Z..
a0009af4:	25a8 a24a 0149 8d51 bb19 8e3c 3507 861f     .%J.I.Q...<..5..
a0009b04:	2a30 430e 1518 d2a3 9070 30d2 430d 5109     0*.C....p..0.C.Q
a0009b14:	189b 3dba 078e 091d 61e3 7310 4a24 4187     ...=.....a.s$J.A
a0009b24:	870e 9a43 2143 5100 17e0 3cbb 41be e2ce     ..C.C!.Q...<.A..
a0009b34:	ce2c 2ce2 e2ce ce2c 30d2 462a 00f3 fa51     ,..,..,..0*F..Q.
a0009b44:	bb16 de3c 2b38 a565 34ac d39c 1430 3143     ..<.8+e..4..0.C1
a0009b54:	c314 01e1 fb51 bb16 de3c 8b1c 7387 a58e     ....Q...<....s..
a0009b64:	41c3 b38d 5652 4aca 05c3 0652 bb18 be3c     .A..RV.J..R...<.
a0009b74:	9672 d316 4f2c 6192 c248 ce2c b0d2 891a     r...,O.aH.,.....
a0009b84:	001a 0752 bb1b ae3c 8b1c 2986 a28c 1a29     ..R...<....)..).
a0009b94:	a8c2 5518 92a2 4594 3559 29ac 5200 1b20     ...U...EY5.).R .
a0009ba4:	3cbb 658e ba53 5d28 2e94 21c3 ba51 5d28     .<.eS.(]...!Q.(]
a0009bb4:	2e94 9b4a a6d2 0658 2952 bb1d 4e3c 1931     ..J...X.R)..<N1.
a0009bc4:	2c93 864c a941 4985 25b4 1291 4d25 2249     .,L.A..I.%..%MI"
a0009bd4:	59c5 859c 5203 1f2b 3cbb 419e b24c c930     .Y...R+..<.AL.0.
a0009be4:	24a2 a419 0b24 6193 6a50 5251 92ca 5652     .$..$..aPjQR..RV
a0009bf4:	3309 00d3 3052 bb1d 8e3c 5643 d28e 16a4     .3..R0..<.CV....
a0009c04:	c325 d4a0 24c2 a419 0b24 2c93 86ce 486c     %....$..$..,..lH
a0009c14:	5207 1d36 3cbb 38be 2629 b0c9 5224 0c98     .R6..<.8)&..$R..
a0009c24:	5283 930b 5864 253a b29d a2a4 0715 3752     .R..dX:%......R7
a0009c34:	bb1d 9e3c 4b61 2cc2 9619 2ca6 6529 3249     ..<.aK.,...,)eI2
a0009c44:	152c 45a5 a2e9 94f4 616c 5236 1b4d 3dba     ,..E....la6RM..=
a0009c54:	30ae b28d 90e1 4383 aa52 8694 54a4 0d29     .0.....CR....T).
a0009c64:	a949 2516 02ca 6a52 bb1a be3c 70da a250     I..%..Rj..<..pP.
a0009c74:	1a30 a892 8a25 2486 d36a e1e1 461a 049b     0...%..$j....F..
a0009c84:	9b52 b915 ce3d c91c 7091 6638 5661 c2cc     R...=....p8faV..
a0009c94:	4d28 7162 5201 1ca0 3cbb 1cae 91cb 1961     (Mbq.R...<....a.
a0009ca4:	4aa2 12d4 44b5 512d 944b 4964 b494 5a0c     .J...D-QK.dI...Z
a0009cb4:	5254 18a1 3cbb 1cbe 461b 8c2d 1c92 11ca     TR...<...F-.....
a0009cc4:	14db 861d 4b38 ccc3 5206 1ba8 3cbb 70fe     ....8K...R...<.p
a0009cd4:	7288 872c 8386 1512 62a3 4494 61a5 c2c9     .r,......b.D.a..
a0009ce4:	4b24 0523 b352 ba18 be3d 1b28 590e 0d94     $K#.R...=.(..Y..
a0009cf4:	3d07 878d cd41 5ac2 889a 0012 0553 bb1b     .=..A..Z....S...
a0009d04:	ae3c 1b1c 2906 868f a929 5945 1b29 2ca4     <....)..).EY)..,
a0009d14:	42ce ca25 61b3 5310 1916 3cbb 28be e28f     .B%..a.S...<.(..
a0009d24:	ca2c 992a c92d 48e2 ca4e 2959 852b 0043     ,.*.-..HN.Y)+.C.
a0009d34:	1753 bb1a be3c 8f28 28f2 a21c 8b48 28d6     S...<.(..(..H..(
a0009d44:	628f 4d29 4ca2 d5aa 0086 4153 bb17 de3c     .b)M.L....SA..<.
a0009d54:	cb1c 1cb1 874b 9a83 3963 6396 9639 2963     ....K...c9.c9.c)
a0009d64:	5300 1743 3cbb 6dee b1d0 4b1c 8387 639a     .SC..<.m...K...c
a0009d74:	9639 3963 6396 0029 4e53 bb19 be3c 56a8     9.c9.c).SN..<..V
a0009d84:	6cc9 b249 5945 1c29 74d2 a838 9639 2963     .lI.EY)..t8.9.c)
a0009d94:	5300 1755 3cbb 7abe 0e92 aca7 9c34 d2b2     .SU..<.z....4...
a0009da4:	4e70 8387 639a 0029 5753 bb1a de3c 3874     pN...c).SW..<.t8
a0009db4:	f1a8 4a70 24b2 44aa 70d1 4aca 29c3 652b     ..pJ.$.D.p.J.)+e
a0009dc4:	0291 5a53 bb1d 9e3c aa30 830c 8612 30cb     ..SZ..<.0......0
a0009dd4:	a255 30d2 a255 3868 5124 94d6 12a5 5300     U..0U.h8$Q.....S
a0009de4:	1761 3cbb 1cce e41b 8b1c 8387 6398 8e49     a..<.........cI.
a0009df4:	7944 e716 0c58 7053 ba19 be3d 1a78 4cc6     Dy..X.Sp..=.x..L
a0009e04:	06cc 1325 3133 9293 886c 2512 a1cc 5310     ..%.31..l..%...S
a0009e14:	1c74 3cbb 1cbe 86cb 5064 aca2 9594 5386     t..<....dP.....S
a0009e24:	2a56 4946 24a4 52ca 32c7 5300 1c9f 3cbb     V*FI.$.R.2.S...<
a0009e34:	e1ae c594 b0c9 6125 0c96 125b c966 95b0     ......%a..[.f...
a0009e44:	b693 8a24 4896 530b 17bb 3cbb 1cde 87cb     ..$..H.S...<....
a0009e54:	cf21 74b1 a838 5439 b30e 16e1 0027 c853     !..t8.9T....'.S.
a0009e64:	ab15 9e3c 98e1 e586 8e2c a472 e50e 2e90     ..<.....,.r.....
a0009e74:	b349 5300 1acc 3cab 078e 8931 a25a 292c     I..S...<..1.Z.,)
a0009e84:	5985 6612 9649 2d64 1a52 61c5 5300 1acd     .Y.fI.d-R..a.S..
a0009e94:	3cbb 6dfe 7390 c72c 4186 b24b 4a30 2cd2     .<.m.s,..AK.0J.,
a0009ea4:	92cd ca30 44a2 5315 19d1 3cbb c6ae 8b28     ..0..D.S...<..(.
a0009eb4:	78b2 8438 3639 59c8 549a 34b3 a44b 1448     .x8.96.Y.T.4K.H.
a0009ec4:	d653 bb1f 8e3c 9473 4a0c 6494 90c9 4964     S...<.s..J.d..dI
a0009ed4:	8954 2886 6a89 2925 a41a 4d24 54a2 530c     T..(.j%)..$M.T.S
a0009ee4:	17d7 3dba 69ee b290 4a24 d293 d070 6891     ...=.i..$J..p..h
a0009ef4:	a358 8f5c 55a4 e353 990c 8e45 dc87 e1f7     X.\..US...E.....
a0009f04:	07a0 e453 bb18 de3c 4b1c 8387 639a 30f9     ..S...<..K...c.0
a0009f14:	6984 8698 3869 610c 011a ea53 ba18 ae3d     .i..i8.a..S...=.
a0009f24:	c861 2cd2 d2cd cd2c 2186 c34b 4c2c 5ca3     a..,..,..!K.,L.\
a0009f34:	0247 ef53 ab18 8e3c 1d07 8709 8c28 518a     G.S...<.....(..Q
a0009f44:	8871 a8c2 e58e 8e58 004c f053 b916 ce3d     q.....X.L.S...=.
a0009f54:	56bc 864d 923b 430c 4694 9469 c346 0090     .VM.;..C.Fi.F...
a0009f64:	f753 bb19 ae3c 0861 70d3 7218 3878 3988     S...<.a..p.rx8.9
a0009f74:	ec34 8e58 51e5 688e 5300 1af8 3cba e19e     4.X..Q.h.S...<..
a0009f84:	0d0e 1c97 864a 0929 24a3 928c ca61 1ca1     ....J.)..$..a...
a0009f94:	178a 5400 1a04 3cbb 1cbe 461b 8b31 88ea     ...T...<...F1...
a0009fa4:	448e 18a9 c329 85a0 9869 130e 5400 1908     .D..)...i....T..
a0009fb4:	3cbb 1cde f24a 2d2c 8329 c3a2 10c3 61a6     .<..J.,-)......a
a0009fc4:	0e1a 9843 0046 0c54 ba19 8e3c 1d07 8651     ..C.F.T...<...Q.
a0009fd4:	4745 21a4 4a92 4952 221a a4a9 ba23 5400     EG.!.JRI."..#..T
a0009fe4:	190d 3cba 1cbe 861a cc2c 2892 74cb 1f24     ...<....,..(.t$.
a0009ff4:	6a0e 6696 3669 010c 0e54 bb1a fe3c 906d     .j.fi6..T...<.m.
a000a004:	6c73 e538 8e58 c325 8496 3151 868a 0b25     sl8.X.%...Q1..%.
a000a014:	0013 1154 ba18 ce3c 891c 8387 488e 2443     ..T...<......HC$
a000a024:	a495 3492 3a44 23a2 00f2 2754 bb1a ce3c     ...4D:.#..T'..<.
a000a034:	5961 a4a2 d253 e929 b494 cb0c 2712 2c75     aY..S.)......'u,
a000a044:	d30d 1874 4a54 bb19 ae3c 947a 830f e594     ..t.TJ..<.z.....
a000a054:	3a58 741c 1878 34c2 c34c 8861 5400 1858     X:.tx..4L.a..TX.
a000a064:	3cbb 61ae d308 1870 7c72 e538 5651 4aca     .<.a..p.r|8.QV.J
a000a074:	2895 b2cc 5475 1a8c 3cbb 794e b2c7 90e1     .(..uT...<Ny....
a000a084:	5944 9a29 4a4a e929 6524 9651 590d 540e     DY).JJ).$eQ..Y.T
a000a094:	16c1 3dba 61ae 38ec e8ec 0d10 4952 492a     ...=.a.8....RI*I
a000a0a4:	41a5 a41a 5406 1acd 3cbb 1cfe 970a 5061     .A...T...<....aP
a000a0b4:	4aaa 5165 28ba 865d 5924 34c2 c34c 5550     .JeQ.(].$Y.4L.PU
a000a0c4:	192e 3cbb 2cae 4e1e 3a59 6a5c 30f1 e568     ...<.,.NY:\j.0h.
a000a0d4:	14e1 7167 0c36 000a 4655 bb1d de3c 3874     ..gq6...UF..<.t8
a000a0e4:	c568 54e1 2a89 1259 a70d 4b24 64a2 a250     h..T.*Y...$K.dP.
a000a0f4:	4b24 58a2 5601 2068 3cbb 219e a219 d44a     $K.X.Vh .<.!..J.
a000a104:	4512 3243 51c4 1c34 dab4 0ca0 944a 2d44     .EC2.Q4.....J.D-
a000a114:	3451 4324 5602 17db 3da9 878e 8928 24a4     Q4$C.V...=..(..$
a000a124:	9292 4a48 2522 661a 387d 01e8 de56 ba18     ..HJ"%.f}8..V...
a000a134:	8e3d 1d07 11d1 8869 92a4 9254 4886 e92a     =.....i...T..H*.
a000a144:	f0c8 048e e056 bb19 8e3c a18f 2a18 90c3     ....V...<....*..
a000a154:	a188 6a18 2649 9165 2692 343a 563c 19fd     ...jI&e..&:4<V..
a000a164:	3dba 078e 511d 4586 b50b 1950 2d16 b489     .=...Q.E..P..-..
a000a174:	1928 91de 20e1 fe56 ba19 8e3d 2907 0695     (.... V...=..)..
a000a184:	14c5 9a4d 1a54 6892 3308 142d e1b3 5720     ..M.T..h.3-... W
a000a194:	1828 3dba 1cce 874a 9643 5923 55a8 4192     (..=..J.C.#Y.U.A
a000a1a4:	66ab 9669 830e 5700 1e30 3cbb 30ae 928d     .fi....W0..<.0..
a000a1b4:	4a34 432a 6c92 92d1 4a25 4a2d 516a 29b2     4J*C.l..%J-JjQ.)
a000a1c4:	2da5 078c 5701 1b3a 3cbb 64ae d2d8 36b0     .-...W:..<.d...6
a000a1d4:	7144 0c32 9651 5a94 29a2 b31a cc50 0511     Dq2.Q..Z.)..P...
a000a1e4:	3e57 bb1c ae3c d864 594a 1929 6294 4c96     W>..<.d.JY)..b.L
a000a1f4:	a959 2918 522d 6696 1649 0169 4057 bb1d     Y..)-R.fI.i.W@..
a000a204:	ae3c 0d30 30d3 961b 4a34 a886 4692 1a49     <.0..0..4J...FI.
a000a214:	e925 6490 125a 830f 5700 1a5b 3cbb 1cae     %..dZ....W[..<..
a000a224:	068b 472d 1c86 864a 0a21 2cd3 4296 38ad     ..-G..J.!..,.B.8
a000a234:	620c 571a 1a83 3cbb 2cae d30e 3868 48e8     .b.W...<.,..h8.H
a000a244:	9594 a6b2 896c 3112 b1c9 1878 5702 1bdf     ....l..1..x..W..
a000a254:	3cbb 54ae 934b 1928 620e 2965 9d25 4592     .<.TK.(..be)%..E
a000a264:	2313 a94d 8949 059c 9958 bb1f 9e3c 8c34     .#M.I...X...<.4.
a000a274:	2186 4a89 d283 0d14 9243 d163 2430 3a43     .!.J....C.c.0$C:
a000a284:	4b25 3498 430e 5800 19f0 3cbb 74de a838     %K.4.C.X...<.t8.
a000a294:	30f9 f8e8 6830 9651 830d 4396 9439 0063     .0..0hQ....C9.c.
a000a2a4:	f358 bb16 de3c 3874 f9a8 e830 f0e8 650e     X...<.t8..0....e
a000a2b4:	9c83 c545 1e68 0459 bb1a ae3c 0d30 21d3     ..E.h.Y...<.0..!
a000a2c4:	a349 ab44 d4f4 c512 9a59 6144 c626 0043     I.D.....Y.Da&.C.
a000a2d4:	0759 bb19 be3c 1b1c 2d46 768c 5124 e1c5     Y...<...F-.v$Q..
a000a2e4:	2a31 430e 1518 2187 5902 1b0d 3cbb 1cae     1*.C...!.Y...<..
a000a2f4:	2e1b 946a 430c 8698 90c3 d0e6 4430 1d52     ..j..C......0DR.
a000a304:	0711 0869 1659 bb1b ae3c 0d30 21d3 a349     ..i.Y...<.0..!I.
a000a314:	cc24 2912 9289 54a2 e28c 0d2c 19ab 5900     $..)...T..,....Y
a000a324:	171a 3db9 7cce c2d0 8928 5562 a4c9 0b41     ...=.|..(.bU..A.
a000a334:	2513 a58a 0441 2759 bb16 de3c cb1c 74b1     .%..A.Y'..<....t
a000a344:	a838 9639 4943 d48e b4b3 0ba4 2959 bb16     8.9.CI......Y)..
a000a354:	9e3c 9ce1 3963 0e96 3507 9287 a91c 6967     <...c9...5....gi
a000a364:	1749 3459 bb17 be3c 4728 59ca e51e 3858     I.Y4..<.(G.Y..X8
a000a374:	e41c 4a1c 2cf2 e92d 5901 1639 3cbb 78de     ...J.,-..Y9..<.x
a000a384:	e738 3551 0da9 3507 9287 4b3c ba4b 5900     8.Q5...5..<KK..Y
a000a394:	1773 3cbb 1cce b1cb 3878 e568 0d2c 25d3     s..<....x8h.,..%
a000a3a4:	7487 d224 04d6 7959 bb1e ae3c 8d30 6c92     .t$...Yy..<.0..l
a000a3b4:	9248 4929 2896 4a59 a749 b2a4 4945 84aa     H.)I.(YJI...EI..
a000a3c4:	a349 083a 7d59 bb1b ae3c cb1c 4386 2598     I.:.Y}..<....C.%
a000a3d4:	9859 a564 4861 a18a c958 594a 4e94 5900     Y.d.aH..X.JY.N.Y
a000a3e4:	2082 3cbb 1cae 91cb 1941 a4a4 2516 24b5     . .<....A....%.$
a000a3f4:	b24a 4a24 48b2 22ca 5069 24a2 31d3 5b00     J.$J.H."iP.$.1.[
a000a404:	1850 3cbb 61ae a1c8 ca1c 1ca1 874b 9a83     P..<.a......K...
a000a414:	3963 2396 2875 5b06 1857 3cbb 78de 2438     c9.#u(.[W..<.x8$
a000a424:	2239 4a0d 439e 70e9 7350 c72c 6472 5b05     9".J.C.pPs,.rd.[
a000a434:	1958 3cbb 78ce 6838 9439 5b0c 899a 3259     X..<.x8h9..[..Y2
a000a444:	c29c 4c34 34c3 00da 665b ba18 9e3d 2b28     ..4L.4..[f..=.(+
a000a454:	d125 d070 6891 91d8 091c 4387 439a 08f9     %.p..h.....C.C..
a000a464:	835b bb18 de3c 3878 3924 a522 8e61 eb45     [...<.x8$9".a.E.
a000a474:	e48e 9c58 e1c5 0430 895b bb17 de3c 3878     ..X...0.[...<.x8
a000a484:	3924 85a2 3c69 b41c 96aa 48ef ada4 5b02     $9..i<.....H...[
a000a494:	1a8c 3cbb 78de 2438 2239 4a0d 0f0e 3087     ...<.x8$9".J...0
a000a4a4:	a3c9 ca3c aca2 0e92 5b01 1a9a 3cbb 78de     ..<......[...<.x
a000a4b4:	2438 a239 d923 c830 9479 4347 c518 3549     8$9.#.0.y.GC..I5
a000a4c4:	861b 5b00 189d 3cbb 1cce 874c 2877 861a     ...[...<..L.w(..
a000a4d4:	c73c 61f2 93c8 891c e1a2 5b20 189e 3cbb     <..a...... [...<
a000a4e4:	74ee 2438 2d65 b289 947a 870e 8738 3c92     .t8$e-..z...8..<
a000a4f4:	56cb 5b01 18a2 3dba 74ce 4838 3469 496c     .V.[...=.t8Hi4lI
a000a504:	6594 24b2 870d 6c28 261c 5b00 18a4 3cbb     .e.$..(l.&.[...<
a000a514:	74de 8778 6194 c248 ca1c 41d2 f3c9 c861     .tx..aH....A..a.
a000a524:	e1d3 5b20 19b6 3cbb 74de 8778 6194 b248     .. [...<.tx..aH.
a000a534:	ab24 46b4 b2a2 51a4 2b49 00aa bd5b bb1a     $..F...QI+..[...
a000a544:	de3c 7874 a2ca 3864 e966 8430 3151 262a     <.tx..d8f.0.Q1*&
a000a554:	a2dd 086c 0087 f95b bb1b 7e3c 1a24 74c2     ..l...[...<~$..t
a000a564:	8538 1259 8a96 9259 6125 8496 9a51 50e4     8.Y...Y.%a..Q..P
a000a574:	5c06 1c06 3cbb 2cae 068e 54a5 1253 4b35     .\...<.,...TS.5K
a000a584:	a8c2 0ca6 1283 b315 4c24 50c3 5c02 170f     ........$L.P.\..
a000a594:	3cbb 1cde b1cb 2a3c 5946 9594 50b2 e6ac     .<....<*FY...P..
a000a5a4:	1d48 018a 115c bb19 de3c cb1c 5291 649a     H...\...<....R.d
a000a5b4:	30a5 a2c9 c93c 1ca1 11ca 4779 5c00 1e31     .0..<.....yG.\1.
a000a5c4:	3cbb dabe d4b0 2891 0e19 9449 86d4 1aa4     .<.....(..I.....
a000a5d4:	5925 f4a2 24a2 a552 64a4 5c02 1c40 3cbb     %Y...$R..d.\@..<
a000a5e4:	61ae e2d0 186c 1cb4 4e1b 9479 510c aa25     .a..l....Ny..Q%.
a000a5f4:	4344 4494 5d25 5c01 184f 3cbb e1ae 4794     DC.D%].\O..<...G
a000a604:	29c3 b309 38a8 1a9c 5387 945b c545 5c08     .)...8...S[.E..\
a000a614:	1e5e 3cbb e19e 4794 29c3 928f 0b61 64d3     ^..<...G.)..a..d
a000a624:	a218 aa24 c324 c921 2532 1219 5c01 1671     ..$.$.!.2%...\q.
a000a634:	3db9 1cce b309 cb4c 4cb4 b4cb cb4c 6cb4     .=....L..L..L..l
a000a644:	e838 5d01 14e5 449b e19e 639c 9639 3963     8..]...D...c9.c9
a000a654:	6396 9639 070e 5d01 16f1 3cab 778e c72c     .c9....]...<.w,.
a000a664:	61b2 72d0 c72c 2c72 ea47 3448 5d1c 16f2     .a.r,.r,G.H4.]..
a000a674:	3daa 838e e50e 3950 061a 8729 4472 7447     .=....P9..).rDGt
a000a684:	1924 5e0e 1802 3cbb 1cde 874b 9a83 830f     $..^...<..K.....
a000a694:	6516 aca5 9594 5a92 4f54 5e01 1f08 3cbb     .e.....ZTO.^...<
a000a6a4:	64ae 9418 4b30 2cc2 8649 2941 4a45 5229     .d..0K.,I.A)EJ)R
a000a6b4:	2d4a 4b51 2894 1669 0067 165e bb1d ae3c     J-QK.(i.g.^...<.
a000a6c4:	4c34 41a3 921b 945a a2d4 32a4 6d2c 92ca     4L.A..Z....2,m..
a000a6d4:	5945 1b29 aca4 5e00 1926 3cbb a6ae 20e1     EY)....^&..<... 
a000a6e4:	4635 e1a5 5431 2186 1a89 62a3 e894 0029     5F..1T.!...b..).
a000a6f4:	385e bb19 ae3c e1b6 e490 3488 592c 0e98     ^8..<......4,Y..
a000a704:	3e7b 5a0c 9594 3922 5e05 1c55 3cbb 078e     {>.Z.."9.^U..<..
a000a714:	3aad 610c 0e1a 9843 d164 d070 2892 0e1a     .:.a..C.d.p..(..
a000a724:	6352 4894 5e00 1772 3cbb e19e 639c 9639     Rc.H.^r..<...c9.
a000a734:	070e c735 2c72 72c7 c72c 0052 735e bb17     ..5.r,.r,.R.^s..
a000a744:	9e3c 9ce1 d547 8ea4 c3a4 cd41 1cb1 b1cb     <...G.....A.....
a000a754:	4b1c 5e01 1774 3cbb 1cae 2e1b 3561 061e     .K.^t..<....a5..
a000a764:	9cad c385 ce41 1cb1 010b 765e bb16 ae3c     ....A.....^v..<.
a000a774:	16b4 c70e ce2c 2ce2 0e1b 395a c34b 066a     ....,..,..Z9K.j.
a000a784:	7b5e bb1c ae3c 8b1c 2986 a24f 8934 41d2     ^{..<....)O.4..A
a000a794:	f28e 4928 2c93 861c 0ea4 0045 7f5e bb17     ..(I.,....E.^...
a000a7a4:	de3c 4c1c 4387 6392 9639 3963 6396 9439     <..L.C.c9.c9.c9.
a000a7b4:	3963 5e06 188f 3cbb 78de 2438 9639 5b0c     c9.^...<.x8$9..[
a000a7c4:	ac25 870e 8c24 d58a 1b30 5e01 1894 3cbb     %...$...0..^...<
a000a7d4:	1cde 874c 9243 4d63 d449 6a25 472b 1671     ..L.C.cMI.%j+Gq.
a000a7e4:	830d 5e00 1a97 3cbb 78ee e538 3958 b21b     ...^...<.x8.X9..
a000a7f4:	3272 496c 2598 1461 4b0d 2616 5e00 19a6     r2lI.%a..K.&.^..
a000a804:	3cbb 78de 2438 7151 3538 4346 6398 b0c9     .<.x8$Qq85FC.c..
a000a814:	b545 4c50 05a6 005f bb17 9e3c 98e1 59c5     E.PL.._...<....Y
a000a824:	c59c 3659 b41c 986a d586 ce2c 5f00 190f     ..Y6..j...,.._..
a000a834:	3cbb 24ee a247 1c3c 720e 243a 9479 7167     .<.$G.<..r:$y.gq
a000a844:	6516 325a 02c4 155f ba19 8e3d 9a5b 59a5     .eZ2.._...=.[..Y
a000a854:	6832 3e49 590c a59a 9a59 4945 a598 5f01     2hI>.Y..Y.EI..._
a000a864:	1653 3db9 5ace aa25 a525 8ee1 48e4 0c32     S..=.Z%.%....H2.
a000a874:	923a c323 5f21 1b55 3cbb 61ae b1c8 1870     :.#.!_U..<.a..p.
a000a884:	2c72 0e1a 2d52 944c 4958 2895 32d2 0551     r,..R-L.XI.(.2Q.
a000a894:	625f bb1b 9e3c 8b61 a56a 1462 830e 4594     _b..<.a.j.b....E
a000a8a4:	28c5 a349 aa30 5945 dc54 5f00 1e88 3cbb     .(I.0.EYT.._...<
a000a8b4:	64be a2d0 ca2c 2506 b24a 20d2 4949 44a4     .d..,..%J.. II.D
a000a8c4:	2d49 462a 48c5 a2ca 5f30 1d97 3cbb 68ae     I-*F.H..0_...<.h
a000a8d4:	a2d0 ca2c 2506 b24a 20d2 48e9 9869 30d2     ..,..%J.. .Hi..0
a000a8e4:	8619 31a8 0094 ae5f bb1f ae3c 4da4 4a69     ...1.._...<..MiJ
a000a8f4:	2506 8687 5924 a22a 2512 294b 6529 a249     .%..$Y*..%K))eI.
a000a904:	4964 ad27 5f00 1eb7 3cbb 2cae 864d 3c6b     dI'.._...<.,M.k<
a000a914:	520c 45d2 8619 c728 4386 2512 4551 124b     .R.E..(..C.%QEK.
a000a924:	9065 5f00 18c3 3cbb 1cde a3cc ca3c 28d3     e.._...<....<..(
a000a934:	9389 5272 a44c 0d30 41e3 6002 1c00 3cbb     ..rRL.0..A.`...<
a000a944:	64ae a218 4a34 2cc2 a4d1 a2a4 2534 2551     .d..4J.,....4%Q%
a000a954:	4c6a 34c3 c34c 600c 1d27 3cbb 30ae 928d     jL.4L..`'..<.0..
a000a964:	512c 496a 0c32 294a b44b 1a34 30b4 d30d     ,QjI2.J)K.4..0..
a000a974:	4d30 2186 3b60 bb1a be3c 127a 430f 8698     0M.!`;..<.z..C..
a000a984:	3869 610c 679a 1251 1d25 6d13 0090 c560     i8.a.gQ.%..m..`.
a000a994:	bb1e ae3c 8d30 a506 2598 a0ca b314 1924     ..<.0....%....$.
a000a9a4:	a886 5a56 28b2 a2d9 14ac 0029 f360 bb1f     ..VZ.(....).`...
a000a9b4:	ae3c d068 2ca2 0e19 9459 cb45 54a0 d2b4     <.h..,..Y.E..T..
a000a9c4:	2620 9459 4944 44c7 241b 6100 1c0f 3cbb      &Y.DI.D.$.a...<
a000a9d4:	78de 6638 70d9 d290 1870 34c2 861c a92c     .x8f.p..p..4..,.
a000a9e4:	4945 2494 b0d2 6104 1f1f 3cbb 24fe 0e1a     EI.$...a...<.$..
a000a9f4:	1a49 430e 2512 294b 9289 5a28 91ac 4b54     I..C.%K)..(Z..TK
a000aa04:	496a 0d22 0013 0f62 bb1c ee3c 1b24 2892     jI"...b...<.$..(
a000aa14:	d24d 1868 a4a2 151e 24a3 a24c 8d30 a544     M.h......$L.0.D.
a000aa24:	090e 1062 bb1b ee3c 4724 68a2 2438 1a61     ..b...<.$G.h8$a.
a000aa34:	43a6 b512 2d44 a8b5 94a5 6224 6226 1c11     .C..D-....$b&b..
a000aa44:	3cbb a4ce 1536 70a3 6838 ae51 9944 4494     .<..6..p8hQ.D..D
a000aa54:	164a 5247 94d2 b144 6200 1c16 3cbb 24ee     J.GR..D..b...<.$
a000aa64:	a247 3864 e9c8 4490 512d 4434 8e49 53a8     G.d8...D-Q4DI..S
a000aa74:	8432 aa89 6205 1c34 3cbb 419e 6629 f0d1     2....b4..<.A)f..
a000aa84:	71d2 4a50 a749 a941 5925 0c34 5349 d465     .qPJI.A.%Y4.ISe.
a000aa94:	6202 1d40 3cbb 513e b6d1 1d30 3492 064a     .b@..<>Q..0..4J.
a000aaa4:	4a25 68a2 a248 5462 6a8c 2c95 004c 4b62     %J.hH.bT.j.,L.bK
a000aab4:	bb17 ee3c 1a21 2c74 ce1e 9639 070e c735     ..<.!.t,..9...5.
a000aac4:	2c72 5487 6200 174d 3cbb 1cfe 870b ac43     r,.T.bM..<....C.
a000aad4:	f523 ce28 30d2 7353 0ea4 0085 5362 bb1a     #.(..0Ss....bS..
a000aae4:	ae3c 8b1c 8386 a616 9261 6285 46a6 1a49     <.......a..b.FI.
a000aaf4:	61a6 6d1a 0013 6b62 bb1a ae3c 8b1c 8386     .a.m..bk..<.....
a000ab04:	e51a 9251 d246 e8a0 1e4a 51e5 dc34 0011     ..Q.F...J..Q4...
a000ab14:	8462 bb1b ae3c 0d30 41b3 b251 8928 512a     b...<.0..AQ.(.*Q
a000ab24:	45aa 9889 86b4 2cd5 545c 6200 1d8a 3cbb     .E.....,\T.b...<
a000ab34:	1cae 068b 5865 516a 4b52 9a94 4832 9a52     ....eXjQRK..2HR.
a000ab44:	7944 4614 21c5 061a a462 bb1a ae3c 2d30     Dy.F.!..b...<.0-
a000ab54:	c90d 1530 62a3 0ca4 948b 5126 e51e 3c49     ..0..b....&Q..I<
a000ab64:	00e4 a562 bb1d ae3c d068 2ca2 b619 2252     ..b...<.h..,..R"
a000ab74:	ba26 2c32 d252 a929 c545 a928 5a4c 6200     &.2,R.).E.(.LZ.b
a000ab84:	1bd2 3cbb 68ae aa98 1ec3 5a0d 65a2 164a     ...<.h.....Z.eJ.
a000ab94:	8349 ca52 794a 4e94 00c3 0963 bb1c ae3c     I.R.Jy.N..c...<.
a000aba4:	2d30 070d 12a9 a255 1954 2d16 4a4a 1652     0-....U.T..-JJR.
a000abb4:	598a 2d12 009a 6e63 bb1d ae3c 9868 c38a     .Y.-..cn..<.h...
a000abc4:	4610 30d1 5225 0ca8 d48b 0d12 b253 6d29     .F.0%R......S.)m
a000abd4:	6949 6310 1c89 3cbb 30ae 870d 1a53 5a0d     Ii.c...<.0..S..Z
a000abe4:	65a2 20ca 5949 1a52 30b4 864d 9843 6301     .e. IYR..0M.C..c
a000abf4:	1ca5 3cbb 30ae 864d 9283 84b5 30c9 5a44     ...<.0M......0DZ
a000ac04:	0ca8 9283 5945 84a4 e495 6316 1ecf 3cbb     ....EY.....c...<
a000ac14:	2cae 9309 20e1 6125 458e a4c3 1294 8929     .,... %a.E....).
a000ac24:	6894 2a98 6951 8538 6301 1fd2 3cbb 54ae     .h.*Qi8..c...<.T
a000ac34:	b68b 4b21 6193 c288 a954 a258 4948 4494     ..!K.a..T.X.HI.D
a000ac44:	a24a 2896 921a 0861 1c64 bb1d ae3c 9a4a     J..(..a.d...<.J.
a000ac54:	c928 4430 4a2d 2522 6951 88b8 9259 5b0c     (.0D-J"%Qi..Y..[
a000ac64:	cc54 45b4 641a 1e44 3cbb 64ae a218 4a2c     T..E.dD..<.d..,J
a000ac74:	6506 4ac8 9259 990c 5254 4186 a9e9 6956     .e.JY...TR.A..Vi
a000ac84:	b419 6428 1e58 3cbb 30ae 864d 9483 c984     ..(dX..<.0M.....
a000ac94:	4430 5449 5e1a 96a2 8964 4e92 b249 4a24     0DIT.^..d..NI.$J
a000aca4:	6428 1e78 3cbb 2cae 9309 20e1 6125 6834     (dx..<.,... %a4h
a000acb4:	9651 8329 6532 70d9 b30a 4b24 4532 6413     Q.).2e.p..$K2E.d
a000acc4:	20ad 3cbb 74ae 864a 486c 92da 8861 b52a     . .<.tJ.lH..a.*.
a000acd4:	1a29 6192 9288 65a8 a218 aa24 c328 6410     )..a...e..$.(..d
a000ace4:	1ace 3cbb 4b8e 449a 4bc3 9494 a5b2 0da2     ...<.K.D.K......
a000acf4:	1c43 870f 1d34 a20e 650a 1e36 3cbb 28be     C...4....e6..<.(
a000ad04:	c28f 1a28 24a6 224b 4a25 96a2 4a44 2522     ..(..$K"%J..DJ"%
a000ad14:	652b 546a c24c 6500 1e3f 3cbb 6cfe e258     +ejTL..e?..<.lX.
a000ad24:	c86c 2522 964a 9252 5125 2592 1251 c966     l."%J.R.%Q.%Q.f.
a000ad34:	8d14 ac49 6505 1c59 3cbb 4aae 2c36 1269     ..I..eY..<.J6,i.
a000ad44:	2f0d 9661 8344 6a52 2d29 31a5 92cd ca68     ./a.D.Rj)-.1..h.
a000ad54:	6502 2070 3cbb 288e 2629 3652 432c 8964     .ep .<.()&R6,Cd.
a000ad64:	2912 2529 c32d 4b52 24a2 b252 4b34 5b92     .))%-.RK.$R.4K.[
a000ad74:	6500 1687 3cbb 1cce 874c 5683 e2ce 4f2c     .e...<..L..V..,O
a000ad84:	a472 e50e 6d88 651d 21af 3cbb 289e 061c     r....m.e.!.<.(..
a000ad94:	8b45 438a 4614 90d1 510c b512 c324 4b52     E..C.F...Q..$.RK
a000ada4:	24a2 a4ca cc24 0012 b065 bb1d be3c 1874     .$..$...e...<.t.
a000adb4:	ad14 2692 3651 432c 4956 a586 2598 d251     ...&Q6,CVI...%Q.
a000adc4:	9b53 2592 6500 17b9 3cbb 1cce 874c 9883     S..%.e...<..L...
a000add4:	3963 a836 1a61 b356 0a38 0037 e065 bb18     c96.a.V.8.7.e...
a000ade4:	9e3c 9ce1 3963 0e96 3107 91c9 947a 5947     <...c9...1..z.GY
a000adf4:	6594 10eb e565 a70d 8e3e 6a83 ae1d e1d6     .e..e...>..j....
a000ae04:	651a 1cf6 3cbb 247e c21a 1a28 614e 8954     .e...<~$..(.NaT.
a000ae14:	21a2 a24a a896 1518 21a3 91cc 6609 190e     .!J......!...f..
a000ae24:	3cbb e1ee 4994 2935 4e1a 5499 a293 94e1     .<...I5).N.T....
a000ae34:	61a5 892d 04d4 2f66 bb18 be3c 0d61 61d3     .a-...f/..<.a..a
a000ae44:	d30d 8761 8387 8f54 2c86 66a9 10c3 3e66     ..a...T..,.f..f>
a000ae54:	bb1c ae3c 0861 70d3 c218 1c34 3886 a349     ..<.a..p..4..8I.
a000ae64:	ca24 5292 3496 e127 1070 7a66 ba1f 9e3d     $..R.4'.p.fz..=.
a000ae74:	1a1c 4192 a2c9 9061 6922 a248 5224 2186     ...A..a."iH.$R.!
a000ae84:	b34b c861 6cd2 1218 6600 19f4 3cbb e19e     K.a..l...f...<..
a000ae94:	c710 a0c3 b295 d061 d94a a830 0e49 88e5     ......a.J.0.I...
a000aea4:	1d6d 0067 bb1b ae3c 0861 70d3 c218 1a34     m.g...<.a..p..4.
a000aeb4:	4a0e 0f94 4aa7 0d14 2991 2792 6701 1908     .J...J...).'.g..
a000aec4:	3db9 61ae d288 8d28 2186 a34a 1a34 2886     .=.a..(..!J.4..(
a000aed4:	d28d 4c24 04e4 0967 bb18 ce3c 3878 3968     ..$L..g...<.x8h9
a000aee4:	8c36 9662 530c 1d31 30d6 d30d 024c 0d67     6.b..S1..0..L.g.
a000aef4:	bb25 9e3c 1921 2894 92c9 c928 2192 9649     %.<.!..(..(..!I.
a000af04:	4928 64a3 8650 4b24 24a2 2a91 9251 1525     (I.dP.$K.$.*Q.%.
a000af14:	9149 6702 1f1f 3cbb 289e 0e1a 9449 2d44     I..g...<.(..I.D-
a000af24:	3443 5124 10cb a255 3868 5124 251e 4951     C4$Q..U.h8$Q.%QI
a000af34:	0494 2c67 bb17 de3c 4b1c 8387 27b8 a4e5     ..g,..<..K...'..
a000af44:	d51a a25a 4a41 2c73 6705 1c3a 3cbb 1cae     ..Z.AJs,.g:..<..
a000af54:	868b 2a30 530d d518 2896 a453 d44a 1512     ..0*.S...(S.J...
a000af64:	2c93 c489 6701 1765 3cbb 78de 45b8 a4d5     .,...ge..<.x.E..
a000af74:	1c36 1cd4 93da 546a 32d2 0535 7f67 bb1d     6.....jT.25.g...
a000af84:	ae3c 8b54 61b6 f28f 9068 2c96 a652 94a4     <.T..a..h..,R...
a000af94:	4988 2616 9251 5a29 6700 1a97 3cbb 30ae     .I.&Q.)Z.g...<.0
a000afa4:	b30d 20e1 e185 2a16 94c9 4944 8d4f 9869     ... ...*..DIO.i.
a000afb4:	1986 6700 199c 3cbb 61ae a308 30e2 5184     ...g...<.a...0.Q
a000afc4:	1871 74f2 8838 527b 4a8d 265a 0768 bb1c     q..t8.{R.JZ&h...
a000afd4:	ae3c d068 6472 91d0 1864 30a2 42dc e929     <.h.rd..d..0.B).
a000afe4:	4494 a895 cd31 0034 0f68 bb1c ae3c 9462     .D..1.4.h...<.b.
a000aff4:	c945 4390 30c9 3a24 27b4 a0d1 b1d4 cb1c     E..C.0$:.'......
a000b004:	64b1 0218 2168 bb1b ae3c 0e2c 64d3 e838     .d..h!..<.,..d8.
a000b014:	9650 4b64 2916 4a2d 8496 2cd5 1309 684d     P.dK.)-J...,..Mh
a000b024:	1b37 3cbb 5aae 344b a41c 5c30 4906 92cc     7..<.ZK4..0\.I..
a000b034:	4d30 2186 d30a 0d30 0033 3c68 bb1c ae3c     0M.!..0.3.h<..<.
a000b044:	ce2c 6486 b248 634a 4a71 4532 a25b 8b41     ,..dH.JcqJ2E[.A.
a000b054:	52b2 1a56 0014 4c68 bb18 de3c ce41 2187     .RV...hL..<.A..!
a000b064:	c34c 0861 70d3 f218 3874 4d48 265a 6368     L.a..p..t8HMZ&hc
a000b074:	bb1c ae3c 8d30 6892 9458 4c2c 61a3 1399     ..<.0..hX.,L.a..
a000b084:	5525 61a2 a3ca 8a3c 0186 fd69 bb1e ae3c     %U.a..<...i...<.
a000b094:	092c e193 29a5 8619 e928 5c34 2ca4 0d29     ,....)..(.4\.,).
a000b0a4:	945a 0695 ca2d 0012 216b bb18 9e3c ce30     Z...-...k!..<.0.
a000b0b4:	68e2 b358 944a 9986 561a 30b2 1ac9 00d5     .hX.J....V.0....
a000b0c4:	4c6b bb1e 8e3c 1e4b 4b65 2834 c36d c4a0     kL..<.K.eK4(m...
a000b0d4:	b459 5164 4a52 2592 d24a cb24 00c6 636b     Y.dQRJ.%J.$...kc
a000b0e4:	ab16 8e3c 3507 f2c7 8f28 2d06 a3ca ca3c     ..<..5..(..-..<.
a000b0f4:	74a3 0838 646b bb1d be3c 1672 5167 4b52     .t8.kd..<.r.gQRK
a000b104:	64a2 92d1 4c2c 30b2 c2c9 8b24 6492 8689     .d..,L.0..$..d..
a000b114:	6b74 187b 3cbb 078e c72d 4bca 52d4 1292     tk{..<..-..K.R..
a000b124:	52a9 e28f 2a2c f346 6b00 1bcf 3cbb 1cae     .R..,*F..k...<..
a000b134:	2e1b 1439 6b0d 4512 41c3 cc6a 6c92 e438     ..9..k.E.Aj..l8.
a000b144:	8e48 0068 d26b bb18 de3c 3874 f1a8 4e70     H.h.k...<.t8..pN
a000b154:	8387 34d4 941c ca2c 4386 01ac d46b ba15     ...4..,..C..k...
a000b164:	8e3d a7b0 4c24 21a2 c2d1 28be 96d9 43a9     =...$L.!...(...C
a000b174:	6c00 1711 3dba 978e c93c e193 a592 3a59     .l...=..<.....Y:
a000b184:	c41c 9252 5929 0eb4 146c bb19 be3c 1b1c     ..R.)Y..l...<...
a000b194:	2c86 9287 ca61 61d1 72c7 ca2c 1ca3 43a9     .,..a..a.r,....C
a000b1a4:	6c02 1e60 3cbb b49e 6494 1261 9526 5931     .l`..<...da.&.1Y
a000b1b4:	44b2 45a9 4549 a64b 892c 2c92 c24c 6c41     .D.EIEK.,..,L.Al
a000b1c4:	1ba1 3cbb 6c9e a308 28c6 b28b 872d 6192     ...<.l...(..-..a
a000b1d4:	6a8b 1261 6289 6516 2889 d56c bb19 9e3c     .ja..b.e.(l...<.
a000b1e4:	98b4 8323 8712 3e69 510c 8998 5669 068a     ..#...i>.Q..iV..
a000b1f4:	16a5 6c06 1ae8 3cbb 309e b30e 186c 5a92     ...l...<.0..l..Z
a000b204:	a59c 1a61 8a0d a61a 1a61 c346 6d10 1a3b     ..a.....a.F..m;.
a000b214:	3cbb 589e b68b 4c38 4186 86ab 3469 5a28     .<.X..8L.A..i4(Z
a000b224:	2b29 8365 5594 6d00 1a41 3cbb b48e 0c32     )+e..U.mA..<..2.
a000b234:	ad6a 1865 38b2 9a4b a4a4 2516 929d 229e     j.e..8K....%..."
a000b244:	6d01 1c4e 3cbb b49e 0c32 9462 9125 449c     .mN..<..2.b.%..D
a000b254:	1261 4d4a 945a b295 ab28 1184 6d00 1a4f     a.JMZ...(....mO.
a000b264:	3cbb 289e 8a8d 90d2 2634 a4c5 25a9 996a     .<.(....4&...%j.
a000b274:	9e92 44b2 724f 6d01 1c6a 3cbb 309e 864e     ...DOr.mj..<.0N.
a000b284:	0b25 68a3 c518 192c a4b6 5536 92a2 2516     %..h..,...6U...%
a000b294:	48b5 6d13 1f77 3cbb 2c9e 868f cb21 6493     .H.mw..<.,..!..d
a000b2a4:	9310 64b6 a218 4a24 a912 4512 90c3 51e4     ...d..$J...E...Q
a000b2b4:	012a 886d bb1b 9e3c 97a8 30e6 8649 092d     *.m...<....0I.-.
a000b2c4:	68a3 8a98 b0db 6164 8592 9649 6d09 1dd8     .h....da..I..m..
a000b2d4:	3cbb 2c9e 868f 94d1 490c c945 64a2 a218     .<.,.....IE..d..
a000b2e4:	9b2c 4e92 5283 ca47 000a f16d bb1c 9e3c     ,..N.RG...m...<.
a000b2f4:	1868 24a2 d52d 24a2 2b4a 10c3 9985 55b8     h..$-..$J+.....U
a000b304:	894a 4954 0033 386e bb1f 9e3c 0b28 68a3     J.TI3.n8..<.(..h
a000b314:	b41b 92da 590c 9494 24b2 8619 8928 a25a     .....Y...$..(.Z.
a000b324:	544a 28b2 6e00 2490 3cbb 689e a218 8b24     JT.(.n.$.<.h..$.
a000b334:	64b2 a250 cb24 4194 6a4a 9251 430c 9594     .dP.$..AJjQ..C..
a000b344:	4492 4a4a a249 4a44 6e00 1ed1 3cbb 6c9e     .DJJI.DJ.n...<.l
a000b354:	a2d0 5e2c 498a 1929 4906 a4c9 5068 52b4     ..,^.I)..I..hP.R
a000b364:	4836 2959 148b 7000 176b 3cbb 1cde a3cb     6HY)...pk..<....
a000b374:	54ac 928c cb30 24a1 ea47 5a59 05d2 6f70     .T..0..$G.YZ..po
a000b384:	bb18 be3c 4b1c a586 4b29 4ab4 1518 30d3     ..<..K..)K.J...0
a000b394:	2b0d 5359 0259 b970 bb18 de3c cb1c 41b1     .+YSY.p...<....A
a000b3a4:	87ce 4c21 34c3 861c 4f1c 4aa2 1516 3671     ..!L.4...O.J..q6
a000b3b4:	bb1b ae3c ce2c 5092 1a6a 4506 934a 28d6     ..<.,..Pj..EJ..(
a000b3c4:	a309 aa2c a52a 164a 7215 1847 3cbb 30ae     ..,.*.J..rG..<.0
a000b3d4:	d30d 1d30 394e 6396 10c3 61a6 c59a 1e51     ..0.N9.c...a..Q.
a000b3e4:	7201 1859 3cbb e19e c790 1a59 c386 d621     .rY..<....Y...!.
a000b3f4:	7a91 6714 98d9 1a43 7200 1e69 3cbb 2cae     .z.g..C..ri..<.,
a000b404:	b24c 8930 8386 5152 a4b2 2524 a915 94a2     L.0...RQ..$%....
a000b414:	4ada a895 2992 7200 1e79 3cbb 30ae a24b     .J...).ry..<.0K.
a000b424:	1941 4ab2 2598 30c9 6244 0ca6 1283 b315     A..J.%.0Db......
a000b434:	4c24 6cc3 7302 1ba9 3cbb 21ee 7419 c724     $L.l.s...<.!.t$.
a000b444:	6872 a619 092c 24b3 4a5c 5262 928d 144c     rh..,..$\JbR..L.
a000b454:	b073 bb1e de3c 1941 ac92 d494 a4a2 2432     s...<.A.......2$
a000b464:	516d 8b52 9a92 4494 5262 928d 1b4c 0374     mQR....DbR..L.t.
a000b474:	bb1c fe3c 1924 96a4 8861 34c2 a24a 5241     ..<.$...a..4J.AR
a000b484:	50b2 94cc 294c cd4d 001a 0674 bb1a ce3c     .P..L)M...t...<.
a000b494:	a9e1 1865 24a2 896a e1a2 4c29 41a3 32d3     ..e..$j...)L.A.2
a000b4a4:	1f35 0086 1f75 bb15 ee3c 9c5a c3c5 ac25     5...u...<.Z...%.
a000b4b4:	c3e6 e790 8e58 c3a5 7521 1828 3cba e19e     ....X...!u(..<..
a000b4c4:	5592 cab2 c970 592a b865 9564 132c 3133     .U..p.*Ye.d.,.31
a000b4d4:	7512 1631 3db9 1cce 8709 9643 d969 d070     .u1..=....C.i.p.
a000b4e4:	2d32 b2d3 a0e1 7507 1535 3dba 1cce 874a     2-.....u5..=..J.
a000b4f4:	564b 2e19 2559 0cab b0d7 1075 4c75 bb18     KV..Y%....u.uL..
a000b504:	9e3c 94e1 8695 5653 ae1a ac49 4a49 6896     <.....SV..I.IJ.h
a000b514:	b0d5 019a c575 bb1a ee3c 3878 3924 1c34     ....u...<.x8$94.
a000b524:	30a2 8654 2941 74b5 344a 4a25 6cb5 7b76     .0T.A).tJ4%J.lv{
a000b534:	bb1b 9e3c 8921 8a5a 9449 c584 5061 2474     ..<.!.Z.I...aPt$
a000b544:	d61b 1d30 28e6 0e1b 7602 187e 3cab 078e     ..0..(...v~..<..
a000b554:	8735 6472 c218 4c34 61c3 d308 0d30 2187     5.rd..4L.a..0..!
a000b564:	7602 1984 3dba 2cae 0dac 30c9 5289 283a     .v...=.,...0.R:(
a000b574:	5499 4a92 3a52 52a8 00a6 d876 bb1f de3c     .T.JR:.R..v...<.
a000b584:	191c 24d6 a34a 1b24 590e 8512 1259 830e     ...$J.$..Y..Y...
a000b594:	4496 9649 4944 1c32 7604 0fee 3eb7 838e     .DI.DI2..v...>..
a000b5a4:	0eaa 7557 aab8 35c3 f876 bb1d be3c d068     ..Wu...5v...<.h.
a000b5b4:	2ca2 b619 a0d2 5945 64b4 6549 a218 295a     .,....EY.dIe..Z)
a000b5c4:	0d2b 945a 7705 1a0b 3cbb e19e 0f1c 1c83     +.Z..w...<......
a000b5d4:	070f 0c2d 2187 c24b 1a28 30d6 261d 7700     ..-..!K.(..0.&.w
a000b5e4:	171f 3dba 74ce 8438 30f9 8716 4c24 b086     ...=.t8..0..$L..
a000b5f4:	1c34 28b2 00b4 4077 bb19 be3c 70e2 87ce     4..(..w@..<..p..
a000b604:	8e21 8387 8616 9283 c925 1510 61d3 7702     !.......%....a.w
a000b614:	1be5 3cbb 1cae a1cb 1941 2ca4 4aca 29c3     ...<....A..,.J.)
a000b624:	652b 4aa5 c954 4192 00c7 ed77 bb1f 9e3c     +e.JT..A..w...<.
a000b634:	1868 1c92 065b 94a5 b295 4864 2d06 a2c7     h...[.....dH.-..
a000b644:	4a2c 24a2 a38b 186c 7802 1e01 3cbb 41de     ,J.$..l..x...<.A
a000b654:	c419 94ac a295 8921 6912 9218 4d28 41a2     ......!..i..(M.A
a000b664:	8649 8934 11da 7805 1c6c 3cbb e1de a590     I.4....xl..<....
a000b674:	30d1 a255 30e4 4d28 6549 1258 5c29 498a     .0U..0(MIeX.)\.I
a000b684:	4ba4 7803 1f9f 3cbb a4de 1c32 4aa4 4a2d     .K.x...<..2..J-J
a000b694:	25a6 9255 a961 c985 2830 a24b 5225 6612     .%U.a...0(K.%R.f
a000b6a4:	0051 c178 bb1f de3c 192c 24a2 864c 6a21     Q.x...<.,..$L.!j
a000b6b4:	a25b 3164 c925 4430 5449 a25a b12c 8b84     [.d1%.0DITZ.,...
a000b6c4:	7912 143a 3cab e19e 34ce d41c 2a3c 5946     .y:..<...4..<*FY
a000b6d4:	8594 5162 7905 1a3e 3cbb b49e 0d98 9c52     ..bQ.y>..<....R.
a000b6e4:	d1a5 69a0 12a1 4965 8698 9869 c326 7910     ...i..eI..i.&..y
a000b6f4:	1868 3cbb 078e 4931 5387 8a25 3b86 0c3e     h..<..1I.S%..;>.
a000b704:	3c39 a41c 9b26 7900 1abb 3cbb 74de 4838     9<..&..y...<.t8H
a000b714:	6349 4c54 871a 8f21 5387 944b 4a0c 2b14     IcTL..!..SK..J.+
a000b724:	7900 1ac1 3cbb 793e c34c 906c 2cd2 529d     .y...<>yL.l..,.R
a000b734:	98a5 5944 1865 62a2 2394 7900 1bcd 3cbb     ..DYe..b.#.y...<
a000b744:	293e d31b 7868 5a89 48a2 2529 30ca 6128     >)..hx.Z.H)%.0(a
a000b754:	a61a 1a61 0066 fb79 bb1b be3c 41da 0e2a     ..a.f.y...<..A*.
a000b764:	944b 1685 4c25 21a2 32d1 4a25 696a 6d18     K...%L.!.2%Jji.m
a000b774:	7a00 1d0b 3cbb 64be a650 94ac 4325 6832     .z...<.dP...%C2h
a000b784:	a639 920c 8512 a0d2 d314 4d30 2186 977a     9.........0M.!z.
a000b794:	ba1e de3d 3870 6128 ca52 e192 4490 9459     ..=.p8(aR....DY.
a000b7a4:	d30c 4494 5491 9289 1868 0014 cb7a bb17     ...D.T..h...z...
a000b7b4:	de3c 4c1c 4387 878e 1869 7947 2794 1639     <..L.C..i.Gy.'9.
a000b7c4:	070e 7b01 1b14 3cbb 309e 921d 6941 0daa     ...{...<.0..Ai..
a000b7d4:	3449 d8e4 0e10 3639 832c a58e 30e9 2c7b     I4....96,....0{,
a000b7e4:	bb1c 9e3c 1d30 4192 aa69 830c 459c 29c3     ..<.0..Ai....E.)
a000b7f4:	878b 9643 5184 d149 0052 497b bb19 9e3c     ..C..QI.R.{I..<.
a000b804:	1d30 6192 a24a 386c c3a7 0f41 6387 4796     0..aJ.l8..A..c.G
a000b814:	a439 7b01 1f52 3cbb 349e 941c aa41 c364     9..{R..<.4..A.d.
a000b824:	8f29 4192 f289 1928 2894 92c9 1928 2894     )..A..(..(..(..(
a000b834:	0056 7e7b bb1b 9e3c 1d30 4192 2a69 6966     V.{~..<.0..Ai*fi
a000b844:	6b12 3292 5228 9463 59c4 1c38 7b02 2080     .k.2(Rc..Y8..{. 
a000b854:	3cbb 309e 921d 4a61 30a2 a41a 8d24 21a2     .<.0..aJ.0..$..!
a000b864:	5a89 68a2 a248 2896 921a 5628 7b00 1c97     .Z.hH..(..(V.{..
a000b874:	3cbb 219e 9419 2552 8619 0d30 2187 c34c     .<.!..R%..0..!L.
a000b884:	4861 6cb3 6838 3145 7b03 1fb1 3cbb 30ae     aH.l8hE1.{...<.0
a000b894:	921d 8921 5292 8b25 6386 5b54 2886 a449     ..!..R%..cT[.(I.
a000b8a4:	8a24 3086 462a 0243 987c bb1d ae3c 4b30     $..0*FC.|...<.0K
a000b8b4:	e14a 4436 3661 6948 2c34 a84b a224 8512     J.6Da6Hi4,K.$...
a000b8c4:	3451 c54c 7c00 15fb 3db9 e1ee 459c 9cc3     Q4L..|...=...E..
a000b8d4:	c967 cc70 a4a2 5516 2d22 207d bb18 9e3c     g.p....U"-} ..<.
a000b8e4:	9ce1 430f 0e9e 3107 874a 0e21 e1a3 9516     ...C...1J.!.....
a000b8f4:	026c 227d bb17 de3c 3878 c3a7 1653 8345     l.}"..<.x8..S.E.
a000b904:	648e 70d9 4ace 9b25 7e00 1aa2 3cbb 1cae     .d.p.J%..~...<..
a000b914:	068b 0d29 2c93 d31b 9ab0 590d a58e 265a     ..)..,.....Y..Z&
a000b924:	430d 7e00 1dbf 3cbb 2cae b309 38a8 d144     .C.~...<.,...8D.
a000b934:	0db8 b252 5186 4432 1c49 a495 9924 0134     ..R..Q2DI...$.4.
a000b944:	cf7e bb1d ae3c d068 2cd2 262a 1251 594d     ~...<.h..,*&Q.MY
a000b954:	4d25 41b2 b219 4b1c 4cb5 861a 7e00 1cd9     %M.A...K.L...~..
a000b964:	3cbb 30ae 5b0d a4b2 2c96 1469 520d 0d0e     .<.0.[...,i..R..
a000b974:	a0c9 996a 2592 a0da 7e00 1edc 3cbb 2cae     ..j..%...~...<.,
a000b984:	86ce 2b28 8925 2d12 9a51 5925 0da4 20cb     ..(+%..-Q.%Y... 
a000b994:	9967 2592 a0da 7e00 1cdd 3cbb 2cae 86ce     g..%...~...<.,..
a000b9a4:	8b28 24b2 2e19 1252 d4b5 4386 6392 a461     (..$..R....C.ca.
a000b9b4:	0784 7e01 1edf 3cbb 30ae 864d 0921 a4d3     ...~...<.0M.!...
a000b9c4:	1c96 2886 1a4b 6893 9288 691c a252 ca64     ...(K..h...iR.d.
a000b9d4:	7f06 1e16 3cbb 30ae 864d 8921 24d2 0e19     .....<.0M.!..$..
a000b9e4:	8e4a c324 4490 6549 4c78 969a 14ca 7f0a     J.$..DIexL......
a000b9f4:	1a51 3dba 078e 911d 64b2 5169 48b2 292a     Q..=.....diQ.H*)
a000ba04:	9289 496c 85a2 223a 7f0f 158e 3cbb e2be     ..lI..:".....<..
a000ba14:	ce70 2187 874f 1a83 d70f cf24 75b2 0180     p..!O.....$..u..
a000ba24:	bb18 de3c ab1c 430d 649e 41c3 21cc 3263     ..<....C.d.A.!c2
a000ba34:	614a c61a 0283 0580 bb1a de3c 587c 28e2     Ja........<.|X.(
a000ba44:	b24f 20e1 c8e6 4430 984a 6b0e 0e98 0013     O.. ..0DJ..k....
a000ba54:	0c80 bb18 8e3c 3507 f287 90e1 2d44 4b51     ....<..5....D-QK
a000ba64:	12d4 44b5 512d 3c4b 3380 ba14 8e3d 2887     ...D-QK<.3..=..(
a000ba74:	1c6c e2c6 3630 070e ca1d 08a1 4a80 bb20     l...06.......J .
a000ba84:	8e3c 0a21 4493 921a 432e a2d2 1974 1692     <.!..D...C..t...
a000ba94:	8ba5 2c92 20c9 5325 9263 0045 5480 bb1e     ...,. %Sc.E..T..
a000baa4:	8e3c 945b 4944 2496 b2c3 4985 0e16 a487     <.[.DI.$...I....
a000bab4:	2616 3659 d528 0b24 00d5 a180 bb20 9e3c     .&Y6(.$..... .<.
a000bac4:	1921 4aa2 12d4 8345 44a6 9479 ca0c 6490     !..J..E..Dy....d
a000bad4:	5449 6a89 1651 a525 0b21 fd80 bb1f ae3c     IT.jQ.%.!.....<.
a000bae4:	54b0 8649 8745 832a 2432 3c59 a528 d12c     .TI.E.*.2$Y<(.,.
a000baf4:	2506 b24a 4a24 6522 8108 1e11 3cbb 2d9e     .%J.$J"e.....<.-
a000bb04:	c24c 492c 6586 9a47 1692 b2a5 9294 d28a     L.,I.eG.........
a000bb14:	94a3 430c 84a2 8101 10ea 3eb7 70ae 5418     ...C.......>.p.T
a000bb24:	b875 570e b875 8106 16f3 3cbb e19e 439a     u..Wu......<...C
a000bb34:	5a59 ce1b 9639 430f 639e 70e9 8210 1972     YZ..9..C.c.p..r.
a000bb44:	3cbb 1cce c61a 1d2c a52e 94ac c365 e5a0     .<....,.....e...
a000bb54:	1e58 d9e5 0830 8282 bb16 be3c 70da ead0     X...0.....<..p..
a000bb64:	6194 b390 8b38 38b3 7399 062c f982 bb18     .a..8..8.s,.....
a000bb74:	be3c 70da 8ad0 2dc3 26aa 9a51 86d4 9a83     <..p...-.&Q.....
a000bb84:	3963 0296 dc83 bb1a be3c 70da ead0 34d8     c9......<..p...4
a000bb94:	612c a592 6d49 6838 3549 692a 0099 dd84     ,a..Im8hI5*i....
a000bba4:	bb1b be3c 70da 8ad0 9449 d126 2510 61cd     ..<..p..I.&..%.a
a000bbb4:	9c36 512a 944b 070c 8501 1fcf 3cbb 28ce     6.*QK........<.(
a000bbc4:	0e1b 9462 8654 d243 1969 2894 92c9 1921     ..b.T.C.i..(..!.
a000bbd4:	5e96 6494 aa50 0089 4c88 bb1a ae3c 9068     .^.dP....L..<.h.
a000bbe4:	2872 7387 1928 4486 928d 4c34 34c3 c34c     r(.s(..D..4L.4L.
a000bbf4:	026c 6888 bb18 de3c 3878 c3e7 a790 41c3     l..h..<.x8.....A
a000bc04:	a24c 4a30 2d42 4a53 28a9 ab88 bb1f 9e3c     L.0JB-SJ.(....<.
a000bc14:	4c38 e1a3 25a0 1251 5225 0cb6 9243 b528     8L...%Q.%R..C.(.
a000bc24:	a928 c545 4a24 4532 890b 187f 3cab 078e     (.E.$J2E.....<..
a000bc34:	4931 5387 6a25 2a89 4951 f29c 3868 09e5     1I.S%j.*QI..h8..
a000bc44:	8900 1981 3cbb 078e 4931 5387 8a25 6b86     .....<..1I.S%..k
a000bc54:	1c3c eab4 2392 3843 002a c189 bb19 ae3c     <....#C8*.....<.
a000bc64:	0861 30d3 462a a8c5 1518 72a3 4792 9459     a..0*F.....r.GY.
a000bc74:	eb65 8910 1cc6 3cbb 6c9e a2d0 192c c692     e......<.l..,...
a000bc84:	2da4 4a4a 4f4b 2d49 334c 25a9 64aa 8903     .-JJKOI-L3.%.d..
a000bc94:	1cc8 3cbb 28be a24d 6941 92ca 1b34 3086     ...<.(M.Ai..4..0
a000bca4:	a30d 5462 2a8c 9299 d90d 8920 1fe3 3cbb     ..bT.*.... ....<
a000bcb4:	6cae 8650 52a8 86ca 9221 4492 86c9 d243     .lP..R..!..D..C.
a000bcc4:	0d94 a487 4b29 354a 0229 e689 bb1e 9e3c     ....)KJ5).....<.
a000bcd4:	1b38 a8b2 0d18 b0ca 1974 8a96 1952 590e     8.......t...R..Y
a000bce4:	d494 a512 4436 12ca a18b bb17 9e3c 98b4     ....6D......<...
a000bcf4:	f963 0870 30d3 d30d 4a24 34b5 b1cc 8b0c     c.p..0..$J.4....
a000bd04:	17a4 3cbb b49e 6398 9639 698d 6698 9849     ...<...c9..i.fI.
a000bd14:	2a34 2559 072c a98b bb19 9e3c 98b4 3986     4*Y%,.....<....9
a000bd24:	8d96 1443 61a6 a61a 9449 696a 0c32 8b01     ..C..a..I.ji2...
a000bd34:	1ab0 3cbb 1c9e 068c cb1d 64b1 a2ce 8b41     ...<.......d..A.
a000bd44:	28f2 c44f 0948 6ca3 8b10 1bba 3cbb b49e     .(O.H..l.....<..
a000bd54:	4398 9e49 4b25 651a 5651 3309 a935 5245     .CI.%K.eQV.35.ER
a000bd64:	6516 0083 be8b bb19 9e3c 086c 7aa3 6714     .e......<.l..z.g
a000bd74:	8ec3 c325 6516 a12d 6696 ba49 8b09 1bc4     ..%..e-..fI.....
a000bd84:	3cbb 689e a218 8f30 49aa 4c65 6193 c288     .<.h..0..IeL.a..
a000bd94:	8934 2d52 730d 032c c68b bb19 9e3c 986c     4.R-.s,.....<.l.
a000bda4:	698a 8698 1443 d146 1530 a4a3 aa51 6145     .i..C.F.0...Q.Ea
a000bdb4:	8b35 1bdd 3cbb 589e 768b 5b2c 2186 d30a     5....<.X.v,[.!..
a000bdc4:	8d30 2d06 32ca 2b25 720d 0096 f48b bb18     0..-.2%+.r......
a000bdd4:	9e3c 4bac c83e 3259 a565 ab41 4984 94a3     <..K>.Y2e.A..I..
a000bde4:	5a94 6cc2 f78b bb1d 9e3c 32b4 510c 2398     .Z.l....<..2.Q.#
a000bdf4:	3283 c9a6 4430 d2b5 45a0 a659 5a0c 2594     .2..0D...EY..Z.%
a000be04:	8c00 2122 3cbb 2c8e 928c 0a21 8aa3 0c32     .."!.<.,..!...2.
a000be14:	a94a 5065 24a2 a44a 8864 a522 8954 916a     J.eP.$J.d.".T.j.
a000be24:	00a2 378c bb1a ce3c 0e28 594b 6994 1461     ...7..<.(.KY.ia.
a000be34:	e187 2830 984a 6164 ac3a 0461 618c bb1c     ..0(J.da:.a..a..
a000be44:	be3c cd41 e1d2 ca52 61b2 9310 522c 3496     <.A...R..a..,R.4
a000be54:	2512 5525 41a2 0112 2d8d bb1e 8e3c 0941     .%%U.A...-..<.A.
a000be64:	24b3 2a4c 92c3 4a88 5229 94da a29e 2945     .$L*...J)R....E)
a000be74:	5127 65aa 000a 348d bb1e 8e3c 8b41 52b2     'Q.e...4..<.A..R
a000be84:	1b52 5a92 d494 a4a2 2c32 4a6d 945b 4a55     R..Z....2,mJ[.UJ
a000be94:	96c3 0164 448d bb1b 9e3c 4728 e192 b512     ..d..D..<.(G....
a000bea4:	6125 6994 10c3 61a6 8c54 49ca 2dba 8d00     %a.i...aT..I.-..
a000beb4:	1870 3cbb 78de e738 3a58 d41c ca3c 41a3     p..<.x8.X:..<..A
a000bec4:	e28b 9aa4 430d 8d00 1d77 3cbb 1cbe 868b     .....C..w..<....
a000bed4:	d068 34c2 0e19 9461 5126 2496 9643 8694     h..4..a.&Q.$C...
a000bee4:	cf45 2186 ef8d bb23 8e3c 4921 64a3 a250     E..!..#.<.!I.dP.
a000bef4:	4b24 a522 6434 9669 8944 2592 6195 a250     $K".4di.D..%.aP.
a000bf04:	492c 2c94 06d1 8e05 18ab 3dba 7cce 8b18     ,I.,.......=.|..
a000bf14:	58c3 8689 0b21 61a3 a390 2950 1989 8f00     .X..!..a..P)....
a000bf24:	1666 3cbb 1cce 87cb 0e63 87d5 cf21 74b1     f..<....c...!..t
a000bf34:	a838 9639 8f02 1b6c 3cbb 30ae 921b 4a41     8.9...l..<.0..AJ
a000bf44:	6543 9418 1c2c 4192 b38b 34a5 c5a6 0234     Ce..,..A...4..4.
a000bf54:	6f8f bb1c 9e3c 0d30 41c3 9419 5330 a4a2     .o..<.0..A..0S..
a000bf64:	4832 9869 a52e 092d aca3 0692 7d8f bb1d     2Hi...-......}..
a000bf74:	be3c a0e2 b314 7868 b30a 8961 5a92 0d12     <.....hx..a..Z..
a000bf84:	1a52 c326 2490 945a 8f05 1e91 3cbb 6cae     R.&..$Z......<.l
a000bf94:	0648 2a25 910e 948e 8386 6512 9299 892d     H.%*.......e..-.
a000bfa4:	45b2 3252 716c 8f02 18be 3cbb b49e 8698     .ER2lq.....<....
a000bfb4:	70f9 d308 cd30 3092 2aca 5269 86cf 8f21     .p..0..0.*iR..!.
a000bfc4:	1ac7 3cbb 389e c34c 1864 2472 8a9a 1259     ...<.8L.d.r$..Y.
a000bfd4:	61a6 861a 925a c367 8f10 1cd4 3cbb 5c9e     .a..Z.g......<.\
a000bfe4:	868a ca30 e1b1 45a4 5a95 4c54 24a2 b48b     ..0....E.ZTL.$..
a000bff4:	9ea4 430d 8f00 1ad8 3cbb 689e a218 ac34     ...C.....<.h..4.
a000c004:	d963 64a6 1251 a255 34c6 e4ac 30d9 8f04     c..dQ.U..4...0..
a000c014:	1ad9 3cbb 309e f30e 90e1 5186 4b31 6ac2     ...<.0.....Q1K.j
a000c024:	8496 1689 7925 0c36 8f01 1adb 3cbb 2c9e     ....%y6......<.,
a000c034:	a30a 3262 51cc 1534 5387 5463 b24c 184a     ..b2.Q4..ScTL.J.
a000c044:	c365 9010 1b01 3cbb ac9e 184b 3a0d 8d92     e......<..K..:..
a000c054:	3269 510c 6698 1849 5165 6aa2 10c3 0290     i2.Q.fI.eQ.j....
a000c064:	bb1b 9e3c 4b58 3486 87cc 9843 8346 6516     ..<.XK.4..C.F..e
a000c074:	41a5 b28b c928 61b3 9008 1f1a 3cbb 689e     .A..(..a.....<.h
a000c084:	2ad8 3261 610c 0d14 30c9 4944 32d4 510c     .*a2.a...0DI.2.Q
a000c094:	b512 8944 cf52 2186 5390 bb1b 9e3c 4bac     ..D.R..!.S..<..K
a000c0a4:	0c98 9e43 834d 6516 41a5 b28b 20d2 7925     ..C.M..e.A... %y
a000c0b4:	0c36 9001 1fa3 3cbb cb8e 5510 96a2 b0ca     6......<...U....
a000c0c4:	a2d4 16a4 d125 2430 8b51 5512 594a 6592     ....%.0$Q..UJY.e
a000c0d4:	064a ae90 bb1d ae3c 906c 6cb2 a258 53a4     J.....<.l..lX..S
a000c0e4:	d3d2 44a0 3749 6da5 2a58 125a 21e5 9000     ...DI7.mX*Z..!..
a000c0f4:	21e8 3cbb 6cbe 4a78 24b2 44aa 3249 a1dc     .!.<.lxJ.$.DI2..
a000c104:	1a24 2894 92c9 c928 2512 9419 9652 0064     $..(..(..%..R.d.
a000c114:	fd90 bb20 be3c 5068 2506 92ca e196 c958     .. .<.hP.%....X.
a000c124:	2486 a44a 5224 2486 516a 21a2 45a9 0649     .$J.$R.$jQ.!.EI.
a000c134:	4d91 bb1e 8e3c 1941 7294 1e52 a556 0c32     .M..<.A..rR.V.2.
a000c144:	1289 4966 2838 9661 c364 6992 20c9 5291     ..fI8(a.d..i. .R
a000c154:	bb21 9e3c 1868 2ca2 d289 4b24 4186 3a4a     !.<.h..,..$K.AJ:
a000c164:	d225 a494 30d3 5124 449a 90c3 6944 9100     %....0$Q.D..Di..
a000c174:	1e77 3cbb 418e 44ab 9649 c344 aa41 22d4     w..<.A.DI.D.A.."
a000c184:	1945 78b6 8650 c92d 6586 92d8 912c 17cc     E..xP.-..e..,...
a000c194:	3cbb e19e 9594 d2b2 ca70 594a 3869 c3c7     .<......p.JYi8..
a000c1a4:	1d39 020e cd91 bb17 9e3c 9ce1 070e 71a9     9.......<......q
a000c1b4:	c218 38a8 790c 9c3c e1d3 9120 17d1 3cbb     ...8.y<... ....<
a000c1c4:	1cde f24a 2d2c 8329 c6a2 39c3 aa8f 6d49     ..J.,-)....9..Im
a000c1d4:	0838 ae94 bb1f 9e3c cb1c 6906 9288 9272     8.....<....i..r.
a000c1e4:	520c 4592 3283 5128 ca56 5292 d526 6192     .R.E.2(QV..R&..a
a000c1f4:	9408 1eb1 3cbb 309e c2c9 9a28 2192 86dc     .....<.0..(..!..
a000c204:	9228 21a2 a21a 255a 452c 5252 344a 9401     (..!..Z%,ERRJ4..
a000c214:	1bfe 3cbb 349e 928c 5941 696a 0d12 a907     ...<.4..AYji....
a000c224:	3869 8d48 7151 9389 0868 0195 bb1d ae3c     i8H.Qq..h.....<.
a000c234:	ea24 4a52 65c3 c250 5a2c a2da 32a4 6d24     $.RJ.eP.,Z...2$m
a000c244:	5251 9293 d130 9504 1f2e 3cbb 649e b2ca     QR..0......<.d..
a000c254:	5161 44b2 864b 9483 86d4 2d53 8649 ca25     aQ.DK.....S-I.%.
a000c264:	4532 92ca 1068 7f95 ba16 ae3d 96b0 7146     2E..h.....=...Fq
a000c274:	cb92 21c3 f24a ce28 24d2 0d0a e895 ba16     ...!J.(..$......
a000c284:	9e3d 9868 1d62 11d1 d11d 1d11 11d1 d11d     =.h.b...........
a000c294:	7911 ed95 bb1a 9e3c 986c 3572 3353 1865     .y....<.l.r5S3e.
a000c2a4:	5112 92d3 aa4c 5929 6a26 00fa ee95 ba18     .Q..L.)Y&j......
a000c2b4:	9e3d 9868 1d62 8691 2a48 2549 24a9 910d     =.h.b...H*I%.$..
a000c2c4:	e88e 3c88 f495 ba19 9e3d 9868 1d62 8691     ...<....=.h.b...
a000c2d4:	2a48 4349 9524 92a4 4434 223a 960f 1e32     H*IC$...4D:"..2.
a000c2e4:	3cbb 218e a30a 92ac c70c 364a 5124 d44b     .<.!......J6$QK.
a000c2f4:	44a2 5295 6496 1261 1265 9600 2144 3cbb     .D.R.da.e...D!.<
a000c304:	218e 44aa a52d d12c 2186 b449 4a24 253a     .!.D-.,..!I.$J:%
a000c314:	a291 92d4 9652 5984 4612 000a 6496 bb1e     ....R..Y.F...d..
a000c324:	8e3c 2b21 a255 ca24 2912 9459 8b30 5386     <.!+U.$..)Y.0..S
a000c334:	4d96 5b49 4914 a459 006a be96 bb1c ee3c     .MI[.IY.j.....<.
a000c344:	1a24 24a2 864d 9a21 a4b2 4614 d4c3 2496     $..$M.!....F...$
a000c354:	d2c3 8c54 61f2 f696 bb18 9e3c 9ce1 4f0e     ..T..a....<....O
a000c364:	2949 359c cb49 61a4 a1c8 c77c 0034 5297     I).5I..a..|.4..R
a000c374:	bb17 de3c 3878 c3e7 a790 41c3 d30b 0d61     ..<.x8.....A..a.
a000c384:	61d3 230d 9700 1862 3dba 878e 4730 e1e2     .a.#..b..=..0G..
a000c394:	9520 21a4 4a92 10d2 a549 1de1 9709 19f3      ..!.J..I.......
a000c3a4:	3cbb 78de 6638 1279 070e 1e1d 3086 870d     .<.x8fy......0..
a000c3b4:	4c21 61c3 0088 7598 bb19 8e3c 3507 861f     !L.a...u..<..5..
a000c3c4:	0d30 62a3 8c54 918a 4712 2871 09c9 9800     0..bT....Gq(....
a000c3d4:	1f91 3cbb 68be 8a50 3259 4a0c 1b29 a506     ...<.hP.Y2.J)...
a000c3e4:	2516 945d a516 5522 614a 6892 005a ce98     .%]..."UJa.hZ...
a000c3f4:	bb1e 9e3c d061 2ce2 b24c 4a24 48b2 4aca     ..<.a..,L.$J.H.J
a000c404:	2459 4965 6494 925a c8e8 050e 6c9a bb18     Y$eI.dZ......l..
a000c414:	9e3c d061 34b1 b34c 4c34 3b87 6396 29c3     <.a..4L.4L.;.c.)
a000c424:	72c7 0144 d89a bb1b de3c 3874 f8e8 6720     .rD.....<.t8.. g
a000c434:	70e1 a3ca 5064 24a2 a24b 5064 58a2 9e01     .p..dP.$K.dP.X..
a000c444:	19d1 3cbb e19e 9594 4e92 14d1 e70d 3878     ...<.....N....x8
a000c454:	c3a7 2941 b255 00a8 209f ba1c 8e3d 1921     ..A)U.... ..=.!.
a000c464:	3c92 9219 c921 e193 4a0e 944a 2454 a24b     .<..!....JJ.T$K.
a000c474:	0cb4 14ca 0000 0000                         ........

a000c47c <u8g2_cb_r0>:
a000c47c:	7ec0 a000 7f18 a000 7ebe a000               .~.......~..

a000c488 <u8x8_d_ssd1306_128x64_noname_flip0_seq>:
a000c488:	1518 15a1 19c8 00ff                         ........

a000c490 <u8x8_d_ssd1306_128x64_noname_flip1_seq>:
a000c490:	1518 15a0 19c0 00ff                         ........

a000c498 <u8x8_d_ssd1306_128x64_noname_init_seq>:
a000c498:	1518 15ae 16d5 1580 16a8 153f 16d3 1500     ..........?.....
a000c4a8:	1540 168d 1514 1620 1500 15a1 15c8 16da     @..... .........
a000c4b8:	1512 1681 15cf 16d9 15f1 16db 1540 152e     ............@...
a000c4c8:	15a4 19a6 00ff 0000                         ........

a000c4d0 <u8x8_d_ssd1306_128x64_noname_powersave0_seq>:
a000c4d0:	1518 19af 00ff 0000                         ........

a000c4d8 <u8x8_d_ssd1306_128x64_noname_powersave1_seq>:
a000c4d8:	1518 19ae 00ff 0000                         ........

a000c4e0 <u8x8_ssd1306_128x64_noname_display_info>:
a000c4e0:	0100 0a14 6464 3232 1200 007a 0400 9628     ....dd22..z...(.
a000c4f0:	0810 0000 0080 0040                         ......@.

a000c4f8 <__clz_tab>:
a000c4f8:	0100 0202 0303 0303 0404 0404 0404 0404     ................
a000c508:	0505 0505 0505 0505 0505 0505 0505 0505     ................
a000c518:	0606 0606 0606 0606 0606 0606 0606 0606     ................
a000c528:	0606 0606 0606 0606 0606 0606 0606 0606     ................
a000c538:	0707 0707 0707 0707 0707 0707 0707 0707     ................
a000c548:	0707 0707 0707 0707 0707 0707 0707 0707     ................
a000c558:	0707 0707 0707 0707 0707 0707 0707 0707     ................
a000c568:	0707 0707 0707 0707 0707 0707 0707 0707     ................
a000c578:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c588:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c598:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c5a8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c5b8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c5c8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c5d8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c5e8:	0808 0808 0808 0808 0808 0808 0808 0808     ................
a000c5f8:	611a ffff 632c ffff 6116 ffff 632c ffff     .a..,c...a..,c..
a000c608:	631c ffff 632c ffff 6116 ffff 611e ffff     .c..,c...a...a..
a000c618:	611e ffff 631c ffff 6116 ffff 60fa ffff     .a...c...a...`..
a000c628:	60fa ffff 60fa ffff 6128 ffff 68d0 ffff     .`...`..(a...h..
a000c638:	68d0 ffff 68e8 ffff 68ca ffff 68ca ffff     .h...h...h...h..
a000c648:	66e2 ffff 68e8 ffff 68ca ffff 66e2 ffff     .f...h...h...f..
a000c658:	68ca ffff 68e8 ffff 68c8 ffff 68c8 ffff     .h...h...h...h..
a000c668:	68c8 ffff 6aaa ffff                         .h...j..

Disassembly of section .itcm_region:

62fc0000 <arch_memcpy>:
void *ATTR_TCM_SECTION arch_memcpy(void *dst, const void *src, uint32_t n)
{
    const uint8_t *p = src;
    uint8_t *q = dst;

    while (n--) {
62fc0000:	00060b63          	beqz	a2,62fc0016 <arch_memcpy+0x16>
62fc0004:	4781                	li	a5,0
62fc0006:	0001                	nop
        *q++ = *p++;
62fc0008:	80f5c70b          	lrbu	a4,a1,a5,0
62fc000c:	00f5570b          	srb	a4,a0,a5,0
    while (n--) {
62fc0010:	0785                	addi	a5,a5,1
62fc0012:	fec79be3          	bne	a5,a2,62fc0008 <arch_memcpy+0x8>
    }

    return dst;
}
62fc0016:	8082                	ret

62fc0018 <arch_memcpy4>:
uint32_t *ATTR_TCM_SECTION arch_memcpy4(uint32_t *dst, const uint32_t *src, uint32_t n)
{
    const uint32_t *p = src;
    uint32_t *q = dst;

    while (n--) {
62fc0018:	ca09                	beqz	a2,62fc002a <arch_memcpy4+0x12>
62fc001a:	4781                	li	a5,0
        *q++ = *p++;
62fc001c:	44f5c70b          	lrw	a4,a1,a5,2
62fc0020:	44f5570b          	srw	a4,a0,a5,2
    while (n--) {
62fc0024:	0785                	addi	a5,a5,1
62fc0026:	fec79be3          	bne	a5,a2,62fc001c <arch_memcpy4+0x4>
    }

    return dst;
}
62fc002a:	8082                	ret
62fc002c:	0000                	unimp
	...

62fc0030 <arch_memcpy_fast>:
{
    uint32_t left, done, i = 0;
    uint8_t *dst = (uint8_t *)pdst;
    uint8_t *src = (uint8_t *)psrc;

    if (((uint32_t)(uintptr_t)dst & 0x3) == 0 && ((uint32_t)(uintptr_t)src & 0x3) == 0) {
62fc0030:	00b567b3          	or	a5,a0,a1
62fc0034:	8b8d                	andi	a5,a5,3
62fc0036:	cb99                	beqz	a5,62fc004c <arch_memcpy_fast+0x1c>
    while (n--) {
62fc0038:	4781                	li	a5,0
62fc003a:	c229                	beqz	a2,62fc007c <arch_memcpy_fast+0x4c>
        *q++ = *p++;
62fc003c:	80f5c70b          	lrbu	a4,a1,a5,0
62fc0040:	00f5570b          	srb	a4,a0,a5,0
    while (n--) {
62fc0044:	0785                	addi	a5,a5,1
62fc0046:	fef61be3          	bne	a2,a5,62fc003c <arch_memcpy_fast+0xc>
    } else {
        arch_memcpy(dst, src, n);
    }

    return dst;
}
62fc004a:	8082                	ret
        arch_memcpy4((uint32_t *)dst, (const uint32_t *)src, n >> 2);
62fc004c:	00265693          	srli	a3,a2,0x2
    while (n--) {
62fc0050:	ca89                	beqz	a3,62fc0062 <arch_memcpy_fast+0x32>
62fc0052:	068a                	slli	a3,a3,0x2
        *q++ = *p++;
62fc0054:	40f5c70b          	lrw	a4,a1,a5,0
62fc0058:	40f5570b          	srw	a4,a0,a5,0
    while (n--) {
62fc005c:	0791                	addi	a5,a5,4
62fc005e:	fef69be3          	bne	a3,a5,62fc0054 <arch_memcpy_fast+0x24>
        left = n % 4;
62fc0062:	00367713          	andi	a4,a2,3
        done = n - left;
62fc0066:	ffc67793          	andi	a5,a2,-4
        while (i < left) {
62fc006a:	d365                	beqz	a4,62fc004a <arch_memcpy_fast+0x1a>
            dst[done + i] = src[done + i];
62fc006c:	80f5c70b          	lrbu	a4,a1,a5,0
62fc0070:	00f5570b          	srb	a4,a0,a5,0
        while (i < left) {
62fc0074:	0785                	addi	a5,a5,1
62fc0076:	fef61be3          	bne	a2,a5,62fc006c <arch_memcpy_fast+0x3c>
62fc007a:	8082                	ret
62fc007c:	8082                	ret
	...

62fc0080 <arch_memcmp>:

    return dst;
}

int ATTR_TCM_SECTION arch_memcmp(const void *s1, const void *s2, uint32_t n)
{
62fc0080:	882a                	mv	a6,a0
    const unsigned char *c1 = s1, *c2 = s2;
    int d = 0;

    while (n--) {
62fc0082:	4781                	li	a5,0
62fc0084:	00c78c63          	beq	a5,a2,62fc009c <arch_memcmp+0x1c>
        d = (int)*c1++ - (int)*c2++;
62fc0088:	80f8468b          	lrbu	a3,a6,a5,0
62fc008c:	80f5c70b          	lrbu	a4,a1,a5,0

        if (d) {
62fc0090:	0785                	addi	a5,a5,1
        d = (int)*c1++ - (int)*c2++;
62fc0092:	40e68533          	sub	a0,a3,a4
        if (d) {
62fc0096:	fee687e3          	beq	a3,a4,62fc0084 <arch_memcmp+0x4>
            break;
        }
    }

    return d;
}
62fc009a:	8082                	ret
62fc009c:	4501                	li	a0,0
62fc009e:	8082                	ret
62fc00a0:	0000                	unimp
	...

62fc00a4 <bflb_soft_crc32>:
{
    uint8_t i;
    uint32_t crc = ~initial; // Initial value
    uint8_t *data = (uint8_t *)in;

    while (len--) {
62fc00a4:	cd85                	beqz	a1,62fc00dc <bflb_soft_crc32+0x38>
62fc00a6:	00b50833          	add	a6,a0,a1
        crc ^= *data++; // crc ^= *data; data++;
        for (i = 0; i < 8; ++i) {
            if (crc & 1) {
                crc = (crc >> 1) ^ 0xEDB88320; // 0xEDB88320= reverse 0x04C11DB7
62fc00aa:	edb885b7          	lui	a1,0xedb88
    uint32_t crc = ~initial; // Initial value
62fc00ae:	57fd                	li	a5,-1
                crc = (crc >> 1) ^ 0xEDB88320; // 0xEDB88320= reverse 0x04C11DB7
62fc00b0:	32058593          	addi	a1,a1,800 # edb88320 <__psram_limit+0x45788320>
        crc ^= *data++; // crc ^= *data; data++;
62fc00b4:	9815468b          	lbuia	a3,(a0),1,0
62fc00b8:	4721                	li	a4,8
62fc00ba:	8fb5                	xor	a5,a5,a3
            if (crc & 1) {
62fc00bc:	0017f613          	andi	a2,a5,1
        for (i = 0; i < 8; ++i) {
62fc00c0:	177d                	addi	a4,a4,-1
                crc = (crc >> 1) ^ 0xEDB88320; // 0xEDB88320= reverse 0x04C11DB7
62fc00c2:	8385                	srli	a5,a5,0x1
62fc00c4:	00b7c6b3          	xor	a3,a5,a1
        for (i = 0; i < 8; ++i) {
62fc00c8:	0ff77713          	andi	a4,a4,255
                crc = (crc >> 1) ^ 0xEDB88320; // 0xEDB88320= reverse 0x04C11DB7
62fc00cc:	42c6978b          	mvnez	a5,a3,a2
        for (i = 0; i < 8; ++i) {
62fc00d0:	f775                	bnez	a4,62fc00bc <bflb_soft_crc32+0x18>
    while (len--) {
62fc00d2:	ff0511e3          	bne	a0,a6,62fc00b4 <bflb_soft_crc32+0x10>
            } else {
                crc = (crc >> 1);
            }
        }
    }
    return ~crc;
62fc00d6:	fff7c513          	not	a0,a5
62fc00da:	8082                	ret
    while (len--) {
62fc00dc:	4501                	li	a0,0

#if !defined(BL602) && !defined(BL702)
uint32_t ATTR_TCM_SECTION bflb_soft_crc32(void *in, uint32_t len)
{
    return bflb_soft_crc32_ex(0, in, len);
}
62fc00de:	8082                	ret

62fc00e0 <bflb_ef_ctrl_read_direct>:
    total_size += EF_CTRL_EFUSE_R1_SIZE;
#else
    (void)region1_count;
#endif

    if (offset > total_size || (offset + count * 4) > total_size || pword == NULL) {
62fc00e0:	20000793          	li	a5,512
62fc00e4:	0cb7ef63          	bltu	a5,a1,62fc01c2 <bflb_ef_ctrl_read_direct+0xe2>
62fc00e8:	04d5950b          	addsl	a0,a1,a3,2
62fc00ec:	0ca7eb63          	bltu	a5,a0,62fc01c2 <bflb_ef_ctrl_read_direct+0xe2>
62fc00f0:	0c060963          	beqz	a2,62fc01c2 <bflb_ef_ctrl_read_direct+0xe2>
{
62fc00f4:	1101                	addi	sp,sp,-32
62fc00f6:	ca26                	sw	s1,20(sp)
62fc00f8:	c84a                	sw	s2,16(sp)
62fc00fa:	c64e                	sw	s3,12(sp)
62fc00fc:	ce06                	sw	ra,28(sp)
62fc00fe:	cc22                	sw	s0,24(sp)
62fc0100:	c452                	sw	s4,8(sp)
62fc0102:	89ba                	mv	s3,a4
62fc0104:	84b6                	mv	s1,a3
62fc0106:	8932                	mv	s2,a2
        return;
    }

    if (offset < EF_CTRL_EFUSE_R0_SIZE) {
62fc0108:	0ef58063          	beq	a1,a5,62fc01e8 <bflb_ef_ctrl_read_direct+0x108>
    }

    // if (dev == NULL) {
    //     dev = bflb_device_get_by_name("ef_ctrl");
    // }
    pefuse_start = (uint32_t *)(BFLB_EF_CTRL_BASE + offset);
62fc010c:	20056437          	lui	s0,0x20056
62fc0110:	942e                	add	s0,s0,a1

    irq_stat = bflb_irq_save();
62fc0112:	2125                	jal	62fc053a <bflb_irq_save>
62fc0114:	8a2a                	mv	s4,a0
#if defined(BL702) || defined(BL602) || defined(BL702L)
    bflb_efuse_switch_cpu_clock_save();
#endif
    if (region0_count > 0) {
62fc0116:	ccc9                	beqz	s1,62fc01b0 <bflb_ef_ctrl_read_direct+0xd0>
        if (reload) {
62fc0118:	00027737          	lui	a4,0x27
62fc011c:	10070713          	addi	a4,a4,256 # 27100 <nocache_min_size+0x22100>
    reg_val = getreg32(BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0120:	200576b7          	lui	a3,0x20057
        if (reload) {
62fc0124:	0a098263          	beqz	s3,62fc01c8 <bflb_ef_ctrl_read_direct+0xe8>
    reg_val = getreg32(BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0128:	8006a783          	lw	a5,-2048(a3) # 20056800 <nocache_min_size+0x20051800>
    if (reg_val & EF_CTRL_EF_IF_0_BUSY_MASK) {
62fc012c:	8b91                	andi	a5,a5,4
62fc012e:	e3e1                	bnez	a5,62fc01ee <bflb_ef_ctrl_read_direct+0x10e>
    putreg32(reg_val, BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0130:	0024c7b7          	lui	a5,0x24c
62fc0134:	20057737          	lui	a4,0x20057
62fc0138:	f0078793          	addi	a5,a5,-256 # 24bf00 <nocache_min_size+0x246f00>
62fc013c:	80f72023          	sw	a5,-2048(a4) # 20056800 <nocache_min_size+0x20051800>
    arch_delay_us(4);
62fc0140:	4511                	li	a0,4
62fc0142:	135000ef          	jal	ra,62fc0a76 <arch_delay_us>
62fc0146:	200567b7          	lui	a5,0x20056
    for (i = 0; i < EF_CTRL_EFUSE_R0_SIZE / 4; i++) {
62fc014a:	20078713          	addi	a4,a5,512 # 20056200 <nocache_min_size+0x20051200>
62fc014e:	0001                	nop
        pefuse_start[i] = 0;
62fc0150:	5847d00b          	swia	zero,(a5),4,0
    for (i = 0; i < EF_CTRL_EFUSE_R0_SIZE / 4; i++) {
62fc0154:	fee79ee3          	bne	a5,a4,62fc0150 <bflb_ef_ctrl_read_direct+0x70>
    putreg32(reg_val, BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0158:	0024c7b7          	lui	a5,0x24c
62fc015c:	f0078713          	addi	a4,a5,-256 # 24bf00 <nocache_min_size+0x246f00>
62fc0160:	200579b7          	lui	s3,0x20057
62fc0164:	80e9a023          	sw	a4,-2048(s3) # 20056800 <nocache_min_size+0x20051800>
    putreg32(reg_val, BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0168:	f1078793          	addi	a5,a5,-240
62fc016c:	80f9a023          	sw	a5,-2048(s3)
    arch_delay_us(10);
62fc0170:	4529                	li	a0,10
62fc0172:	105000ef          	jal	ra,62fc0a76 <arch_delay_us>
        reg_val = getreg32(BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0176:	00027737          	lui	a4,0x27
62fc017a:	8009a783          	lw	a5,-2048(s3)
62fc017e:	0ff70713          	addi	a4,a4,255 # 270ff <nocache_min_size+0x220ff>
    } while ((reg_val & EF_CTRL_EF_IF_0_BUSY_MASK) || (!(reg_val & EF_CTRL_EF_IF_0_AUTOLOAD_DONE_MASK)));
62fc0182:	4689                	li	a3,2
        reg_val = getreg32(BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0184:	20057637          	lui	a2,0x20057
62fc0188:	a021                	j	62fc0190 <bflb_ef_ctrl_read_direct+0xb0>
62fc018a:	80062783          	lw	a5,-2048(a2) # 20056800 <nocache_min_size+0x20051800>
        if (timeout == 0) {
62fc018e:	c709                	beqz	a4,62fc0198 <bflb_ef_ctrl_read_direct+0xb8>
    } while ((reg_val & EF_CTRL_EF_IF_0_BUSY_MASK) || (!(reg_val & EF_CTRL_EF_IF_0_AUTOLOAD_DONE_MASK)));
62fc0190:	8b99                	andi	a5,a5,6
        if (timeout == 0) {
62fc0192:	177d                	addi	a4,a4,-1
    } while ((reg_val & EF_CTRL_EF_IF_0_BUSY_MASK) || (!(reg_val & EF_CTRL_EF_IF_0_AUTOLOAD_DONE_MASK)));
62fc0194:	fed79be3          	bne	a5,a3,62fc018a <bflb_ef_ctrl_read_direct+0xaa>
    putreg32(reg_val, BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc0198:	0024c7b7          	lui	a5,0x24c
62fc019c:	20057737          	lui	a4,0x20057
62fc01a0:	f0078793          	addi	a5,a5,-256 # 24bf00 <nocache_min_size+0x246f00>
62fc01a4:	80f72023          	sw	a5,-2048(a4) # 20056800 <nocache_min_size+0x20051800>
            bflb_ef_ctrl_load_efuse_r0(dev);
        } else {
            bflb_ef_ctrl_switch_ahb_clk_r0(dev);
        }
        arch_memcpy4(pword, pefuse_start, region0_count);
62fc01a8:	8626                	mv	a2,s1
62fc01aa:	85a2                	mv	a1,s0
62fc01ac:	854a                	mv	a0,s2
62fc01ae:	35ad                	jal	62fc0018 <arch_memcpy4>
#if defined(BL702) || defined(BL602) || defined(BL702L)
    bflb_efuse_switch_cpu_clock_restore();
#endif

    bflb_irq_restore(irq_stat);
}
62fc01b0:	4462                	lw	s0,24(sp)
62fc01b2:	40f2                	lw	ra,28(sp)
62fc01b4:	44d2                	lw	s1,20(sp)
62fc01b6:	4942                	lw	s2,16(sp)
62fc01b8:	49b2                	lw	s3,12(sp)
    bflb_irq_restore(irq_stat);
62fc01ba:	8552                	mv	a0,s4
}
62fc01bc:	4a22                	lw	s4,8(sp)
62fc01be:	6105                	addi	sp,sp,32
    bflb_irq_restore(irq_stat);
62fc01c0:	a649                	j	62fc0542 <bflb_irq_restore>
62fc01c2:	8082                	ret
        if (timeout == 0) {
62fc01c4:	177d                	addi	a4,a4,-1
62fc01c6:	c709                	beqz	a4,62fc01d0 <bflb_ef_ctrl_read_direct+0xf0>
    reg_val = getreg32(BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc01c8:	8006a783          	lw	a5,-2048(a3)
    if (reg_val & EF_CTRL_EF_IF_0_BUSY_MASK) {
62fc01cc:	8b91                	andi	a5,a5,4
62fc01ce:	fbfd                	bnez	a5,62fc01c4 <bflb_ef_ctrl_read_direct+0xe4>
    putreg32(reg_val, BFLB_EF_CTRL_BASE + EF_CTRL_EF_IF_CTRL_0_OFFSET);
62fc01d0:	0024c7b7          	lui	a5,0x24c
62fc01d4:	20057737          	lui	a4,0x20057
62fc01d8:	f0078793          	addi	a5,a5,-256 # 24bf00 <nocache_min_size+0x246f00>
62fc01dc:	80f72023          	sw	a5,-2048(a4) # 20056800 <nocache_min_size+0x20051800>
    arch_delay_us(4);
62fc01e0:	4511                	li	a0,4
62fc01e2:	095000ef          	jal	ra,62fc0a76 <arch_delay_us>
}
62fc01e6:	b7c9                	j	62fc01a8 <bflb_ef_ctrl_read_direct+0xc8>
    irq_stat = bflb_irq_save();
62fc01e8:	2e89                	jal	62fc053a <bflb_irq_save>
62fc01ea:	8a2a                	mv	s4,a0
    if (region0_count > 0) {
62fc01ec:	b7d1                	j	62fc01b0 <bflb_ef_ctrl_read_direct+0xd0>
        if (timeout == 0) {
62fc01ee:	177d                	addi	a4,a4,-1
62fc01f0:	ff05                	bnez	a4,62fc0128 <bflb_ef_ctrl_read_direct+0x48>
62fc01f2:	bf3d                	j	62fc0130 <bflb_ef_ctrl_read_direct+0x50>

62fc01f4 <bflb_uart_putchar>:
    }
    putreg32(regval, reg_base + UART_FIFO_CONFIG_0_OFFSET);
}

ATTR_TCM_SECTION int bflb_uart_putchar(struct bflb_device_s *dev, int ch)
{
62fc01f4:	1101                	addi	sp,sp,-32
62fc01f6:	c256                	sw	s5,4(sp)
    uint64_t start_time;
    uint32_t reg_base;

    reg_base = dev->reg_base;
62fc01f8:	00452a83          	lw	s5,4(a0)
{
62fc01fc:	cc22                	sw	s0,24(sp)
62fc01fe:	ca26                	sw	s1,20(sp)
62fc0200:	c84a                	sw	s2,16(sp)
62fc0202:	c64e                	sw	s3,12(sp)
62fc0204:	c452                	sw	s4,8(sp)
62fc0206:	ce06                	sw	ra,28(sp)
62fc0208:	8a2e                	mv	s4,a1
    start_time = bflb_mtimer_get_time_ms();
62fc020a:	2e7d                	jal	62fc05c8 <bflb_mtimer_get_time_ms>
    while ((getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET) & UART_TX_FIFO_CNT_MASK) == 0) {
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
62fc020c:	06400993          	li	s3,100
    start_time = bflb_mtimer_get_time_ms();
62fc0210:	842a                	mv	s0,a0
62fc0212:	84ae                	mv	s1,a1
    while ((getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET) & UART_TX_FIFO_CNT_MASK) == 0) {
62fc0214:	084a8913          	addi	s2,s5,132
62fc0218:	a039                	j	62fc0226 <bflb_uart_putchar+0x32>
        if ((bflb_mtimer_get_time_ms() - start_time) > 100) {
62fc021a:	267d                	jal	62fc05c8 <bflb_mtimer_get_time_ms>
62fc021c:	c2851577          	sub64	a0,a0,s0
62fc0220:	e595                	bnez	a1,62fc024c <bflb_uart_putchar+0x58>
62fc0222:	02a9e563          	bltu	s3,a0,62fc024c <bflb_uart_putchar+0x58>
    while ((getreg32(reg_base + UART_FIFO_CONFIG_1_OFFSET) & UART_TX_FIFO_CNT_MASK) == 0) {
62fc0226:	00092783          	lw	a5,0(s2)
62fc022a:	03f7f793          	andi	a5,a5,63
62fc022e:	d7f5                	beqz	a5,62fc021a <bflb_uart_putchar+0x26>
            return -ETIMEDOUT;
        }
    }
    putreg8(ch, reg_base + UART_FIFO_WDATA_OFFSET);
62fc0230:	0ffa7a13          	andi	s4,s4,255
62fc0234:	094a8423          	sb	s4,136(s5)
    return 0;
62fc0238:	4501                	li	a0,0
}
62fc023a:	40f2                	lw	ra,28(sp)
62fc023c:	4462                	lw	s0,24(sp)
62fc023e:	44d2                	lw	s1,20(sp)
62fc0240:	4942                	lw	s2,16(sp)
62fc0242:	49b2                	lw	s3,12(sp)
62fc0244:	4a22                	lw	s4,8(sp)
62fc0246:	4a92                	lw	s5,4(sp)
62fc0248:	6105                	addi	sp,sp,32
62fc024a:	8082                	ret
            return -ETIMEDOUT;
62fc024c:	f8c00513          	li	a0,-116
62fc0250:	b7ed                	j	62fc023a <bflb_uart_putchar+0x46>

62fc0252 <flash2_init.isra.0>:
static int ATTR_TCM_SECTION flash2_init(void)
62fc0252:	7179                	addi	sp,sp,-48
    sf_bank2_cfg.sbus2_select = 1;
62fc0254:	4705                	li	a4,1
    if (deviceInfo.memoryInfo == 3) {
62fc0256:	c181a683          	lw	a3,-1000(gp) # 62fc9418 <deviceInfo>
    sf_bank2_cfg.remap = SF_CTRL_REMAP_4MB;
62fc025a:	10300793          	li	a5,259
    sf_bank2_cfg.sbus2_select = 1;
62fc025e:	ca3a                	sw	a4,20(sp)
    sf_bank2_cfg.bank2_clk_delay = 1;
62fc0260:	cc3a                	sw	a4,24(sp)
    sf_bank2_cfg.remap = SF_CTRL_REMAP_4MB;
62fc0262:	00f11e23          	sh	a5,28(sp)
    cmds_cfg.ack_latency = 1;
62fc0266:	01010737          	lui	a4,0x1010
    cmds_cfg.cmds_wrap_len = SF_CTRL_WRAP_LEN_4096;
62fc026a:	47a5                	li	a5,9
    cmds_cfg.ack_latency = 1;
62fc026c:	10170713          	addi	a4,a4,257 # 1010101 <nocache_min_size+0x100b101>
    cmds_cfg.cmds_wrap_len = SF_CTRL_WRAP_LEN_4096;
62fc0270:	00f10823          	sb	a5,16(sp)
    if (deviceInfo.memoryInfo == 3) {
62fc0274:	1c0007b7          	lui	a5,0x1c000
    cmds_cfg.ack_latency = 1;
62fc0278:	c63a                	sw	a4,12(sp)
static int ATTR_TCM_SECTION flash2_init(void)
62fc027a:	d606                	sw	ra,44(sp)
62fc027c:	d422                	sw	s0,40(sp)
62fc027e:	d226                	sw	s1,36(sp)
62fc0280:	d04a                	sw	s2,32(sp)
    uint32_t jid = 0;
62fc0282:	c402                	sw	zero,8(sp)
    if (deviceInfo.memoryInfo == 3) {
62fc0284:	8ff5                	and	a5,a5,a3
62fc0286:	0c000737          	lui	a4,0xc000
62fc028a:	00e78863          	beq	a5,a4,62fc029a <flash2_init.isra.0+0x48>
}
62fc028e:	50b2                	lw	ra,44(sp)
62fc0290:	5422                	lw	s0,40(sp)
62fc0292:	5492                	lw	s1,36(sp)
62fc0294:	5902                	lw	s2,32(sp)
62fc0296:	6145                	addi	sp,sp,48
62fc0298:	8082                	ret
        bflb_sf_cfg_sbus2_flash_init(SF_IO_EMB_SWAP_IO3IO0_AND_SF2, &sf_bank2_cfg);
62fc029a:	084c                	addi	a1,sp,20
62fc029c:	03400513          	li	a0,52
62fc02a0:	2191                	jal	62fc06e4 <bflb_sf_cfg_sbus2_flash_init>
        bflb_sf_ctrl_sbus2_replace(SF_CTRL_PAD2);
62fc02a2:	4505                	li	a0,1
62fc02a4:	21a5                	jal	62fc070c <bflb_sf_ctrl_sbus2_replace>
        ret = bflb_sf_cfg_flash_identify_ext(0, SF_IO_EMB_SWAP_IO3IO0_AND_SF2, 0, &g_flash2_cfg, 0, SF_CTRL_FLASH_BANK1);
62fc02a6:	4785                	li	a5,1
62fc02a8:	4701                	li	a4,0
62fc02aa:	80818693          	addi	a3,gp,-2040 # 62fc9008 <g_flash2_cfg>
62fc02ae:	4601                	li	a2,0
62fc02b0:	03400593          	li	a1,52
62fc02b4:	4501                	li	a0,0
62fc02b6:	23fd                	jal	62fc08a4 <bflb_sf_cfg_flash_identify_ext>
62fc02b8:	80818913          	addi	s2,gp,-2040 # 62fc9008 <g_flash2_cfg>
        if ((ret & BFLB_FLASH_ID_VALID_FLAG) == 0) {
62fc02bc:	fc0559e3          	bgez	a0,62fc028e <flash2_init.isra.0+0x3c>
        g_flash2_cfg.io_mode = 0x11;
62fc02c0:	47c5                	li	a5,17
        bflb_sflash_get_jedecid(&g_flash2_cfg, (uint8_t *)&jid);
62fc02c2:	002c                	addi	a1,sp,8
62fc02c4:	80818513          	addi	a0,gp,-2040 # 62fc9008 <g_flash2_cfg>
        g_flash2_cfg.io_mode = 0x11;
62fc02c8:	00f91023          	sh	a5,0(s2)
        g_flash2_cfg.c_read_mode = 0xff;
62fc02cc:	57fd                	li	a5,-1
62fc02ce:	02f90f23          	sb	a5,62(s2)
        bflb_sflash_get_jedecid(&g_flash2_cfg, (uint8_t *)&jid);
62fc02d2:	2169                	jal	62fc075c <bflb_sflash_get_jedecid>
        jid &= 0xFFFFFF;
62fc02d4:	47a2                	lw	a5,8(sp)
62fc02d6:	01000737          	lui	a4,0x1000
62fc02da:	177d                	addi	a4,a4,-1
62fc02dc:	8ff9                	and	a5,a5,a4
        bflb_sf_ctrl_cmds_set(&cmds_cfg, SF_CTRL_FLASH_BANK1);
62fc02de:	4585                	li	a1,1
62fc02e0:	0068                	addi	a0,sp,12
        g_jedec_id2 = jid;
62fc02e2:	c2018493          	addi	s1,gp,-992 # 62fc9420 <g_jedec_id2>
        jid &= 0xFFFFFF;
62fc02e6:	c43e                	sw	a5,8(sp)
        g_jedec_id2 = jid;
62fc02e8:	c09c                	sw	a5,0(s1)
        bflb_sf_ctrl_cmds_set(&cmds_cfg, SF_CTRL_FLASH_BANK1);
62fc02ea:	2921                	jal	62fc0702 <bflb_sf_ctrl_cmds_set>
        stat = bflb_sflash_xip_read_enable(&g_flash2_cfg, (g_flash2_cfg.io_mode & 0xf), 0, SF_CTRL_FLASH_BANK1);
62fc02ec:	00094583          	lbu	a1,0(s2)
62fc02f0:	4685                	li	a3,1
62fc02f2:	4601                	li	a2,0
62fc02f4:	89bd                	andi	a1,a1,15
62fc02f6:	80818513          	addi	a0,gp,-2040 # 62fc9008 <g_flash2_cfg>
62fc02fa:	2c1d                	jal	62fc0530 <bflb_sflash_xip_read_enable>
        if (0 != stat) {
62fc02fc:	f949                	bnez	a0,62fc028e <flash2_init.isra.0+0x3c>
        bflb_sf_ctrl_sbus2_revoke_replace();
62fc02fe:	2921                	jal	62fc0716 <bflb_sf_ctrl_sbus2_revoke_replace>
        flash2_size = flash_get_size_from_jedecid(g_jedec_id2);
62fc0300:	4098                	lw	a4,0(s1)
    jid = ((jedec_id & 0xff) << 16) + (jedec_id & 0xff00) + ((jedec_id & 0xff0000) >> 16);
62fc0302:	00ff06b7          	lui	a3,0xff0
62fc0306:	01071793          	slli	a5,a4,0x10
62fc030a:	8ff5                	and	a5,a5,a3
62fc030c:	66c1                	lui	a3,0x10
62fc030e:	f0068693          	addi	a3,a3,-256 # ff00 <nocache_min_size+0xaf00>
62fc0312:	8ef9                	and	a3,a3,a4
62fc0314:	8fd5                	or	a5,a5,a3
62fc0316:	5d07370b          	extu	a4,a4,23,16
62fc031a:	97ba                	add	a5,a5,a4
    if (jid == 0) {
62fc031c:	c799                	beqz	a5,62fc032a <flash2_init.isra.0+0xd8>
    flash_size_level = (jid & 0x1f);
62fc031e:	8bfd                	andi	a5,a5,31
    flash_size_level -= 0x13;
62fc0320:	17b5                	addi	a5,a5,-19
    flash_size = (1 << flash_size_level) * 512 * 1024;
62fc0322:	00080737          	lui	a4,0x80
62fc0326:	00f717b3          	sll	a5,a4,a5
}
62fc032a:	50b2                	lw	ra,44(sp)
62fc032c:	5422                	lw	s0,40(sp)
        flash2_size = flash_get_size_from_jedecid(g_jedec_id2);
62fc032e:	80f1a223          	sw	a5,-2044(gp) # 62fc9004 <flash2_size>
}
62fc0332:	5492                	lw	s1,36(sp)
62fc0334:	5902                	lw	s2,32(sp)
62fc0336:	6145                	addi	sp,sp,48
62fc0338:	8082                	ret

62fc033a <bflb_flash_init>:
{
62fc033a:	7139                	addi	sp,sp,-64
    bflb_ef_ctrl_get_device_info(&deviceInfo);
62fc033c:	c1818513          	addi	a0,gp,-1000 # 62fc9418 <deviceInfo>
{
62fc0340:	de06                	sw	ra,60(sp)
62fc0342:	dc22                	sw	s0,56(sp)
62fc0344:	da26                	sw	s1,52(sp)
62fc0346:	d84a                	sw	s2,48(sp)
62fc0348:	d64e                	sw	s3,44(sp)
62fc034a:	d452                	sw	s4,40(sp)
    uint32_t jedec_id = 0;
62fc034c:	c602                	sw	zero,12(sp)
    bflb_ef_ctrl_get_device_info(&deviceInfo);
62fc034e:	3d047097          	auipc	ra,0x3d047
62fc0352:	9c6080e7          	jalr	-1594(ra) # a0006d14 <bflb_ef_ctrl_get_device_info>
    jedec_id = GLB_Get_Flash_Id_Value();
62fc0356:	2d8d                	jal	62fc09c8 <GLB_Get_Flash_Id_Value>
62fc0358:	c62a                	sw	a0,12(sp)
    if (jedec_id != 0) {
62fc035a:	c909                	beqz	a0,62fc036c <bflb_flash_init+0x32>
        ret = bflb_sf_cfg_get_flash_cfg_need_lock_ext(jedec_id, &g_flash_cfg, 0, 0);
62fc035c:	4681                	li	a3,0
62fc035e:	4601                	li	a2,0
62fc0360:	85c18593          	addi	a1,gp,-1956 # 62fc905c <g_flash_cfg>
62fc0364:	2181                	jal	62fc07a4 <bflb_sf_cfg_get_flash_cfg_need_lock_ext>
62fc0366:	84aa                	mv	s1,a0
        if (ret == 0) {
62fc0368:	16050963          	beqz	a0,62fc04da <bflb_flash_init+0x1a0>
    uint8_t is_aes_enable = 0;
62fc036c:	000105a3          	sb	zero,11(sp)
    uint32_t jid = 0;
62fc0370:	c802                	sw	zero,16(sp)
    uint32_t offset = 0;
62fc0372:	ca02                	sw	zero,20(sp)
    flag = bflb_irq_save();
62fc0374:	22d9                	jal	62fc053a <bflb_irq_save>
62fc0376:	8a2a                	mv	s4,a0
    bflb_xip_sflash_opt_enter(&is_aes_enable);
62fc0378:	00b10513          	addi	a0,sp,11
62fc037c:	2909                	jal	62fc078e <bflb_xip_sflash_opt_enter>
    bflb_xip_sflash_state_save(p_flash_cfg, &offset, 0, 0);
62fc037e:	4681                	li	a3,0
62fc0380:	4601                	li	a2,0
62fc0382:	084c                	addi	a1,sp,20
62fc0384:	85c18513          	addi	a0,gp,-1956 # 62fc905c <g_flash_cfg>
62fc0388:	2b45                	jal	62fc0938 <bflb_xip_sflash_state_save>
    bflb_sflash_get_jedecid(p_flash_cfg, (uint8_t *)&jid);
62fc038a:	080c                	addi	a1,sp,16
62fc038c:	85c18513          	addi	a0,gp,-1956 # 62fc905c <g_flash_cfg>
62fc0390:	26f1                	jal	62fc075c <bflb_sflash_get_jedecid>
    arch_memcpy(jedec_id, (uint8_t *)&jid, 3);
62fc0392:	460d                	li	a2,3
62fc0394:	080c                	addi	a1,sp,16
62fc0396:	0068                	addi	a0,sp,12
62fc0398:	31a5                	jal	62fc0000 <arch_memcpy>
    jid &= 0xFFFFFF;
62fc039a:	4542                	lw	a0,16(sp)
62fc039c:	010007b7          	lui	a5,0x1000
62fc03a0:	17fd                	addi	a5,a5,-1
62fc03a2:	8d7d                	and	a0,a0,a5
    g_jedec_id = jid;
62fc03a4:	c1c18913          	addi	s2,gp,-996 # 62fc941c <g_jedec_id>
    ret = bflb_sf_cfg_get_flash_cfg_need_lock_ext(jid, p_flash_cfg, 0, 0);
62fc03a8:	4681                	li	a3,0
62fc03aa:	4601                	li	a2,0
62fc03ac:	85c18593          	addi	a1,gp,-1956 # 62fc905c <g_flash_cfg>
    jid &= 0xFFFFFF;
62fc03b0:	c82a                	sw	a0,16(sp)
    g_jedec_id = jid;
62fc03b2:	00a92023          	sw	a0,0(s2)
    ret = bflb_sf_cfg_get_flash_cfg_need_lock_ext(jid, p_flash_cfg, 0, 0);
62fc03b6:	26fd                	jal	62fc07a4 <bflb_sf_cfg_get_flash_cfg_need_lock_ext>
62fc03b8:	84aa                	mv	s1,a0
    bflb_xip_sflash_state_save(p_flash_cfg, &offset, 0, 0);
62fc03ba:	85c18993          	addi	s3,gp,-1956 # 62fc905c <g_flash_cfg>
    if (ret == 0) {
62fc03be:	10050463          	beqz	a0,62fc04c6 <bflb_flash_init+0x18c>
    if ((p_flash_cfg->io_mode & 0x1f) == SF_CTRL_QIO_MODE) {
62fc03c2:	0009c783          	lbu	a5,0(s3)
    cmds_cfg.ack_latency = 1;
62fc03c6:	01010737          	lui	a4,0x1010
62fc03ca:	10170713          	addi	a4,a4,257 # 1010101 <nocache_min_size+0x100b101>
62fc03ce:	cc3a                	sw	a4,24(sp)
    cmds_cfg.cmds_wrap_len = 9;
62fc03d0:	4725                	li	a4,9
62fc03d2:	00e10e23          	sb	a4,28(sp)
    if ((p_flash_cfg->io_mode & 0x1f) == SF_CTRL_QIO_MODE) {
62fc03d6:	8bfd                	andi	a5,a5,31
62fc03d8:	4711                	li	a4,4
62fc03da:	00e79763          	bne	a5,a4,62fc03e8 <bflb_flash_init+0xae>
        cmds_cfg.cmds_wrap_mode = 2;
62fc03de:	4789                	li	a5,2
62fc03e0:	00f10da3          	sb	a5,27(sp)
        cmds_cfg.cmds_wrap_len = 2;
62fc03e4:	00f10e23          	sb	a5,28(sp)
    bflb_sf_ctrl_cmds_set(&cmds_cfg, 0);
62fc03e8:	4581                	li	a1,0
62fc03ea:	0828                	addi	a0,sp,24
62fc03ec:	2e19                	jal	62fc0702 <bflb_sf_ctrl_cmds_set>
    if ((p_flash_cfg->io_mode & 0x0f) == SF_CTRL_QO_MODE || (p_flash_cfg->io_mode & 0x0f) == SF_CTRL_QIO_MODE) {
62fc03ee:	0009c703          	lbu	a4,0(s3)
62fc03f2:	00f77793          	andi	a5,a4,15
62fc03f6:	17f9                	addi	a5,a5,-2
62fc03f8:	0fd7f793          	andi	a5,a5,253
62fc03fc:	e791                	bnez	a5,62fc0408 <bflb_flash_init+0xce>
        bflb_sflash_qspi_enable(p_flash_cfg);
62fc03fe:	85c18513          	addi	a0,gp,-1956 # 62fc905c <g_flash_cfg>
62fc0402:	2e0d                	jal	62fc0734 <bflb_sflash_qspi_enable>
    if ((p_flash_cfg->io_mode & 0x1f) == SF_CTRL_QIO_MODE) {
62fc0404:	0009c703          	lbu	a4,0(s3)
62fc0408:	8b7d                	andi	a4,a4,31
62fc040a:	4791                	li	a5,4
62fc040c:	0cf70163          	beq	a4,a5,62fc04ce <bflb_flash_init+0x194>
        L1C_Set_Wrap(DISABLE);
62fc0410:	4501                	li	a0,0
62fc0412:	24e1                	jal	62fc06da <L1C_Set_Wrap>
        bflb_sflash_disable_burst_wrap(p_flash_cfg);
62fc0414:	85c18513          	addi	a0,gp,-1956 # 62fc905c <g_flash_cfg>
62fc0418:	2e2d                	jal	62fc0752 <bflb_sflash_disable_burst_wrap>
    bflb_xip_sflash_state_restore(p_flash_cfg, offset, 0, 0);
62fc041a:	45d2                	lw	a1,20(sp)
62fc041c:	4681                	li	a3,0
62fc041e:	4601                	li	a2,0
62fc0420:	85c18513          	addi	a0,gp,-1956 # 62fc905c <g_flash_cfg>
62fc0424:	2e99                	jal	62fc077a <bflb_xip_sflash_state_restore>
    bflb_xip_sflash_opt_exit(is_aes_enable);
62fc0426:	00b14503          	lbu	a0,11(sp)
62fc042a:	26bd                	jal	62fc0798 <bflb_xip_sflash_opt_exit>
    bflb_irq_restore(flag);
62fc042c:	8552                	mv	a0,s4
62fc042e:	2a11                	jal	62fc0542 <bflb_irq_restore>
    regval = getreg32(reg_base + SF_CTRL_0_OFFSET);
62fc0430:	2000b7b7          	lui	a5,0x2000b
62fc0434:	4390                	lw	a2,0(a5)
    regval = getreg32(reg_base + SF_CTRL_SF_IF_IO_DLY_1_OFFSET);
62fc0436:	5bd4                	lw	a3,52(a5)
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc0438:	4881                	li	a7,0
62fc043a:	2886370b          	extu	a4,a2,10,8
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_DI_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DI_DLY_SEL_SHIFT) << 2);
62fc043e:	0066d793          	srli	a5,a3,0x6
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc0442:	00569813          	slli	a6,a3,0x5
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_SF_RX_INV_SEL) ? 1 : 0) << 1);
62fc0446:	00165593          	srli	a1,a2,0x1
    if (regval & SF_CTRL_SF_IF_READ_DLY_EN) {
62fc044a:	2cb6330b          	extu	t1,a2,11,11
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc044e:	06087813          	andi	a6,a6,96
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_SF_RX_INV_SEL) ? 1 : 0) << 1);
62fc0452:	8989                	andi	a1,a1,2
    GLB_Set_Flash_Id_Value(g_jedec_id);
62fc0454:	00092503          	lw	a0,0(s2)
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc0458:	0705                	addi	a4,a4,1
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc045a:	82b1                	srli	a3,a3,0xc
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_DI_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DI_DLY_SEL_SHIFT) << 2);
62fc045c:	8bb1                	andi	a5,a5,12
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_OUT_INV_SEL) ? 1 : 0) << 0);
62fc045e:	1046360b          	extu	a2,a2,4,4
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc0462:	0306f693          	andi	a3,a3,48
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc0466:	4068970b          	mveqz	a4,a7,t1
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc046a:	0107e7b3          	or	a5,a5,a6
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_SF_RX_INV_SEL) ? 1 : 0) << 1);
62fc046e:	8e4d                	or	a2,a2,a1
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc0470:	8f55                	or	a4,a4,a3
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc0472:	8fd1                	or	a5,a5,a2
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc0474:	00e98123          	sb	a4,2(s3)
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc0478:	00f981a3          	sb	a5,3(s3)
    GLB_Set_Flash_Id_Value(g_jedec_id);
62fc047c:	2b2d                	jal	62fc09b6 <GLB_Set_Flash_Id_Value>
    flash1_size = flash_get_size_from_jedecid(g_jedec_id);
62fc047e:	00092703          	lw	a4,0(s2)
    jid = ((jedec_id & 0xff) << 16) + (jedec_id & 0xff00) + ((jedec_id & 0xff0000) >> 16);
62fc0482:	00ff06b7          	lui	a3,0xff0
62fc0486:	01071793          	slli	a5,a4,0x10
62fc048a:	8ff5                	and	a5,a5,a3
62fc048c:	66c1                	lui	a3,0x10
62fc048e:	f0068693          	addi	a3,a3,-256 # ff00 <nocache_min_size+0xaf00>
62fc0492:	8ef9                	and	a3,a3,a4
62fc0494:	8fd5                	or	a5,a5,a3
62fc0496:	5d07370b          	extu	a4,a4,23,16
62fc049a:	97ba                	add	a5,a5,a4
    if (jid == 0) {
62fc049c:	c799                	beqz	a5,62fc04aa <bflb_flash_init+0x170>
    flash_size_level = (jid & 0x1f);
62fc049e:	8bfd                	andi	a5,a5,31
    flash_size_level -= 0x13;
62fc04a0:	17b5                	addi	a5,a5,-19
    flash_size = (1 << flash_size_level) * 512 * 1024;
62fc04a2:	00080737          	lui	a4,0x80
62fc04a6:	00f717b3          	sll	a5,a4,a5
    flash1_size = flash_get_size_from_jedecid(g_jedec_id);
62fc04aa:	62fc9737          	lui	a4,0x62fc9
62fc04ae:	00f72023          	sw	a5,0(a4) # 62fc9000 <flash1_size>
    flash2_init();
62fc04b2:	3345                	jal	62fc0252 <flash2_init.isra.0>
}
62fc04b4:	50f2                	lw	ra,60(sp)
62fc04b6:	5462                	lw	s0,56(sp)
62fc04b8:	5942                	lw	s2,48(sp)
62fc04ba:	59b2                	lw	s3,44(sp)
62fc04bc:	5a22                	lw	s4,40(sp)
62fc04be:	8526                	mv	a0,s1
62fc04c0:	54d2                	lw	s1,52(sp)
62fc04c2:	6121                	addi	sp,sp,64
62fc04c4:	8082                	ret
        p_flash_cfg->mid = (jid & 0xff);
62fc04c6:	47c2                	lw	a5,16(sp)
62fc04c8:	00f986a3          	sb	a5,13(s3)
62fc04cc:	bddd                	j	62fc03c2 <bflb_flash_init+0x88>
        L1C_Set_Wrap(ENABLE);
62fc04ce:	4505                	li	a0,1
62fc04d0:	2429                	jal	62fc06da <L1C_Set_Wrap>
        bflb_sflash_set_burst_wrap(p_flash_cfg);
62fc04d2:	85c18513          	addi	a0,gp,-1956 # 62fc905c <g_flash_cfg>
62fc04d6:	2c69                	jal	62fc0770 <bflb_sflash_set_burst_wrap>
62fc04d8:	b789                	j	62fc041a <bflb_flash_init+0xe0>
            g_jedec_id = jedec_id;
62fc04da:	4732                	lw	a4,12(sp)
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc04dc:	4801                	li	a6,0
            g_jedec_id = jedec_id;
62fc04de:	c0e1ae23          	sw	a4,-996(gp) # 62fc941c <g_jedec_id>
    regval = getreg32(reg_base + SF_CTRL_0_OFFSET);
62fc04e2:	2000b7b7          	lui	a5,0x2000b
62fc04e6:	4390                	lw	a2,0(a5)
    regval = getreg32(reg_base + SF_CTRL_SF_IF_IO_DLY_1_OFFSET);
62fc04e8:	5bd4                	lw	a3,52(a5)
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc04ea:	85c18413          	addi	s0,gp,-1956 # 62fc905c <g_flash_cfg>
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc04ee:	2886370b          	extu	a4,a2,10,8
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_SF_RX_INV_SEL) ? 1 : 0) << 1);
62fc04f2:	00165793          	srli	a5,a2,0x1
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_DI_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DI_DLY_SEL_SHIFT) << 2);
62fc04f6:	0066d593          	srli	a1,a3,0x6
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc04fa:	00569513          	slli	a0,a3,0x5
    if (regval & SF_CTRL_SF_IF_READ_DLY_EN) {
62fc04fe:	2cb6388b          	extu	a7,a2,11,11
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_DI_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DI_DLY_SEL_SHIFT) << 2);
62fc0502:	89b1                	andi	a1,a1,12
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_OUT_INV_SEL) ? 1 : 0) << 0);
62fc0504:	1046360b          	extu	a2,a2,4,4
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc0508:	06057513          	andi	a0,a0,96
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc050c:	0705                	addi	a4,a4,1
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc050e:	82b1                	srli	a3,a3,0xc
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_SF_RX_INV_SEL) ? 1 : 0) << 1);
62fc0510:	8b89                	andi	a5,a5,2
        cfg->clk_delay = ((regval & SF_CTRL_SF_IF_READ_DLY_N_MASK) >> SF_CTRL_SF_IF_READ_DLY_N_SHIFT) + 1;
62fc0512:	4118170b          	mveqz	a4,a6,a7
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc0516:	0306f693          	andi	a3,a3,48
    cfg->clk_invert |= (((regval & SF_CTRL_SF_CLK_SF_RX_INV_SEL) ? 1 : 0) << 1);
62fc051a:	8fd1                	or	a5,a5,a2
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc051c:	00a5e633          	or	a2,a1,a0
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc0520:	8f55                	or	a4,a4,a3
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc0522:	8fd1                	or	a5,a5,a2
    cfg->clk_delay |= (((regval & SF_CTRL_SF_IO_0_DO_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_DO_DLY_SEL_SHIFT) << 4);
62fc0524:	00e40123          	sb	a4,2(s0) # 20056002 <nocache_min_size+0x20051002>
    cfg->clk_invert |= (((regval & SF_CTRL_SF_IO_0_OE_DLY_SEL_MASK) >> SF_CTRL_SF_IO_0_OE_DLY_SEL_SHIFT) << 5);
62fc0528:	00f401a3          	sb	a5,3(s0)
            flash2_init();
62fc052c:	331d                	jal	62fc0252 <flash2_init.isra.0>
            return 0;
62fc052e:	b759                	j	62fc04b4 <bflb_flash_init+0x17a>

62fc0530 <bflb_sflash_xip_read_enable>:
 *
*******************************************************************************/
__WEAK
int ATTR_TCM_SECTION bflb_sflash_xip_read_enable(spi_flash_cfg_type *flash_cfg,
                                                 uint8_t io_mode, uint8_t cont_read, uint8_t bank)
{
62fc0530:	87b6                	mv	a5,a3
    int stat = 0;

    stat = bflb_sflash_set_xip_cfg(flash_cfg, io_mode, cont_read, 0, 32, bank);
62fc0532:	02000713          	li	a4,32
62fc0536:	4681                	li	a3,0
62fc0538:	ac01                	j	62fc0748 <bflb_sflash_set_xip_cfg>

62fc053a <bflb_irq_save>:
{
    uintptr_t oldstat;

    /* Read mstatus & clear machine interrupt enable (MIE) in mstatus */

    asm volatile("csrrc %0, mstatus, %1"
62fc053a:	4521                	li	a0,8
62fc053c:	30053573          	csrrc	a0,mstatus,a0
                 : "=r"(oldstat)
                 : "r"(MSTATUS_MIE));
    return oldstat;
}
62fc0540:	8082                	ret

62fc0542 <bflb_irq_restore>:

ATTR_TCM_SECTION void bflb_irq_restore(uintptr_t flags)
{
    /* Write flags to mstatus */

    asm volatile("csrw mstatus, %0"
62fc0542:	30051073          	csrw	mstatus,a0
                 : /* no output */
                 : "r"(flags));
}
62fc0546:	8082                	ret

62fc0548 <bflb_mtimer_get_time_us>:
{
    return 1 * 1000 * 1000;
}

uint64_t ATTR_TCM_SECTION bflb_mtimer_get_time_us(void)
{
62fc0548:	7179                	addi	sp,sp,-48
62fc054a:	d622                	sw	s0,44(sp)
62fc054c:	d426                	sw	s1,40(sp)
    return (CORET->MTIME >> 32) & 0xFFFFFFFF;
62fc054e:	e000c7b7          	lui	a5,0xe000c
62fc0552:	0001                	nop
62fc0554:	ff87ae03          	lw	t3,-8(a5) # e000bff8 <__psram_limit+0x37c0bff8>
62fc0558:	ffc7ae83          	lw	t4,-4(a5)
62fc055c:	4881                	li	a7,0
62fc055e:	4381                	li	t2,0
        tmp_high = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET + 4);
        tmp_low = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET);
        tmp_low1 = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET);
        tmp_high1 = getreg32(CLIC_CTRL_BASE + CLIC_MTIME_OFFSET + 4);
#else
        tmp_high = (uint64_t)csi_coret_get_valueh();
62fc0560:	c476                	sw	t4,8(sp)
62fc0562:	c646                	sw	a7,12(sp)
    return CORET->MTIME & 0xFFFFFFFF;
62fc0564:	ff87ae03          	lw	t3,-8(a5)
62fc0568:	ffc7ae83          	lw	t4,-4(a5)
62fc056c:	4681                	li	a3,0
        tmp_low = (uint64_t)csi_coret_get_value();
62fc056e:	c072                	sw	t3,0(sp)
62fc0570:	c21e                	sw	t2,4(sp)
62fc0572:	ff87ae03          	lw	t3,-8(a5)
62fc0576:	ffc7ae83          	lw	t4,-4(a5)
    return (CORET->MTIME >> 32) & 0xFFFFFFFF;
62fc057a:	4581                	li	a1,0
        tmp_low1 = (uint64_t)csi_coret_get_value();
62fc057c:	c872                	sw	t3,16(sp)
62fc057e:	ca36                	sw	a3,20(sp)
62fc0580:	ff87ae03          	lw	t3,-8(a5)
62fc0584:	ffc7ae83          	lw	t4,-4(a5)
        tmp_high1 = (uint64_t)csi_coret_get_valueh();
62fc0588:	cc76                	sw	t4,24(sp)
62fc058a:	ce2e                	sw	a1,28(sp)
#endif
    } while (tmp_low > tmp_low1 || tmp_high != tmp_high1);
62fc058c:	4f02                	lw	t5,0(sp)
62fc058e:	4f92                	lw	t6,4(sp)
62fc0590:	4442                	lw	s0,16(sp)
62fc0592:	44d2                	lw	s1,20(sp)
62fc0594:	fdf4e0e3          	bltu	s1,t6,62fc0554 <bflb_mtimer_get_time_us+0xc>
62fc0598:	009f9463          	bne	t6,s1,62fc05a0 <bflb_mtimer_get_time_us+0x58>
62fc059c:	fbe46ce3          	bltu	s0,t5,62fc0554 <bflb_mtimer_get_time_us+0xc>
62fc05a0:	4e22                	lw	t3,8(sp)
62fc05a2:	4eb2                	lw	t4,12(sp)
62fc05a4:	4f62                	lw	t5,24(sp)
62fc05a6:	4ff2                	lw	t6,28(sp)
62fc05a8:	fbcf16e3          	bne	t5,t3,62fc0554 <bflb_mtimer_get_time_us+0xc>
62fc05ac:	fbdf94e3          	bne	t6,t4,62fc0554 <bflb_mtimer_get_time_us+0xc>
#ifdef CONFIG_MTIMER_CUSTOM_FREQUENCE
    return ((uint64_t)(((tmp_high1 << 32) + tmp_low1)) * ((uint64_t)(1 * 1000 * 1000)) / bflb_mtimer_get_freq());
#else
    return (uint64_t)(((tmp_high1 << 32) + tmp_low1));
62fc05b0:	4662                	lw	a2,24(sp)
#endif
}
62fc05b2:	5432                	lw	s0,44(sp)
    return (uint64_t)(((tmp_high1 << 32) + tmp_low1));
62fc05b4:	46f2                	lw	a3,28(sp)
62fc05b6:	4542                	lw	a0,16(sp)
62fc05b8:	45d2                	lw	a1,20(sp)
62fc05ba:	4701                	li	a4,0
62fc05bc:	87b2                	mv	a5,a2
}
62fc05be:	54a2                	lw	s1,40(sp)
62fc05c0:	c0a71577          	add64	a0,a4,a0
62fc05c4:	6145                	addi	sp,sp,48
62fc05c6:	8082                	ret

62fc05c8 <bflb_mtimer_get_time_ms>:
    *n = res;
    return rem;
}

uint64_t ATTR_TCM_SECTION bflb_mtimer_get_time_ms(void)
{
62fc05c8:	1141                	addi	sp,sp,-16
62fc05ca:	c606                	sw	ra,12(sp)
#ifdef BFLB_BOOT2
    uint64_t ret = bflb_mtimer_get_time_us();
    __div64_32(&ret, 1000);
    return ret;
#else
    return bflb_mtimer_get_time_us() / 1000;
62fc05cc:	3fb5                	jal	62fc0548 <bflb_mtimer_get_time_us>
62fc05ce:	3e800613          	li	a2,1000
62fc05d2:	4681                	li	a3,0
62fc05d4:	3d041097          	auipc	ra,0x3d041
62fc05d8:	d86080e7          	jalr	-634(ra) # a000135a <__udivdi3>
#endif
}
62fc05dc:	40b2                	lw	ra,12(sp)
62fc05de:	0141                	addi	sp,sp,16
62fc05e0:	8082                	ret

62fc05e2 <bflb_mtimer_delay_us>:

void ATTR_TCM_SECTION bflb_mtimer_delay_us(uint32_t time)
{
62fc05e2:	1101                	addi	sp,sp,-32
62fc05e4:	cc22                	sw	s0,24(sp)
62fc05e6:	ca26                	sw	s1,20(sp)
62fc05e8:	c84a                	sw	s2,16(sp)
62fc05ea:	c64e                	sw	s3,12(sp)
62fc05ec:	ce06                	sw	ra,28(sp)
62fc05ee:	89aa                	mv	s3,a0
    uint64_t start_time = bflb_mtimer_get_time_us();
62fc05f0:	3fa1                	jal	62fc0548 <bflb_mtimer_get_time_us>

    while (bflb_mtimer_get_time_us() - start_time < time) {
62fc05f2:	4901                	li	s2,0
    uint64_t start_time = bflb_mtimer_get_time_us();
62fc05f4:	842a                	mv	s0,a0
62fc05f6:	84ae                	mv	s1,a1
    while (bflb_mtimer_get_time_us() - start_time < time) {
62fc05f8:	3f81                	jal	62fc0548 <bflb_mtimer_get_time_us>
62fc05fa:	c2851577          	sub64	a0,a0,s0
62fc05fe:	00b91463          	bne	s2,a1,62fc0606 <bflb_mtimer_delay_us+0x24>
62fc0602:	ff356be3          	bltu	a0,s3,62fc05f8 <bflb_mtimer_delay_us+0x16>
    }
}
62fc0606:	40f2                	lw	ra,28(sp)
62fc0608:	4462                	lw	s0,24(sp)
62fc060a:	44d2                	lw	s1,20(sp)
62fc060c:	4942                	lw	s2,16(sp)
62fc060e:	49b2                	lw	s3,12(sp)
62fc0610:	6105                	addi	sp,sp,32
62fc0612:	8082                	ret

62fc0614 <bflb_mtimer_delay_ms>:

void ATTR_TCM_SECTION bflb_mtimer_delay_ms(uint32_t time)
{
62fc0614:	1101                	addi	sp,sp,-32
62fc0616:	ce06                	sw	ra,28(sp)
62fc0618:	cc22                	sw	s0,24(sp)
62fc061a:	ca26                	sw	s1,20(sp)
62fc061c:	c84a                	sw	s2,16(sp)
62fc061e:	c64e                	sw	s3,12(sp)
62fc0620:	84aa                	mv	s1,a0
    return bflb_mtimer_get_time_us() / 1000;
62fc0622:	371d                	jal	62fc0548 <bflb_mtimer_get_time_us>
62fc0624:	3e800613          	li	a2,1000
62fc0628:	4681                	li	a3,0
62fc062a:	3d041097          	auipc	ra,0x3d041
62fc062e:	d30080e7          	jalr	-720(ra) # a000135a <__udivdi3>
62fc0632:	892a                	mv	s2,a0
62fc0634:	89ae                	mv	s3,a1
    uint64_t start_time = bflb_mtimer_get_time_ms();

    while (bflb_mtimer_get_time_ms() - start_time < time) {
62fc0636:	4401                	li	s0,0
    return bflb_mtimer_get_time_us() / 1000;
62fc0638:	3f01                	jal	62fc0548 <bflb_mtimer_get_time_us>
62fc063a:	3e800613          	li	a2,1000
62fc063e:	4681                	li	a3,0
62fc0640:	3d041097          	auipc	ra,0x3d041
62fc0644:	d1a080e7          	jalr	-742(ra) # a000135a <__udivdi3>
    while (bflb_mtimer_get_time_ms() - start_time < time) {
62fc0648:	c3251577          	sub64	a0,a0,s2
62fc064c:	00b41463          	bne	s0,a1,62fc0654 <bflb_mtimer_delay_ms+0x40>
62fc0650:	fe9564e3          	bltu	a0,s1,62fc0638 <bflb_mtimer_delay_ms+0x24>
    }
}
62fc0654:	40f2                	lw	ra,28(sp)
62fc0656:	4462                	lw	s0,24(sp)
62fc0658:	44d2                	lw	s1,20(sp)
62fc065a:	4942                	lw	s2,16(sp)
62fc065c:	49b2                	lw	s3,12(sp)
62fc065e:	6105                	addi	sp,sp,32
62fc0660:	8082                	ret

62fc0662 <CPU_Set_MTimer_CLK>:
    return RomDriver_CPU_Reset_MTimer();
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type CPU_Set_MTimer_CLK(uint8_t enable, BL_MTimer_Source_Clock_Type mTimerSourceClockType, uint16_t div){
    return RomDriver_CPU_Set_MTimer_CLK(enable,mTimerSourceClockType,div);
62fc0662:	900167b7          	lui	a5,0x90016
62fc0666:	8607a783          	lw	a5,-1952(a5) # 90015860 <__psram_limit+0xe7c15860>
62fc066a:	8782                	jr	a5

62fc066c <Clock_Peripheral_Clock_Get>:
    return RomDriver_Clock_Get_PSRAMB_Clk();
}

__ALWAYS_INLINE ATTR_TCM_SECTION
uint32_t Clock_Peripheral_Clock_Get(BL_Peripheral_Type type){
    return RomDriver_Clock_Peripheral_Clock_Get(type);
62fc066c:	900167b7          	lui	a5,0x90016
62fc0670:	87c7a783          	lw	a5,-1924(a5) # 9001587c <__psram_limit+0xe7c1587c>
62fc0674:	8782                	jr	a5

62fc0676 <Clock_System_Clock_Get>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
uint32_t Clock_System_Clock_Get(BL_System_Clock_Type type){
    return RomDriver_Clock_System_Clock_Get(type);
62fc0676:	900167b7          	lui	a5,0x90016
62fc067a:	8807a783          	lw	a5,-1920(a5) # 90015880 <__psram_limit+0xe7c15880>
62fc067e:	8782                	jr	a5

62fc0680 <GLB_Power_On_XTAL_And_PLL_CLK>:
    return RomDriver_GLB_Power_On_WIFIPLL(cfg,waitStable);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Power_On_XTAL_And_PLL_CLK(GLB_XTAL_Type xtalType, GLB_PLL_Type pllType){
    return RomDriver_GLB_Power_On_XTAL_And_PLL_CLK(xtalType,pllType);
62fc0680:	900167b7          	lui	a5,0x90016
62fc0684:	9cc7a783          	lw	a5,-1588(a5) # 900159cc <__psram_limit+0xe7c159cc>
62fc0688:	8782                	jr	a5

62fc068a <GLB_Set_DIG_512K_CLK>:
    return RomDriver_GLB_Set_DIG_32K_CLK(enable,compensationEn,div);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_DIG_512K_CLK(uint8_t enable, uint8_t compensationEn, uint8_t div){
    return RomDriver_GLB_Set_DIG_512K_CLK(enable,compensationEn,div);
62fc068a:	900167b7          	lui	a5,0x90016
62fc068e:	a0c7a783          	lw	a5,-1524(a5) # 90015a0c <__psram_limit+0xe7c15a0c>
62fc0692:	8782                	jr	a5

62fc0694 <GLB_Set_DIG_CLK_Sel>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_DIG_CLK_Sel(GLB_DIG_CLK_Type clkSel){
    return RomDriver_GLB_Set_DIG_CLK_Sel(clkSel);
62fc0694:	900167b7          	lui	a5,0x90016
62fc0698:	a107a783          	lw	a5,-1520(a5) # 90015a10 <__psram_limit+0xe7c15a10>
62fc069c:	8782                	jr	a5

62fc069e <GLB_Set_MCU_System_CLK>:
    return RomDriver_GLB_Set_MCU_SPI_0_ACT_MOD_Sel(mod);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_MCU_System_CLK(GLB_MCU_SYS_CLK_Type clkFreq){
    return RomDriver_GLB_Set_MCU_System_CLK(clkFreq);
62fc069e:	900167b7          	lui	a5,0x90016
62fc06a2:	a407a783          	lw	a5,-1472(a5) # 90015a40 <__psram_limit+0xe7c15a40>
62fc06a6:	8782                	jr	a5

62fc06a8 <GLB_Set_PKA_CLK_Sel>:
    return RomDriver_GLB_Set_PDM_IO_Sel(ioSel);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_PKA_CLK_Sel(GLB_PKA_CLK_Type clkSel){
    return RomDriver_GLB_Set_PKA_CLK_Sel(clkSel);
62fc06a8:	900167b7          	lui	a5,0x90016
62fc06ac:	a4c7a783          	lw	a5,-1460(a5) # 90015a4c <__psram_limit+0xe7c15a4c>
62fc06b0:	8782                	jr	a5

62fc06b2 <GLB_Set_PWM1_IO_Sel>:
}
#endif

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_PWM1_IO_Sel(GLB_PWM1_IO_SEL_Type ioSel){
    return RomDriver_GLB_Set_PWM1_IO_Sel(ioSel);
62fc06b2:	900167b7          	lui	a5,0x90016
62fc06b6:	a547a783          	lw	a5,-1452(a5) # 90015a54 <__psram_limit+0xe7c15a54>
62fc06ba:	8782                	jr	a5

62fc06bc <GLB_Set_UART_CLK>:
    return RomDriver_GLB_Set_Slave_Grp_0_CLK(slave,enable,clkSel,div);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_UART_CLK(uint8_t enable, HBN_UART_CLK_Type clkSel, uint8_t div){
    return RomDriver_GLB_Set_UART_CLK(enable,clkSel,div);
62fc06bc:	900167b7          	lui	a5,0x90016
62fc06c0:	a847a783          	lw	a5,-1404(a5) # 90015a84 <__psram_limit+0xe7c15a84>
62fc06c4:	8782                	jr	a5

62fc06c6 <GLB_Set_USB_CLK_From_WIFIPLL>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Set_USB_CLK_From_WIFIPLL(uint8_t enable){
    return RomDriver_GLB_Set_USB_CLK_From_WIFIPLL(enable);
62fc06c6:	900167b7          	lui	a5,0x90016
62fc06ca:	a887a783          	lw	a5,-1400(a5) # 90015a88 <__psram_limit+0xe7c15a88>
62fc06ce:	8782                	jr	a5

62fc06d0 <GLB_Swap_MCU_SPI_0_MOSI_With_MISO>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type GLB_Swap_MCU_SPI_0_MOSI_With_MISO(BL_Fun_Type newState){
    return RomDriver_GLB_Swap_MCU_SPI_0_MOSI_With_MISO(newState);
62fc06d0:	900167b7          	lui	a5,0x90016
62fc06d4:	a8c7a783          	lw	a5,-1396(a5) # 90015a8c <__psram_limit+0xe7c15a8c>
62fc06d8:	8782                	jr	a5

62fc06da <L1C_Set_Wrap>:
    return RomDriver_L1C_Set_Cache_Setting_By_ID(core,cacheSetting);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
BL_Err_Type L1C_Set_Wrap(uint8_t en){
    return RomDriver_L1C_Set_Wrap(en);
62fc06da:	900167b7          	lui	a5,0x90016
62fc06de:	c947a783          	lw	a5,-876(a5) # 90015c94 <__psram_limit+0xe7c15c94>
62fc06e2:	8782                	jr	a5

62fc06e4 <bflb_sf_cfg_sbus2_flash_init>:
    return RomDriver_SF_Cfg_Init_Flash_Gpio(flash_pin_cfg,restore_default);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
int bflb_sf_cfg_sbus2_flash_init(uint8_t sel, const struct sf_ctrl_bank2_cfg *p_bank2_cfg){
    return RomDriver_SF_Cfg_Sbus2_Flash_Init(sel,p_bank2_cfg);
62fc06e4:	900167b7          	lui	a5,0x90016
62fc06e8:	d107a783          	lw	a5,-752(a5) # 90015d10 <__psram_limit+0xe7c15d10>
62fc06ec:	8782                	jr	a5

62fc06ee <bflb_sf_cfg_flash_identify>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
uint32_t bflb_sf_cfg_flash_identify(uint8_t call_from_flash, uint8_t flash_pin_cfg, uint8_t restore_default, spi_flash_cfg_type *flash_cfg, uint8_t group, uint8_t bank){
    return RomDriver_SF_Cfg_Flash_Identify(call_from_flash,flash_pin_cfg,restore_default,flash_cfg,group,bank);
62fc06ee:	90016837          	lui	a6,0x90016
62fc06f2:	d1482803          	lw	a6,-748(a6) # 90015d14 <__psram_limit+0xe7c15d14>
62fc06f6:	8802                	jr	a6

62fc06f8 <bflb_sf_ctrl_get_flash_image_offset>:
    return RomDriver_SF_Ctrl_Is_Sbus2_Enable();
}

__ALWAYS_INLINE ATTR_TCM_SECTION
uint32_t bflb_sf_ctrl_get_flash_image_offset(uint8_t group, uint8_t bank){
    return RomDriver_SF_Ctrl_Get_Flash_Image_Offset(group,bank);
62fc06f8:	900167b7          	lui	a5,0x90016
62fc06fc:	d247a783          	lw	a5,-732(a5) # 90015d24 <__psram_limit+0xe7c15d24>
62fc0700:	8782                	jr	a5

62fc0702 <bflb_sf_ctrl_cmds_set>:
    return RomDriver_SF_Ctrl_Bank2_Enable(bank2_cfg);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sf_ctrl_cmds_set(struct sf_ctrl_cmds_cfg *cmds_cfg, uint8_t bank){
    return RomDriver_SF_Ctrl_Cmds_Set(cmds_cfg,bank);
62fc0702:	900167b7          	lui	a5,0x90016
62fc0706:	d707a783          	lw	a5,-656(a5) # 90015d70 <__psram_limit+0xe7c15d70>
62fc070a:	8782                	jr	a5

62fc070c <bflb_sf_ctrl_sbus2_replace>:
    return RomDriver_SF_Ctrl_Sbus2_Release_Sram();
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sf_ctrl_sbus2_replace(uint8_t pad){
    return RomDriver_SF_Ctrl_Sbus2_Replace(pad);
62fc070c:	900167b7          	lui	a5,0x90016
62fc0710:	d987a783          	lw	a5,-616(a5) # 90015d98 <__psram_limit+0xe7c15d98>
62fc0714:	8782                	jr	a5

62fc0716 <bflb_sf_ctrl_sbus2_revoke_replace>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sf_ctrl_sbus2_revoke_replace(void){
    return RomDriver_SF_Ctrl_Sbus2_Revoke_replace();
62fc0716:	900167b7          	lui	a5,0x90016
62fc071a:	d9c7a783          	lw	a5,-612(a5) # 90015d9c <__psram_limit+0xe7c15d9c>
62fc071e:	8782                	jr	a5

62fc0720 <bflb_sf_ctrl_set_flash_image_offset>:
    return RomDriver_SF_Ctrl_Set_Clock_Delay(delay);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sf_ctrl_set_flash_image_offset(uint32_t addr_offset, uint8_t group, uint8_t bank){
    return RomDriver_SF_Ctrl_Set_Flash_Image_Offset(addr_offset,group,bank);
62fc0720:	900167b7          	lui	a5,0x90016
62fc0724:	db47a783          	lw	a5,-588(a5) # 90015db4 <__psram_limit+0xe7c15db4>
62fc0728:	8782                	jr	a5

62fc072a <bflb_sf_ctrl_set_owner>:
    return RomDriver_SF_Ctrl_Set_IO_Delay(pad,do_delay,di_delay,oe_delay);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sf_ctrl_set_owner(uint8_t owner){
    return RomDriver_SF_Ctrl_Set_Owner(owner);
62fc072a:	900167b7          	lui	a5,0x90016
62fc072e:	dbc7a783          	lw	a5,-580(a5) # 90015dbc <__psram_limit+0xe7c15dbc>
62fc0732:	8782                	jr	a5

62fc0734 <bflb_sflash_qspi_enable>:
    return RomDriver_SFlash_Qspi_Disable(flash_cfg);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
int bflb_sflash_qspi_enable(spi_flash_cfg_type *flash_cfg){
    return RomDriver_SFlash_Qspi_Enable(flash_cfg);
62fc0734:	900167b7          	lui	a5,0x90016
62fc0738:	de47a783          	lw	a5,-540(a5) # 90015de4 <__psram_limit+0xe7c15de4>
62fc073c:	8782                	jr	a5

62fc073e <bflb_sflash_set_32bits_addr_mode>:
    return RomDriver_SFlash_Sector_Erase(flash_cfg,sec_num);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
int bflb_sflash_set_32bits_addr_mode(spi_flash_cfg_type *flash_cfg, BL_Fun_Type en_32bits_addr){
    return RomDriver_SFlash_Set32BitsAddrMode(flash_cfg,en_32bits_addr);
62fc073e:	900167b7          	lui	a5,0x90016
62fc0742:	e047a783          	lw	a5,-508(a5) # 90015e04 <__psram_limit+0xe7c15e04>
62fc0746:	8782                	jr	a5

62fc0748 <bflb_sflash_set_xip_cfg>:
    return RomDriver_SFlash_SetSPIMode(mode);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
int bflb_sflash_set_xip_cfg(spi_flash_cfg_type *flash_cfg, uint8_t io_mode, uint8_t cont_read, uint32_t addr, uint32_t len, uint8_t bank){
    return RomDriver_SFlash_Set_IDbus_Cfg(flash_cfg,io_mode,cont_read,addr,len,bank);
62fc0748:	90016837          	lui	a6,0x90016
62fc074c:	e0c82803          	lw	a6,-500(a6) # 90015e0c <__psram_limit+0xe7c15e0c>
62fc0750:	8802                	jr	a6

62fc0752 <bflb_sflash_disable_burst_wrap>:
    return RomDriver_SFlash_Busy(flash_cfg);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sflash_disable_burst_wrap(spi_flash_cfg_type *flash_cfg){
    return RomDriver_SFlash_DisableBurstWrap(flash_cfg);
62fc0752:	900167b7          	lui	a5,0x90016
62fc0756:	e247a783          	lw	a5,-476(a5) # 90015e24 <__psram_limit+0xe7c15e24>
62fc075a:	8782                	jr	a5

62fc075c <bflb_sflash_get_jedecid>:
    return RomDriver_SFlash_GetDeviceId(data,is_32bits_addr);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sflash_get_jedecid(spi_flash_cfg_type *flash_cfg, uint8_t *data){
    return RomDriver_SFlash_GetJedecId(flash_cfg,data);
62fc075c:	900167b7          	lui	a5,0x90016
62fc0760:	e2c7a783          	lw	a5,-468(a5) # 90015e2c <__psram_limit+0xe7c15e2c>
62fc0764:	8782                	jr	a5

62fc0766 <bflb_sflash_reset_continue_read>:
    return RomDriver_SFlash_Release_Powerdown(flash_cfg);
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sflash_reset_continue_read(spi_flash_cfg_type *flash_cfg){
    return RomDriver_SFlash_Reset_Continue_Read(flash_cfg);
62fc0766:	900167b7          	lui	a5,0x90016
62fc076a:	e447a783          	lw	a5,-444(a5) # 90015e44 <__psram_limit+0xe7c15e44>
62fc076e:	8782                	jr	a5

62fc0770 <bflb_sflash_set_burst_wrap>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_sflash_set_burst_wrap(spi_flash_cfg_type *flash_cfg){
    return RomDriver_SFlash_SetBurstWrap(flash_cfg);
62fc0770:	900167b7          	lui	a5,0x90016
62fc0774:	e487a783          	lw	a5,-440(a5) # 90015e48 <__psram_limit+0xe7c15e48>
62fc0778:	8782                	jr	a5

62fc077a <bflb_xip_sflash_state_restore>:
}
#endif

__ALWAYS_INLINE ATTR_TCM_SECTION
int bflb_xip_sflash_state_restore(spi_flash_cfg_type *flash_cfg, uint32_t offset, uint8_t group, uint8_t bank){
    return RomDriver_XIP_SFlash_State_Restore(flash_cfg,offset,group,bank);
62fc077a:	900167b7          	lui	a5,0x90016
62fc077e:	ef87a783          	lw	a5,-264(a5) # 90015ef8 <__psram_limit+0xe7c15ef8>
int bflb_xip_sflash_state_restore(spi_flash_cfg_type *flash_cfg, uint32_t offset, uint8_t group, uint8_t bank){
62fc0782:	1141                	addi	sp,sp,-16
62fc0784:	c606                	sw	ra,12(sp)
    return RomDriver_XIP_SFlash_State_Restore(flash_cfg,offset,group,bank);
62fc0786:	9782                	jalr	a5
}
62fc0788:	40b2                	lw	ra,12(sp)
62fc078a:	0141                	addi	sp,sp,16
62fc078c:	8082                	ret

62fc078e <bflb_xip_sflash_opt_enter>:
}
#endif

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_xip_sflash_opt_enter(uint8_t *aes_enable){
    return RomDriver_XIP_SFlash_Opt_Enter(aes_enable);
62fc078e:	900167b7          	lui	a5,0x90016
62fc0792:	f047a783          	lw	a5,-252(a5) # 90015f04 <__psram_limit+0xe7c15f04>
62fc0796:	8782                	jr	a5

62fc0798 <bflb_xip_sflash_opt_exit>:
}

__ALWAYS_INLINE ATTR_TCM_SECTION
void bflb_xip_sflash_opt_exit(uint8_t aes_enable){
    return RomDriver_XIP_SFlash_Opt_Exit(aes_enable);
62fc0798:	900167b7          	lui	a5,0x90016
62fc079c:	f087a783          	lw	a5,-248(a5) # 90015f08 <__psram_limit+0xe7c15f08>
62fc07a0:	8782                	jr	a5
	...

62fc07a4 <bflb_sf_cfg_get_flash_cfg_need_lock_ext>:
    char flash_cfg_magic[] = "FCFG";
62fc07a4:	474647b7          	lui	a5,0x47464
{
62fc07a8:	7175                	addi	sp,sp,-144
    char flash_cfg_magic[] = "FCFG";
62fc07aa:	34678793          	addi	a5,a5,838 # 47464346 <__RFTLV_HEAD1_H+0xf3f704>
{
62fc07ae:	dece                	sw	s3,124(sp)
62fc07b0:	c706                	sw	ra,140(sp)
62fc07b2:	c522                	sw	s0,136(sp)
62fc07b4:	c326                	sw	s1,132(sp)
62fc07b6:	c14a                	sw	s2,128(sp)
62fc07b8:	dcd2                	sw	s4,120(sp)
    char flash_cfg_magic[] = "FCFG";
62fc07ba:	c63e                	sw	a5,12(sp)
62fc07bc:	00010823          	sb	zero,16(sp)
{
62fc07c0:	89ae                	mv	s3,a1
    if (flash_id == 0) {
62fc07c2:	c135                	beqz	a0,62fc0826 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0x82>
        if (RomDriver_SF_Cfg_Get_Flash_Cfg_Need_Lock(flash_id, p_flash_cfg) == 0) {
62fc07c4:	900167b7          	lui	a5,0x90016
62fc07c8:	d007a783          	lw	a5,-768(a5) # 90015d00 <__psram_limit+0xe7c15d00>
62fc07cc:	842a                	mv	s0,a0
62fc07ce:	9782                	jalr	a5
62fc07d0:	84aa                	mv	s1,a0
62fc07d2:	c129                	beqz	a0,62fc0814 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0x70>
62fc07d4:	62fc15b7          	lui	a1,0x62fc1
62fc07d8:	00174737          	lui	a4,0x174
62fc07dc:	ac458593          	addi	a1,a1,-1340 # 62fc0ac4 <flash_infos>
62fc07e0:	0ef70713          	addi	a4,a4,239 # 1740ef <nocache_min_size+0x16f0ef>
62fc07e4:	00c58693          	addi	a3,a1,12
        for (i = 0; i < sizeof(flash_infos) / sizeof(flash_infos[0]); i++) {
62fc07e8:	4781                	li	a5,0
62fc07ea:	4675                	li	a2,29
            if (flash_infos[i].jedec_id == flash_id) {
62fc07ec:	00870963          	beq	a4,s0,62fc07fe <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0x5a>
        for (i = 0; i < sizeof(flash_infos) / sizeof(flash_infos[0]); i++) {
62fc07f0:	0785                	addi	a5,a5,1
62fc07f2:	0ac78763          	beq	a5,a2,62fc08a0 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0xfc>
            if (flash_infos[i].jedec_id == flash_id) {
62fc07f6:	58c6c70b          	lwia	a4,(a3),12,0
62fc07fa:	fe871be3          	bne	a4,s0,62fc07f0 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0x4c>
                arch_memcpy_fast(p_flash_cfg, flash_infos[i].cfg, sizeof(spi_flash_cfg_type));
62fc07fe:	02f7978b          	addsl	a5,a5,a5,1
62fc0802:	04f5978b          	addsl	a5,a1,a5,2
62fc0806:	478c                	lw	a1,8(a5)
62fc0808:	05400613          	li	a2,84
62fc080c:	854e                	mv	a0,s3
62fc080e:	823ff0ef          	jal	ra,62fc0030 <arch_memcpy_fast>
                return 0;
62fc0812:	4481                	li	s1,0
}
62fc0814:	40ba                	lw	ra,140(sp)
62fc0816:	442a                	lw	s0,136(sp)
62fc0818:	490a                	lw	s2,128(sp)
62fc081a:	59f6                	lw	s3,124(sp)
62fc081c:	5a66                	lw	s4,120(sp)
62fc081e:	8526                	mv	a0,s1
62fc0820:	449a                	lw	s1,132(sp)
62fc0822:	6149                	addi	sp,sp,144
62fc0824:	8082                	ret
        xip_offset = bflb_sf_ctrl_get_flash_image_offset(group, bank);
62fc0826:	85b6                	mv	a1,a3
62fc0828:	8532                	mv	a0,a2
62fc082a:	8936                	mv	s2,a3
62fc082c:	84b2                	mv	s1,a2
62fc082e:	35e9                	jal	62fc06f8 <bflb_sf_ctrl_get_flash_image_offset>
        bflb_sf_ctrl_set_flash_image_offset(0, group, bank);
62fc0830:	864a                	mv	a2,s2
62fc0832:	85a6                	mv	a1,s1
        xip_offset = bflb_sf_ctrl_get_flash_image_offset(group, bank);
62fc0834:	842a                	mv	s0,a0
        bflb_sf_ctrl_set_flash_image_offset(0, group, bank);
62fc0836:	4501                	li	a0,0
62fc0838:	35e5                	jal	62fc0720 <bflb_sf_ctrl_set_flash_image_offset>
    offset = bflb_sf_ctrl_get_flash_image_offset(group, bank);
62fc083a:	85ca                	mv	a1,s2
62fc083c:	8526                	mv	a0,s1
62fc083e:	3d6d                	jal	62fc06f8 <bflb_sf_ctrl_get_flash_image_offset>
    bflb_sf_ctrl_set_flash_image_offset(0, group, bank);
62fc0840:	864a                	mv	a2,s2
62fc0842:	85a6                	mv	a1,s1
    offset = bflb_sf_ctrl_get_flash_image_offset(group, bank);
62fc0844:	8a2a                	mv	s4,a0
    bflb_sf_ctrl_set_flash_image_offset(0, group, bank);
62fc0846:	4501                	li	a0,0
62fc0848:	3de1                	jal	62fc0720 <bflb_sf_ctrl_set_flash_image_offset>
    arch_memcpy_fast(data, (void *)(uintptr_t)(addr - bflb_sf_ctrl_get_flash_image_offset(group, bank)), len);
62fc084a:	85ca                	mv	a1,s2
62fc084c:	8526                	mv	a0,s1
62fc084e:	356d                	jal	62fc06f8 <bflb_sf_ctrl_get_flash_image_offset>
62fc0850:	a00007b7          	lui	a5,0xa0000
62fc0854:	07a1                	addi	a5,a5,8
62fc0856:	40a785b3          	sub	a1,a5,a0
62fc085a:	05c00613          	li	a2,92
62fc085e:	0848                	addi	a0,sp,20
62fc0860:	fd0ff0ef          	jal	ra,62fc0030 <arch_memcpy_fast>
    bflb_sf_ctrl_set_flash_image_offset(offset, group, bank);
62fc0864:	85a6                	mv	a1,s1
62fc0866:	864a                	mv	a2,s2
62fc0868:	8552                	mv	a0,s4
62fc086a:	3d5d                	jal	62fc0720 <bflb_sf_ctrl_set_flash_image_offset>
        bflb_sf_ctrl_set_flash_image_offset(xip_offset, group, bank);
62fc086c:	85a6                	mv	a1,s1
62fc086e:	864a                	mv	a2,s2
62fc0870:	8522                	mv	a0,s0
62fc0872:	357d                	jal	62fc0720 <bflb_sf_ctrl_set_flash_image_offset>
        if (ARCH_MemCmp(buf, flash_cfg_magic, 4) == 0) {
62fc0874:	4611                	li	a2,4
62fc0876:	006c                	addi	a1,sp,12
62fc0878:	0848                	addi	a0,sp,20
62fc087a:	807ff0ef          	jal	ra,62fc0080 <arch_memcmp>
62fc087e:	84aa                	mv	s1,a0
62fc0880:	e105                	bnez	a0,62fc08a0 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0xfc>
            crc = BFLB_Soft_CRC32((uint8_t *)buf + 4, sizeof(spi_flash_cfg_type));
62fc0882:	05400593          	li	a1,84
62fc0886:	0828                	addi	a0,sp,24
62fc0888:	81dff0ef          	jal	ra,62fc00a4 <bflb_soft_crc32>
            if (*p_crc == crc) {
62fc088c:	57b6                	lw	a5,108(sp)
62fc088e:	00a79963          	bne	a5,a0,62fc08a0 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0xfc>
                arch_memcpy_fast(p_flash_cfg, (uint8_t *)buf + 4, sizeof(spi_flash_cfg_type));
62fc0892:	05400613          	li	a2,84
62fc0896:	082c                	addi	a1,sp,24
62fc0898:	854e                	mv	a0,s3
62fc089a:	f96ff0ef          	jal	ra,62fc0030 <arch_memcpy_fast>
                return 0;
62fc089e:	bf9d                	j	62fc0814 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0x70>
    return -1;
62fc08a0:	54fd                	li	s1,-1
62fc08a2:	bf8d                	j	62fc0814 <bflb_sf_cfg_get_flash_cfg_need_lock_ext+0x70>

62fc08a4 <bflb_sf_cfg_flash_identify_ext>:
{
62fc08a4:	1101                	addi	sp,sp,-32
62fc08a6:	cc22                	sw	s0,24(sp)
62fc08a8:	ca26                	sw	s1,20(sp)
62fc08aa:	c84a                	sw	s2,16(sp)
62fc08ac:	c64e                	sw	s3,12(sp)
62fc08ae:	ce06                	sw	ra,28(sp)
62fc08b0:	892a                	mv	s2,a0
62fc08b2:	84b6                	mv	s1,a3
62fc08b4:	89be                	mv	s3,a5
    ret = bflb_sf_cfg_flash_identify(call_from_flash, flash_pin_cfg, restore_default, p_flash_cfg, group, bank);
62fc08b6:	3d25                	jal	62fc06ee <bflb_sf_cfg_flash_identify>
62fc08b8:	842a                	mv	s0,a0
    if (call_from_flash) {
62fc08ba:	06091363          	bnez	s2,62fc0920 <bflb_sf_cfg_flash_identify_ext+0x7c>
    if ((ret & BFLB_FLASH_ID_VALID_FLAG) != 0) {
62fc08be:	04044963          	bltz	s0,62fc0910 <bflb_sf_cfg_flash_identify_ext+0x6c>
    jedec_id = (ret & 0xffffff);
62fc08c2:	010007b7          	lui	a5,0x1000
62fc08c6:	17fd                	addi	a5,a5,-1
62fc08c8:	62fc15b7          	lui	a1,0x62fc1
62fc08cc:	00174737          	lui	a4,0x174
62fc08d0:	ac458593          	addi	a1,a1,-1340 # 62fc0ac4 <flash_infos>
62fc08d4:	8c7d                	and	s0,s0,a5
62fc08d6:	0ef70713          	addi	a4,a4,239 # 1740ef <nocache_min_size+0x16f0ef>
62fc08da:	00c58693          	addi	a3,a1,12
    for (i = 0; i < sizeof(flash_infos) / sizeof(flash_infos[0]); i++) {
62fc08de:	4781                	li	a5,0
62fc08e0:	4675                	li	a2,29
        if (flash_infos[i].jedec_id == jedec_id) {
62fc08e2:	00e40a63          	beq	s0,a4,62fc08f6 <bflb_sf_cfg_flash_identify_ext+0x52>
62fc08e6:	0001                	nop
    for (i = 0; i < sizeof(flash_infos) / sizeof(flash_infos[0]); i++) {
62fc08e8:	0785                	addi	a5,a5,1
62fc08ea:	02c78363          	beq	a5,a2,62fc0910 <bflb_sf_cfg_flash_identify_ext+0x6c>
        if (flash_infos[i].jedec_id == jedec_id) {
62fc08ee:	58c6c70b          	lwia	a4,(a3),12,0
62fc08f2:	fee41be3          	bne	s0,a4,62fc08e8 <bflb_sf_cfg_flash_identify_ext+0x44>
            arch_memcpy_fast(p_flash_cfg, flash_infos[i].cfg, sizeof(spi_flash_cfg_type));
62fc08f6:	02f7978b          	addsl	a5,a5,a5,1
62fc08fa:	04f5978b          	addsl	a5,a1,a5,2
62fc08fe:	478c                	lw	a1,8(a5)
62fc0900:	05400613          	li	a2,84
62fc0904:	8526                	mv	a0,s1
62fc0906:	f2aff0ef          	jal	ra,62fc0030 <arch_memcpy_fast>
        return (jedec_id | BFLB_FLASH_ID_VALID_FLAG);
62fc090a:	800007b7          	lui	a5,0x80000
62fc090e:	8c5d                	or	s0,s0,a5
}
62fc0910:	40f2                	lw	ra,28(sp)
62fc0912:	8522                	mv	a0,s0
62fc0914:	4462                	lw	s0,24(sp)
62fc0916:	44d2                	lw	s1,20(sp)
62fc0918:	4942                	lw	s2,16(sp)
62fc091a:	49b2                	lw	s3,12(sp)
62fc091c:	6105                	addi	sp,sp,32
62fc091e:	8082                	ret
        bflb_sflash_set_xip_cfg(p_flash_cfg, p_flash_cfg->io_mode & 0xf, 1, 0, 32, bank);
62fc0920:	0004c583          	lbu	a1,0(s1)
62fc0924:	87ce                	mv	a5,s3
62fc0926:	02000713          	li	a4,32
62fc092a:	4681                	li	a3,0
62fc092c:	4605                	li	a2,1
62fc092e:	89bd                	andi	a1,a1,15
62fc0930:	8526                	mv	a0,s1
62fc0932:	3d19                	jal	62fc0748 <bflb_sflash_set_xip_cfg>
62fc0934:	b769                	j	62fc08be <bflb_sf_cfg_flash_identify_ext+0x1a>
	...

62fc0938 <bflb_xip_sflash_state_save>:
{
62fc0938:	7179                	addi	sp,sp,-48
    volatile uint32_t i = 32 * 2;
62fc093a:	04000793          	li	a5,64
{
62fc093e:	d422                	sw	s0,40(sp)
62fc0940:	d226                	sw	s1,36(sp)
62fc0942:	d04a                	sw	s2,32(sp)
62fc0944:	ce4e                	sw	s3,28(sp)
62fc0946:	d606                	sw	ra,44(sp)
62fc0948:	842a                	mv	s0,a0
62fc094a:	89ae                	mv	s3,a1
62fc094c:	8932                	mv	s2,a2
62fc094e:	84b6                	mv	s1,a3
    volatile uint32_t i = 32 * 2;
62fc0950:	c63e                	sw	a5,12(sp)
62fc0952:	0001                	nop
    while (i--)
62fc0954:	47b2                	lw	a5,12(sp)
62fc0956:	fff78713          	addi	a4,a5,-1 # 7fffffff <__psram_limit+0xd7bfffff>
62fc095a:	c63a                	sw	a4,12(sp)
62fc095c:	ffe5                	bnez	a5,62fc0954 <bflb_xip_sflash_state_save+0x1c>
    if (bank == SF_CTRL_FLASH_BANK1) {
62fc095e:	4785                	li	a5,1
62fc0960:	04f48763          	beq	s1,a5,62fc09ae <bflb_xip_sflash_state_save+0x76>
    bflb_sf_ctrl_set_owner(SF_CTRL_OWNER_SAHB);
62fc0964:	4501                	li	a0,0
62fc0966:	33d1                	jal	62fc072a <bflb_sf_ctrl_set_owner>
    bflb_sflash_reset_continue_read(p_flash_cfg);
62fc0968:	8522                	mv	a0,s0
62fc096a:	3bf5                	jal	62fc0766 <bflb_sflash_reset_continue_read>
    bflb_sflash_disable_burst_wrap(p_flash_cfg);
62fc096c:	8522                	mv	a0,s0
62fc096e:	33d5                	jal	62fc0752 <bflb_sflash_disable_burst_wrap>
    bflb_sflash_set_32bits_addr_mode(p_flash_cfg, 1);
62fc0970:	4585                	li	a1,1
62fc0972:	8522                	mv	a0,s0
62fc0974:	33e9                	jal	62fc073e <bflb_sflash_set_32bits_addr_mode>
    if ((p_flash_cfg->io_mode & 0x0f) == SF_CTRL_QO_MODE || (p_flash_cfg->io_mode & 0x0f) == SF_CTRL_QIO_MODE) {
62fc0976:	00044783          	lbu	a5,0(s0)
62fc097a:	8bbd                	andi	a5,a5,15
62fc097c:	17f9                	addi	a5,a5,-2
62fc097e:	0fd7f793          	andi	a5,a5,253
62fc0982:	e399                	bnez	a5,62fc0988 <bflb_xip_sflash_state_save+0x50>
        bflb_sflash_qspi_enable(p_flash_cfg);
62fc0984:	8522                	mv	a0,s0
62fc0986:	337d                	jal	62fc0734 <bflb_sflash_qspi_enable>
    bflb_sflash_disable_burst_wrap(p_flash_cfg);
62fc0988:	8522                	mv	a0,s0
62fc098a:	33e1                	jal	62fc0752 <bflb_sflash_disable_burst_wrap>
    *offset = bflb_sf_ctrl_get_flash_image_offset(group, bank);
62fc098c:	85a6                	mv	a1,s1
62fc098e:	854a                	mv	a0,s2
62fc0990:	33a5                	jal	62fc06f8 <bflb_sf_ctrl_get_flash_image_offset>
62fc0992:	00a9a023          	sw	a0,0(s3)
    bflb_sf_ctrl_set_flash_image_offset(0, group, bank);
62fc0996:	8626                	mv	a2,s1
62fc0998:	4501                	li	a0,0
62fc099a:	85ca                	mv	a1,s2
62fc099c:	3351                	jal	62fc0720 <bflb_sf_ctrl_set_flash_image_offset>
}
62fc099e:	50b2                	lw	ra,44(sp)
62fc09a0:	5422                	lw	s0,40(sp)
62fc09a2:	5492                	lw	s1,36(sp)
62fc09a4:	5902                	lw	s2,32(sp)
62fc09a6:	49f2                	lw	s3,28(sp)
62fc09a8:	4501                	li	a0,0
62fc09aa:	6145                	addi	sp,sp,48
62fc09ac:	8082                	ret
        bflb_sf_ctrl_sbus2_replace(SF_CTRL_PAD2);
62fc09ae:	4505                	li	a0,1
62fc09b0:	3bb1                	jal	62fc070c <bflb_sf_ctrl_sbus2_replace>
62fc09b2:	bf4d                	j	62fc0964 <bflb_xip_sflash_state_save+0x2c>
	...

62fc09b6 <GLB_Set_Flash_Id_Value>:
    BL_WR_REG(GLB_BASE, GLB_HW_RSV1, (idValue | BFLB_FLASH_ID_VALID_FLAG));
62fc09b6:	800007b7          	lui	a5,0x80000
62fc09ba:	8d5d                	or	a0,a0,a5
62fc09bc:	200007b7          	lui	a5,0x20000
62fc09c0:	5ca7a223          	sw	a0,1476(a5) # 200005c4 <nocache_min_size+0x1fffb5c4>
}
62fc09c4:	4501                	li	a0,0
62fc09c6:	8082                	ret

62fc09c8 <GLB_Get_Flash_Id_Value>:
    tmpVal = BL_RD_REG(GLB_BASE, GLB_HW_RSV1);
62fc09c8:	200007b7          	lui	a5,0x20000
62fc09cc:	5c47a783          	lw	a5,1476(a5) # 200005c4 <nocache_min_size+0x1fffb5c4>
    return 0x00000000;
62fc09d0:	4501                	li	a0,0
    if ((tmpVal & BFLB_FLASH_ID_VALID_FLAG) != 0) {
62fc09d2:	0007c363          	bltz	a5,62fc09d8 <GLB_Get_Flash_Id_Value+0x10>
}
62fc09d6:	8082                	ret
        return (tmpVal & BFLB_FLASH_ID_VALID_MASK);
62fc09d8:	80000537          	lui	a0,0x80000
62fc09dc:	fff54513          	not	a0,a0
62fc09e0:	8d7d                	and	a0,a0,a5
}
62fc09e2:	8082                	ret
	...

62fc09f0 <ASM_Delay_Us>:
 *
 *******************************************************************************/
#ifdef ARCH_RISCV
__WEAK
void ATTR_TCM_SECTION ASM_Delay_Us(uint32_t core, uint32_t cnt, uint32_t loopT)
{
62fc09f0:	1141                	addi	sp,sp,-16
    volatile uint32_t divVal = loopT;
62fc09f2:	c232                	sw	a2,4(sp)
    volatile uint32_t speed = 0;
62fc09f4:	c402                	sw	zero,8(sp)

    /* 1M=100K*10, so multiple is 10 */
    /* loop function take 4 instructions, so instructionNum is 4 */
    /* divVal = multiple*instructionNum */

    if (core >= 1 * 1000 * 1000) {
62fc09f6:	000f47b7          	lui	a5,0xf4
    volatile uint32_t cycNum = 0;
62fc09fa:	c602                	sw	zero,12(sp)
    if (core >= 1 * 1000 * 1000) {
62fc09fc:	23f78793          	addi	a5,a5,575 # f423f <nocache_min_size+0xef23f>
62fc0a00:	04a7f963          	bgeu	a5,a0,62fc0a52 <ASM_Delay_Us+0x62>
        /* CPU clock >= 1MHz */
        speed = core / (100 * 1000);
62fc0a04:	67e1                	lui	a5,0x18
62fc0a06:	6a078793          	addi	a5,a5,1696 # 186a0 <nocache_min_size+0x136a0>
62fc0a0a:	02f55533          	divu	a0,a0,a5
62fc0a0e:	c42a                	sw	a0,8(sp)
        cycNum = speed * cnt;
62fc0a10:	4722                	lw	a4,8(sp)
62fc0a12:	02b70733          	mul	a4,a4,a1
62fc0a16:	c63a                	sw	a4,12(sp)
        cycNum = cycNum / 10;
62fc0a18:	47b2                	lw	a5,12(sp)
62fc0a1a:	4729                	li	a4,10
62fc0a1c:	02e7d7b3          	divu	a5,a5,a4
        /* cycNum >= 0 */
    } else {
        /* CPU clock < 1MHz */
        speed = core / 1000;
        cycNum = speed * cnt;
        cycNum = cycNum / 1000;
62fc0a20:	c63e                	sw	a5,12(sp)
        cycNum = cycNum / divVal;
62fc0a22:	47b2                	lw	a5,12(sp)
62fc0a24:	4712                	lw	a4,4(sp)
62fc0a26:	02e7d7b3          	divu	a5,a5,a4
62fc0a2a:	c63e                	sw	a5,12(sp)
        /* cycNum >= 0 */
    }

    if (!cycNum) {
62fc0a2c:	47b2                	lw	a5,12(sp)
62fc0a2e:	c385                	beqz	a5,62fc0a4e <ASM_Delay_Us+0x5e>
        return;
    }

    __asm__ __volatile__(
62fc0a30:	46b2                	lw	a3,12(sp)
62fc0a32:	8736                	mv	a4,a3
62fc0a34:	4781                	li	a5,0
62fc0a36:	0001                	nop
62fc0a38:	0001                	nop
62fc0a3a:	0001                	nop
62fc0a3c:	00000013          	nop
62fc0a40:	00e78663          	beq	a5,a4,62fc0a4c <ASM_Delay_Us+0x5c>
62fc0a44:	0785                	addi	a5,a5,1
62fc0a46:	bfed                	j	62fc0a40 <ASM_Delay_Us+0x50>
62fc0a48:	0001                	nop
62fc0a4a:	0001                	nop
62fc0a4c:	0001                	nop
        "nop\n"
        :             /* output */
        : "r"(cycNum) /* input */
        : "a4", "a5"  /* destruct description */
    );
}
62fc0a4e:	0141                	addi	sp,sp,16
62fc0a50:	8082                	ret
        speed = core / 1000;
62fc0a52:	3e800693          	li	a3,1000
62fc0a56:	02d55533          	divu	a0,a0,a3
62fc0a5a:	c42a                	sw	a0,8(sp)
        cycNum = speed * cnt;
62fc0a5c:	4722                	lw	a4,8(sp)
62fc0a5e:	02b70733          	mul	a4,a4,a1
62fc0a62:	c63a                	sw	a4,12(sp)
        cycNum = cycNum / 1000;
62fc0a64:	47b2                	lw	a5,12(sp)
62fc0a66:	02d7d7b3          	divu	a5,a5,a3
62fc0a6a:	bf5d                	j	62fc0a20 <ASM_Delay_Us+0x30>
	...

62fc0a76 <arch_delay_us>:
 * @return none
 *
 *******************************************************************************/
__WEAK
void ATTR_TCM_SECTION arch_delay_us(uint32_t cnt)
{
62fc0a76:	1141                	addi	sp,sp,-16
62fc0a78:	c226                	sw	s1,4(sp)
62fc0a7a:	c606                	sw	ra,12(sp)
62fc0a7c:	c422                	sw	s0,8(sp)
62fc0a7e:	84aa                	mv	s1,a0
    __ASM volatile("csrr %0, mhcr"
62fc0a80:	7c102673          	csrr	a2,mhcr
62fc0a84:	7c102473          	csrr	s0,mhcr
    uint32_t iCacheEn;
    uint32_t dCacheEn;

    /* requirement: icache enable && dcache enable */
    /* otherwise the latency depends on the code address */
    iCacheEn = (__get_MHCR() & CACHE_MHCR_IE_Msk) >> CACHE_MHCR_IE_Pos;
62fc0a88:	00167793          	andi	a5,a2,1
    dCacheEn = (__get_MHCR() & CACHE_MHCR_DE_Msk) >> CACHE_MHCR_DE_Pos;
62fc0a8c:	8005                	srli	s0,s0,0x1

    if(iCacheEn && dCacheEn){
62fc0a8e:	c785                	beqz	a5,62fc0ab6 <arch_delay_us+0x40>
    dCacheEn = (__get_MHCR() & CACHE_MHCR_DE_Msk) >> CACHE_MHCR_DE_Pos;
62fc0a90:	8805                	andi	s0,s0,1
    if(iCacheEn && dCacheEn){
62fc0a92:	4611                	li	a2,4
62fc0a94:	40860433          	sub	s0,a2,s0
    GLB_CORE_ID_Type coreID;
    coreID = GLB_Get_Core_Type();
    switch (coreID) {
        case GLB_CORE_ID_M0:
#endif
            coreFreq = Clock_System_Clock_Get(BL_SYSTEM_CLOCK_MCU_CLK);
62fc0a98:	4505                	li	a0,1
62fc0a9a:	3ef1                	jal	62fc0676 <Clock_System_Clock_Get>
    }
#endif

    coreFreq = coreFreq ? coreFreq : (32 * 1000 * 1000);

    ASM_Delay_Us(coreFreq, cnt, loopTick);
62fc0a9c:	8622                	mv	a2,s0
}
62fc0a9e:	4422                	lw	s0,8(sp)
62fc0aa0:	40b2                	lw	ra,12(sp)
    coreFreq = coreFreq ? coreFreq : (32 * 1000 * 1000);
62fc0aa2:	01e857b7          	lui	a5,0x1e85
    ASM_Delay_Us(coreFreq, cnt, loopTick);
62fc0aa6:	85a6                	mv	a1,s1
}
62fc0aa8:	4492                	lw	s1,4(sp)
    ASM_Delay_Us(coreFreq, cnt, loopTick);
62fc0aaa:	80078793          	addi	a5,a5,-2048 # 1e84800 <nocache_min_size+0x1e7f800>
62fc0aae:	40a7950b          	mveqz	a0,a5,a0
}
62fc0ab2:	0141                	addi	sp,sp,16
    ASM_Delay_Us(coreFreq, cnt, loopTick);
62fc0ab4:	bf35                	j	62fc09f0 <ASM_Delay_Us>
    }else if(!iCacheEn && !dCacheEn){
62fc0ab6:	8c51                	or	s0,s0,a2
        loopTick = 24;
62fc0ab8:	0004240b          	ext	s0,s0,0,0
62fc0abc:	982d                	andi	s0,s0,-21
62fc0abe:	0461                	addi	s0,s0,24
62fc0ac0:	bfe1                	j	62fc0a98 <arch_delay_us+0x22>
	...

62fc0ac4 <flash_infos>:
62fc0ac4:	40ef 0017 0000 0000 0d1c 62fc 40ef 0019     .@.........b.@..
62fc0ad4:	0000 0000 0d70 62fc 60ef 0017 0000 0000     ....p..b.`......
62fc0ae4:	0d1c 62fc 70ef 0015 0000 0000 0cc8 62fc     ...b.p.........b
62fc0af4:	40c8 0017 0000 0000 0c74 62fc 60c8 0017     .@......t..b.`..
62fc0b04:	0000 0000 0c20 62fc 60c8 0018 0000 0000     .... ..b.`......
62fc0b14:	0c20 62fc 65c8 0018 0000 0000 0c74 62fc      ..b.e......t..b
62fc0b24:	345e 0015 0000 0000 0c74 62fc 405e 0015     ^4......t..b^@..
62fc0b34:	0000 0000 0c74 62fc 405e 0016 0000 0000     ....t..b^@......
62fc0b44:	0c74 62fc 405e 0017 0000 0000 0c74 62fc     t..b^@......t..b
62fc0b54:	405e 0018 0000 0000 0c74 62fc 605e 0015     ^@......t..b^`..
62fc0b64:	0000 0000 0c74 62fc 25c2 0039 0000 0000     ....t..b.%9.....
62fc0b74:	0dc4 62fc 4020 0014 0000 0000 0cc8 62fc     ...b @.........b
62fc0b84:	4020 0015 0000 0000 0cc8 62fc 4020 0016      @.........b @..
62fc0b94:	0000 0000 0cc8 62fc 4020 0017 0000 0000     .......b @......
62fc0ba4:	0cc8 62fc 4020 0018 0000 0000 0cc8 62fc     ...b @.........b
62fc0bb4:	4220 0017 0000 0000 0cc8 62fc 400b 0017      B.........b.@..
62fc0bc4:	0000 0000 0c20 62fc 6085 0017 0000 0000     .... ..b.`......
62fc0bd4:	0e18 62fc 6085 0018 0000 0000 0e18 62fc     ...b.`.........b
62fc0be4:	40a1 0015 0000 0000 0cc8 62fc 40a1 0016     .@.........b.@..
62fc0bf4:	0000 0000 0c20 62fc 40a1 0017 0000 0000     .... ..b.@......
62fc0c04:	0cc8 62fc 40a1 0018 0000 0000 0cc8 62fc     ...b.@.........b
62fc0c14:	28a1 0018 0000 0000 0cc8 62fc               .(.........b

62fc0c20 <flash_cfg_GD_LQ64E>:
62fc0c20:	0104 3d01 9966 03ff 009f e9b7 c804 0100     ...=f...........
62fc0c30:	20c7 d852 0206 0032 010b 010b 013b 00bb     . R...2.....;...
62fc0c40:	016b 02eb 02eb 5002 0100 0100 0001 0100     k......P........
62fc0c50:	0102 01ab 3505 0000 0101 0000 ff38 ffa0     .....5......8...
62fc0c60:	0377 4002 0377 f002 01f4 07d0 07d0 0005     w..@w...........
62fc0c70:	80e8 0003                                   ....

62fc0c74 <flash_cfg_GD_Q64E>:
62fc0c74:	0104 3f01 9966 03ff 009f e9b7 c804 0100     ...?f...........
62fc0c84:	20c7 d852 0206 0032 010b 010b 013b 00bb     . R...2.....;...
62fc0c94:	016b 02eb 02eb 5002 0100 0100 0001 0100     k......P........
62fc0ca4:	0101 01ab 3505 0000 3101 0000 ff38 ff20     .....5...1..8. .
62fc0cb4:	0377 4002 0377 f002 012c 04b0 04b0 0005     w..@w...,.......
62fc0cc4:	80e8 0014                                   ....

62fc0cc8 <flash_cfg_Winb_16JV>:
62fc0cc8:	0104 3d01 9966 03ff 009f e9b7 ef04 0100     ...=f...........
62fc0cd8:	20c7 d852 0206 0032 010b 010b 013b 00bb     . R...2.....;...
62fc0ce8:	016b 02eb 02eb 5002 0100 0100 0001 0100     k......P........
62fc0cf8:	0102 01ab 3505 0000 0101 0000 ff38 ffa0     .....5......8...
62fc0d08:	0377 4002 0377 f002 012c 04b0 04b0 0005     w..@w...,.......
62fc0d18:	80e8 0003                                   ....

62fc0d1c <flash_cfg_Winb_64JV>:
62fc0d1c:	0004 3f01 9966 03ff 009f e9b7 ef04 0100     ...?f...........
62fc0d2c:	20c7 d852 0206 0032 010b 010b 013b 00bb     . R...2.....;...
62fc0d3c:	016b 02eb 02eb 5002 0100 0100 0001 0100     k......P........
62fc0d4c:	0101 01ab 3505 0000 3101 0000 ff38 ffff     .....5...1..8...
62fc0d5c:	0377 4002 0377 f002 0190 0640 07d0 0005     w..@w.....@.....
62fc0d6c:	80e8 0003                                   ....

62fc0d70 <flash_cfg_Winb_256FV>:
62fc0d70:	0124 3f01 9966 03ff 009f e9b7 ef04 0100     $..?f...........
62fc0d80:	20c7 d852 0206 0032 010b 010b 013b 00bb     . R...2.....;...
62fc0d90:	016b 02eb 02eb 5002 0100 0100 0001 0100     k......P........
62fc0da0:	0101 01ab 3505 0000 3101 0000 ff38 ffa0     .....5...1..8...
62fc0db0:	0377 4002 0377 f002 0190 0640 07d0 0005     w..@w.....@.....
62fc0dc0:	80e8 0003                                   ....

62fc0dc4 <flash_cfg_Mxic_25U256>:
62fc0dc4:	0124 3f01 9966 03ff 009f e9b7 c204 0100     $..?f...........
62fc0dd4:	20c7 d852 0206 0238 010b 010b 013b 00bb     . R...8.....;...
62fc0de4:	016b 02eb 02eb 5002 0000 0100 0006 0100     k......P........
62fc0df4:	0102 01ab 1505 0000 0101 0000 ff38 ffa5     ............8...
62fc0e04:	00c0 0200 00c0 1000 0190 03e8 07d0 0005     ................
62fc0e14:	80e8 0014                                   ....

62fc0e18 <flash_cfg_Puya_Q32H>:
62fc0e18:	0104 3f01 9966 03ff 009f e9b7 8504 0100     ...?f...........
62fc0e28:	20c7 d852 0206 0032 010b 010b 013b 00bb     . R...2.....;...
62fc0e38:	016b 02eb 02eb 5002 0100 0100 0001 0100     k......P........
62fc0e48:	0101 01ab 3505 0000 3101 0000 ff38 ffa0     .....5...1..8...
62fc0e58:	0377 4002 0377 f002 0190 0640 07d0 0005     w..@w.....@.....
62fc0e68:	80e8 0008                                   ....
