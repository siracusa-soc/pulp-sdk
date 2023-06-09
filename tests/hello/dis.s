APP_CFLAGS=-O3 -g -DSKIP_PLL_INIT
riscv32-unknown-elf-objdump -Mmarch=rv32imcxgap9 -d /scratch/prasadar/siracusa/camera/pulp-sdk/tests/hello/BUILD/SIRACUSA/GCC_RISCV//test/test

/scratch/prasadar/siracusa/camera/pulp-sdk/tests/hello/BUILD/SIRACUSA/GCC_RISCV//test/test:     file format elf32-littleriscv


Disassembly of section .vectors:

1c008000 <__irq_vector_base>:
1c008000:	08c0006f          	j	1c00808c <pos_illegal_instr>
1c008004:	08c0006f          	j	1c008090 <pos_no_irq_handler>
1c008008:	0880006f          	j	1c008090 <pos_no_irq_handler>
1c00800c:	0840006f          	j	1c008090 <pos_no_irq_handler>
1c008010:	0800006f          	j	1c008090 <pos_no_irq_handler>
1c008014:	07c0006f          	j	1c008090 <pos_no_irq_handler>
1c008018:	0780006f          	j	1c008090 <pos_no_irq_handler>
1c00801c:	0740006f          	j	1c008090 <pos_no_irq_handler>
1c008020:	0700006f          	j	1c008090 <pos_no_irq_handler>
1c008024:	06c0006f          	j	1c008090 <pos_no_irq_handler>
1c008028:	0680006f          	j	1c008090 <pos_no_irq_handler>
1c00802c:	0640006f          	j	1c008090 <pos_no_irq_handler>
1c008030:	0600006f          	j	1c008090 <pos_no_irq_handler>
1c008034:	05c0006f          	j	1c008090 <pos_no_irq_handler>
1c008038:	0580006f          	j	1c008090 <pos_no_irq_handler>
1c00803c:	0540006f          	j	1c008090 <pos_no_irq_handler>
1c008040:	0500006f          	j	1c008090 <pos_no_irq_handler>
1c008044:	04c0006f          	j	1c008090 <pos_no_irq_handler>
1c008048:	0480006f          	j	1c008090 <pos_no_irq_handler>
1c00804c:	0440006f          	j	1c008090 <pos_no_irq_handler>
1c008050:	0400006f          	j	1c008090 <pos_no_irq_handler>
1c008054:	03c0006f          	j	1c008090 <pos_no_irq_handler>
1c008058:	0380006f          	j	1c008090 <pos_no_irq_handler>
1c00805c:	0340006f          	j	1c008090 <pos_no_irq_handler>
1c008060:	0300006f          	j	1c008090 <pos_no_irq_handler>
1c008064:	02c0006f          	j	1c008090 <pos_no_irq_handler>
1c008068:	0280006f          	j	1c008090 <pos_no_irq_handler>
1c00806c:	0240006f          	j	1c008090 <pos_no_irq_handler>
1c008070:	0200006f          	j	1c008090 <pos_no_irq_handler>
1c008074:	01c0006f          	j	1c008090 <pos_no_irq_handler>
1c008078:	0180006f          	j	1c008090 <pos_no_irq_handler>
1c00807c:	0140006f          	j	1c008090 <pos_no_irq_handler>

1c008080 <_start>:
1c008080:	00003517          	auipc	a0,0x3
1c008084:	cb050513          	addi	a0,a0,-848 # 1c00ad30 <pos_init_entry>
1c008088:	00050067          	jr	a0

1c00808c <pos_illegal_instr>:
1c00808c:	0000006f          	j	1c00808c <pos_illegal_instr>

1c008090 <pos_no_irq_handler>:
1c008090:	30200073          	mret

1c008094 <pos_semihosting_call>:
1c008094:	00100073          	ebreak
1c008098:	00008067          	ret

Disassembly of section .text:

1c00809c <__udivdi3>:
1c00809c:	87b2                	mv	a5,a2
1c00809e:	8736                	mv	a4,a3
1c0080a0:	88aa                	mv	a7,a0
1c0080a2:	882e                	mv	a6,a1
1c0080a4:	1e069d63          	bnez	a3,1c00829e <__udivdi3+0x202>
1c0080a8:	1c001337          	lui	t1,0x1c001
1c0080ac:	85830313          	addi	t1,t1,-1960 # 1c000858 <__DTOR_END__>
1c0080b0:	0ac5fd63          	bleu	a2,a1,1c00816a <__udivdi3+0xce>
1c0080b4:	6741                	lui	a4,0x10
1c0080b6:	0ae67363          	bleu	a4,a2,1c00815c <__udivdi3+0xc0>
1c0080ba:	0ff00693          	li	a3,255
1c0080be:	00c6b6b3          	sltu	a3,a3,a2
1c0080c2:	068e                	slli	a3,a3,0x3
1c0080c4:	00d65733          	srl	a4,a2,a3
1c0080c8:	933a                	add	t1,t1,a4
1c0080ca:	00034703          	lbu	a4,0(t1)
1c0080ce:	02000313          	li	t1,32
1c0080d2:	96ba                	add	a3,a3,a4
1c0080d4:	40d30333          	sub	t1,t1,a3
1c0080d8:	00030c63          	beqz	t1,1c0080f0 <__udivdi3+0x54>
1c0080dc:	00659733          	sll	a4,a1,t1
1c0080e0:	00d556b3          	srl	a3,a0,a3
1c0080e4:	006617b3          	sll	a5,a2,t1
1c0080e8:	00e6e833          	or	a6,a3,a4
1c0080ec:	006518b3          	sll	a7,a0,t1
1c0080f0:	0107d513          	srli	a0,a5,0x10
1c0080f4:	02a85733          	divu	a4,a6,a0
1c0080f8:	1007d5b3          	p.exthz	a1,a5
1c0080fc:	0108d693          	srli	a3,a7,0x10
1c008100:	02a87633          	remu	a2,a6,a0
1c008104:	02e58833          	mul	a6,a1,a4
1c008108:	0642                	slli	a2,a2,0x10
1c00810a:	8ed1                	or	a3,a3,a2
1c00810c:	863a                	mv	a2,a4
1c00810e:	0106fc63          	bleu	a6,a3,1c008126 <__udivdi3+0x8a>
1c008112:	96be                	add	a3,a3,a5
1c008114:	fff70613          	addi	a2,a4,-1 # ffff <pos_soc_event_callback+0xfbc7>
1c008118:	00f6e763          	bltu	a3,a5,1c008126 <__udivdi3+0x8a>
1c00811c:	0106f563          	bleu	a6,a3,1c008126 <__udivdi3+0x8a>
1c008120:	ffe70613          	addi	a2,a4,-2
1c008124:	96be                	add	a3,a3,a5
1c008126:	410686b3          	sub	a3,a3,a6
1c00812a:	02a6f833          	remu	a6,a3,a0
1c00812e:	02a6d6b3          	divu	a3,a3,a0
1c008132:	df0828b3          	p.insert	a7,a6,15,16
1c008136:	02d58733          	mul	a4,a1,a3
1c00813a:	8536                	mv	a0,a3
1c00813c:	00e8fb63          	bleu	a4,a7,1c008152 <__udivdi3+0xb6>
1c008140:	98be                	add	a7,a7,a5
1c008142:	fff68513          	addi	a0,a3,-1
1c008146:	00f8e663          	bltu	a7,a5,1c008152 <__udivdi3+0xb6>
1c00814a:	00e8f463          	bleu	a4,a7,1c008152 <__udivdi3+0xb6>
1c00814e:	ffe68513          	addi	a0,a3,-2
1c008152:	01061793          	slli	a5,a2,0x10
1c008156:	8fc9                	or	a5,a5,a0
1c008158:	4801                	li	a6,0
1c00815a:	a06d                	j	1c008204 <__udivdi3+0x168>
1c00815c:	01000737          	lui	a4,0x1000
1c008160:	46c1                	li	a3,16
1c008162:	f6e661e3          	bltu	a2,a4,1c0080c4 <__udivdi3+0x28>
1c008166:	46e1                	li	a3,24
1c008168:	bfb1                	j	1c0080c4 <__udivdi3+0x28>
1c00816a:	e601                	bnez	a2,1c008172 <__udivdi3+0xd6>
1c00816c:	4685                	li	a3,1
1c00816e:	02c6d7b3          	divu	a5,a3,a2
1c008172:	66c1                	lui	a3,0x10
1c008174:	08d7fb63          	bleu	a3,a5,1c00820a <__udivdi3+0x16e>
1c008178:	0ff00693          	li	a3,255
1c00817c:	00f6f363          	bleu	a5,a3,1c008182 <__udivdi3+0xe6>
1c008180:	4721                	li	a4,8
1c008182:	00e7d6b3          	srl	a3,a5,a4
1c008186:	9336                	add	t1,t1,a3
1c008188:	00034683          	lbu	a3,0(t1)
1c00818c:	02000613          	li	a2,32
1c008190:	96ba                	add	a3,a3,a4
1c008192:	8e15                	sub	a2,a2,a3
1c008194:	e251                	bnez	a2,1c008218 <__udivdi3+0x17c>
1c008196:	40f58733          	sub	a4,a1,a5
1c00819a:	4805                	li	a6,1
1c00819c:	0107d513          	srli	a0,a5,0x10
1c0081a0:	1007d5b3          	p.exthz	a1,a5
1c0081a4:	0108d693          	srli	a3,a7,0x10
1c0081a8:	02a77633          	remu	a2,a4,a0
1c0081ac:	02a75733          	divu	a4,a4,a0
1c0081b0:	0642                	slli	a2,a2,0x10
1c0081b2:	8ed1                	or	a3,a3,a2
1c0081b4:	02e58333          	mul	t1,a1,a4
1c0081b8:	863a                	mv	a2,a4
1c0081ba:	0066fc63          	bleu	t1,a3,1c0081d2 <__udivdi3+0x136>
1c0081be:	96be                	add	a3,a3,a5
1c0081c0:	fff70613          	addi	a2,a4,-1 # ffffff <__l1_heap_size+0xf00027>
1c0081c4:	00f6e763          	bltu	a3,a5,1c0081d2 <__udivdi3+0x136>
1c0081c8:	0066f563          	bleu	t1,a3,1c0081d2 <__udivdi3+0x136>
1c0081cc:	ffe70613          	addi	a2,a4,-2
1c0081d0:	96be                	add	a3,a3,a5
1c0081d2:	406686b3          	sub	a3,a3,t1
1c0081d6:	02a6f333          	remu	t1,a3,a0
1c0081da:	02a6d6b3          	divu	a3,a3,a0
1c0081de:	df0328b3          	p.insert	a7,t1,15,16
1c0081e2:	02d58733          	mul	a4,a1,a3
1c0081e6:	8536                	mv	a0,a3
1c0081e8:	00e8fb63          	bleu	a4,a7,1c0081fe <__udivdi3+0x162>
1c0081ec:	98be                	add	a7,a7,a5
1c0081ee:	fff68513          	addi	a0,a3,-1 # ffff <pos_soc_event_callback+0xfbc7>
1c0081f2:	00f8e663          	bltu	a7,a5,1c0081fe <__udivdi3+0x162>
1c0081f6:	00e8f463          	bleu	a4,a7,1c0081fe <__udivdi3+0x162>
1c0081fa:	ffe68513          	addi	a0,a3,-2
1c0081fe:	01061793          	slli	a5,a2,0x10
1c008202:	8fc9                	or	a5,a5,a0
1c008204:	853e                	mv	a0,a5
1c008206:	85c2                	mv	a1,a6
1c008208:	8082                	ret
1c00820a:	010006b7          	lui	a3,0x1000
1c00820e:	4741                	li	a4,16
1c008210:	f6d7e9e3          	bltu	a5,a3,1c008182 <__udivdi3+0xe6>
1c008214:	4761                	li	a4,24
1c008216:	b7b5                	j	1c008182 <__udivdi3+0xe6>
1c008218:	00c797b3          	sll	a5,a5,a2
1c00821c:	00d5d333          	srl	t1,a1,a3
1c008220:	0107de13          	srli	t3,a5,0x10
1c008224:	00c59733          	sll	a4,a1,a2
1c008228:	00c518b3          	sll	a7,a0,a2
1c00822c:	00d555b3          	srl	a1,a0,a3
1c008230:	03c35533          	divu	a0,t1,t3
1c008234:	8dd9                	or	a1,a1,a4
1c008236:	1007d733          	p.exthz	a4,a5
1c00823a:	0105d693          	srli	a3,a1,0x10
1c00823e:	03c37633          	remu	a2,t1,t3
1c008242:	882a                	mv	a6,a0
1c008244:	02a70333          	mul	t1,a4,a0
1c008248:	0642                	slli	a2,a2,0x10
1c00824a:	8ed1                	or	a3,a3,a2
1c00824c:	0066fc63          	bleu	t1,a3,1c008264 <__udivdi3+0x1c8>
1c008250:	96be                	add	a3,a3,a5
1c008252:	fff50813          	addi	a6,a0,-1
1c008256:	00f6e763          	bltu	a3,a5,1c008264 <__udivdi3+0x1c8>
1c00825a:	0066f563          	bleu	t1,a3,1c008264 <__udivdi3+0x1c8>
1c00825e:	ffe50813          	addi	a6,a0,-2
1c008262:	96be                	add	a3,a3,a5
1c008264:	406686b3          	sub	a3,a3,t1
1c008268:	03c6f633          	remu	a2,a3,t3
1c00826c:	03c6d6b3          	divu	a3,a3,t3
1c008270:	df0625b3          	p.insert	a1,a2,15,16
1c008274:	02d70733          	mul	a4,a4,a3
1c008278:	8636                	mv	a2,a3
1c00827a:	00e5fc63          	bleu	a4,a1,1c008292 <__udivdi3+0x1f6>
1c00827e:	95be                	add	a1,a1,a5
1c008280:	fff68613          	addi	a2,a3,-1 # ffffff <__l1_heap_size+0xf00027>
1c008284:	00f5e763          	bltu	a1,a5,1c008292 <__udivdi3+0x1f6>
1c008288:	00e5f563          	bleu	a4,a1,1c008292 <__udivdi3+0x1f6>
1c00828c:	ffe68613          	addi	a2,a3,-2
1c008290:	95be                	add	a1,a1,a5
1c008292:	0842                	slli	a6,a6,0x10
1c008294:	40e58733          	sub	a4,a1,a4
1c008298:	00c86833          	or	a6,a6,a2
1c00829c:	b701                	j	1c00819c <__udivdi3+0x100>
1c00829e:	12d5ea63          	bltu	a1,a3,1c0083d2 <__udivdi3+0x336>
1c0082a2:	67c1                	lui	a5,0x10
1c0082a4:	02f6fd63          	bleu	a5,a3,1c0082de <__udivdi3+0x242>
1c0082a8:	0ff00793          	li	a5,255
1c0082ac:	00d7b8b3          	sltu	a7,a5,a3
1c0082b0:	088e                	slli	a7,a7,0x3
1c0082b2:	1c001737          	lui	a4,0x1c001
1c0082b6:	0116d7b3          	srl	a5,a3,a7
1c0082ba:	85870713          	addi	a4,a4,-1960 # 1c000858 <__DTOR_END__>
1c0082be:	97ba                	add	a5,a5,a4
1c0082c0:	0007c783          	lbu	a5,0(a5) # 10000 <pos_soc_event_callback+0xfbc8>
1c0082c4:	02000813          	li	a6,32
1c0082c8:	97c6                	add	a5,a5,a7
1c0082ca:	40f80833          	sub	a6,a6,a5
1c0082ce:	00081f63          	bnez	a6,1c0082ec <__udivdi3+0x250>
1c0082d2:	4785                	li	a5,1
1c0082d4:	f2b6e8e3          	bltu	a3,a1,1c008204 <__udivdi3+0x168>
1c0082d8:	04a637b3          	p.sletu	a5,a2,a0
1c0082dc:	b725                	j	1c008204 <__udivdi3+0x168>
1c0082de:	010007b7          	lui	a5,0x1000
1c0082e2:	48c1                	li	a7,16
1c0082e4:	fcf6e7e3          	bltu	a3,a5,1c0082b2 <__udivdi3+0x216>
1c0082e8:	48e1                	li	a7,24
1c0082ea:	b7e1                	j	1c0082b2 <__udivdi3+0x216>
1c0082ec:	00f658b3          	srl	a7,a2,a5
1c0082f0:	010696b3          	sll	a3,a3,a6
1c0082f4:	00d8e6b3          	or	a3,a7,a3
1c0082f8:	00f5d333          	srl	t1,a1,a5
1c0082fc:	0106de13          	srli	t3,a3,0x10
1c008300:	00f55733          	srl	a4,a0,a5
1c008304:	03c377b3          	remu	a5,t1,t3
1c008308:	1006d8b3          	p.exthz	a7,a3
1c00830c:	010595b3          	sll	a1,a1,a6
1c008310:	8f4d                	or	a4,a4,a1
1c008312:	01075593          	srli	a1,a4,0x10
1c008316:	01061633          	sll	a2,a2,a6
1c00831a:	03c35333          	divu	t1,t1,t3
1c00831e:	07c2                	slli	a5,a5,0x10
1c008320:	8ddd                	or	a1,a1,a5
1c008322:	02688eb3          	mul	t4,a7,t1
1c008326:	879a                	mv	a5,t1
1c008328:	01d5fc63          	bleu	t4,a1,1c008340 <__udivdi3+0x2a4>
1c00832c:	95b6                	add	a1,a1,a3
1c00832e:	fff30793          	addi	a5,t1,-1
1c008332:	00d5e763          	bltu	a1,a3,1c008340 <__udivdi3+0x2a4>
1c008336:	01d5f563          	bleu	t4,a1,1c008340 <__udivdi3+0x2a4>
1c00833a:	ffe30793          	addi	a5,t1,-2
1c00833e:	95b6                	add	a1,a1,a3
1c008340:	41d585b3          	sub	a1,a1,t4
1c008344:	03c5f333          	remu	t1,a1,t3
1c008348:	03c5d5b3          	divu	a1,a1,t3
1c00834c:	df032733          	p.insert	a4,t1,15,16
1c008350:	02b888b3          	mul	a7,a7,a1
1c008354:	832e                	mv	t1,a1
1c008356:	01177c63          	bleu	a7,a4,1c00836e <__udivdi3+0x2d2>
1c00835a:	9736                	add	a4,a4,a3
1c00835c:	fff58313          	addi	t1,a1,-1
1c008360:	00d76763          	bltu	a4,a3,1c00836e <__udivdi3+0x2d2>
1c008364:	01177563          	bleu	a7,a4,1c00836e <__udivdi3+0x2d2>
1c008368:	ffe58313          	addi	t1,a1,-2
1c00836c:	9736                	add	a4,a4,a3
1c00836e:	07c2                	slli	a5,a5,0x10
1c008370:	6e41                	lui	t3,0x10
1c008372:	0067e7b3          	or	a5,a5,t1
1c008376:	fffe0593          	addi	a1,t3,-1 # ffff <pos_soc_event_callback+0xfbc7>
1c00837a:	00b7f6b3          	and	a3,a5,a1
1c00837e:	41170733          	sub	a4,a4,a7
1c008382:	8df1                	and	a1,a1,a2
1c008384:	0107d893          	srli	a7,a5,0x10
1c008388:	02b68333          	mul	t1,a3,a1
1c00838c:	8241                	srli	a2,a2,0x10
1c00838e:	02b885b3          	mul	a1,a7,a1
1c008392:	8eae                	mv	t4,a1
1c008394:	42c68eb3          	p.mac	t4,a3,a2
1c008398:	01035693          	srli	a3,t1,0x10
1c00839c:	96f6                	add	a3,a3,t4
1c00839e:	02c888b3          	mul	a7,a7,a2
1c0083a2:	00b6f363          	bleu	a1,a3,1c0083a8 <__udivdi3+0x30c>
1c0083a6:	98f2                	add	a7,a7,t3
1c0083a8:	0106d613          	srli	a2,a3,0x10
1c0083ac:	98b2                	add	a7,a7,a2
1c0083ae:	03176063          	bltu	a4,a7,1c0083ce <__udivdi3+0x332>
1c0083b2:	db1713e3          	bne	a4,a7,1c008158 <__udivdi3+0xbc>
1c0083b6:	6741                	lui	a4,0x10
1c0083b8:	177d                	addi	a4,a4,-1
1c0083ba:	8ef9                	and	a3,a3,a4
1c0083bc:	06c2                	slli	a3,a3,0x10
1c0083be:	00e37333          	and	t1,t1,a4
1c0083c2:	01051533          	sll	a0,a0,a6
1c0083c6:	969a                	add	a3,a3,t1
1c0083c8:	4801                	li	a6,0
1c0083ca:	e2d57de3          	bleu	a3,a0,1c008204 <__udivdi3+0x168>
1c0083ce:	17fd                	addi	a5,a5,-1
1c0083d0:	b361                	j	1c008158 <__udivdi3+0xbc>
1c0083d2:	4801                	li	a6,0
1c0083d4:	4781                	li	a5,0
1c0083d6:	b53d                	j	1c008204 <__udivdi3+0x168>

1c0083d8 <__umoddi3>:
1c0083d8:	88b2                	mv	a7,a2
1c0083da:	8736                	mv	a4,a3
1c0083dc:	87aa                	mv	a5,a0
1c0083de:	882e                	mv	a6,a1
1c0083e0:	1a069963          	bnez	a3,1c008592 <__umoddi3+0x1ba>
1c0083e4:	1c0016b7          	lui	a3,0x1c001
1c0083e8:	85868693          	addi	a3,a3,-1960 # 1c000858 <__DTOR_END__>
1c0083ec:	0ac5f463          	bleu	a2,a1,1c008494 <__umoddi3+0xbc>
1c0083f0:	6341                	lui	t1,0x10
1c0083f2:	08667a63          	bleu	t1,a2,1c008486 <__umoddi3+0xae>
1c0083f6:	0ff00313          	li	t1,255
1c0083fa:	00c37363          	bleu	a2,t1,1c008400 <__umoddi3+0x28>
1c0083fe:	4721                	li	a4,8
1c008400:	00e65333          	srl	t1,a2,a4
1c008404:	969a                	add	a3,a3,t1
1c008406:	0006c683          	lbu	a3,0(a3)
1c00840a:	02000313          	li	t1,32
1c00840e:	9736                	add	a4,a4,a3
1c008410:	40e30333          	sub	t1,t1,a4
1c008414:	00030c63          	beqz	t1,1c00842c <__umoddi3+0x54>
1c008418:	006595b3          	sll	a1,a1,t1
1c00841c:	00e55733          	srl	a4,a0,a4
1c008420:	006618b3          	sll	a7,a2,t1
1c008424:	00b76833          	or	a6,a4,a1
1c008428:	006517b3          	sll	a5,a0,t1
1c00842c:	0108d613          	srli	a2,a7,0x10
1c008430:	02c87733          	remu	a4,a6,a2
1c008434:	1008d533          	p.exthz	a0,a7
1c008438:	0107d693          	srli	a3,a5,0x10
1c00843c:	02c85833          	divu	a6,a6,a2
1c008440:	0742                	slli	a4,a4,0x10
1c008442:	8ed9                	or	a3,a3,a4
1c008444:	03050833          	mul	a6,a0,a6
1c008448:	0106f863          	bleu	a6,a3,1c008458 <__umoddi3+0x80>
1c00844c:	96c6                	add	a3,a3,a7
1c00844e:	0116e563          	bltu	a3,a7,1c008458 <__umoddi3+0x80>
1c008452:	0106f363          	bleu	a6,a3,1c008458 <__umoddi3+0x80>
1c008456:	96c6                	add	a3,a3,a7
1c008458:	410686b3          	sub	a3,a3,a6
1c00845c:	02c6f733          	remu	a4,a3,a2
1c008460:	02c6d6b3          	divu	a3,a3,a2
1c008464:	df0727b3          	p.insert	a5,a4,15,16
1c008468:	02d506b3          	mul	a3,a0,a3
1c00846c:	00d7f863          	bleu	a3,a5,1c00847c <__umoddi3+0xa4>
1c008470:	97c6                	add	a5,a5,a7
1c008472:	0117e563          	bltu	a5,a7,1c00847c <__umoddi3+0xa4>
1c008476:	00d7f363          	bleu	a3,a5,1c00847c <__umoddi3+0xa4>
1c00847a:	97c6                	add	a5,a5,a7
1c00847c:	8f95                	sub	a5,a5,a3
1c00847e:	0067d533          	srl	a0,a5,t1
1c008482:	4581                	li	a1,0
1c008484:	8082                	ret
1c008486:	01000337          	lui	t1,0x1000
1c00848a:	4741                	li	a4,16
1c00848c:	f6666ae3          	bltu	a2,t1,1c008400 <__umoddi3+0x28>
1c008490:	4761                	li	a4,24
1c008492:	b7bd                	j	1c008400 <__umoddi3+0x28>
1c008494:	e601                	bnez	a2,1c00849c <__umoddi3+0xc4>
1c008496:	4605                	li	a2,1
1c008498:	031658b3          	divu	a7,a2,a7
1c00849c:	6641                	lui	a2,0x10
1c00849e:	06c8ff63          	bleu	a2,a7,1c00851c <__umoddi3+0x144>
1c0084a2:	0ff00613          	li	a2,255
1c0084a6:	01167363          	bleu	a7,a2,1c0084ac <__umoddi3+0xd4>
1c0084aa:	4721                	li	a4,8
1c0084ac:	00e8d633          	srl	a2,a7,a4
1c0084b0:	96b2                	add	a3,a3,a2
1c0084b2:	0006c603          	lbu	a2,0(a3)
1c0084b6:	02000313          	li	t1,32
1c0084ba:	963a                	add	a2,a2,a4
1c0084bc:	40c30333          	sub	t1,t1,a2
1c0084c0:	06031563          	bnez	t1,1c00852a <__umoddi3+0x152>
1c0084c4:	411585b3          	sub	a1,a1,a7
1c0084c8:	0108d713          	srli	a4,a7,0x10
1c0084cc:	1008d533          	p.exthz	a0,a7
1c0084d0:	0107d613          	srli	a2,a5,0x10
1c0084d4:	02e5f6b3          	remu	a3,a1,a4
1c0084d8:	02e5d5b3          	divu	a1,a1,a4
1c0084dc:	06c2                	slli	a3,a3,0x10
1c0084de:	8ed1                	or	a3,a3,a2
1c0084e0:	02b505b3          	mul	a1,a0,a1
1c0084e4:	00b6f863          	bleu	a1,a3,1c0084f4 <__umoddi3+0x11c>
1c0084e8:	96c6                	add	a3,a3,a7
1c0084ea:	0116e563          	bltu	a3,a7,1c0084f4 <__umoddi3+0x11c>
1c0084ee:	00b6f363          	bleu	a1,a3,1c0084f4 <__umoddi3+0x11c>
1c0084f2:	96c6                	add	a3,a3,a7
1c0084f4:	40b685b3          	sub	a1,a3,a1
1c0084f8:	02e5f6b3          	remu	a3,a1,a4
1c0084fc:	02e5d5b3          	divu	a1,a1,a4
1c008500:	df06a7b3          	p.insert	a5,a3,15,16
1c008504:	02b505b3          	mul	a1,a0,a1
1c008508:	00b7f863          	bleu	a1,a5,1c008518 <__umoddi3+0x140>
1c00850c:	97c6                	add	a5,a5,a7
1c00850e:	0117e563          	bltu	a5,a7,1c008518 <__umoddi3+0x140>
1c008512:	00b7f363          	bleu	a1,a5,1c008518 <__umoddi3+0x140>
1c008516:	97c6                	add	a5,a5,a7
1c008518:	8f8d                	sub	a5,a5,a1
1c00851a:	b795                	j	1c00847e <__umoddi3+0xa6>
1c00851c:	01000637          	lui	a2,0x1000
1c008520:	4741                	li	a4,16
1c008522:	f8c8e5e3          	bltu	a7,a2,1c0084ac <__umoddi3+0xd4>
1c008526:	4761                	li	a4,24
1c008528:	b751                	j	1c0084ac <__umoddi3+0xd4>
1c00852a:	006898b3          	sll	a7,a7,t1
1c00852e:	00c5d733          	srl	a4,a1,a2
1c008532:	006517b3          	sll	a5,a0,t1
1c008536:	00c55633          	srl	a2,a0,a2
1c00853a:	006595b3          	sll	a1,a1,t1
1c00853e:	0108d513          	srli	a0,a7,0x10
1c008542:	8dd1                	or	a1,a1,a2
1c008544:	02a77633          	remu	a2,a4,a0
1c008548:	1008d833          	p.exthz	a6,a7
1c00854c:	0105d693          	srli	a3,a1,0x10
1c008550:	02a75733          	divu	a4,a4,a0
1c008554:	0642                	slli	a2,a2,0x10
1c008556:	8ed1                	or	a3,a3,a2
1c008558:	02e80733          	mul	a4,a6,a4
1c00855c:	00e6f863          	bleu	a4,a3,1c00856c <__umoddi3+0x194>
1c008560:	96c6                	add	a3,a3,a7
1c008562:	0116e563          	bltu	a3,a7,1c00856c <__umoddi3+0x194>
1c008566:	00e6f363          	bleu	a4,a3,1c00856c <__umoddi3+0x194>
1c00856a:	96c6                	add	a3,a3,a7
1c00856c:	8e99                	sub	a3,a3,a4
1c00856e:	02a6f733          	remu	a4,a3,a0
1c008572:	02a6d6b3          	divu	a3,a3,a0
1c008576:	df0725b3          	p.insert	a1,a4,15,16
1c00857a:	02d806b3          	mul	a3,a6,a3
1c00857e:	00d5f863          	bleu	a3,a1,1c00858e <__umoddi3+0x1b6>
1c008582:	95c6                	add	a1,a1,a7
1c008584:	0115e563          	bltu	a1,a7,1c00858e <__umoddi3+0x1b6>
1c008588:	00d5f363          	bleu	a3,a1,1c00858e <__umoddi3+0x1b6>
1c00858c:	95c6                	add	a1,a1,a7
1c00858e:	8d95                	sub	a1,a1,a3
1c008590:	bf25                	j	1c0084c8 <__umoddi3+0xf0>
1c008592:	eed5e9e3          	bltu	a1,a3,1c008484 <__umoddi3+0xac>
1c008596:	6741                	lui	a4,0x10
1c008598:	04e6f563          	bleu	a4,a3,1c0085e2 <__umoddi3+0x20a>
1c00859c:	0ff00e93          	li	t4,255
1c0085a0:	00deb733          	sltu	a4,t4,a3
1c0085a4:	070e                	slli	a4,a4,0x3
1c0085a6:	1c001337          	lui	t1,0x1c001
1c0085aa:	00e6d8b3          	srl	a7,a3,a4
1c0085ae:	85830313          	addi	t1,t1,-1960 # 1c000858 <__DTOR_END__>
1c0085b2:	989a                	add	a7,a7,t1
1c0085b4:	0008ce83          	lbu	t4,0(a7)
1c0085b8:	02000e13          	li	t3,32
1c0085bc:	9eba                	add	t4,t4,a4
1c0085be:	41de0e33          	sub	t3,t3,t4
1c0085c2:	020e1763          	bnez	t3,1c0085f0 <__umoddi3+0x218>
1c0085c6:	00b6e463          	bltu	a3,a1,1c0085ce <__umoddi3+0x1f6>
1c0085ca:	00c56963          	bltu	a0,a2,1c0085dc <__umoddi3+0x204>
1c0085ce:	40c507b3          	sub	a5,a0,a2
1c0085d2:	8d95                	sub	a1,a1,a3
1c0085d4:	00f53533          	sltu	a0,a0,a5
1c0085d8:	40a58833          	sub	a6,a1,a0
1c0085dc:	853e                	mv	a0,a5
1c0085de:	85c2                	mv	a1,a6
1c0085e0:	b555                	j	1c008484 <__umoddi3+0xac>
1c0085e2:	010008b7          	lui	a7,0x1000
1c0085e6:	4741                	li	a4,16
1c0085e8:	fb16efe3          	bltu	a3,a7,1c0085a6 <__umoddi3+0x1ce>
1c0085ec:	4761                	li	a4,24
1c0085ee:	bf65                	j	1c0085a6 <__umoddi3+0x1ce>
1c0085f0:	01d65733          	srl	a4,a2,t4
1c0085f4:	01c696b3          	sll	a3,a3,t3
1c0085f8:	8ed9                	or	a3,a3,a4
1c0085fa:	01d5d7b3          	srl	a5,a1,t4
1c0085fe:	0106d813          	srli	a6,a3,0x10
1c008602:	0307f333          	remu	t1,a5,a6
1c008606:	1006d733          	p.exthz	a4,a3
1c00860a:	01d558b3          	srl	a7,a0,t4
1c00860e:	01c595b3          	sll	a1,a1,t3
1c008612:	00b8e5b3          	or	a1,a7,a1
1c008616:	0105d893          	srli	a7,a1,0x10
1c00861a:	01c61633          	sll	a2,a2,t3
1c00861e:	01c51533          	sll	a0,a0,t3
1c008622:	0307d7b3          	divu	a5,a5,a6
1c008626:	0342                	slli	t1,t1,0x10
1c008628:	011368b3          	or	a7,t1,a7
1c00862c:	02f70f33          	mul	t5,a4,a5
1c008630:	833e                	mv	t1,a5
1c008632:	01e8fc63          	bleu	t5,a7,1c00864a <__umoddi3+0x272>
1c008636:	98b6                	add	a7,a7,a3
1c008638:	fff78313          	addi	t1,a5,-1 # ffffff <__l1_heap_size+0xf00027>
1c00863c:	00d8e763          	bltu	a7,a3,1c00864a <__umoddi3+0x272>
1c008640:	01e8f563          	bleu	t5,a7,1c00864a <__umoddi3+0x272>
1c008644:	ffe78313          	addi	t1,a5,-2
1c008648:	98b6                	add	a7,a7,a3
1c00864a:	41e888b3          	sub	a7,a7,t5
1c00864e:	0308f7b3          	remu	a5,a7,a6
1c008652:	0308d8b3          	divu	a7,a7,a6
1c008656:	df07a5b3          	p.insert	a1,a5,15,16
1c00865a:	03170733          	mul	a4,a4,a7
1c00865e:	87c6                	mv	a5,a7
1c008660:	00e5fc63          	bleu	a4,a1,1c008678 <__umoddi3+0x2a0>
1c008664:	95b6                	add	a1,a1,a3
1c008666:	fff88793          	addi	a5,a7,-1 # ffffff <__l1_heap_size+0xf00027>
1c00866a:	00d5e763          	bltu	a1,a3,1c008678 <__umoddi3+0x2a0>
1c00866e:	00e5f563          	bleu	a4,a1,1c008678 <__umoddi3+0x2a0>
1c008672:	ffe88793          	addi	a5,a7,-2
1c008676:	95b6                	add	a1,a1,a3
1c008678:	0342                	slli	t1,t1,0x10
1c00867a:	6f41                	lui	t5,0x10
1c00867c:	00f36333          	or	t1,t1,a5
1c008680:	ffff0793          	addi	a5,t5,-1 # ffff <pos_soc_event_callback+0xfbc7>
1c008684:	00f37833          	and	a6,t1,a5
1c008688:	01035313          	srli	t1,t1,0x10
1c00868c:	8ff1                	and	a5,a5,a2
1c00868e:	02f808b3          	mul	a7,a6,a5
1c008692:	8d99                	sub	a1,a1,a4
1c008694:	01065713          	srli	a4,a2,0x10
1c008698:	02f307b3          	mul	a5,t1,a5
1c00869c:	8fbe                	mv	t6,a5
1c00869e:	42e80fb3          	p.mac	t6,a6,a4
1c0086a2:	0108d813          	srli	a6,a7,0x10
1c0086a6:	987e                	add	a6,a6,t6
1c0086a8:	02e30333          	mul	t1,t1,a4
1c0086ac:	00f87363          	bleu	a5,a6,1c0086b2 <__umoddi3+0x2da>
1c0086b0:	937a                	add	t1,t1,t5
1c0086b2:	01085713          	srli	a4,a6,0x10
1c0086b6:	933a                	add	t1,t1,a4
1c0086b8:	6741                	lui	a4,0x10
1c0086ba:	177d                	addi	a4,a4,-1
1c0086bc:	00e87833          	and	a6,a6,a4
1c0086c0:	0842                	slli	a6,a6,0x10
1c0086c2:	00e8f733          	and	a4,a7,a4
1c0086c6:	9742                	add	a4,a4,a6
1c0086c8:	0065e663          	bltu	a1,t1,1c0086d4 <__umoddi3+0x2fc>
1c0086cc:	00659d63          	bne	a1,t1,1c0086e6 <__umoddi3+0x30e>
1c0086d0:	00e57b63          	bleu	a4,a0,1c0086e6 <__umoddi3+0x30e>
1c0086d4:	40c70633          	sub	a2,a4,a2
1c0086d8:	00c73733          	sltu	a4,a4,a2
1c0086dc:	40d30333          	sub	t1,t1,a3
1c0086e0:	40e30333          	sub	t1,t1,a4
1c0086e4:	8732                	mv	a4,a2
1c0086e6:	40e50733          	sub	a4,a0,a4
1c0086ea:	00e53533          	sltu	a0,a0,a4
1c0086ee:	406585b3          	sub	a1,a1,t1
1c0086f2:	8d89                	sub	a1,a1,a0
1c0086f4:	01d597b3          	sll	a5,a1,t4
1c0086f8:	01c75733          	srl	a4,a4,t3
1c0086fc:	00e7e533          	or	a0,a5,a4
1c008700:	01c5d5b3          	srl	a1,a1,t3
1c008704:	b341                	j	1c008484 <__umoddi3+0xac>

1c008706 <pe_entry>:
1c008706:	f14025f3          	csrr	a1,mhartid
1c00870a:	1141                	addi	sp,sp,-16
1c00870c:	c422                	sw	s0,8(sp)
1c00870e:	1c001537          	lui	a0,0x1c001
1c008712:	f1402473          	csrr	s0,mhartid
1c008716:	f4543433          	p.bclr	s0,s0,26,5
1c00871a:	8622                	mv	a2,s0
1c00871c:	ca5595b3          	p.extractu	a1,a1,5,5
1c008720:	9bc50513          	addi	a0,a0,-1604 # 1c0009bc <__DTOR_END__+0x164>
1c008724:	c606                	sw	ra,12(sp)
1c008726:	2e91                	jal	1c008a7a <printf>
1c008728:	00402703          	lw	a4,4(zero) # 4 <pos_freq_domains>
1c00872c:	00241793          	slli	a5,s0,0x2
1c008730:	40b2                	lw	ra,12(sp)
1c008732:	008767a3          	p.sw	s0,a5(a4)
1c008736:	4422                	lw	s0,8(sp)
1c008738:	0141                	addi	sp,sp,16
1c00873a:	8082                	ret

1c00873c <cluster_entry>:
1c00873c:	1101                	addi	sp,sp,-32
1c00873e:	c64e                	sw	s3,12(sp)
1c008740:	f14029f3          	csrr	s3,mhartid
1c008744:	cc22                	sw	s0,24(sp)
1c008746:	1c0017b7          	lui	a5,0x1c001
1c00874a:	ca5999b3          	p.extractu	s3,s3,5,5
1c00874e:	00199413          	slli	s0,s3,0x1
1c008752:	944e                	add	s0,s0,s3
1c008754:	2b078793          	addi	a5,a5,688 # 1c0012b0 <cluster_dev>
1c008758:	040a                	slli	s0,s0,0x2
1c00875a:	943e                	add	s0,s0,a5
1c00875c:	c84a                	sw	s2,16(sp)
1c00875e:	02000593          	li	a1,32
1c008762:	892a                	mv	s2,a0
1c008764:	8522                	mv	a0,s0
1c008766:	ca26                	sw	s1,20(sp)
1c008768:	c452                	sw	s4,8(sp)
1c00876a:	ce06                	sw	ra,28(sp)
1c00876c:	11c020ef          	jal	ra,1c00a888 <pi_cl_l1_malloc>
1c008770:	00400a13          	li	s4,4
1c008774:	0ff00793          	li	a5,255
1c008778:	002044b7          	lui	s1,0x204
1c00877c:	00aa2023          	sw	a0,0(s4)
1c008780:	08f4a223          	sw	a5,132(s1) # 204084 <__l1_heap_size+0x1040ac>
1c008784:	20048713          	addi	a4,s1,512
1c008788:	00f72023          	sw	a5,0(a4) # 10000 <pos_soc_event_callback+0xfbc8>
1c00878c:	00f72623          	sw	a5,12(a4)
1c008790:	1ff00793          	li	a5,511
1c008794:	22048713          	addi	a4,s1,544
1c008798:	00f72023          	sw	a5,0(a4)
1c00879c:	00f72623          	sw	a5,12(a4)
1c0087a0:	1c0087b7          	lui	a5,0x1c008
1c0087a4:	70678793          	addi	a5,a5,1798 # 1c008706 <pe_entry>
1c0087a8:	08f4a023          	sw	a5,128(s1)
1c0087ac:	0804a023          	sw	zero,128(s1)
1c0087b0:	4501                	li	a0,0
1c0087b2:	3f91                	jal	1c008706 <pe_entry>
1c0087b4:	21c48493          	addi	s1,s1,540
1c0087b8:	409c                	lw	a5,0(s1)
1c0087ba:	000a2683          	lw	a3,0(s4)
1c0087be:	1c001537          	lui	a0,0x1c001
1c0087c2:	85ce                	mv	a1,s3
1c0087c4:	f1402673          	csrr	a2,mhartid
1c0087c8:	95850513          	addi	a0,a0,-1704 # 1c000958 <__DTOR_END__+0x100>
1c0087cc:	f4563633          	p.bclr	a2,a2,26,5
1c0087d0:	246d                	jal	1c008a7a <printf>
1c0087d2:	000a2583          	lw	a1,0(s4)
1c0087d6:	8522                	mv	a0,s0
1c0087d8:	02000613          	li	a2,32
1c0087dc:	41dc                	lw	a5,4(a1)
1c0087de:	4180                	lw	s0,0(a1)
1c0087e0:	4594                	lw	a3,8(a1)
1c0087e2:	45d8                	lw	a4,12(a1)
1c0087e4:	943e                	add	s0,s0,a5
1c0087e6:	499c                	lw	a5,16(a1)
1c0087e8:	9436                	add	s0,s0,a3
1c0087ea:	49d4                	lw	a3,20(a1)
1c0087ec:	943a                	add	s0,s0,a4
1c0087ee:	4d98                	lw	a4,24(a1)
1c0087f0:	943e                	add	s0,s0,a5
1c0087f2:	4ddc                	lw	a5,28(a1)
1c0087f4:	9436                	add	s0,s0,a3
1c0087f6:	943a                	add	s0,s0,a4
1c0087f8:	943e                	add	s0,s0,a5
1c0087fa:	0a6020ef          	jal	ra,1c00a8a0 <pi_cl_l1_free>
1c0087fe:	47f1                	li	a5,28
1c008800:	00f41c63          	bne	s0,a5,1c008818 <cluster_entry+0xdc>
1c008804:	40f2                	lw	ra,28(sp)
1c008806:	4462                	lw	s0,24(sp)
1c008808:	00092023          	sw	zero,0(s2)
1c00880c:	44d2                	lw	s1,20(sp)
1c00880e:	4942                	lw	s2,16(sp)
1c008810:	49b2                	lw	s3,12(sp)
1c008812:	4a22                	lw	s4,8(sp)
1c008814:	6105                	addi	sp,sp,32
1c008816:	8082                	ret
1c008818:	1c001537          	lui	a0,0x1c001
1c00881c:	8622                	mv	a2,s0
1c00881e:	85ce                	mv	a1,s3
1c008820:	46f1                	li	a3,28
1c008822:	97850513          	addi	a0,a0,-1672 # 1c000978 <__DTOR_END__+0x120>
1c008826:	2c91                	jal	1c008a7a <printf>
1c008828:	40f2                	lw	ra,28(sp)
1c00882a:	4462                	lw	s0,24(sp)
1c00882c:	57fd                	li	a5,-1
1c00882e:	00f92023          	sw	a5,0(s2)
1c008832:	44d2                	lw	s1,20(sp)
1c008834:	4942                	lw	s2,16(sp)
1c008836:	49b2                	lw	s3,12(sp)
1c008838:	4a22                	lw	s4,8(sp)
1c00883a:	6105                	addi	sp,sp,32
1c00883c:	8082                	ret

1c00883e <main>:
1c00883e:	1c001537          	lui	a0,0x1c001
1c008842:	7139                	addi	sp,sp,-64
1c008844:	4589                	li	a1,2
1c008846:	99850513          	addi	a0,a0,-1640 # 1c000998 <__DTOR_END__+0x140>
1c00884a:	de06                	sw	ra,60(sp)
1c00884c:	dc22                	sw	s0,56(sp)
1c00884e:	da26                	sw	s1,52(sp)
1c008850:	d84a                	sw	s2,48(sp)
1c008852:	d64e                	sw	s3,44(sp)
1c008854:	d452                	sw	s4,40(sp)
1c008856:	d256                	sw	s5,36(sp)
1c008858:	d05a                	sw	s6,32(sp)
1c00885a:	ce5e                	sw	s7,28(sp)
1c00885c:	2c39                	jal	1c008a7a <printf>
1c00885e:	4511                	li	a0,4
1c008860:	1c010437          	lui	s0,0x1c010
1c008864:	054020ef          	jal	ra,1c00a8b8 <pi_l2_malloc>
1c008868:	15040413          	addi	s0,s0,336 # 1c010150 <array_fc_id>
1c00886c:	c008                	sw	a0,0(s0)
1c00886e:	16050463          	beqz	a0,1c0089d6 <main+0x198>
1c008872:	f14025f3          	csrr	a1,mhartid
1c008876:	862a                	mv	a2,a0
1c008878:	00052023          	sw	zero,0(a0)
1c00887c:	1c001537          	lui	a0,0x1c001
1c008880:	ca5595b3          	p.extractu	a1,a1,5,5
1c008884:	95c50513          	addi	a0,a0,-1700 # 1c00095c <__DTOR_END__+0x104>
1c008888:	2acd                	jal	1c008a7a <printf>
1c00888a:	4008                	lw	a0,0(s0)
1c00888c:	4591                	li	a1,4
1c00888e:	1c001437          	lui	s0,0x1c001
1c008892:	032020ef          	jal	ra,1c00a8c4 <pi_l2_free>
1c008896:	28040513          	addi	a0,s0,640 # 1c001280 <_edata>
1c00889a:	240020ef          	jal	ra,1c00aada <pi_cluster_conf_init>
1c00889e:	28040993          	addi	s3,s0,640
1c0088a2:	1c0014b7          	lui	s1,0x1c001
1c0088a6:	29848513          	addi	a0,s1,664 # 1c001298 <_edata+0x18>
1c0088aa:	0009a223          	sw	zero,4(s3)
1c0088ae:	22c020ef          	jal	ra,1c00aada <pi_cluster_conf_init>
1c0088b2:	4785                	li	a5,1
1c0088b4:	1c001937          	lui	s2,0x1c001
1c0088b8:	00f9ae23          	sw	a5,28(s3)
1c0088bc:	28040593          	addi	a1,s0,640
1c0088c0:	2b090513          	addi	a0,s2,688 # 1c0012b0 <cluster_dev>
1c0088c4:	60f010ef          	jal	ra,1c00a6d2 <pi_open_from_conf>
1c0088c8:	1c0019b7          	lui	s3,0x1c001
1c0088cc:	2bc98513          	addi	a0,s3,700 # 1c0012bc <cluster_dev+0xc>
1c0088d0:	29848593          	addi	a1,s1,664
1c0088d4:	5ff010ef          	jal	ra,1c00a6d2 <pi_open_from_conf>
1c0088d8:	2b090513          	addi	a0,s2,688
1c0088dc:	208020ef          	jal	ra,1c00aae4 <pi_cluster_open>
1c0088e0:	0e051563          	bnez	a0,1c0089ca <main+0x18c>
1c0088e4:	1c001b37          	lui	s6,0x1c001
1c0088e8:	348b0493          	addi	s1,s6,840 # 1c001348 <cl_task>
1c0088ec:	1c008a37          	lui	s4,0x1c008
1c0088f0:	4ba1                	li	s7,8
1c0088f2:	003c                	addi	a5,sp,8
1c0088f4:	73ca0a13          	addi	s4,s4,1852 # 1c00873c <cluster_entry>
1c0088f8:	2bc98513          	addi	a0,s3,700
1c0088fc:	c0dc                	sw	a5,4(s1)
1c0088fe:	0004a423          	sw	zero,8(s1)
1c008902:	0004a623          	sw	zero,12(s1)
1c008906:	0174aa23          	sw	s7,20(s1)
1c00890a:	354b2423          	sw	s4,840(s6)
1c00890e:	1d6020ef          	jal	ra,1c00aae4 <pi_cluster_open>
1c008912:	e161                	bnez	a0,1c0089d2 <main+0x194>
1c008914:	1c001637          	lui	a2,0x1c001
1c008918:	1c00aab7          	lui	s5,0x1c00a
1c00891c:	2c860413          	addi	s0,a2,712 # 1c0012c8 <events>
1c008920:	007c                	addi	a5,sp,12
1c008922:	6d6a8a93          	addi	s5,s5,1750 # 1c00a6d6 <pos_task_handle_blocking>
1c008926:	348b0593          	addi	a1,s6,840
1c00892a:	d4dc                	sw	a5,44(s1)
1c00892c:	2c860613          	addi	a2,a2,712
1c008930:	2b090513          	addi	a0,s2,688
1c008934:	0344a423          	sw	s4,40(s1)
1c008938:	0204a823          	sw	zero,48(s1)
1c00893c:	0204aa23          	sw	zero,52(s1)
1c008940:	0374ae23          	sw	s7,60(s1)
1c008944:	01542223          	sw	s5,4(s0)
1c008948:	c400                	sw	s0,8(s0)
1c00894a:	00040a23          	sb	zero,20(s0)
1c00894e:	360020ef          	jal	ra,1c00acae <pi_cluster_send_task_to_cl_async>
1c008952:	1c001637          	lui	a2,0x1c001
1c008956:	30860793          	addi	a5,a2,776 # 1c001308 <events+0x40>
1c00895a:	1c0015b7          	lui	a1,0x1c001
1c00895e:	30860613          	addi	a2,a2,776
1c008962:	37058593          	addi	a1,a1,880 # 1c001370 <cl_task+0x28>
1c008966:	2bc98513          	addi	a0,s3,700
1c00896a:	05542223          	sw	s5,68(s0)
1c00896e:	c43c                	sw	a5,72(s0)
1c008970:	04040a23          	sb	zero,84(s0)
1c008974:	33a020ef          	jal	ra,1c00acae <pi_cluster_send_task_to_cl_async>
1c008978:	300474f3          	csrrci	s1,mstatus,8
1c00897c:	01440783          	lb	a5,20(s0)
1c008980:	e791                	bnez	a5,1c00898c <main+0x14e>
1c008982:	55d010ef          	jal	ra,1c00a6de <pos_task_handle>
1c008986:	01440783          	lb	a5,20(s0)
1c00898a:	dfe5                	beqz	a5,1c008982 <main+0x144>
1c00898c:	30049073          	csrw	mstatus,s1
1c008990:	300474f3          	csrrci	s1,mstatus,8
1c008994:	05440783          	lb	a5,84(s0)
1c008998:	e791                	bnez	a5,1c0089a4 <main+0x166>
1c00899a:	545010ef          	jal	ra,1c00a6de <pos_task_handle>
1c00899e:	05440783          	lb	a5,84(s0)
1c0089a2:	dfe5                	beqz	a5,1c00899a <main+0x15c>
1c0089a4:	30049073          	csrw	mstatus,s1
1c0089a8:	2b090513          	addi	a0,s2,688
1c0089ac:	280020ef          	jal	ra,1c00ac2c <pi_cluster_close>
1c0089b0:	2bc98513          	addi	a0,s3,700
1c0089b4:	278020ef          	jal	ra,1c00ac2c <pi_cluster_close>
1c0089b8:	47a2                	lw	a5,8(sp)
1c0089ba:	4732                	lw	a4,12(sp)
1c0089bc:	97ba                	add	a5,a5,a4
1c0089be:	1c001737          	lui	a4,0x1c001
1c0089c2:	853e                	mv	a0,a5
1c0089c4:	38f72c23          	sw	a5,920(a4) # 1c001398 <pos_kernel_pmsis_exit_value>
1c0089c8:	28bd                	jal	1c008a46 <exit>
1c0089ca:	4701                	li	a4,0
1c0089cc:	57f9                	li	a5,-2
1c0089ce:	8f99                	sub	a5,a5,a4
1c0089d0:	b7fd                	j	1c0089be <main+0x180>
1c0089d2:	4705                	li	a4,1
1c0089d4:	bfe5                	j	1c0089cc <main+0x18e>
1c0089d6:	57fd                	li	a5,-1
1c0089d8:	b7dd                	j	1c0089be <main+0x180>

1c0089da <pos_soc_init>:
1c0089da:	02faf7b7          	lui	a5,0x2faf
1c0089de:	08078793          	addi	a5,a5,128 # 2faf080 <__l1_heap_size+0x2eaf0a8>
1c0089e2:	00400713          	li	a4,4
1c0089e6:	00f02223          	sw	a5,4(zero) # 4 <pos_freq_domains>
1c0089ea:	c71c                	sw	a5,8(a4)
1c0089ec:	c35c                	sw	a5,4(a4)
1c0089ee:	8082                	ret

1c0089f0 <strchr>:
1c0089f0:	00054783          	lbu	a5,0(a0)
1c0089f4:	0ff5f593          	andi	a1,a1,255
1c0089f8:	00b78c63          	beq	a5,a1,1c008a10 <strchr+0x20>
1c0089fc:	cb99                	beqz	a5,1c008a12 <strchr+0x22>
1c0089fe:	00150793          	addi	a5,a0,1
1c008a02:	a011                	j	1c008a06 <strchr+0x16>
1c008a04:	c719                	beqz	a4,1c008a12 <strchr+0x22>
1c008a06:	853e                	mv	a0,a5
1c008a08:	0017c70b          	p.lbu	a4,1(a5!)
1c008a0c:	feb71ce3          	bne	a4,a1,1c008a04 <strchr+0x14>
1c008a10:	8082                	ret
1c008a12:	0015b593          	seqz	a1,a1
1c008a16:	40b005b3          	neg	a1,a1
1c008a1a:	8d6d                	and	a0,a0,a1
1c008a1c:	8082                	ret

1c008a1e <pos_libc_fputc_locked>:
1c008a1e:	f14027f3          	csrr	a5,mhartid
1c008a22:	1a10f6b7          	lui	a3,0x1a10f
1c008a26:	f1402773          	csrr	a4,mhartid
1c008a2a:	ca5797b3          	p.extractu	a5,a5,5,5
1c008a2e:	070e                	slli	a4,a4,0x3
1c008a30:	079e                	slli	a5,a5,0x7
1c008a32:	0ff57513          	andi	a0,a0,255
1c008a36:	ee873733          	p.bclr	a4,a4,23,8
1c008a3a:	97b6                	add	a5,a5,a3
1c008a3c:	00a767a3          	p.sw	a0,a5(a4)
1c008a40:	4501                	li	a0,0
1c008a42:	8082                	ret

1c008a44 <pos_libc_prf_locked>:
1c008a44:	a095                	j	1c008aa8 <pos_libc_prf>

1c008a46 <exit>:
1c008a46:	1141                	addi	sp,sp,-16
1c008a48:	c422                	sw	s0,8(sp)
1c008a4a:	c606                	sw	ra,12(sp)
1c008a4c:	842a                	mv	s0,a0
1c008a4e:	443010ef          	jal	ra,1c00a690 <pos_init_stop>
1c008a52:	c1f44533          	p.bset	a0,s0,0,31
1c008a56:	1a1047b7          	lui	a5,0x1a104
1c008a5a:	0aa7a023          	sw	a0,160(a5) # 1a1040a0 <__l1_heap_size+0x1a0040c8>
1c008a5e:	1a10a7b7          	lui	a5,0x1a10a
1c008a62:	577d                	li	a4,-1
1c008a64:	80e7a423          	sw	a4,-2040(a5) # 1a109808 <__l1_heap_size+0x1a009830>
1c008a68:	10500073          	wfi
1c008a6c:	10500073          	wfi
1c008a70:	bfe5                	j	1c008a68 <exit+0x22>

1c008a72 <pos_io_start>:
1c008a72:	4501                	li	a0,0
1c008a74:	8082                	ret

1c008a76 <pos_io_stop>:
1c008a76:	4501                	li	a0,0
1c008a78:	8082                	ret

1c008a7a <printf>:
1c008a7a:	7139                	addi	sp,sp,-64
1c008a7c:	02410313          	addi	t1,sp,36
1c008a80:	d432                	sw	a2,40(sp)
1c008a82:	862a                	mv	a2,a0
1c008a84:	1c009537          	lui	a0,0x1c009
1c008a88:	d22e                	sw	a1,36(sp)
1c008a8a:	d636                	sw	a3,44(sp)
1c008a8c:	4589                	li	a1,2
1c008a8e:	869a                	mv	a3,t1
1c008a90:	a1e50513          	addi	a0,a0,-1506 # 1c008a1e <pos_libc_fputc_locked>
1c008a94:	ce06                	sw	ra,28(sp)
1c008a96:	d83a                	sw	a4,48(sp)
1c008a98:	da3e                	sw	a5,52(sp)
1c008a9a:	dc42                	sw	a6,56(sp)
1c008a9c:	de46                	sw	a7,60(sp)
1c008a9e:	c61a                	sw	t1,12(sp)
1c008aa0:	3755                	jal	1c008a44 <pos_libc_prf_locked>
1c008aa2:	40f2                	lw	ra,28(sp)
1c008aa4:	6121                	addi	sp,sp,64
1c008aa6:	8082                	ret

1c008aa8 <pos_libc_prf>:
1c008aa8:	7119                	addi	sp,sp,-128
1c008aaa:	dca2                	sw	s0,120(sp)
1c008aac:	1058                	addi	a4,sp,36
1c008aae:	4401                	li	s0,0
1c008ab0:	d6ce                	sw	s3,108(sp)
1c008ab2:	d4d2                	sw	s4,104(sp)
1c008ab4:	d2d6                	sw	s5,100(sp)
1c008ab6:	cede                	sw	s7,92(sp)
1c008ab8:	cce2                	sw	s8,88(sp)
1c008aba:	c8ea                	sw	s10,80(sp)
1c008abc:	de86                	sw	ra,124(sp)
1c008abe:	daa6                	sw	s1,116(sp)
1c008ac0:	d8ca                	sw	s2,112(sp)
1c008ac2:	d0da                	sw	s6,96(sp)
1c008ac4:	cae6                	sw	s9,84(sp)
1c008ac6:	c6ee                	sw	s11,76(sp)
1c008ac8:	89aa                	mv	s3,a0
1c008aca:	8bae                	mv	s7,a1
1c008acc:	8d32                	mv	s10,a2
1c008ace:	8a36                	mv	s4,a3
1c008ad0:	1c001c37          	lui	s8,0x1c001
1c008ad4:	c03a                	sw	a4,0(sp)
1c008ad6:	8aa2                	mv	s5,s0
1c008ad8:	a039                	j	1c008ae6 <pos_libc_prf+0x3e>
1c008ada:	85de                	mv	a1,s7
1c008adc:	9982                	jalr	s3
1c008ade:	15f52063          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008ae2:	0a85                	addi	s5,s5,1
1c008ae4:	8d22                	mv	s10,s0
1c008ae6:	000d4503          	lbu	a0,0(s10)
1c008aea:	001d0413          	addi	s0,s10,1
1c008aee:	c979                	beqz	a0,1c008bc4 <pos_libc_prf+0x11c>
1c008af0:	02500793          	li	a5,37
1c008af4:	fef513e3          	bne	a0,a5,1c008ada <pos_libc_prf+0x32>
1c008af8:	ca02                	sw	zero,20(sp)
1c008afa:	c802                	sw	zero,16(sp)
1c008afc:	c602                	sw	zero,12(sp)
1c008afe:	c402                	sw	zero,8(sp)
1c008b00:	c202                	sw	zero,4(sp)
1c008b02:	02300493          	li	s1,35
1c008b06:	02d00b13          	li	s6,45
1c008b0a:	00044c83          	lbu	s9,0(s0)
1c008b0e:	00140913          	addi	s2,s0,1
1c008b12:	9e4c0513          	addi	a0,s8,-1564 # 1c0009e4 <__DTOR_END__+0x18c>
1c008b16:	85e6                	mv	a1,s9
1c008b18:	8d4a                	mv	s10,s2
1c008b1a:	8de6                	mv	s11,s9
1c008b1c:	3dd1                	jal	1c0089f0 <strchr>
1c008b1e:	c91d                	beqz	a0,1c008b54 <pos_libc_prf+0xac>
1c008b20:	109c8963          	beq	s9,s1,1c008c32 <pos_libc_prf+0x18a>
1c008b24:	0194fe63          	bleu	s9,s1,1c008b40 <pos_libc_prf+0x98>
1c008b28:	116c8163          	beq	s9,s6,1c008c2a <pos_libc_prf+0x182>
1c008b2c:	03000713          	li	a4,48
1c008b30:	0eec8963          	beq	s9,a4,1c008c22 <pos_libc_prf+0x17a>
1c008b34:	02b00793          	li	a5,43
1c008b38:	0afc8763          	beq	s9,a5,1c008be6 <pos_libc_prf+0x13e>
1c008b3c:	844a                	mv	s0,s2
1c008b3e:	b7f1                	j	1c008b0a <pos_libc_prf+0x62>
1c008b40:	080c8263          	beqz	s9,1c008bc4 <pos_libc_prf+0x11c>
1c008b44:	02000793          	li	a5,32
1c008b48:	fefc9ae3          	bne	s9,a5,1c008b3c <pos_libc_prf+0x94>
1c008b4c:	4785                	li	a5,1
1c008b4e:	c83e                	sw	a5,16(sp)
1c008b50:	844a                	mv	s0,s2
1c008b52:	bf65                	j	1c008b0a <pos_libc_prf+0x62>
1c008b54:	02a00693          	li	a3,42
1c008b58:	2edc8263          	beq	s9,a3,1c008e3c <pos_libc_prf+0x394>
1c008b5c:	fd0c8693          	addi	a3,s9,-48
1c008b60:	45a5                	li	a1,9
1c008b62:	4b01                	li	s6,0
1c008b64:	0cd5fd63          	bleu	a3,a1,1c008c3e <pos_libc_prf+0x196>
1c008b68:	02e00793          	li	a5,46
1c008b6c:	28fd8663          	beq	s11,a5,1c008df8 <pos_libc_prf+0x350>
1c008b70:	846e                	mv	s0,s11
1c008b72:	54fd                	li	s1,-1
1c008b74:	1c001737          	lui	a4,0x1c001
1c008b78:	85ee                	mv	a1,s11
1c008b7a:	9ec70513          	addi	a0,a4,-1556 # 1c0009ec <__DTOR_END__+0x194>
1c008b7e:	3d8d                	jal	1c0089f0 <strchr>
1c008b80:	4781                	li	a5,0
1c008b82:	cd19                	beqz	a0,1c008ba0 <pos_libc_prf+0xf8>
1c008b84:	06c00793          	li	a5,108
1c008b88:	001d0693          	addi	a3,s10,1
1c008b8c:	000d4d83          	lbu	s11,0(s10)
1c008b90:	3af40563          	beq	s0,a5,1c008f3a <pos_libc_prf+0x492>
1c008b94:	06800793          	li	a5,104
1c008b98:	3af40563          	beq	s0,a5,1c008f42 <pos_libc_prf+0x49a>
1c008b9c:	8d36                	mv	s10,a3
1c008b9e:	87a2                	mv	a5,s0
1c008ba0:	06700693          	li	a3,103
1c008ba4:	0bb6ee63          	bltu	a3,s11,1c008c60 <pos_libc_prf+0x1b8>
1c008ba8:	06500693          	li	a3,101
1c008bac:	3addf0e3          	bleu	a3,s11,1c00974c <pos_libc_prf+0xca4>
1c008bb0:	04700693          	li	a3,71
1c008bb4:	39b6ed63          	bltu	a3,s11,1c008f4e <pos_libc_prf+0x4a6>
1c008bb8:	04500793          	li	a5,69
1c008bbc:	38fdf8e3          	bleu	a5,s11,1c00974c <pos_libc_prf+0xca4>
1c008bc0:	2e0d9863          	bnez	s11,1c008eb0 <pos_libc_prf+0x408>
1c008bc4:	8456                	mv	s0,s5
1c008bc6:	8522                	mv	a0,s0
1c008bc8:	50f6                	lw	ra,124(sp)
1c008bca:	5466                	lw	s0,120(sp)
1c008bcc:	54d6                	lw	s1,116(sp)
1c008bce:	5946                	lw	s2,112(sp)
1c008bd0:	59b6                	lw	s3,108(sp)
1c008bd2:	5a26                	lw	s4,104(sp)
1c008bd4:	5a96                	lw	s5,100(sp)
1c008bd6:	5b06                	lw	s6,96(sp)
1c008bd8:	4bf6                	lw	s7,92(sp)
1c008bda:	4c66                	lw	s8,88(sp)
1c008bdc:	4cd6                	lw	s9,84(sp)
1c008bde:	4d46                	lw	s10,80(sp)
1c008be0:	4db6                	lw	s11,76(sp)
1c008be2:	6109                	addi	sp,sp,128
1c008be4:	8082                	ret
1c008be6:	4705                	li	a4,1
1c008be8:	c63a                	sw	a4,12(sp)
1c008bea:	844a                	mv	s0,s2
1c008bec:	bf39                	j	1c008b0a <pos_libc_prf+0x62>
1c008bee:	00044503          	lbu	a0,0(s0)
1c008bf2:	47a5                	li	a5,9
1c008bf4:	fd050693          	addi	a3,a0,-48
1c008bf8:	72d7ece3          	bltu	a5,a3,1c009b30 <pos_libc_prf+0x1088>
1c008bfc:	00140793          	addi	a5,s0,1
1c008c00:	8dbe                	mv	s11,a5
1c008c02:	a809                	j	1c008c14 <pos_libc_prf+0x16c>
1c008c04:	001dc50b          	p.lbu	a0,1(s11!)
1c008c08:	4725                	li	a4,9
1c008c0a:	197d                	addi	s2,s2,-1
1c008c0c:	fd050793          	addi	a5,a0,-48
1c008c10:	72f761e3          	bltu	a4,a5,1c009b32 <pos_libc_prf+0x108a>
1c008c14:	85de                	mv	a1,s7
1c008c16:	846e                	mv	s0,s11
1c008c18:	9982                	jalr	s3
1c008c1a:	fff535e3          	p.bneimm	a0,-1,1c008c04 <pos_libc_prf+0x15c>
1c008c1e:	547d                	li	s0,-1
1c008c20:	b75d                	j	1c008bc6 <pos_libc_prf+0x11e>
1c008c22:	4785                	li	a5,1
1c008c24:	ca3e                	sw	a5,20(sp)
1c008c26:	844a                	mv	s0,s2
1c008c28:	b5cd                	j	1c008b0a <pos_libc_prf+0x62>
1c008c2a:	4705                	li	a4,1
1c008c2c:	c43a                	sw	a4,8(sp)
1c008c2e:	844a                	mv	s0,s2
1c008c30:	bde9                	j	1c008b0a <pos_libc_prf+0x62>
1c008c32:	4705                	li	a4,1
1c008c34:	c23a                	sw	a4,4(sp)
1c008c36:	844a                	mv	s0,s2
1c008c38:	bdc9                	j	1c008b0a <pos_libc_prf+0x62>
1c008c3a:	844a                	mv	s0,s2
1c008c3c:	0905                	addi	s2,s2,1
1c008c3e:	00094d83          	lbu	s11,0(s2)
1c008c42:	002b1793          	slli	a5,s6,0x2
1c008c46:	97da                	add	a5,a5,s6
1c008c48:	0786                	slli	a5,a5,0x1
1c008c4a:	97e6                	add	a5,a5,s9
1c008c4c:	fd0d8713          	addi	a4,s11,-48
1c008c50:	fd078b13          	addi	s6,a5,-48
1c008c54:	8cee                	mv	s9,s11
1c008c56:	fee5f2e3          	bleu	a4,a1,1c008c3a <pos_libc_prf+0x192>
1c008c5a:	00240d13          	addi	s10,s0,2
1c008c5e:	b729                	j	1c008b68 <pos_libc_prf+0xc0>
1c008c60:	07000693          	li	a3,112
1c008c64:	24dd83e3          	beq	s11,a3,1c0096aa <pos_libc_prf+0xc02>
1c008c68:	1fb6e463          	bltu	a3,s11,1c008e50 <pos_libc_prf+0x3a8>
1c008c6c:	06e00693          	li	a3,110
1c008c70:	20dd88e3          	beq	s11,a3,1c009680 <pos_libc_prf+0xbd8>
1c008c74:	2fb6e763          	bltu	a3,s11,1c008f62 <pos_libc_prf+0x4ba>
1c008c78:	06900693          	li	a3,105
1c008c7c:	2add9ae3          	bne	s11,a3,1c009730 <pos_libc_prf+0xc88>
1c008c80:	06c00693          	li	a3,108
1c008c84:	00d78a63          	beq	a5,a3,1c008c98 <pos_libc_prf+0x1f0>
1c008c88:	07a00693          	li	a3,122
1c008c8c:	00d78663          	beq	a5,a3,1c008c98 <pos_libc_prf+0x1f0>
1c008c90:	04c00693          	li	a3,76
1c008c94:	60d780e3          	beq	a5,a3,1c009a94 <pos_libc_prf+0xfec>
1c008c98:	000a2783          	lw	a5,0(s4)
1c008c9c:	0a11                	addi	s4,s4,4
1c008c9e:	ce52                	sw	s4,28(sp)
1c008ca0:	41f7d713          	srai	a4,a5,0x1f
1c008ca4:	c23a                	sw	a4,4(sp)
1c008ca6:	4e0744e3          	bltz	a4,1c00998e <pos_libc_prf+0xee6>
1c008caa:	4732                	lw	a4,12(sp)
1c008cac:	44070ce3          	beqz	a4,1c009904 <pos_libc_prf+0xe5c>
1c008cb0:	4c92                	lw	s9,4(sp)
1c008cb2:	02b00693          	li	a3,43
1c008cb6:	02d10223          	sb	a3,36(sp)
1c008cba:	02510a13          	addi	s4,sp,37
1c008cbe:	843e                	mv	s0,a5
1c008cc0:	8dd2                	mv	s11,s4
1c008cc2:	a011                	j	1c008cc6 <pos_libc_prf+0x21e>
1c008cc4:	8dca                	mv	s11,s2
1c008cc6:	4629                	li	a2,10
1c008cc8:	4681                	li	a3,0
1c008cca:	8522                	mv	a0,s0
1c008ccc:	85e6                	mv	a1,s9
1c008cce:	f0aff0ef          	jal	ra,1c0083d8 <__umoddi3>
1c008cd2:	892a                	mv	s2,a0
1c008cd4:	85e6                	mv	a1,s9
1c008cd6:	8522                	mv	a0,s0
1c008cd8:	4629                	li	a2,10
1c008cda:	4681                	li	a3,0
1c008cdc:	bc0ff0ef          	jal	ra,1c00809c <__udivdi3>
1c008ce0:	03090913          	addi	s2,s2,48
1c008ce4:	012d8023          	sb	s2,0(s11)
1c008ce8:	00a5e7b3          	or	a5,a1,a0
1c008cec:	001d8913          	addi	s2,s11,1
1c008cf0:	842a                	mv	s0,a0
1c008cf2:	8cae                	mv	s9,a1
1c008cf4:	fbe1                	bnez	a5,1c008cc4 <pos_libc_prf+0x21c>
1c008cf6:	00090023          	sb	zero,0(s2)
1c008cfa:	01ba7d63          	bleu	s11,s4,1c008d14 <pos_libc_prf+0x26c>
1c008cfe:	87ee                	mv	a5,s11
1c008d00:	000a4683          	lbu	a3,0(s4)
1c008d04:	0007c703          	lbu	a4,0(a5)
1c008d08:	fed78fab          	p.sb	a3,-1(a5!)
1c008d0c:	00ea00ab          	p.sb	a4,1(s4!)
1c008d10:	fefa68e3          	bltu	s4,a5,1c008d00 <pos_libc_prf+0x258>
1c008d14:	4782                	lw	a5,0(sp)
1c008d16:	4732                	lw	a4,12(sp)
1c008d18:	40f90933          	sub	s2,s2,a5
1c008d1c:	3e0710e3          	bnez	a4,1c0098fc <pos_libc_prf+0xe54>
1c008d20:	47c2                	lw	a5,16(sp)
1c008d22:	3c079de3          	bnez	a5,1c0098fc <pos_libc_prf+0xe54>
1c008d26:	4712                	lw	a4,4(sp)
1c008d28:	837d                	srli	a4,a4,0x1f
1c008d2a:	c23a                	sw	a4,4(sp)
1c008d2c:	3404c463          	bltz	s1,1c009074 <pos_libc_prf+0x5cc>
1c008d30:	4712                	lw	a4,4(sp)
1c008d32:	412484b3          	sub	s1,s1,s2
1c008d36:	1040                	addi	s0,sp,36
1c008d38:	94ba                	add	s1,s1,a4
1c008d3a:	0404e4b3          	p.max	s1,s1,zero
1c008d3e:	009907b3          	add	a5,s2,s1
1c008d42:	40fb0b33          	sub	s6,s6,a5
1c008d46:	4c81                	li	s9,0
1c008d48:	cc02                	sw	zero,24(sp)
1c008d4a:	4a01                	li	s4,0
1c008d4c:	4722                	lw	a4,8(sp)
1c008d4e:	e305                	bnez	a4,1c008d6e <pos_libc_prf+0x2c6>
1c008d50:	01605f63          	blez	s6,1c008d6e <pos_libc_prf+0x2c6>
1c008d54:	fffb0d93          	addi	s11,s6,-1
1c008d58:	85de                	mv	a1,s7
1c008d5a:	02000513          	li	a0,32
1c008d5e:	9982                	jalr	s3
1c008d60:	1dfd                	addi	s11,s11,-1
1c008d62:	ebf52ee3          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008d66:	fffdb9e3          	p.bneimm	s11,-1,1c008d58 <pos_libc_prf+0x2b0>
1c008d6a:	9ada                	add	s5,s5,s6
1c008d6c:	5b7d                	li	s6,-1
1c008d6e:	4792                	lw	a5,4(sp)
1c008d70:	00f40db3          	add	s11,s0,a5
1c008d74:	a031                	j	1c008d80 <pos_libc_prf+0x2d8>
1c008d76:	0014450b          	p.lbu	a0,1(s0!)
1c008d7a:	9982                	jalr	s3
1c008d7c:	ebf521e3          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008d80:	85de                	mv	a1,s7
1c008d82:	ffb41ae3          	bne	s0,s11,1c008d76 <pos_libc_prf+0x2ce>
1c008d86:	8da6                	mv	s11,s1
1c008d88:	a021                	j	1c008d90 <pos_libc_prf+0x2e8>
1c008d8a:	9982                	jalr	s3
1c008d8c:	e9f529e3          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008d90:	1dfd                	addi	s11,s11,-1
1c008d92:	85de                	mv	a1,s7
1c008d94:	03000513          	li	a0,48
1c008d98:	fffdb9e3          	p.bneimm	s11,-1,1c008d8a <pos_libc_prf+0x2e2>
1c008d9c:	4712                	lw	a4,4(sp)
1c008d9e:	40e90933          	sub	s2,s2,a4
1c008da2:	c44a                	sw	s2,8(sp)
1c008da4:	e40a15e3          	bnez	s4,1c008bee <pos_libc_prf+0x146>
1c008da8:	47e2                	lw	a5,24(sp)
1c008daa:	16079763          	bnez	a5,1c008f18 <pos_libc_prf+0x470>
1c008dae:	120c8863          	beqz	s9,1c008ede <pos_libc_prf+0x436>
1c008db2:	00044783          	lbu	a5,0(s0)
1c008db6:	4a25                	li	s4,9
1c008db8:	02e00d93          	li	s11,46
1c008dbc:	a801                	j	1c008dcc <pos_libc_prf+0x324>
1c008dbe:	0405                	addi	s0,s0,1
1c008dc0:	9982                	jalr	s3
1c008dc2:	e5f52ee3          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008dc6:	00044783          	lbu	a5,0(s0)
1c008dca:	197d                	addi	s2,s2,-1
1c008dcc:	fd078713          	addi	a4,a5,-48
1c008dd0:	853e                	mv	a0,a5
1c008dd2:	85de                	mv	a1,s7
1c008dd4:	feea75e3          	bleu	a4,s4,1c008dbe <pos_libc_prf+0x316>
1c008dd8:	ffb783e3          	beq	a5,s11,1c008dbe <pos_libc_prf+0x316>
1c008ddc:	8a66                	mv	s4,s9
1c008dde:	85de                	mv	a1,s7
1c008de0:	03000513          	li	a0,48
1c008de4:	01404463          	bgtz	s4,1c008dec <pos_libc_prf+0x344>
1c008de8:	0070106f          	j	1c00a5ee <pos_libc_prf+0x1b46>
1c008dec:	9982                	jalr	s3
1c008dee:	1a7d                	addi	s4,s4,-1
1c008df0:	fff537e3          	p.bneimm	a0,-1,1c008dde <pos_libc_prf+0x336>
1c008df4:	547d                	li	s0,-1
1c008df6:	bbc1                	j	1c008bc6 <pos_libc_prf+0x11e>
1c008df8:	000d4d83          	lbu	s11,0(s10)
1c008dfc:	02a00793          	li	a5,42
1c008e00:	001d0513          	addi	a0,s10,1
1c008e04:	08fd8e63          	beq	s11,a5,1c008ea0 <pos_libc_prf+0x3f8>
1c008e08:	fd0d8793          	addi	a5,s11,-48
1c008e0c:	4825                	li	a6,9
1c008e0e:	846e                	mv	s0,s11
1c008e10:	86aa                	mv	a3,a0
1c008e12:	4481                	li	s1,0
1c008e14:	45a5                	li	a1,9
1c008e16:	8d2a                	mv	s10,a0
1c008e18:	d4f86ee3          	bltu	a6,a5,1c008b74 <pos_libc_prf+0xcc>
1c008e1c:	00249793          	slli	a5,s1,0x2
1c008e20:	97a6                	add	a5,a5,s1
1c008e22:	0786                	slli	a5,a5,0x1
1c008e24:	97ee                	add	a5,a5,s11
1c008e26:	0016cd8b          	p.lbu	s11,1(a3!) # 1a10f001 <__l1_heap_size+0x1a00f029>
1c008e2a:	fd078493          	addi	s1,a5,-48
1c008e2e:	fd0d8793          	addi	a5,s11,-48
1c008e32:	846e                	mv	s0,s11
1c008e34:	fef5f4e3          	bleu	a5,a1,1c008e1c <pos_libc_prf+0x374>
1c008e38:	8d36                	mv	s10,a3
1c008e3a:	bb2d                	j	1c008b74 <pos_libc_prf+0xcc>
1c008e3c:	000a2b03          	lw	s6,0(s4)
1c008e40:	0a11                	addi	s4,s4,4
1c008e42:	080b4363          	bltz	s6,1c008ec8 <pos_libc_prf+0x420>
1c008e46:	00094d83          	lbu	s11,0(s2)
1c008e4a:	00240d13          	addi	s10,s0,2
1c008e4e:	bb29                	j	1c008b68 <pos_libc_prf+0xc0>
1c008e50:	07500693          	li	a3,117
1c008e54:	10dd8763          	beq	s11,a3,1c008f62 <pos_libc_prf+0x4ba>
1c008e58:	07800693          	li	a3,120
1c008e5c:	10dd8363          	beq	s11,a3,1c008f62 <pos_libc_prf+0x4ba>
1c008e60:	07300793          	li	a5,115
1c008e64:	0cfd96e3          	bne	s11,a5,1c009730 <pos_libc_prf+0xc88>
1c008e68:	004a0713          	addi	a4,s4,4
1c008e6c:	ce3a                	sw	a4,28(sp)
1c008e6e:	000a2403          	lw	s0,0(s4)
1c008e72:	3c04c5e3          	bltz	s1,1c009a3c <pos_libc_prf+0xf94>
1c008e76:	460484e3          	beqz	s1,1c009ade <pos_libc_prf+0x1036>
1c008e7a:	00044783          	lbu	a5,0(s0)
1c008e7e:	44078fe3          	beqz	a5,1c009adc <pos_libc_prf+0x1034>
1c008e82:	00140793          	addi	a5,s0,1
1c008e86:	4901                	li	s2,0
1c008e88:	a021                	j	1c008e90 <pos_libc_prf+0x3e8>
1c008e8a:	0017c70b          	p.lbu	a4,1(a5!)
1c008e8e:	c701                	beqz	a4,1c008e96 <pos_libc_prf+0x3ee>
1c008e90:	0905                	addi	s2,s2,1
1c008e92:	fe994ce3          	blt	s2,s1,1c008e8a <pos_libc_prf+0x3e2>
1c008e96:	412b0b33          	sub	s6,s6,s2
1c008e9a:	4481                	li	s1,0
1c008e9c:	c202                	sw	zero,4(sp)
1c008e9e:	b565                	j	1c008d46 <pos_libc_prf+0x29e>
1c008ea0:	001d4d83          	lbu	s11,1(s10)
1c008ea4:	000a2483          	lw	s1,0(s4)
1c008ea8:	0d09                	addi	s10,s10,2
1c008eaa:	846e                	mv	s0,s11
1c008eac:	0a11                	addi	s4,s4,4
1c008eae:	b1d9                	j	1c008b74 <pos_libc_prf+0xcc>
1c008eb0:	02500793          	li	a5,37
1c008eb4:	06fd9ee3          	bne	s11,a5,1c009730 <pos_libc_prf+0xc88>
1c008eb8:	85de                	mv	a1,s7
1c008eba:	02500513          	li	a0,37
1c008ebe:	9982                	jalr	s3
1c008ec0:	d5f52fe3          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008ec4:	0a85                	addi	s5,s5,1
1c008ec6:	b105                	j	1c008ae6 <pos_libc_prf+0x3e>
1c008ec8:	4785                	li	a5,1
1c008eca:	41600b33          	neg	s6,s6
1c008ece:	c43e                	sw	a5,8(sp)
1c008ed0:	bf9d                	j	1c008e46 <pos_libc_prf+0x39e>
1c008ed2:	0014450b          	p.lbu	a0,1(s0!)
1c008ed6:	197d                	addi	s2,s2,-1
1c008ed8:	9982                	jalr	s3
1c008eda:	d5f522e3          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c008ede:	85de                	mv	a1,s7
1c008ee0:	ff2049e3          	bgtz	s2,1c008ed2 <pos_libc_prf+0x42a>
1c008ee4:	4792                	lw	a5,4(sp)
1c008ee6:	4a72                	lw	s4,28(sp)
1c008ee8:	00fa8733          	add	a4,s5,a5
1c008eec:	47a2                	lw	a5,8(sp)
1c008eee:	9726                	add	a4,a4,s1
1c008ef0:	00e78ab3          	add	s5,a5,a4
1c008ef4:	bf6059e3          	blez	s6,1c008ae6 <pos_libc_prf+0x3e>
1c008ef8:	9ada                	add	s5,s5,s6
1c008efa:	1b7d                	addi	s6,s6,-1
1c008efc:	a029                	j	1c008f06 <pos_libc_prf+0x45e>
1c008efe:	01fb3463          	p.bneimm	s6,-1,1c008f06 <pos_libc_prf+0x45e>
1c008f02:	6040106f          	j	1c00a506 <pos_libc_prf+0x1a5e>
1c008f06:	85de                	mv	a1,s7
1c008f08:	02000513          	li	a0,32
1c008f0c:	9982                	jalr	s3
1c008f0e:	1b7d                	addi	s6,s6,-1
1c008f10:	fff537e3          	p.bneimm	a0,-1,1c008efe <pos_libc_prf+0x456>
1c008f14:	547d                	li	s0,-1
1c008f16:	b945                	j	1c008bc6 <pos_libc_prf+0x11e>
1c008f18:	02e00a13          	li	s4,46
1c008f1c:	a029                	j	1c008f26 <pos_libc_prf+0x47e>
1c008f1e:	014d9463          	bne	s11,s4,1c008f26 <pos_libc_prf+0x47e>
1c008f22:	53a0106f          	j	1c00a45c <pos_libc_prf+0x19b4>
1c008f26:	00144d8b          	p.lbu	s11,1(s0!)
1c008f2a:	85de                	mv	a1,s7
1c008f2c:	197d                	addi	s2,s2,-1
1c008f2e:	856e                	mv	a0,s11
1c008f30:	9982                	jalr	s3
1c008f32:	fff536e3          	p.bneimm	a0,-1,1c008f1e <pos_libc_prf+0x476>
1c008f36:	547d                	li	s0,-1
1c008f38:	b179                	j	1c008bc6 <pos_libc_prf+0x11e>
1c008f3a:	188d86e3          	beq	s11,s0,1c0098c6 <pos_libc_prf+0xe1e>
1c008f3e:	8d36                	mv	s10,a3
1c008f40:	b185                	j	1c008ba0 <pos_libc_prf+0xf8>
1c008f42:	188d89e3          	beq	s11,s0,1c0098d4 <pos_libc_prf+0xe2c>
1c008f46:	8d36                	mv	s10,a3
1c008f48:	06800793          	li	a5,104
1c008f4c:	b991                	j	1c008ba0 <pos_libc_prf+0xf8>
1c008f4e:	06300693          	li	a3,99
1c008f52:	70dd8a63          	beq	s11,a3,1c009666 <pos_libc_prf+0xbbe>
1c008f56:	d3b6e5e3          	bltu	a3,s11,1c008c80 <pos_libc_prf+0x1d8>
1c008f5a:	05800693          	li	a3,88
1c008f5e:	7cdd9963          	bne	s11,a3,1c009730 <pos_libc_prf+0xc88>
1c008f62:	06c00693          	li	a3,108
1c008f66:	18d783e3          	beq	a5,a3,1c0098ec <pos_libc_prf+0xe44>
1c008f6a:	07a00693          	li	a3,122
1c008f6e:	16d78fe3          	beq	a5,a3,1c0098ec <pos_libc_prf+0xe44>
1c008f72:	04c00693          	li	a3,76
1c008f76:	2ed781e3          	beq	a5,a3,1c009a58 <pos_libc_prf+0xfb0>
1c008f7a:	000a2403          	lw	s0,0(s4)
1c008f7e:	0a11                	addi	s4,s4,4
1c008f80:	ce52                	sw	s4,28(sp)
1c008f82:	4c81                	li	s9,0
1c008f84:	06f00793          	li	a5,111
1c008f88:	3cfd84e3          	beq	s11,a5,1c009b50 <pos_libc_prf+0x10a8>
1c008f8c:	07500793          	li	a5,117
1c008f90:	02410a13          	addi	s4,sp,36
1c008f94:	04fd8763          	beq	s11,a5,1c008fe2 <pos_libc_prf+0x53a>
1c008f98:	4712                	lw	a4,4(sp)
1c008f9a:	2a070be3          	beqz	a4,1c009a50 <pos_libc_prf+0xfa8>
1c008f9e:	77e1                	lui	a5,0xffff8
1c008fa0:	8307c793          	xori	a5,a5,-2000
1c008fa4:	02f11223          	sh	a5,36(sp)
1c008fa8:	4909                	li	s2,2
1c008faa:	02610693          	addi	a3,sp,38
1c008fae:	87b6                	mv	a5,a3
1c008fb0:	4e25                	li	t3,9
1c008fb2:	f6443733          	p.bclr	a4,s0,27,4
1c008fb6:	01cc9613          	slli	a2,s9,0x1c
1c008fba:	8011                	srli	s0,s0,0x4
1c008fbc:	8c51                	or	s0,s0,a2
1c008fbe:	004cdc93          	srli	s9,s9,0x4
1c008fc2:	05770813          	addi	a6,a4,87
1c008fc6:	03070593          	addi	a1,a4,48
1c008fca:	01946533          	or	a0,s0,s9
1c008fce:	06ee7663          	bleu	a4,t3,1c00903a <pos_libc_prf+0x592>
1c008fd2:	01078023          	sb	a6,0(a5) # ffff8000 <pulp__FC+0xffff8001>
1c008fd6:	00178593          	addi	a1,a5,1
1c008fda:	c52d                	beqz	a0,1c009044 <pos_libc_prf+0x59c>
1c008fdc:	87ae                	mv	a5,a1
1c008fde:	bfd1                	j	1c008fb2 <pos_libc_prf+0x50a>
1c008fe0:	8a4a                	mv	s4,s2
1c008fe2:	4629                	li	a2,10
1c008fe4:	4681                	li	a3,0
1c008fe6:	8522                	mv	a0,s0
1c008fe8:	85e6                	mv	a1,s9
1c008fea:	beeff0ef          	jal	ra,1c0083d8 <__umoddi3>
1c008fee:	892a                	mv	s2,a0
1c008ff0:	85e6                	mv	a1,s9
1c008ff2:	8522                	mv	a0,s0
1c008ff4:	4629                	li	a2,10
1c008ff6:	4681                	li	a3,0
1c008ff8:	8a4ff0ef          	jal	ra,1c00809c <__udivdi3>
1c008ffc:	03090913          	addi	s2,s2,48
1c009000:	012a0023          	sb	s2,0(s4)
1c009004:	00a5e7b3          	or	a5,a1,a0
1c009008:	001a0913          	addi	s2,s4,1
1c00900c:	842a                	mv	s0,a0
1c00900e:	8cae                	mv	s9,a1
1c009010:	fbe1                	bnez	a5,1c008fe0 <pos_libc_prf+0x538>
1c009012:	4782                	lw	a5,0(sp)
1c009014:	00090023          	sb	zero,0(s2)
1c009018:	40f90933          	sub	s2,s2,a5
1c00901c:	0147fd63          	bleu	s4,a5,1c009036 <pos_libc_prf+0x58e>
1c009020:	105c                	addi	a5,sp,36
1c009022:	0007c683          	lbu	a3,0(a5)
1c009026:	000a4703          	lbu	a4,0(s4)
1c00902a:	feda0fab          	p.sb	a3,-1(s4!)
1c00902e:	00e780ab          	p.sb	a4,1(a5!)
1c009032:	ff47e8e3          	bltu	a5,s4,1c009022 <pos_libc_prf+0x57a>
1c009036:	c202                	sw	zero,4(sp)
1c009038:	b9d5                	j	1c008d2c <pos_libc_prf+0x284>
1c00903a:	00b78023          	sb	a1,0(a5)
1c00903e:	00178593          	addi	a1,a5,1
1c009042:	fd49                	bnez	a0,1c008fdc <pos_libc_prf+0x534>
1c009044:	00058023          	sb	zero,0(a1)
1c009048:	8d95                	sub	a1,a1,a3
1c00904a:	00f6fc63          	bleu	a5,a3,1c009062 <pos_libc_prf+0x5ba>
1c00904e:	0006c603          	lbu	a2,0(a3)
1c009052:	0007c703          	lbu	a4,0(a5)
1c009056:	fec78fab          	p.sb	a2,-1(a5!)
1c00905a:	00e680ab          	p.sb	a4,1(a3!)
1c00905e:	fef6e8e3          	bltu	a3,a5,1c00904e <pos_libc_prf+0x5a6>
1c009062:	05800793          	li	a5,88
1c009066:	28fd85e3          	beq	s11,a5,1c009af0 <pos_libc_prf+0x1048>
1c00906a:	4712                	lw	a4,4(sp)
1c00906c:	992e                	add	s2,s2,a1
1c00906e:	0706                	slli	a4,a4,0x1
1c009070:	c23a                	sw	a4,4(sp)
1c009072:	b96d                	j	1c008d2c <pos_libc_prf+0x284>
1c009074:	4c81                	li	s9,0
1c009076:	cc02                	sw	zero,24(sp)
1c009078:	4a01                	li	s4,0
1c00907a:	47d2                	lw	a5,20(sp)
1c00907c:	5c078f63          	beqz	a5,1c00965a <pos_libc_prf+0xbb2>
1c009080:	412b04b3          	sub	s1,s6,s2
1c009084:	0404e4b3          	p.max	s1,s1,zero
1c009088:	009907b3          	add	a5,s2,s1
1c00908c:	40fb0b33          	sub	s6,s6,a5
1c009090:	1040                	addi	s0,sp,36
1c009092:	b96d                	j	1c008d4c <pos_libc_prf+0x2a4>
1c009094:	4301                	li	t1,0
1c009096:	4881                	li	a7,0
1c009098:	4581                	li	a1,0
1c00909a:	4801                	li	a6,0
1c00909c:	4691                	li	a3,4
1c00909e:	411686b3          	sub	a3,a3,a7
1c0090a2:	0136c0fb          	lp.setup	x1,a3,1c0090c8 <pos_libc_prf+0x620>
1c0090a6:	01f81713          	slli	a4,a6,0x1f
1c0090aa:	0015d793          	srli	a5,a1,0x1
1c0090ae:	8fd9                	or	a5,a5,a4
1c0090b0:	fc15b5b3          	p.bclr	a1,a1,30,1
1c0090b4:	00f58f33          	add	t5,a1,a5
1c0090b8:	00185813          	srli	a6,a6,0x1
1c0090bc:	00bf35b3          	sltu	a1,t5,a1
1c0090c0:	01058533          	add	a0,a1,a6
1c0090c4:	882a                	mv	a6,a0
1c0090c6:	85fa                	mv	a1,t5
1c0090c8:	0885                	addi	a7,a7,1
1c0090ca:	0004d363          	bgez	s1,1c0090d0 <pos_libc_prf+0x628>
1c0090ce:	4499                	li	s1,6
1c0090d0:	04700793          	li	a5,71
1c0090d4:	0cfe8de3          	beq	t4,a5,1c0099ae <pos_libc_prf+0xf06>
1c0090d8:	06600793          	li	a5,102
1c0090dc:	4801                	li	a6,0
1c0090de:	0efd86e3          	beq	s11,a5,1c0099ca <pos_libc_prf+0xf22>
1c0090e2:	00148e93          	addi	t4,s1,1
1c0090e6:	4741                	li	a4,16
1c0090e8:	04eeceb3          	p.min	t4,t4,a4
1c0090ec:	1efd                	addi	t4,t4,-1
1c0090ee:	4281                	li	t0,0
1c0090f0:	080006b7          	lui	a3,0x8000
1c0090f4:	4f95                	li	t6,5
1c0090f6:	0e85                	addi	t4,t4,1
1c0090f8:	02fec0fb          	lp.setup	x1,t4,1c009156 <pos_libc_prf+0x6ae>
1c0090fc:	00228713          	addi	a4,t0,2
1c009100:	005737b3          	sltu	a5,a4,t0
1c009104:	97b6                	add	a5,a5,a3
1c009106:	03f7d5b3          	divu	a1,a5,t6
1c00910a:	00375613          	srli	a2,a4,0x3
1c00910e:	00259693          	slli	a3,a1,0x2
1c009112:	96ae                	add	a3,a3,a1
1c009114:	8f95                	sub	a5,a5,a3
1c009116:	07f6                	slli	a5,a5,0x1d
1c009118:	8e5d                	or	a2,a2,a5
1c00911a:	03f65633          	divu	a2,a2,t6
1c00911e:	00361693          	slli	a3,a2,0x3
1c009122:	00561793          	slli	a5,a2,0x5
1c009126:	97b6                	add	a5,a5,a3
1c009128:	40f707b3          	sub	a5,a4,a5
1c00912c:	03f7d7b3          	divu	a5,a5,t6
1c009130:	8275                	srli	a2,a2,0x1d
1c009132:	962e                	add	a2,a2,a1
1c009134:	96be                	add	a3,a3,a5
1c009136:	00f6b7b3          	sltu	a5,a3,a5
1c00913a:	00c78733          	add	a4,a5,a2
1c00913e:	01f71613          	slli	a2,a4,0x1f
1c009142:	0016d793          	srli	a5,a3,0x1
1c009146:	8fd1                	or	a5,a5,a2
1c009148:	fc16b6b3          	p.bclr	a3,a3,30,1
1c00914c:	00f682b3          	add	t0,a3,a5
1c009150:	8305                	srli	a4,a4,0x1
1c009152:	00d2b6b3          	sltu	a3,t0,a3
1c009156:	96ba                	add	a3,a3,a4
1c009158:	005f07b3          	add	a5,t5,t0
1c00915c:	01e7bf33          	sltu	t5,a5,t5
1c009160:	96aa                	add	a3,a3,a0
1c009162:	96fa                	add	a3,a3,t5
1c009164:	f606b5b3          	p.bclr	a1,a3,27,0
1c009168:	cdb9                	beqz	a1,1c0091c6 <pos_libc_prf+0x71e>
1c00916a:	00278513          	addi	a0,a5,2
1c00916e:	00f537b3          	sltu	a5,a0,a5
1c009172:	97b6                	add	a5,a5,a3
1c009174:	4f15                	li	t5,5
1c009176:	03e7deb3          	divu	t4,a5,t5
1c00917a:	00355693          	srli	a3,a0,0x3
1c00917e:	0305                	addi	t1,t1,1
1c009180:	002e9593          	slli	a1,t4,0x2
1c009184:	95f6                	add	a1,a1,t4
1c009186:	8f8d                	sub	a5,a5,a1
1c009188:	07f6                	slli	a5,a5,0x1d
1c00918a:	8edd                	or	a3,a3,a5
1c00918c:	03e6d6b3          	divu	a3,a3,t5
1c009190:	00369593          	slli	a1,a3,0x3
1c009194:	00569793          	slli	a5,a3,0x5
1c009198:	97ae                	add	a5,a5,a1
1c00919a:	40f507b3          	sub	a5,a0,a5
1c00919e:	03e7d7b3          	divu	a5,a5,t5
1c0091a2:	82f5                	srli	a3,a3,0x1d
1c0091a4:	96f6                	add	a3,a3,t4
1c0091a6:	95be                	add	a1,a1,a5
1c0091a8:	00f5b7b3          	sltu	a5,a1,a5
1c0091ac:	96be                	add	a3,a3,a5
1c0091ae:	01f69513          	slli	a0,a3,0x1f
1c0091b2:	0015d793          	srli	a5,a1,0x1
1c0091b6:	8fc9                	or	a5,a5,a0
1c0091b8:	fc15b5b3          	p.bclr	a1,a1,30,1
1c0091bc:	97ae                	add	a5,a5,a1
1c0091be:	8285                	srli	a3,a3,0x1
1c0091c0:	00b7b5b3          	sltu	a1,a5,a1
1c0091c4:	96ae                	add	a3,a3,a1
1c0091c6:	06600593          	li	a1,102
1c0091ca:	001e0513          	addi	a0,t3,1
1c0091ce:	1ebd87e3          	beq	s11,a1,1c009bbc <pos_libc_prf+0x1114>
1c0091d2:	01e7de93          	srli	t4,a5,0x1e
1c0091d6:	00279593          	slli	a1,a5,0x2
1c0091da:	00269893          	slli	a7,a3,0x2
1c0091de:	97ae                	add	a5,a5,a1
1c0091e0:	011ee8b3          	or	a7,t4,a7
1c0091e4:	00b7b5b3          	sltu	a1,a5,a1
1c0091e8:	96c6                	add	a3,a3,a7
1c0091ea:	96ae                	add	a3,a3,a1
1c0091ec:	0686                	slli	a3,a3,0x1
1c0091ee:	01f7d593          	srli	a1,a5,0x1f
1c0091f2:	8ecd                	or	a3,a3,a1
1c0091f4:	01c6d593          	srli	a1,a3,0x1c
1c0091f8:	4712                	lw	a4,4(sp)
1c0091fa:	88ae                	mv	a7,a1
1c0091fc:	03058593          	addi	a1,a1,48
1c009200:	011038b3          	snez	a7,a7
1c009204:	00be0023          	sb	a1,0(t3)
1c009208:	c7c6beb3          	p.bclr	t4,a3,3,28
1c00920c:	00179593          	slli	a1,a5,0x1
1c009210:	41130333          	sub	t1,t1,a7
1c009214:	0a0719e3          	bnez	a4,1c009ac6 <pos_libc_prf+0x101e>
1c009218:	8ca6                	mv	s9,s1
1c00921a:	3c905d63          	blez	s1,1c0095f4 <pos_libc_prf+0xb4c>
1c00921e:	02e00693          	li	a3,46
1c009222:	002e0793          	addi	a5,t3,2
1c009226:	00de00a3          	sb	a3,1(t3)
1c00922a:	00259693          	slli	a3,a1,0x2
1c00922e:	01e5d893          	srli	a7,a1,0x1e
1c009232:	002e9513          	slli	a0,t4,0x2
1c009236:	95b6                	add	a1,a1,a3
1c009238:	00a8e533          	or	a0,a7,a0
1c00923c:	00d5b8b3          	sltu	a7,a1,a3
1c009240:	01d506b3          	add	a3,a0,t4
1c009244:	98b6                	add	a7,a7,a3
1c009246:	0886                	slli	a7,a7,0x1
1c009248:	01f5d693          	srli	a3,a1,0x1f
1c00924c:	0116e8b3          	or	a7,a3,a7
1c009250:	01c8de13          	srli	t3,a7,0x1c
1c009254:	030e0e13          	addi	t3,t3,48
1c009258:	100006b7          	lui	a3,0x10000
1c00925c:	fff68513          	addi	a0,a3,-1 # fffffff <__l1_heap_size+0xff00027>
1c009260:	01c78023          	sb	t3,0(a5)
1c009264:	00159e93          	slli	t4,a1,0x1
1c009268:	00a8f8b3          	and	a7,a7,a0
1c00926c:	0014b463          	p.bneimm	s1,1,1c009274 <pos_libc_prf+0x7cc>
1c009270:	3de0106f          	j	1c00a64e <pos_libc_prf+0x1ba6>
1c009274:	00359693          	slli	a3,a1,0x3
1c009278:	00289e13          	slli	t3,a7,0x2
1c00927c:	01eedf13          	srli	t5,t4,0x1e
1c009280:	01d685b3          	add	a1,a3,t4
1c009284:	01cf6e33          	or	t3,t5,t3
1c009288:	98f2                	add	a7,a7,t3
1c00928a:	00d5b6b3          	sltu	a3,a1,a3
1c00928e:	96c6                	add	a3,a3,a7
1c009290:	0686                	slli	a3,a3,0x1
1c009292:	01f5d893          	srli	a7,a1,0x1f
1c009296:	00d8e6b3          	or	a3,a7,a3
1c00929a:	01c6d893          	srli	a7,a3,0x1c
1c00929e:	03088893          	addi	a7,a7,48
1c0092a2:	011780a3          	sb	a7,1(a5)
1c0092a6:	ffe48c93          	addi	s9,s1,-2
1c0092aa:	00159e13          	slli	t3,a1,0x1
1c0092ae:	8ee9                	and	a3,a3,a0
1c0092b0:	01904463          	bgtz	s9,1c0092b8 <pos_libc_prf+0x810>
1c0092b4:	3920106f          	j	1c00a646 <pos_libc_prf+0x1b9e>
1c0092b8:	01ee5e93          	srli	t4,t3,0x1e
1c0092bc:	058e                	slli	a1,a1,0x3
1c0092be:	00269893          	slli	a7,a3,0x2
1c0092c2:	9e2e                	add	t3,t3,a1
1c0092c4:	011ee8b3          	or	a7,t4,a7
1c0092c8:	96c6                	add	a3,a3,a7
1c0092ca:	00be35b3          	sltu	a1,t3,a1
1c0092ce:	95b6                	add	a1,a1,a3
1c0092d0:	0586                	slli	a1,a1,0x1
1c0092d2:	01fe5693          	srli	a3,t3,0x1f
1c0092d6:	8dd5                	or	a1,a1,a3
1c0092d8:	01c5d693          	srli	a3,a1,0x1c
1c0092dc:	03068693          	addi	a3,a3,48
1c0092e0:	00d78123          	sb	a3,2(a5)
1c0092e4:	ffd48c93          	addi	s9,s1,-3
1c0092e8:	001e1e93          	slli	t4,t3,0x1
1c0092ec:	8de9                	and	a1,a1,a0
1c0092ee:	01904463          	bgtz	s9,1c0092f6 <pos_libc_prf+0x84e>
1c0092f2:	34c0106f          	j	1c00a63e <pos_libc_prf+0x1b96>
1c0092f6:	003e1693          	slli	a3,t3,0x3
1c0092fa:	00259893          	slli	a7,a1,0x2
1c0092fe:	01eede13          	srli	t3,t4,0x1e
1c009302:	011e68b3          	or	a7,t3,a7
1c009306:	9eb6                	add	t4,t4,a3
1c009308:	95c6                	add	a1,a1,a7
1c00930a:	00deb6b3          	sltu	a3,t4,a3
1c00930e:	96ae                	add	a3,a3,a1
1c009310:	0686                	slli	a3,a3,0x1
1c009312:	01fed593          	srli	a1,t4,0x1f
1c009316:	8ecd                	or	a3,a3,a1
1c009318:	01c6d593          	srli	a1,a3,0x1c
1c00931c:	03058593          	addi	a1,a1,48
1c009320:	00b781a3          	sb	a1,3(a5)
1c009324:	ffc48c93          	addi	s9,s1,-4
1c009328:	001e9e13          	slli	t3,t4,0x1
1c00932c:	8ee9                	and	a3,a3,a0
1c00932e:	01904463          	bgtz	s9,1c009336 <pos_libc_prf+0x88e>
1c009332:	3040106f          	j	1c00a636 <pos_libc_prf+0x1b8e>
1c009336:	003e9593          	slli	a1,t4,0x3
1c00933a:	00269893          	slli	a7,a3,0x2
1c00933e:	01ee5e93          	srli	t4,t3,0x1e
1c009342:	011ee8b3          	or	a7,t4,a7
1c009346:	9e2e                	add	t3,t3,a1
1c009348:	96c6                	add	a3,a3,a7
1c00934a:	00be35b3          	sltu	a1,t3,a1
1c00934e:	95b6                	add	a1,a1,a3
1c009350:	0586                	slli	a1,a1,0x1
1c009352:	01fe5693          	srli	a3,t3,0x1f
1c009356:	8dd5                	or	a1,a1,a3
1c009358:	01c5d693          	srli	a3,a1,0x1c
1c00935c:	03068693          	addi	a3,a3,48
1c009360:	00d78223          	sb	a3,4(a5)
1c009364:	ffb48c93          	addi	s9,s1,-5
1c009368:	001e1e93          	slli	t4,t3,0x1
1c00936c:	8de9                	and	a1,a1,a0
1c00936e:	01904463          	bgtz	s9,1c009376 <pos_libc_prf+0x8ce>
1c009372:	2bc0106f          	j	1c00a62e <pos_libc_prf+0x1b86>
1c009376:	003e1693          	slli	a3,t3,0x3
1c00937a:	00259893          	slli	a7,a1,0x2
1c00937e:	01eede13          	srli	t3,t4,0x1e
1c009382:	011e68b3          	or	a7,t3,a7
1c009386:	9eb6                	add	t4,t4,a3
1c009388:	95c6                	add	a1,a1,a7
1c00938a:	00deb6b3          	sltu	a3,t4,a3
1c00938e:	96ae                	add	a3,a3,a1
1c009390:	0686                	slli	a3,a3,0x1
1c009392:	01fed593          	srli	a1,t4,0x1f
1c009396:	8ecd                	or	a3,a3,a1
1c009398:	01c6d593          	srli	a1,a3,0x1c
1c00939c:	03058593          	addi	a1,a1,48
1c0093a0:	00b782a3          	sb	a1,5(a5)
1c0093a4:	ffa48c93          	addi	s9,s1,-6
1c0093a8:	001e9e13          	slli	t3,t4,0x1
1c0093ac:	8ee9                	and	a3,a3,a0
1c0093ae:	01904463          	bgtz	s9,1c0093b6 <pos_libc_prf+0x90e>
1c0093b2:	2740106f          	j	1c00a626 <pos_libc_prf+0x1b7e>
1c0093b6:	003e9593          	slli	a1,t4,0x3
1c0093ba:	00269893          	slli	a7,a3,0x2
1c0093be:	01ee5e93          	srli	t4,t3,0x1e
1c0093c2:	011ee8b3          	or	a7,t4,a7
1c0093c6:	9e2e                	add	t3,t3,a1
1c0093c8:	96c6                	add	a3,a3,a7
1c0093ca:	00be35b3          	sltu	a1,t3,a1
1c0093ce:	95b6                	add	a1,a1,a3
1c0093d0:	0586                	slli	a1,a1,0x1
1c0093d2:	01fe5693          	srli	a3,t3,0x1f
1c0093d6:	8dd5                	or	a1,a1,a3
1c0093d8:	01c5d693          	srli	a3,a1,0x1c
1c0093dc:	03068693          	addi	a3,a3,48
1c0093e0:	00d78323          	sb	a3,6(a5)
1c0093e4:	ff948c93          	addi	s9,s1,-7
1c0093e8:	001e1e93          	slli	t4,t3,0x1
1c0093ec:	8de9                	and	a1,a1,a0
1c0093ee:	01904463          	bgtz	s9,1c0093f6 <pos_libc_prf+0x94e>
1c0093f2:	22c0106f          	j	1c00a61e <pos_libc_prf+0x1b76>
1c0093f6:	003e1693          	slli	a3,t3,0x3
1c0093fa:	00259893          	slli	a7,a1,0x2
1c0093fe:	01eede13          	srli	t3,t4,0x1e
1c009402:	011e68b3          	or	a7,t3,a7
1c009406:	9eb6                	add	t4,t4,a3
1c009408:	95c6                	add	a1,a1,a7
1c00940a:	00deb6b3          	sltu	a3,t4,a3
1c00940e:	96ae                	add	a3,a3,a1
1c009410:	0686                	slli	a3,a3,0x1
1c009412:	01fed593          	srli	a1,t4,0x1f
1c009416:	8ecd                	or	a3,a3,a1
1c009418:	01c6d593          	srli	a1,a3,0x1c
1c00941c:	03058593          	addi	a1,a1,48
1c009420:	00b783a3          	sb	a1,7(a5)
1c009424:	ff848c93          	addi	s9,s1,-8
1c009428:	001e9e13          	slli	t3,t4,0x1
1c00942c:	8ee9                	and	a3,a3,a0
1c00942e:	01904463          	bgtz	s9,1c009436 <pos_libc_prf+0x98e>
1c009432:	1e40106f          	j	1c00a616 <pos_libc_prf+0x1b6e>
1c009436:	003e9593          	slli	a1,t4,0x3
1c00943a:	00269893          	slli	a7,a3,0x2
1c00943e:	01ee5e93          	srli	t4,t3,0x1e
1c009442:	011ee8b3          	or	a7,t4,a7
1c009446:	9e2e                	add	t3,t3,a1
1c009448:	96c6                	add	a3,a3,a7
1c00944a:	00be35b3          	sltu	a1,t3,a1
1c00944e:	95b6                	add	a1,a1,a3
1c009450:	0586                	slli	a1,a1,0x1
1c009452:	01fe5693          	srli	a3,t3,0x1f
1c009456:	8dd5                	or	a1,a1,a3
1c009458:	01c5d693          	srli	a3,a1,0x1c
1c00945c:	03068693          	addi	a3,a3,48
1c009460:	00d78423          	sb	a3,8(a5)
1c009464:	ff748c93          	addi	s9,s1,-9
1c009468:	001e1e93          	slli	t4,t3,0x1
1c00946c:	8de9                	and	a1,a1,a0
1c00946e:	01904463          	bgtz	s9,1c009476 <pos_libc_prf+0x9ce>
1c009472:	19c0106f          	j	1c00a60e <pos_libc_prf+0x1b66>
1c009476:	003e1693          	slli	a3,t3,0x3
1c00947a:	00259893          	slli	a7,a1,0x2
1c00947e:	01eedf13          	srli	t5,t4,0x1e
1c009482:	01d68e33          	add	t3,a3,t4
1c009486:	011f68b3          	or	a7,t5,a7
1c00948a:	98ae                	add	a7,a7,a1
1c00948c:	00de36b3          	sltu	a3,t3,a3
1c009490:	96c6                	add	a3,a3,a7
1c009492:	01fe5593          	srli	a1,t3,0x1f
1c009496:	0686                	slli	a3,a3,0x1
1c009498:	8ecd                	or	a3,a3,a1
1c00949a:	01c6d593          	srli	a1,a3,0x1c
1c00949e:	03058593          	addi	a1,a1,48
1c0094a2:	00b784a3          	sb	a1,9(a5)
1c0094a6:	ff648c93          	addi	s9,s1,-10
1c0094aa:	8ee9                	and	a3,a3,a0
1c0094ac:	001e1593          	slli	a1,t3,0x1
1c0094b0:	00a78513          	addi	a0,a5,10
1c0094b4:	15905063          	blez	s9,1c0095f4 <pos_libc_prf+0xb4c>
1c0094b8:	00259513          	slli	a0,a1,0x2
1c0094bc:	01e5d893          	srli	a7,a1,0x1e
1c0094c0:	00269e13          	slli	t3,a3,0x2
1c0094c4:	95aa                	add	a1,a1,a0
1c0094c6:	01c8ee33          	or	t3,a7,t3
1c0094ca:	96f2                	add	a3,a3,t3
1c0094cc:	00a5b8b3          	sltu	a7,a1,a0
1c0094d0:	98b6                	add	a7,a7,a3
1c0094d2:	0886                	slli	a7,a7,0x1
1c0094d4:	01f5d693          	srli	a3,a1,0x1f
1c0094d8:	0116e8b3          	or	a7,a3,a7
1c0094dc:	01c8de13          	srli	t3,a7,0x1c
1c0094e0:	030e0e13          	addi	t3,t3,48
1c0094e4:	100006b7          	lui	a3,0x10000
1c0094e8:	fff68513          	addi	a0,a3,-1 # fffffff <__l1_heap_size+0xff00027>
1c0094ec:	01c78523          	sb	t3,10(a5)
1c0094f0:	ff548c93          	addi	s9,s1,-11
1c0094f4:	00159e93          	slli	t4,a1,0x1
1c0094f8:	00a8f8b3          	and	a7,a7,a0
1c0094fc:	01904463          	bgtz	s9,1c009504 <pos_libc_prf+0xa5c>
1c009500:	1060106f          	j	1c00a606 <pos_libc_prf+0x1b5e>
1c009504:	00359693          	slli	a3,a1,0x3
1c009508:	00289e13          	slli	t3,a7,0x2
1c00950c:	01eedf13          	srli	t5,t4,0x1e
1c009510:	01d685b3          	add	a1,a3,t4
1c009514:	01cf6e33          	or	t3,t5,t3
1c009518:	98f2                	add	a7,a7,t3
1c00951a:	00d5b6b3          	sltu	a3,a1,a3
1c00951e:	96c6                	add	a3,a3,a7
1c009520:	0686                	slli	a3,a3,0x1
1c009522:	01f5d893          	srli	a7,a1,0x1f
1c009526:	00d8e6b3          	or	a3,a7,a3
1c00952a:	01c6d893          	srli	a7,a3,0x1c
1c00952e:	03088893          	addi	a7,a7,48
1c009532:	011785a3          	sb	a7,11(a5)
1c009536:	ff448c93          	addi	s9,s1,-12
1c00953a:	00159e13          	slli	t3,a1,0x1
1c00953e:	8ee9                	and	a3,a3,a0
1c009540:	01904463          	bgtz	s9,1c009548 <pos_libc_prf+0xaa0>
1c009544:	0ba0106f          	j	1c00a5fe <pos_libc_prf+0x1b56>
1c009548:	058e                	slli	a1,a1,0x3
1c00954a:	01ee5e93          	srli	t4,t3,0x1e
1c00954e:	00269893          	slli	a7,a3,0x2
1c009552:	9e2e                	add	t3,t3,a1
1c009554:	011ee8b3          	or	a7,t4,a7
1c009558:	96c6                	add	a3,a3,a7
1c00955a:	00be35b3          	sltu	a1,t3,a1
1c00955e:	95b6                	add	a1,a1,a3
1c009560:	0586                	slli	a1,a1,0x1
1c009562:	01fe5693          	srli	a3,t3,0x1f
1c009566:	8dd5                	or	a1,a1,a3
1c009568:	01c5d693          	srli	a3,a1,0x1c
1c00956c:	03068693          	addi	a3,a3,48
1c009570:	00d78623          	sb	a3,12(a5)
1c009574:	ff348c93          	addi	s9,s1,-13
1c009578:	001e1893          	slli	a7,t3,0x1
1c00957c:	01904463          	bgtz	s9,1c009584 <pos_libc_prf+0xadc>
1c009580:	0760106f          	j	1c00a5f6 <pos_libc_prf+0x1b4e>
1c009584:	8de9                	and	a1,a1,a0
1c009586:	003e1693          	slli	a3,t3,0x3
1c00958a:	01e8de93          	srli	t4,a7,0x1e
1c00958e:	00259e13          	slli	t3,a1,0x2
1c009592:	98b6                	add	a7,a7,a3
1c009594:	01ceee33          	or	t3,t4,t3
1c009598:	95f2                	add	a1,a1,t3
1c00959a:	00d8b6b3          	sltu	a3,a7,a3
1c00959e:	96ae                	add	a3,a3,a1
1c0095a0:	0686                	slli	a3,a3,0x1
1c0095a2:	01f8d593          	srli	a1,a7,0x1f
1c0095a6:	8ecd                	or	a3,a3,a1
1c0095a8:	01c6d593          	srli	a1,a3,0x1c
1c0095ac:	03058593          	addi	a1,a1,48
1c0095b0:	00b786a3          	sb	a1,13(a5)
1c0095b4:	ff248c93          	addi	s9,s1,-14
1c0095b8:	8ee9                	and	a3,a3,a0
1c0095ba:	00189593          	slli	a1,a7,0x1
1c0095be:	00e78513          	addi	a0,a5,14
1c0095c2:	03905963          	blez	s9,1c0095f4 <pos_libc_prf+0xb4c>
1c0095c6:	00389513          	slli	a0,a7,0x3
1c0095ca:	01e5de13          	srli	t3,a1,0x1e
1c0095ce:	00269893          	slli	a7,a3,0x2
1c0095d2:	95aa                	add	a1,a1,a0
1c0095d4:	011e68b3          	or	a7,t3,a7
1c0095d8:	00a5b5b3          	sltu	a1,a1,a0
1c0095dc:	96c6                	add	a3,a3,a7
1c0095de:	96ae                	add	a3,a3,a1
1c0095e0:	0686                	slli	a3,a3,0x1
1c0095e2:	82f1                	srli	a3,a3,0x1c
1c0095e4:	03068693          	addi	a3,a3,48
1c0095e8:	00f78513          	addi	a0,a5,15
1c0095ec:	00d78723          	sb	a3,14(a5)
1c0095f0:	ff148c93          	addi	s9,s1,-15
1c0095f4:	44080a63          	beqz	a6,1c009a48 <pos_libc_prf+0xfa0>
1c0095f8:	4581                	li	a1,0
1c0095fa:	cc02                	sw	zero,24(sp)
1c0095fc:	4a01                	li	s4,0
1c0095fe:	03000813          	li	a6,48
1c009602:	a011                	j	1c009606 <pos_libc_prf+0xb5e>
1c009604:	853e                	mv	a0,a5
1c009606:	fff50793          	addi	a5,a0,-1
1c00960a:	0007c683          	lbu	a3,0(a5)
1c00960e:	ff068be3          	beq	a3,a6,1c009604 <pos_libc_prf+0xb5c>
1c009612:	02e00813          	li	a6,46
1c009616:	4c81                	li	s9,0
1c009618:	01069363          	bne	a3,a6,1c00961e <pos_libc_prf+0xb76>
1c00961c:	853e                	mv	a0,a5
1c00961e:	0dfdf793          	andi	a5,s11,223
1c009622:	04500693          	li	a3,69
1c009626:	3cd78363          	beq	a5,a3,1c0099ec <pos_libc_prf+0xf44>
1c00962a:	4782                	lw	a5,0(sp)
1c00962c:	00050023          	sb	zero,0(a0)
1c009630:	8d1d                	sub	a0,a0,a5
1c009632:	4732                	lw	a4,12(sp)
1c009634:	2a071763          	bnez	a4,1c0098e2 <pos_libc_prf+0xe3a>
1c009638:	47c2                	lw	a5,16(sp)
1c00963a:	2a079463          	bnez	a5,1c0098e2 <pos_libc_prf+0xe3a>
1c00963e:	02414783          	lbu	a5,36(sp)
1c009642:	02d00693          	li	a3,45
1c009646:	c202                	sw	zero,4(sp)
1c009648:	28d78d63          	beq	a5,a3,1c0098e2 <pos_libc_prf+0xe3a>
1c00964c:	fd078793          	addi	a5,a5,-48
1c009650:	46a5                	li	a3,9
1c009652:	00b50933          	add	s2,a0,a1
1c009656:	a2f6f2e3          	bleu	a5,a3,1c00907a <pos_libc_prf+0x5d2>
1c00965a:	412b0b33          	sub	s6,s6,s2
1c00965e:	1040                	addi	s0,sp,36
1c009660:	4481                	li	s1,0
1c009662:	eeaff06f          	j	1c008d4c <pos_libc_prf+0x2a4>
1c009666:	000a2783          	lw	a5,0(s4)
1c00966a:	0a11                	addi	s4,s4,4
1c00966c:	ce52                	sw	s4,28(sp)
1c00966e:	1b7d                	addi	s6,s6,-1
1c009670:	02f10223          	sb	a5,36(sp)
1c009674:	4481                	li	s1,0
1c009676:	c202                	sw	zero,4(sp)
1c009678:	4905                	li	s2,1
1c00967a:	1040                	addi	s0,sp,36
1c00967c:	ecaff06f          	j	1c008d46 <pos_libc_prf+0x29e>
1c009680:	04c00613          	li	a2,76
1c009684:	004a268b          	p.lw	a3,4(s4!)
1c009688:	5cc783e3          	beq	a5,a2,1c00a44e <pos_libc_prf+0x19a6>
1c00968c:	28f65863          	ble	a5,a2,1c00991c <pos_libc_prf+0xe74>
1c009690:	06800613          	li	a2,104
1c009694:	00c78663          	beq	a5,a2,1c0096a0 <pos_libc_prf+0xbf8>
1c009698:	0156a023          	sw	s5,0(a3)
1c00969c:	c4aff06f          	j	1c008ae6 <pos_libc_prf+0x3e>
1c0096a0:	87d6                	mv	a5,s5
1c0096a2:	00f69023          	sh	a5,0(a3)
1c0096a6:	c40ff06f          	j	1c008ae6 <pos_libc_prf+0x3e>
1c0096aa:	004a0793          	addi	a5,s4,4
1c0096ae:	ce3e                	sw	a5,28(sp)
1c0096b0:	7761                	lui	a4,0xffff8
1c0096b2:	000a2783          	lw	a5,0(s4)
1c0096b6:	02610593          	addi	a1,sp,38
1c0096ba:	83074713          	xori	a4,a4,-2000
1c0096be:	4601                	li	a2,0
1c0096c0:	02e11223          	sh	a4,36(sp)
1c0096c4:	86ae                	mv	a3,a1
1c0096c6:	4ea5                	li	t4,9
1c0096c8:	f647b733          	p.bclr	a4,a5,27,4
1c0096cc:	01c61513          	slli	a0,a2,0x1c
1c0096d0:	8391                	srli	a5,a5,0x4
1c0096d2:	8fc9                	or	a5,a5,a0
1c0096d4:	8211                	srli	a2,a2,0x4
1c0096d6:	05770e13          	addi	t3,a4,87 # ffff8057 <pulp__FC+0xffff8058>
1c0096da:	03070893          	addi	a7,a4,48
1c0096de:	00c7e333          	or	t1,a5,a2
1c0096e2:	00eefa63          	bleu	a4,t4,1c0096f6 <pos_libc_prf+0xc4e>
1c0096e6:	01c68023          	sb	t3,0(a3)
1c0096ea:	00168513          	addi	a0,a3,1
1c0096ee:	00030a63          	beqz	t1,1c009702 <pos_libc_prf+0xc5a>
1c0096f2:	86aa                	mv	a3,a0
1c0096f4:	bfd1                	j	1c0096c8 <pos_libc_prf+0xc20>
1c0096f6:	01168023          	sb	a7,0(a3)
1c0096fa:	00168513          	addi	a0,a3,1
1c0096fe:	fe031ae3          	bnez	t1,1c0096f2 <pos_libc_prf+0xc4a>
1c009702:	00050023          	sb	zero,0(a0)
1c009706:	8d0d                	sub	a0,a0,a1
1c009708:	00d5fe63          	bleu	a3,a1,1c009724 <pos_libc_prf+0xc7c>
1c00970c:	87b6                	mv	a5,a3
1c00970e:	86ae                	mv	a3,a1
1c009710:	0006c603          	lbu	a2,0(a3)
1c009714:	0007c703          	lbu	a4,0(a5)
1c009718:	fec78fab          	p.sb	a2,-1(a5!)
1c00971c:	00e680ab          	p.sb	a4,1(a3!)
1c009720:	fef6e8e3          	bltu	a3,a5,1c009710 <pos_libc_prf+0xc68>
1c009724:	4789                	li	a5,2
1c009726:	00250913          	addi	s2,a0,2
1c00972a:	c23e                	sw	a5,4(sp)
1c00972c:	e00ff06f          	j	1c008d2c <pos_libc_prf+0x284>
1c009730:	85de                	mv	a1,s7
1c009732:	02500513          	li	a0,37
1c009736:	9982                	jalr	s3
1c009738:	cff52363          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c00973c:	85de                	mv	a1,s7
1c00973e:	856e                	mv	a0,s11
1c009740:	9982                	jalr	s3
1c009742:	cdf52e63          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c009746:	0a89                	addi	s5,s5,2
1c009748:	b9eff06f          	j	1c008ae6 <pos_libc_prf+0x3e>
1c00974c:	007a0513          	addi	a0,s4,7
1c009750:	c4053533          	p.bclr	a0,a0,2,0
1c009754:	411c                	lw	a5,0(a0)
1c009756:	00452303          	lw	t1,4(a0)
1c00975a:	0521                	addi	a0,a0,8
1c00975c:	0157d693          	srli	a3,a5,0x15
1c009760:	00b31813          	slli	a6,t1,0xb
1c009764:	01435893          	srli	a7,t1,0x14
1c009768:	0106e833          	or	a6,a3,a6
1c00976c:	ce2a                	sw	a0,28(sp)
1c00976e:	e8b8b8b3          	p.bclr	a7,a7,20,11
1c009772:	00b79593          	slli	a1,a5,0xb
1c009776:	c1f83833          	p.bclr	a6,a6,0,31
1c00977a:	20034363          	bltz	t1,1c009980 <pos_libc_prf+0xed8>
1c00977e:	47b2                	lw	a5,12(sp)
1c009780:	1e078463          	beqz	a5,1c009968 <pos_libc_prf+0xec0>
1c009784:	02b00793          	li	a5,43
1c009788:	02f10223          	sb	a5,36(sp)
1c00978c:	02510e13          	addi	t3,sp,37
1c009790:	7ff00793          	li	a5,2047
1c009794:	18f88d63          	beq	a7,a5,1c00992e <pos_libc_prf+0xe86>
1c009798:	04600793          	li	a5,70
1c00979c:	0dfdfe93          	andi	t4,s11,223
1c0097a0:	34fd8363          	beq	s11,a5,1c009ae6 <pos_libc_prf+0x103e>
1c0097a4:	41f8d693          	srai	a3,a7,0x1f
1c0097a8:	00b8e7b3          	or	a5,a7,a1
1c0097ac:	0106e6b3          	or	a3,a3,a6
1c0097b0:	8fd5                	or	a5,a5,a3
1c0097b2:	8e0781e3          	beqz	a5,1c009094 <pos_libc_prf+0x5ec>
1c0097b6:	02089463          	bnez	a7,1c0097de <pos_libc_prf+0xd36>
1c0097ba:	01f5d793          	srli	a5,a1,0x1f
1c0097be:	00181693          	slli	a3,a6,0x1
1c0097c2:	00d7e833          	or	a6,a5,a3
1c0097c6:	0586                	slli	a1,a1,0x1
1c0097c8:	5c0843e3          	bltz	a6,1c00a58e <pos_libc_prf+0x1ae6>
1c0097cc:	01f5d793          	srli	a5,a1,0x1f
1c0097d0:	0806                	slli	a6,a6,0x1
1c0097d2:	0107e833          	or	a6,a5,a6
1c0097d6:	18fd                	addi	a7,a7,-1
1c0097d8:	0586                	slli	a1,a1,0x1
1c0097da:	fe0859e3          	bgez	a6,1c0097cc <pos_libc_prf+0xd24>
1c0097de:	c0288893          	addi	a7,a7,-1022
1c0097e2:	57f9                	li	a5,-2
1c0097e4:	c1f84833          	p.bset	a6,a6,0,31
1c0097e8:	4301                	li	t1,0
1c0097ea:	06f8d863          	ble	a5,a7,1c00985a <pos_libc_prf+0xdb2>
1c0097ee:	33333537          	lui	a0,0x33333
1c0097f2:	80000f37          	lui	t5,0x80000
1c0097f6:	4301                	li	t1,0
1c0097f8:	33250513          	addi	a0,a0,818 # 33333332 <__l2_shared_end+0x17323182>
1c0097fc:	ffff4f13          	not	t5,t5
1c009800:	5ff9                	li	t6,-2
1c009802:	a011                	j	1c009806 <pos_libc_prf+0xd5e>
1c009804:	88be                	mv	a7,a5
1c009806:	01f81693          	slli	a3,a6,0x1f
1c00980a:	0015d713          	srli	a4,a1,0x1
1c00980e:	fc15b7b3          	p.bclr	a5,a1,30,1
1c009812:	8f55                	or	a4,a4,a3
1c009814:	00e785b3          	add	a1,a5,a4
1c009818:	00f5b7b3          	sltu	a5,a1,a5
1c00981c:	00185813          	srli	a6,a6,0x1
1c009820:	983e                	add	a6,a6,a5
1c009822:	00188793          	addi	a5,a7,1
1c009826:	fd056fe3          	bltu	a0,a6,1c009804 <pos_libc_prf+0xd5c>
1c00982a:	00259693          	slli	a3,a1,0x2
1c00982e:	01e5d613          	srli	a2,a1,0x1e
1c009832:	00281713          	slli	a4,a6,0x2
1c009836:	95b6                	add	a1,a1,a3
1c009838:	8f51                	or	a4,a4,a2
1c00983a:	983a                	add	a6,a6,a4
1c00983c:	00d5b6b3          	sltu	a3,a1,a3
1c009840:	9836                	add	a6,a6,a3
1c009842:	01f5d713          	srli	a4,a1,0x1f
1c009846:	0889                	addi	a7,a7,2
1c009848:	137d                	addi	t1,t1,-1
1c00984a:	01e81663          	bne	a6,t5,1c009856 <pos_libc_prf+0xdae>
1c00984e:	0586                	slli	a1,a1,0x1
1c009850:	fc174833          	p.bset	a6,a4,30,1
1c009854:	88be                	mv	a7,a5
1c009856:	fbf8c8e3          	blt	a7,t6,1c009806 <pos_libc_prf+0xd5e>
1c00985a:	80000f37          	lui	t5,0x80000
1c00985e:	4f95                	li	t6,5
1c009860:	ffff4f13          	not	t5,t5
1c009864:	83105ce3          	blez	a7,1c00909c <pos_libc_prf+0x5f4>
1c009868:	00258693          	addi	a3,a1,2
1c00986c:	00b6b5b3          	sltu	a1,a3,a1
1c009870:	982e                	add	a6,a6,a1
1c009872:	03f857b3          	divu	a5,a6,t6
1c009876:	0036d613          	srli	a2,a3,0x3
1c00987a:	18fd                	addi	a7,a7,-1
1c00987c:	0305                	addi	t1,t1,1
1c00987e:	00279713          	slli	a4,a5,0x2
1c009882:	973e                	add	a4,a4,a5
1c009884:	40e80833          	sub	a6,a6,a4
1c009888:	01d81713          	slli	a4,a6,0x1d
1c00988c:	8e59                	or	a2,a2,a4
1c00988e:	03f65633          	divu	a2,a2,t6
1c009892:	00361593          	slli	a1,a2,0x3
1c009896:	00561713          	slli	a4,a2,0x5
1c00989a:	972e                	add	a4,a4,a1
1c00989c:	40e68733          	sub	a4,a3,a4
1c0098a0:	03f75733          	divu	a4,a4,t6
1c0098a4:	8275                	srli	a2,a2,0x1d
1c0098a6:	97b2                	add	a5,a5,a2
1c0098a8:	95ba                	add	a1,a1,a4
1c0098aa:	00e5b733          	sltu	a4,a1,a4
1c0098ae:	00f70833          	add	a6,a4,a5
1c0098b2:	01f5d793          	srli	a5,a1,0x1f
1c0098b6:	0806                	slli	a6,a6,0x1
1c0098b8:	0107e833          	or	a6,a5,a6
1c0098bc:	0586                	slli	a1,a1,0x1
1c0098be:	18fd                	addi	a7,a7,-1
1c0098c0:	ff0f79e3          	bleu	a6,t5,1c0098b2 <pos_libc_prf+0xe0a>
1c0098c4:	b745                	j	1c009864 <pos_libc_prf+0xdbc>
1c0098c6:	001d4d83          	lbu	s11,1(s10)
1c0098ca:	04c00793          	li	a5,76
1c0098ce:	0d09                	addi	s10,s10,2
1c0098d0:	ad0ff06f          	j	1c008ba0 <pos_libc_prf+0xf8>
1c0098d4:	001d4d83          	lbu	s11,1(s10)
1c0098d8:	04800793          	li	a5,72
1c0098dc:	0d09                	addi	s10,s10,2
1c0098de:	ac2ff06f          	j	1c008ba0 <pos_libc_prf+0xf8>
1c0098e2:	4705                	li	a4,1
1c0098e4:	02514783          	lbu	a5,37(sp)
1c0098e8:	c23a                	sw	a4,4(sp)
1c0098ea:	b38d                	j	1c00964c <pos_libc_prf+0xba4>
1c0098ec:	004a0793          	addi	a5,s4,4
1c0098f0:	ce3e                	sw	a5,28(sp)
1c0098f2:	000a2403          	lw	s0,0(s4)
1c0098f6:	4c81                	li	s9,0
1c0098f8:	e8cff06f          	j	1c008f84 <pos_libc_prf+0x4dc>
1c0098fc:	4785                	li	a5,1
1c0098fe:	c23e                	sw	a5,4(sp)
1c009900:	c2cff06f          	j	1c008d2c <pos_libc_prf+0x284>
1c009904:	4742                	lw	a4,16(sp)
1c009906:	22070063          	beqz	a4,1c009b26 <pos_libc_prf+0x107e>
1c00990a:	02000693          	li	a3,32
1c00990e:	02d10223          	sb	a3,36(sp)
1c009912:	4c92                	lw	s9,4(sp)
1c009914:	02510a13          	addi	s4,sp,37
1c009918:	ba6ff06f          	j	1c008cbe <pos_libc_prf+0x216>
1c00991c:	04800613          	li	a2,72
1c009920:	d6c79ce3          	bne	a5,a2,1c009698 <pos_libc_prf+0xbf0>
1c009924:	87d6                	mv	a5,s5
1c009926:	00f68023          	sb	a5,0(a3)
1c00992a:	9bcff06f          	j	1c008ae6 <pos_libc_prf+0x3e>
1c00992e:	0105e6b3          	or	a3,a1,a6
1c009932:	fbfd8613          	addi	a2,s11,-65
1c009936:	003e0513          	addi	a0,t3,3
1c00993a:	47e5                	li	a5,25
1c00993c:	16069963          	bnez	a3,1c009aae <pos_libc_prf+0x1006>
1c009940:	3ec7e1e3          	bltu	a5,a2,1c00a522 <pos_libc_prf+0x1a7a>
1c009944:	6795                	lui	a5,0x5
1c009946:	e4978793          	addi	a5,a5,-439 # 4e49 <pos_soc_event_callback+0x4a11>
1c00994a:	00fe1023          	sh	a5,0(t3)
1c00994e:	04600793          	li	a5,70
1c009952:	00fe0123          	sb	a5,2(t3)
1c009956:	4782                	lw	a5,0(sp)
1c009958:	000e01a3          	sb	zero,3(t3)
1c00995c:	4581                	li	a1,0
1c00995e:	8d1d                	sub	a0,a0,a5
1c009960:	4c81                	li	s9,0
1c009962:	cc02                	sw	zero,24(sp)
1c009964:	4a01                	li	s4,0
1c009966:	b1f1                	j	1c009632 <pos_libc_prf+0xb8a>
1c009968:	4742                	lw	a4,16(sp)
1c00996a:	02410e13          	addi	t3,sp,36
1c00996e:	e20701e3          	beqz	a4,1c009790 <pos_libc_prf+0xce8>
1c009972:	02000793          	li	a5,32
1c009976:	02f10223          	sb	a5,36(sp)
1c00997a:	02510e13          	addi	t3,sp,37
1c00997e:	bd09                	j	1c009790 <pos_libc_prf+0xce8>
1c009980:	02d00793          	li	a5,45
1c009984:	02f10223          	sb	a5,36(sp)
1c009988:	02510e13          	addi	t3,sp,37
1c00998c:	b511                	j	1c009790 <pos_libc_prf+0xce8>
1c00998e:	40f007b3          	neg	a5,a5
1c009992:	00f036b3          	snez	a3,a5
1c009996:	40e00cb3          	neg	s9,a4
1c00999a:	02d00613          	li	a2,45
1c00999e:	02c10223          	sb	a2,36(sp)
1c0099a2:	40dc8cb3          	sub	s9,s9,a3
1c0099a6:	02510a13          	addi	s4,sp,37
1c0099aa:	b14ff06f          	j	1c008cbe <pos_libc_prf+0x216>
1c0099ae:	57f5                	li	a5,-3
1c0099b0:	0cf34063          	blt	t1,a5,1c009a70 <pos_libc_prf+0xfc8>
1c0099b4:	0a64ce63          	blt	s1,t1,1c009a70 <pos_libc_prf+0xfc8>
1c0099b8:	4792                	lw	a5,4(sp)
1c0099ba:	406484b3          	sub	s1,s1,t1
1c0099be:	4801                	li	a6,0
1c0099c0:	e789                	bnez	a5,1c0099ca <pos_libc_prf+0xf22>
1c0099c2:	00902833          	sgtz	a6,s1
1c0099c6:	0ff87813          	andi	a6,a6,255
1c0099ca:	009307b3          	add	a5,t1,s1
1c0099ce:	2e07cae3          	bltz	a5,1c00a4c2 <pos_libc_prf+0x1a1a>
1c0099d2:	4741                	li	a4,16
1c0099d4:	04e7ceb3          	p.min	t4,a5,a4
1c0099d8:	1efd                	addi	t4,t4,-1
1c0099da:	06600d93          	li	s11,102
1c0099de:	f0079863          	bnez	a5,1c0090ee <pos_libc_prf+0x646>
1c0099e2:	4281                	li	t0,0
1c0099e4:	080006b7          	lui	a3,0x8000
1c0099e8:	f70ff06f          	j	1c009158 <pos_libc_prf+0x6b0>
1c0099ec:	86aa                	mv	a3,a0
1c0099ee:	01b6812b          	p.sb	s11,2(a3!) # 8000002 <__l1_heap_size+0x7f0002a>
1c0099f2:	240346e3          	bltz	t1,1c00a43e <pos_libc_prf+0x1996>
1c0099f6:	02b00793          	li	a5,43
1c0099fa:	00f500a3          	sb	a5,1(a0)
1c0099fe:	06300793          	li	a5,99
1c009a02:	0067de63          	ble	t1,a5,1c009a1e <pos_libc_prf+0xf76>
1c009a06:	06400613          	li	a2,100
1c009a0a:	02c347b3          	div	a5,t1,a2
1c009a0e:	00350693          	addi	a3,a0,3
1c009a12:	02c36333          	rem	t1,t1,a2
1c009a16:	03078793          	addi	a5,a5,48
1c009a1a:	00f50123          	sb	a5,2(a0)
1c009a1e:	47a9                	li	a5,10
1c009a20:	8536                	mv	a0,a3
1c009a22:	02f34633          	div	a2,t1,a5
1c009a26:	02f367b3          	rem	a5,t1,a5
1c009a2a:	03060613          	addi	a2,a2,48
1c009a2e:	00c5012b          	p.sb	a2,2(a0!)
1c009a32:	03078793          	addi	a5,a5,48
1c009a36:	00f680a3          	sb	a5,1(a3)
1c009a3a:	bec5                	j	1c00962a <pos_libc_prf+0xb82>
1c009a3c:	800004b7          	lui	s1,0x80000
1c009a40:	fff4c493          	not	s1,s1
1c009a44:	c36ff06f          	j	1c008e7a <pos_libc_prf+0x3d2>
1c009a48:	85e6                	mv	a1,s9
1c009a4a:	cc02                	sw	zero,24(sp)
1c009a4c:	4a01                	li	s4,0
1c009a4e:	bec1                	j	1c00961e <pos_libc_prf+0xb76>
1c009a50:	4901                	li	s2,0
1c009a52:	1054                	addi	a3,sp,36
1c009a54:	d5aff06f          	j	1c008fae <pos_libc_prf+0x506>
1c009a58:	007a0793          	addi	a5,s4,7
1c009a5c:	c407b7b3          	p.bclr	a5,a5,2,0
1c009a60:	00878713          	addi	a4,a5,8
1c009a64:	ce3a                	sw	a4,28(sp)
1c009a66:	4380                	lw	s0,0(a5)
1c009a68:	0047ac83          	lw	s9,4(a5)
1c009a6c:	d18ff06f          	j	1c008f84 <pos_libc_prf+0x4dc>
1c009a70:	ffed8613          	addi	a2,s11,-2
1c009a74:	0ff67d93          	andi	s11,a2,255
1c009a78:	220486e3          	beqz	s1,1c00a4a4 <pos_libc_prf+0x19fc>
1c009a7c:	4712                	lw	a4,4(sp)
1c009a7e:	fff48793          	addi	a5,s1,-1 # 7fffffff <pulp__FC+0x80000000>
1c009a82:	1e071fe3          	bnez	a4,1c00a480 <pos_libc_prf+0x19d8>
1c009a86:	00f02833          	sgtz	a6,a5
1c009a8a:	0ff87813          	andi	a6,a6,255
1c009a8e:	84be                	mv	s1,a5
1c009a90:	e52ff06f          	j	1c0090e2 <pos_libc_prf+0x63a>
1c009a94:	007a0693          	addi	a3,s4,7
1c009a98:	c406b6b3          	p.bclr	a3,a3,2,0
1c009a9c:	00868793          	addi	a5,a3,8
1c009aa0:	ce3e                	sw	a5,28(sp)
1c009aa2:	429c                	lw	a5,0(a3)
1c009aa4:	42d4                	lw	a3,4(a3)
1c009aa6:	c236                	sw	a3,4(sp)
1c009aa8:	8736                	mv	a4,a3
1c009aaa:	9fcff06f          	j	1c008ca6 <pos_libc_prf+0x1fe>
1c009aae:	24c7efe3          	bltu	a5,a2,1c00a50c <pos_libc_prf+0x1a64>
1c009ab2:	6791                	lui	a5,0x4
1c009ab4:	14e78793          	addi	a5,a5,334 # 414e <pos_soc_event_callback+0x3d16>
1c009ab8:	00fe1023          	sh	a5,0(t3)
1c009abc:	04e00793          	li	a5,78
1c009ac0:	00fe0123          	sb	a5,2(t3)
1c009ac4:	bd49                	j	1c009956 <pos_libc_prf+0xeae>
1c009ac6:	02e00793          	li	a5,46
1c009aca:	00fe00a3          	sb	a5,1(t3)
1c009ace:	002e0793          	addi	a5,t3,2
1c009ad2:	f4904c63          	bgtz	s1,1c00922a <pos_libc_prf+0x782>
1c009ad6:	8ca6                	mv	s9,s1
1c009ad8:	853e                	mv	a0,a5
1c009ada:	be29                	j	1c0095f4 <pos_libc_prf+0xb4c>
1c009adc:	4481                	li	s1,0
1c009ade:	c202                	sw	zero,4(sp)
1c009ae0:	4901                	li	s2,0
1c009ae2:	a64ff06f          	j	1c008d46 <pos_libc_prf+0x29e>
1c009ae6:	04600e93          	li	t4,70
1c009aea:	06600d93          	li	s11,102
1c009aee:	b95d                	j	1c0097a4 <pos_libc_prf+0xcfc>
1c009af0:	105c                	addi	a5,sp,36
1c009af2:	4565                	li	a0,25
1c009af4:	0017c70b          	p.lbu	a4,1(a5!)
1c009af8:	f9f70693          	addi	a3,a4,-97
1c009afc:	0ff6f693          	andi	a3,a3,255
1c009b00:	fe070613          	addi	a2,a4,-32
1c009b04:	00d56e63          	bltu	a0,a3,1c009b20 <pos_libc_prf+0x1078>
1c009b08:	fec78fa3          	sb	a2,-1(a5)
1c009b0c:	0017c70b          	p.lbu	a4,1(a5!)
1c009b10:	f9f70693          	addi	a3,a4,-97
1c009b14:	0ff6f693          	andi	a3,a3,255
1c009b18:	fe070613          	addi	a2,a4,-32
1c009b1c:	fed576e3          	bleu	a3,a0,1c009b08 <pos_libc_prf+0x1060>
1c009b20:	fb71                	bnez	a4,1c009af4 <pos_libc_prf+0x104c>
1c009b22:	d48ff06f          	j	1c00906a <pos_libc_prf+0x5c2>
1c009b26:	4c92                	lw	s9,4(sp)
1c009b28:	02410a13          	addi	s4,sp,36
1c009b2c:	992ff06f          	j	1c008cbe <pos_libc_prf+0x216>
1c009b30:	4922                	lw	s2,8(sp)
1c009b32:	8dd2                	mv	s11,s4
1c009b34:	a029                	j	1c009b3e <pos_libc_prf+0x1096>
1c009b36:	9982                	jalr	s3
1c009b38:	1dfd                	addi	s11,s11,-1
1c009b3a:	8ff52263          	p.beqimm	a0,-1,1c008c1e <pos_libc_prf+0x176>
1c009b3e:	85de                	mv	a1,s7
1c009b40:	03000513          	li	a0,48
1c009b44:	ffb049e3          	bgtz	s11,1c009b36 <pos_libc_prf+0x108e>
1c009b48:	41490933          	sub	s2,s2,s4
1c009b4c:	a5cff06f          	j	1c008da8 <pos_libc_prf+0x300>
1c009b50:	4712                	lw	a4,4(sp)
1c009b52:	12070fe3          	beqz	a4,1c00a490 <pos_libc_prf+0x19e8>
1c009b56:	03000793          	li	a5,48
1c009b5a:	02f10223          	sb	a5,36(sp)
1c009b5e:	019467b3          	or	a5,s0,s9
1c009b62:	14078ae3          	beqz	a5,1c00a4b6 <pos_libc_prf+0x1a0e>
1c009b66:	02510593          	addi	a1,sp,37
1c009b6a:	4905                	li	s2,1
1c009b6c:	86ae                	mv	a3,a1
1c009b6e:	87b6                	mv	a5,a3
1c009b70:	a011                	j	1c009b74 <pos_libc_prf+0x10cc>
1c009b72:	87b2                	mv	a5,a2
1c009b74:	01dc9613          	slli	a2,s9,0x1d
1c009b78:	f8343733          	p.bclr	a4,s0,28,3
1c009b7c:	800d                	srli	s0,s0,0x3
1c009b7e:	8c51                	or	s0,s0,a2
1c009b80:	03070713          	addi	a4,a4,48
1c009b84:	003cdc93          	srli	s9,s9,0x3
1c009b88:	00e78023          	sb	a4,0(a5)
1c009b8c:	01946733          	or	a4,s0,s9
1c009b90:	00178613          	addi	a2,a5,1
1c009b94:	ff79                	bnez	a4,1c009b72 <pos_libc_prf+0x10ca>
1c009b96:	00060023          	sb	zero,0(a2)
1c009b9a:	8e0d                	sub	a2,a2,a1
1c009b9c:	00f6fc63          	bleu	a5,a3,1c009bb4 <pos_libc_prf+0x110c>
1c009ba0:	0006c583          	lbu	a1,0(a3)
1c009ba4:	0007c703          	lbu	a4,0(a5)
1c009ba8:	feb78fab          	p.sb	a1,-1(a5!)
1c009bac:	00e680ab          	p.sb	a4,1(a3!)
1c009bb0:	fef6e8e3          	bltu	a3,a5,1c009ba0 <pos_libc_prf+0x10f8>
1c009bb4:	9932                	add	s2,s2,a2
1c009bb6:	c202                	sw	zero,4(sp)
1c009bb8:	974ff06f          	j	1c008d2c <pos_libc_prf+0x284>
1c009bbc:	106057e3          	blez	t1,1c00a4ca <pos_libc_prf+0x1a22>
1c009bc0:	00279e93          	slli	t4,a5,0x2
1c009bc4:	01e7df93          	srli	t6,a5,0x1e
1c009bc8:	00269f13          	slli	t5,a3,0x2
1c009bcc:	00fe85b3          	add	a1,t4,a5
1c009bd0:	01efef33          	or	t5,t6,t5
1c009bd4:	9f36                	add	t5,t5,a3
1c009bd6:	01d5b6b3          	sltu	a3,a1,t4
1c009bda:	96fa                	add	a3,a3,t5
1c009bdc:	01f5d793          	srli	a5,a1,0x1f
1c009be0:	0686                	slli	a3,a3,0x1
1c009be2:	8edd                	or	a3,a3,a5
1c009be4:	01c6d793          	srli	a5,a3,0x1c
1c009be8:	03078793          	addi	a5,a5,48
1c009bec:	10000eb7          	lui	t4,0x10000
1c009bf0:	1efd                	addi	t4,t4,-1
1c009bf2:	00fe0023          	sb	a5,0(t3)
1c009bf6:	01d6f6b3          	and	a3,a3,t4
1c009bfa:	00159793          	slli	a5,a1,0x1
1c009bfe:	16132ee3          	p.beqimm	t1,1,1c00a57a <pos_libc_prf+0x1ad2>
1c009c02:	01e7df93          	srli	t6,a5,0x1e
1c009c06:	00269f13          	slli	t5,a3,0x2
1c009c0a:	058e                	slli	a1,a1,0x3
1c009c0c:	00f58533          	add	a0,a1,a5
1c009c10:	01efef33          	or	t5,t6,t5
1c009c14:	9f36                	add	t5,t5,a3
1c009c16:	00b536b3          	sltu	a3,a0,a1
1c009c1a:	96fa                	add	a3,a3,t5
1c009c1c:	01f55793          	srli	a5,a0,0x1f
1c009c20:	0686                	slli	a3,a3,0x1
1c009c22:	8edd                	or	a3,a3,a5
1c009c24:	01c6d793          	srli	a5,a3,0x1c
1c009c28:	03078793          	addi	a5,a5,48
1c009c2c:	00fe00a3          	sb	a5,1(t3)
1c009c30:	01d6f6b3          	and	a3,a3,t4
1c009c34:	00151793          	slli	a5,a0,0x1
1c009c38:	162323e3          	p.beqimm	t1,2,1c00a59e <pos_libc_prf+0x1af6>
1c009c3c:	01e7df93          	srli	t6,a5,0x1e
1c009c40:	00269f13          	slli	t5,a3,0x2
1c009c44:	050e                	slli	a0,a0,0x3
1c009c46:	00f505b3          	add	a1,a0,a5
1c009c4a:	01efef33          	or	t5,t6,t5
1c009c4e:	9f36                	add	t5,t5,a3
1c009c50:	00a5b6b3          	sltu	a3,a1,a0
1c009c54:	96fa                	add	a3,a3,t5
1c009c56:	01f5d793          	srli	a5,a1,0x1f
1c009c5a:	0686                	slli	a3,a3,0x1
1c009c5c:	8edd                	or	a3,a3,a5
1c009c5e:	01c6d793          	srli	a5,a3,0x1c
1c009c62:	03078793          	addi	a5,a5,48
1c009c66:	00fe0123          	sb	a5,2(t3)
1c009c6a:	ffd30a13          	addi	s4,t1,-3
1c009c6e:	00159793          	slli	a5,a1,0x1
1c009c72:	01d6f6b3          	and	a3,a3,t4
1c009c76:	134050e3          	blez	s4,1c00a596 <pos_libc_prf+0x1aee>
1c009c7a:	01e7df93          	srli	t6,a5,0x1e
1c009c7e:	00269f13          	slli	t5,a3,0x2
1c009c82:	058e                	slli	a1,a1,0x3
1c009c84:	00f58533          	add	a0,a1,a5
1c009c88:	01efef33          	or	t5,t6,t5
1c009c8c:	9f36                	add	t5,t5,a3
1c009c8e:	00b536b3          	sltu	a3,a0,a1
1c009c92:	96fa                	add	a3,a3,t5
1c009c94:	01f55793          	srli	a5,a0,0x1f
1c009c98:	0686                	slli	a3,a3,0x1
1c009c9a:	8edd                	or	a3,a3,a5
1c009c9c:	01c6d793          	srli	a5,a3,0x1c
1c009ca0:	03078793          	addi	a5,a5,48
1c009ca4:	00fe01a3          	sb	a5,3(t3)
1c009ca8:	ffc30a13          	addi	s4,t1,-4
1c009cac:	00151793          	slli	a5,a0,0x1
1c009cb0:	01d6f6b3          	and	a3,a3,t4
1c009cb4:	134056e3          	blez	s4,1c00a5e0 <pos_libc_prf+0x1b38>
1c009cb8:	01e7df93          	srli	t6,a5,0x1e
1c009cbc:	00269f13          	slli	t5,a3,0x2
1c009cc0:	050e                	slli	a0,a0,0x3
1c009cc2:	00f505b3          	add	a1,a0,a5
1c009cc6:	01efef33          	or	t5,t6,t5
1c009cca:	9f36                	add	t5,t5,a3
1c009ccc:	00a5b6b3          	sltu	a3,a1,a0
1c009cd0:	96fa                	add	a3,a3,t5
1c009cd2:	01f5d793          	srli	a5,a1,0x1f
1c009cd6:	0686                	slli	a3,a3,0x1
1c009cd8:	8edd                	or	a3,a3,a5
1c009cda:	01c6d793          	srli	a5,a3,0x1c
1c009cde:	03078793          	addi	a5,a5,48
1c009ce2:	00fe0223          	sb	a5,4(t3)
1c009ce6:	ffb30a13          	addi	s4,t1,-5
1c009cea:	00159793          	slli	a5,a1,0x1
1c009cee:	01d6f6b3          	and	a3,a3,t4
1c009cf2:	0f4053e3          	blez	s4,1c00a5d8 <pos_libc_prf+0x1b30>
1c009cf6:	01e7df93          	srli	t6,a5,0x1e
1c009cfa:	00269f13          	slli	t5,a3,0x2
1c009cfe:	058e                	slli	a1,a1,0x3
1c009d00:	00f58533          	add	a0,a1,a5
1c009d04:	01efef33          	or	t5,t6,t5
1c009d08:	9f36                	add	t5,t5,a3
1c009d0a:	00b536b3          	sltu	a3,a0,a1
1c009d0e:	96fa                	add	a3,a3,t5
1c009d10:	01f55793          	srli	a5,a0,0x1f
1c009d14:	0686                	slli	a3,a3,0x1
1c009d16:	8edd                	or	a3,a3,a5
1c009d18:	01c6d793          	srli	a5,a3,0x1c
1c009d1c:	03078793          	addi	a5,a5,48
1c009d20:	00fe02a3          	sb	a5,5(t3)
1c009d24:	ffa30a13          	addi	s4,t1,-6
1c009d28:	00151793          	slli	a5,a0,0x1
1c009d2c:	01d6f6b3          	and	a3,a3,t4
1c009d30:	0b4050e3          	blez	s4,1c00a5d0 <pos_libc_prf+0x1b28>
1c009d34:	01e7df93          	srli	t6,a5,0x1e
1c009d38:	00269f13          	slli	t5,a3,0x2
1c009d3c:	050e                	slli	a0,a0,0x3
1c009d3e:	00f505b3          	add	a1,a0,a5
1c009d42:	01efef33          	or	t5,t6,t5
1c009d46:	9f36                	add	t5,t5,a3
1c009d48:	00a5b6b3          	sltu	a3,a1,a0
1c009d4c:	96fa                	add	a3,a3,t5
1c009d4e:	01f5d793          	srli	a5,a1,0x1f
1c009d52:	0686                	slli	a3,a3,0x1
1c009d54:	8edd                	or	a3,a3,a5
1c009d56:	01c6d793          	srli	a5,a3,0x1c
1c009d5a:	03078793          	addi	a5,a5,48
1c009d5e:	00fe0323          	sb	a5,6(t3)
1c009d62:	ff930a13          	addi	s4,t1,-7
1c009d66:	00159793          	slli	a5,a1,0x1
1c009d6a:	01d6f6b3          	and	a3,a3,t4
1c009d6e:	05405de3          	blez	s4,1c00a5c8 <pos_libc_prf+0x1b20>
1c009d72:	058e                	slli	a1,a1,0x3
1c009d74:	01e7df13          	srli	t5,a5,0x1e
1c009d78:	00269513          	slli	a0,a3,0x2
1c009d7c:	97ae                	add	a5,a5,a1
1c009d7e:	00af6533          	or	a0,t5,a0
1c009d82:	9536                	add	a0,a0,a3
1c009d84:	00b7b6b3          	sltu	a3,a5,a1
1c009d88:	96aa                	add	a3,a3,a0
1c009d8a:	01f7d593          	srli	a1,a5,0x1f
1c009d8e:	0686                	slli	a3,a3,0x1
1c009d90:	8ecd                	or	a3,a3,a1
1c009d92:	01c6d593          	srli	a1,a3,0x1c
1c009d96:	03058593          	addi	a1,a1,48
1c009d9a:	0786                	slli	a5,a5,0x1
1c009d9c:	00be03a3          	sb	a1,7(t3)
1c009da0:	ff830a13          	addi	s4,t1,-8
1c009da4:	85be                	mv	a1,a5
1c009da6:	01d6f6b3          	and	a3,a3,t4
1c009daa:	01405be3          	blez	s4,1c00a5c0 <pos_libc_prf+0x1b18>
1c009dae:	078a                	slli	a5,a5,0x2
1c009db0:	01e5de93          	srli	t4,a1,0x1e
1c009db4:	00269513          	slli	a0,a3,0x2
1c009db8:	95be                	add	a1,a1,a5
1c009dba:	00aee533          	or	a0,t4,a0
1c009dbe:	9536                	add	a0,a0,a3
1c009dc0:	00f5b6b3          	sltu	a3,a1,a5
1c009dc4:	96aa                	add	a3,a3,a0
1c009dc6:	01f5d793          	srli	a5,a1,0x1f
1c009dca:	0686                	slli	a3,a3,0x1
1c009dcc:	8edd                	or	a3,a3,a5
1c009dce:	01c6d793          	srli	a5,a3,0x1c
1c009dd2:	03078793          	addi	a5,a5,48
1c009dd6:	10000eb7          	lui	t4,0x10000
1c009dda:	1efd                	addi	t4,t4,-1
1c009ddc:	00fe0423          	sb	a5,8(t3)
1c009de0:	ff730a13          	addi	s4,t1,-9
1c009de4:	00159793          	slli	a5,a1,0x1
1c009de8:	01d6f6b3          	and	a3,a3,t4
1c009dec:	7d405663          	blez	s4,1c00a5b8 <pos_libc_prf+0x1b10>
1c009df0:	01e7df93          	srli	t6,a5,0x1e
1c009df4:	00269f13          	slli	t5,a3,0x2
1c009df8:	058e                	slli	a1,a1,0x3
1c009dfa:	00f58533          	add	a0,a1,a5
1c009dfe:	01efef33          	or	t5,t6,t5
1c009e02:	9f36                	add	t5,t5,a3
1c009e04:	00b536b3          	sltu	a3,a0,a1
1c009e08:	96fa                	add	a3,a3,t5
1c009e0a:	01f55793          	srli	a5,a0,0x1f
1c009e0e:	0686                	slli	a3,a3,0x1
1c009e10:	8edd                	or	a3,a3,a5
1c009e12:	01c6d793          	srli	a5,a3,0x1c
1c009e16:	03078793          	addi	a5,a5,48
1c009e1a:	00fe04a3          	sb	a5,9(t3)
1c009e1e:	ff630a13          	addi	s4,t1,-10
1c009e22:	00151793          	slli	a5,a0,0x1
1c009e26:	01d6f6b3          	and	a3,a3,t4
1c009e2a:	79405363          	blez	s4,1c00a5b0 <pos_libc_prf+0x1b08>
1c009e2e:	01e7df93          	srli	t6,a5,0x1e
1c009e32:	00269f13          	slli	t5,a3,0x2
1c009e36:	050e                	slli	a0,a0,0x3
1c009e38:	00f505b3          	add	a1,a0,a5
1c009e3c:	01efef33          	or	t5,t6,t5
1c009e40:	9f36                	add	t5,t5,a3
1c009e42:	00a5b6b3          	sltu	a3,a1,a0
1c009e46:	96fa                	add	a3,a3,t5
1c009e48:	01f5d793          	srli	a5,a1,0x1f
1c009e4c:	0686                	slli	a3,a3,0x1
1c009e4e:	8edd                	or	a3,a3,a5
1c009e50:	01c6d793          	srli	a5,a3,0x1c
1c009e54:	03078793          	addi	a5,a5,48
1c009e58:	00fe0523          	sb	a5,10(t3)
1c009e5c:	ff530a13          	addi	s4,t1,-11
1c009e60:	00159793          	slli	a5,a1,0x1
1c009e64:	01d6f6b3          	and	a3,a3,t4
1c009e68:	75405063          	blez	s4,1c00a5a8 <pos_libc_prf+0x1b00>
1c009e6c:	01e7df93          	srli	t6,a5,0x1e
1c009e70:	00269f13          	slli	t5,a3,0x2
1c009e74:	058e                	slli	a1,a1,0x3
1c009e76:	00f58533          	add	a0,a1,a5
1c009e7a:	01efef33          	or	t5,t6,t5
1c009e7e:	9f36                	add	t5,t5,a3
1c009e80:	00b536b3          	sltu	a3,a0,a1
1c009e84:	96fa                	add	a3,a3,t5
1c009e86:	01f55793          	srli	a5,a0,0x1f
1c009e8a:	0686                	slli	a3,a3,0x1
1c009e8c:	8edd                	or	a3,a3,a5
1c009e8e:	01c6d793          	srli	a5,a3,0x1c
1c009e92:	03078793          	addi	a5,a5,48
1c009e96:	00fe05a3          	sb	a5,11(t3)
1c009e9a:	ff430a13          	addi	s4,t1,-12
1c009e9e:	00151793          	slli	a5,a0,0x1
1c009ea2:	01d6f6b3          	and	a3,a3,t4
1c009ea6:	6f405163          	blez	s4,1c00a588 <pos_libc_prf+0x1ae0>
1c009eaa:	050e                	slli	a0,a0,0x3
1c009eac:	01e7df13          	srli	t5,a5,0x1e
1c009eb0:	00269893          	slli	a7,a3,0x2
1c009eb4:	00f505b3          	add	a1,a0,a5
1c009eb8:	011f68b3          	or	a7,t5,a7
1c009ebc:	98b6                	add	a7,a7,a3
1c009ebe:	00a5b6b3          	sltu	a3,a1,a0
1c009ec2:	96c6                	add	a3,a3,a7
1c009ec4:	01f5d793          	srli	a5,a1,0x1f
1c009ec8:	0686                	slli	a3,a3,0x1
1c009eca:	8edd                	or	a3,a3,a5
1c009ecc:	01c6d793          	srli	a5,a3,0x1c
1c009ed0:	03078793          	addi	a5,a5,48
1c009ed4:	00fe0623          	sb	a5,12(t3)
1c009ed8:	ff330a13          	addi	s4,t1,-13
1c009edc:	00159793          	slli	a5,a1,0x1
1c009ee0:	01d6f6b3          	and	a3,a3,t4
1c009ee4:	00de0513          	addi	a0,t3,13
1c009ee8:	488d                	li	a7,3
1c009eea:	0d405163          	blez	s4,1c009fac <pos_libc_prf+0x1504>
1c009eee:	01e7df13          	srli	t5,a5,0x1e
1c009ef2:	00269893          	slli	a7,a3,0x2
1c009ef6:	058e                	slli	a1,a1,0x3
1c009ef8:	00f58533          	add	a0,a1,a5
1c009efc:	011f68b3          	or	a7,t5,a7
1c009f00:	98b6                	add	a7,a7,a3
1c009f02:	00b536b3          	sltu	a3,a0,a1
1c009f06:	96c6                	add	a3,a3,a7
1c009f08:	01f55793          	srli	a5,a0,0x1f
1c009f0c:	0686                	slli	a3,a3,0x1
1c009f0e:	8edd                	or	a3,a3,a5
1c009f10:	01c6d793          	srli	a5,a3,0x1c
1c009f14:	03078793          	addi	a5,a5,48
1c009f18:	00fe06a3          	sb	a5,13(t3)
1c009f1c:	ff230a13          	addi	s4,t1,-14
1c009f20:	00151793          	slli	a5,a0,0x1
1c009f24:	01d6f6b3          	and	a3,a3,t4
1c009f28:	65405c63          	blez	s4,1c00a580 <pos_libc_prf+0x1ad8>
1c009f2c:	050e                	slli	a0,a0,0x3
1c009f2e:	01e7df13          	srli	t5,a5,0x1e
1c009f32:	00269893          	slli	a7,a3,0x2
1c009f36:	00f505b3          	add	a1,a0,a5
1c009f3a:	011f68b3          	or	a7,t5,a7
1c009f3e:	98b6                	add	a7,a7,a3
1c009f40:	00a5b6b3          	sltu	a3,a1,a0
1c009f44:	96c6                	add	a3,a3,a7
1c009f46:	01f5d793          	srli	a5,a1,0x1f
1c009f4a:	0686                	slli	a3,a3,0x1
1c009f4c:	8edd                	or	a3,a3,a5
1c009f4e:	01c6d793          	srli	a5,a3,0x1c
1c009f52:	03078793          	addi	a5,a5,48
1c009f56:	00fe0723          	sb	a5,14(t3)
1c009f5a:	ff130a13          	addi	s4,t1,-15
1c009f5e:	00159793          	slli	a5,a1,0x1
1c009f62:	01d6f6b3          	and	a3,a3,t4
1c009f66:	00fe0513          	addi	a0,t3,15
1c009f6a:	4885                	li	a7,1
1c009f6c:	05405063          	blez	s4,1c009fac <pos_libc_prf+0x1504>
1c009f70:	01e7d893          	srli	a7,a5,0x1e
1c009f74:	058e                	slli	a1,a1,0x3
1c009f76:	00269513          	slli	a0,a3,0x2
1c009f7a:	97ae                	add	a5,a5,a1
1c009f7c:	00a8e533          	or	a0,a7,a0
1c009f80:	9536                	add	a0,a0,a3
1c009f82:	00b7b6b3          	sltu	a3,a5,a1
1c009f86:	96aa                	add	a3,a3,a0
1c009f88:	01f7d593          	srli	a1,a5,0x1f
1c009f8c:	0686                	slli	a3,a3,0x1
1c009f8e:	8ecd                	or	a3,a3,a1
1c009f90:	01c6d593          	srli	a1,a3,0x1c
1c009f94:	03058593          	addi	a1,a1,48
1c009f98:	010e0513          	addi	a0,t3,16
1c009f9c:	0786                	slli	a5,a5,0x1
1c009f9e:	01d6f6b3          	and	a3,a3,t4
1c009fa2:	00be07a3          	sb	a1,15(t3)
1c009fa6:	ff030a13          	addi	s4,t1,-16
1c009faa:	4881                	li	a7,0
1c009fac:	4712                	lw	a4,4(sp)
1c009fae:	4e070663          	beqz	a4,1c00a49a <pos_libc_prf+0x19f2>
1c009fb2:	02e00313          	li	t1,46
1c009fb6:	00650023          	sb	t1,0(a0)
1c009fba:	8e26                	mv	t3,s1
1c009fbc:	cc02                	sw	zero,24(sp)
1c009fbe:	00150593          	addi	a1,a0,1
1c009fc2:	4301                	li	t1,0
1c009fc4:	63c05263          	blez	t3,1c00a5e8 <pos_libc_prf+0x1b40>
1c009fc8:	62088063          	beqz	a7,1c00a5e8 <pos_libc_prf+0x1b40>
1c009fcc:	00279513          	slli	a0,a5,0x2
1c009fd0:	01e7df13          	srli	t5,a5,0x1e
1c009fd4:	00269e93          	slli	t4,a3,0x2
1c009fd8:	97aa                	add	a5,a5,a0
1c009fda:	01df6eb3          	or	t4,t5,t4
1c009fde:	96f6                	add	a3,a3,t4
1c009fe0:	00a7bf33          	sltu	t5,a5,a0
1c009fe4:	9f36                	add	t5,t5,a3
1c009fe6:	0f06                	slli	t5,t5,0x1
1c009fe8:	01f7d693          	srli	a3,a5,0x1f
1c009fec:	01e6ef33          	or	t5,a3,t5
1c009ff0:	01cf5693          	srli	a3,t5,0x1c
1c009ff4:	03068693          	addi	a3,a3,48
1c009ff8:	00d58023          	sb	a3,0(a1)
1c009ffc:	fffe0493          	addi	s1,t3,-1
1c00a000:	00158513          	addi	a0,a1,1
1c00a004:	00179693          	slli	a3,a5,0x1
1c00a008:	42048263          	beqz	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a00c:	4218a063          	p.beqimm	a7,1,1c00a42c <pos_libc_prf+0x1984>
1c00a010:	10000eb7          	lui	t4,0x10000
1c00a014:	1efd                	addi	t4,t4,-1
1c00a016:	01df7f33          	and	t5,t5,t4
1c00a01a:	078e                	slli	a5,a5,0x3
1c00a01c:	01e6df93          	srli	t6,a3,0x1e
1c00a020:	002f1513          	slli	a0,t5,0x2
1c00a024:	96be                	add	a3,a3,a5
1c00a026:	00afe533          	or	a0,t6,a0
1c00a02a:	9f2a                	add	t5,t5,a0
1c00a02c:	00f6b7b3          	sltu	a5,a3,a5
1c00a030:	97fa                	add	a5,a5,t5
1c00a032:	01f6d513          	srli	a0,a3,0x1f
1c00a036:	0786                	slli	a5,a5,0x1
1c00a038:	8fc9                	or	a5,a5,a0
1c00a03a:	01c7d513          	srli	a0,a5,0x1c
1c00a03e:	03050513          	addi	a0,a0,48
1c00a042:	00a580a3          	sb	a0,1(a1)
1c00a046:	ffee0493          	addi	s1,t3,-2
1c00a04a:	00258513          	addi	a0,a1,2
1c00a04e:	00169f13          	slli	t5,a3,0x1
1c00a052:	01d7f7b3          	and	a5,a5,t4
1c00a056:	3c048b63          	beqz	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a05a:	3c28a963          	p.beqimm	a7,2,1c00a42c <pos_libc_prf+0x1984>
1c00a05e:	01ef5f93          	srli	t6,t5,0x1e
1c00a062:	068e                	slli	a3,a3,0x3
1c00a064:	00279513          	slli	a0,a5,0x2
1c00a068:	9f36                	add	t5,t5,a3
1c00a06a:	00afe533          	or	a0,t6,a0
1c00a06e:	00df36b3          	sltu	a3,t5,a3
1c00a072:	97aa                	add	a5,a5,a0
1c00a074:	97b6                	add	a5,a5,a3
1c00a076:	0786                	slli	a5,a5,0x1
1c00a078:	01ff5693          	srli	a3,t5,0x1f
1c00a07c:	8fd5                	or	a5,a5,a3
1c00a07e:	01c7d693          	srli	a3,a5,0x1c
1c00a082:	03068693          	addi	a3,a3,48
1c00a086:	00d58123          	sb	a3,2(a1)
1c00a08a:	ffde0493          	addi	s1,t3,-3
1c00a08e:	00358513          	addi	a0,a1,3
1c00a092:	001f1693          	slli	a3,t5,0x1
1c00a096:	01d7ffb3          	and	t6,a5,t4
1c00a09a:	38905963          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a09e:	3838a763          	p.beqimm	a7,3,1c00a42c <pos_libc_prf+0x1984>
1c00a0a2:	003f1513          	slli	a0,t5,0x3
1c00a0a6:	01e6d793          	srli	a5,a3,0x1e
1c00a0aa:	002f9f13          	slli	t5,t6,0x2
1c00a0ae:	96aa                	add	a3,a3,a0
1c00a0b0:	01e7ef33          	or	t5,a5,t5
1c00a0b4:	9f7e                	add	t5,t5,t6
1c00a0b6:	00a6b7b3          	sltu	a5,a3,a0
1c00a0ba:	97fa                	add	a5,a5,t5
1c00a0bc:	01f6d513          	srli	a0,a3,0x1f
1c00a0c0:	0786                	slli	a5,a5,0x1
1c00a0c2:	8fc9                	or	a5,a5,a0
1c00a0c4:	01c7d513          	srli	a0,a5,0x1c
1c00a0c8:	03050513          	addi	a0,a0,48
1c00a0cc:	00a581a3          	sb	a0,3(a1)
1c00a0d0:	ffce0493          	addi	s1,t3,-4
1c00a0d4:	00458513          	addi	a0,a1,4
1c00a0d8:	00169f13          	slli	t5,a3,0x1
1c00a0dc:	01d7feb3          	and	t4,a5,t4
1c00a0e0:	34905663          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a0e4:	3448a463          	p.beqimm	a7,4,1c00a42c <pos_libc_prf+0x1984>
1c00a0e8:	068e                	slli	a3,a3,0x3
1c00a0ea:	01ef5793          	srli	a5,t5,0x1e
1c00a0ee:	002e9513          	slli	a0,t4,0x2
1c00a0f2:	9f36                	add	t5,t5,a3
1c00a0f4:	8d5d                	or	a0,a0,a5
1c00a0f6:	9eaa                	add	t4,t4,a0
1c00a0f8:	00df37b3          	sltu	a5,t5,a3
1c00a0fc:	97f6                	add	a5,a5,t4
1c00a0fe:	01ff5693          	srli	a3,t5,0x1f
1c00a102:	0786                	slli	a5,a5,0x1
1c00a104:	8fd5                	or	a5,a5,a3
1c00a106:	01c7d693          	srli	a3,a5,0x1c
1c00a10a:	03068693          	addi	a3,a3,48
1c00a10e:	00d58223          	sb	a3,4(a1)
1c00a112:	ffbe0493          	addi	s1,t3,-5
1c00a116:	00558513          	addi	a0,a1,5
1c00a11a:	001f1693          	slli	a3,t5,0x1
1c00a11e:	30905763          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a122:	3058a563          	p.beqimm	a7,5,1c00a42c <pos_libc_prf+0x1984>
1c00a126:	10000eb7          	lui	t4,0x10000
1c00a12a:	1efd                	addi	t4,t4,-1
1c00a12c:	01d7f7b3          	and	a5,a5,t4
1c00a130:	01e6df13          	srli	t5,a3,0x1e
1c00a134:	00269513          	slli	a0,a3,0x2
1c00a138:	00279f93          	slli	t6,a5,0x2
1c00a13c:	96aa                	add	a3,a3,a0
1c00a13e:	01ff6fb3          	or	t6,t5,t6
1c00a142:	00a6b533          	sltu	a0,a3,a0
1c00a146:	97fe                	add	a5,a5,t6
1c00a148:	97aa                	add	a5,a5,a0
1c00a14a:	00179f13          	slli	t5,a5,0x1
1c00a14e:	01f6d513          	srli	a0,a3,0x1f
1c00a152:	01e56f33          	or	t5,a0,t5
1c00a156:	01cf5793          	srli	a5,t5,0x1c
1c00a15a:	03078793          	addi	a5,a5,48
1c00a15e:	00f582a3          	sb	a5,5(a1)
1c00a162:	ffae0493          	addi	s1,t3,-6
1c00a166:	00658513          	addi	a0,a1,6
1c00a16a:	00169793          	slli	a5,a3,0x1
1c00a16e:	01df7f33          	and	t5,t5,t4
1c00a172:	2a905d63          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a176:	2a68ab63          	p.beqimm	a7,6,1c00a42c <pos_libc_prf+0x1984>
1c00a17a:	068e                	slli	a3,a3,0x3
1c00a17c:	01e7df93          	srli	t6,a5,0x1e
1c00a180:	002f1513          	slli	a0,t5,0x2
1c00a184:	97b6                	add	a5,a5,a3
1c00a186:	00afe533          	or	a0,t6,a0
1c00a18a:	9f2a                	add	t5,t5,a0
1c00a18c:	00d7b6b3          	sltu	a3,a5,a3
1c00a190:	96fa                	add	a3,a3,t5
1c00a192:	01f7d513          	srli	a0,a5,0x1f
1c00a196:	00169f13          	slli	t5,a3,0x1
1c00a19a:	01e56f33          	or	t5,a0,t5
1c00a19e:	01cf5693          	srli	a3,t5,0x1c
1c00a1a2:	03068693          	addi	a3,a3,48
1c00a1a6:	00d58323          	sb	a3,6(a1)
1c00a1aa:	ff9e0493          	addi	s1,t3,-7
1c00a1ae:	00758513          	addi	a0,a1,7
1c00a1b2:	00179693          	slli	a3,a5,0x1
1c00a1b6:	01df7f33          	and	t5,t5,t4
1c00a1ba:	26905963          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a1be:	2678a763          	p.beqimm	a7,7,1c00a42c <pos_libc_prf+0x1984>
1c00a1c2:	078e                	slli	a5,a5,0x3
1c00a1c4:	01e6df93          	srli	t6,a3,0x1e
1c00a1c8:	002f1513          	slli	a0,t5,0x2
1c00a1cc:	96be                	add	a3,a3,a5
1c00a1ce:	00afe533          	or	a0,t6,a0
1c00a1d2:	9f2a                	add	t5,t5,a0
1c00a1d4:	00f6b7b3          	sltu	a5,a3,a5
1c00a1d8:	97fa                	add	a5,a5,t5
1c00a1da:	01f6d513          	srli	a0,a3,0x1f
1c00a1de:	00179f13          	slli	t5,a5,0x1
1c00a1e2:	01e56f33          	or	t5,a0,t5
1c00a1e6:	01cf5793          	srli	a5,t5,0x1c
1c00a1ea:	03078793          	addi	a5,a5,48
1c00a1ee:	00f583a3          	sb	a5,7(a1)
1c00a1f2:	ff8e0493          	addi	s1,t3,-8
1c00a1f6:	00858513          	addi	a0,a1,8
1c00a1fa:	00169793          	slli	a5,a3,0x1
1c00a1fe:	01df7f33          	and	t5,t5,t4
1c00a202:	22905563          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a206:	2288a363          	p.beqimm	a7,8,1c00a42c <pos_libc_prf+0x1984>
1c00a20a:	01e7df93          	srli	t6,a5,0x1e
1c00a20e:	068e                	slli	a3,a3,0x3
1c00a210:	002f1513          	slli	a0,t5,0x2
1c00a214:	97b6                	add	a5,a5,a3
1c00a216:	00afe533          	or	a0,t6,a0
1c00a21a:	9f2a                	add	t5,t5,a0
1c00a21c:	00d7b6b3          	sltu	a3,a5,a3
1c00a220:	96fa                	add	a3,a3,t5
1c00a222:	01f7d513          	srli	a0,a5,0x1f
1c00a226:	0686                	slli	a3,a3,0x1
1c00a228:	8ec9                	or	a3,a3,a0
1c00a22a:	01c6d513          	srli	a0,a3,0x1c
1c00a22e:	03050513          	addi	a0,a0,48
1c00a232:	00a58423          	sb	a0,8(a1)
1c00a236:	ff7e0493          	addi	s1,t3,-9
1c00a23a:	00958513          	addi	a0,a1,9
1c00a23e:	00179f93          	slli	t6,a5,0x1
1c00a242:	01d6ff33          	and	t5,a3,t4
1c00a246:	1e905363          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a24a:	1e98a163          	p.beqimm	a7,9,1c00a42c <pos_libc_prf+0x1984>
1c00a24e:	078e                	slli	a5,a5,0x3
1c00a250:	01efd293          	srli	t0,t6,0x1e
1c00a254:	002f1513          	slli	a0,t5,0x2
1c00a258:	01f786b3          	add	a3,a5,t6
1c00a25c:	00a2e533          	or	a0,t0,a0
1c00a260:	00f6b7b3          	sltu	a5,a3,a5
1c00a264:	957a                	add	a0,a0,t5
1c00a266:	97aa                	add	a5,a5,a0
1c00a268:	0786                	slli	a5,a5,0x1
1c00a26a:	01f6d513          	srli	a0,a3,0x1f
1c00a26e:	8fc9                	or	a5,a5,a0
1c00a270:	01c7d513          	srli	a0,a5,0x1c
1c00a274:	03050513          	addi	a0,a0,48
1c00a278:	00a584a3          	sb	a0,9(a1)
1c00a27c:	ff6e0493          	addi	s1,t3,-10
1c00a280:	00a58513          	addi	a0,a1,10
1c00a284:	0686                	slli	a3,a3,0x1
1c00a286:	01d7f7b3          	and	a5,a5,t4
1c00a28a:	1a905163          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a28e:	18a8af63          	p.beqimm	a7,10,1c00a42c <pos_libc_prf+0x1984>
1c00a292:	01e6df13          	srli	t5,a3,0x1e
1c00a296:	00269513          	slli	a0,a3,0x2
1c00a29a:	00279e93          	slli	t4,a5,0x2
1c00a29e:	96aa                	add	a3,a3,a0
1c00a2a0:	01df6eb3          	or	t4,t5,t4
1c00a2a4:	00a6b533          	sltu	a0,a3,a0
1c00a2a8:	97f6                	add	a5,a5,t4
1c00a2aa:	97aa                	add	a5,a5,a0
1c00a2ac:	00179f13          	slli	t5,a5,0x1
1c00a2b0:	01f6d513          	srli	a0,a3,0x1f
1c00a2b4:	01e56f33          	or	t5,a0,t5
1c00a2b8:	01cf5793          	srli	a5,t5,0x1c
1c00a2bc:	03078793          	addi	a5,a5,48
1c00a2c0:	10000eb7          	lui	t4,0x10000
1c00a2c4:	1efd                	addi	t4,t4,-1
1c00a2c6:	00f58523          	sb	a5,10(a1)
1c00a2ca:	ff5e0493          	addi	s1,t3,-11
1c00a2ce:	00b58513          	addi	a0,a1,11
1c00a2d2:	00169793          	slli	a5,a3,0x1
1c00a2d6:	01df7f33          	and	t5,t5,t4
1c00a2da:	14905963          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a2de:	14b8a763          	p.beqimm	a7,11,1c00a42c <pos_libc_prf+0x1984>
1c00a2e2:	068e                	slli	a3,a3,0x3
1c00a2e4:	01e7df93          	srli	t6,a5,0x1e
1c00a2e8:	002f1513          	slli	a0,t5,0x2
1c00a2ec:	97b6                	add	a5,a5,a3
1c00a2ee:	00afe533          	or	a0,t6,a0
1c00a2f2:	9f2a                	add	t5,t5,a0
1c00a2f4:	00d7b6b3          	sltu	a3,a5,a3
1c00a2f8:	96fa                	add	a3,a3,t5
1c00a2fa:	01f7d513          	srli	a0,a5,0x1f
1c00a2fe:	0686                	slli	a3,a3,0x1
1c00a300:	8ec9                	or	a3,a3,a0
1c00a302:	01c6d513          	srli	a0,a3,0x1c
1c00a306:	03050513          	addi	a0,a0,48
1c00a30a:	00a585a3          	sb	a0,11(a1)
1c00a30e:	ff4e0493          	addi	s1,t3,-12
1c00a312:	00c58513          	addi	a0,a1,12
1c00a316:	00179f13          	slli	t5,a5,0x1
1c00a31a:	10905963          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a31e:	10c8a763          	p.beqimm	a7,12,1c00a42c <pos_libc_prf+0x1984>
1c00a322:	01d6f6b3          	and	a3,a3,t4
1c00a326:	01ef5f93          	srli	t6,t5,0x1e
1c00a32a:	078e                	slli	a5,a5,0x3
1c00a32c:	00269513          	slli	a0,a3,0x2
1c00a330:	9f3e                	add	t5,t5,a5
1c00a332:	00afe533          	or	a0,t6,a0
1c00a336:	96aa                	add	a3,a3,a0
1c00a338:	00ff37b3          	sltu	a5,t5,a5
1c00a33c:	97b6                	add	a5,a5,a3
1c00a33e:	01ff5513          	srli	a0,t5,0x1f
1c00a342:	00179693          	slli	a3,a5,0x1
1c00a346:	8ec9                	or	a3,a3,a0
1c00a348:	01c6d793          	srli	a5,a3,0x1c
1c00a34c:	03078793          	addi	a5,a5,48
1c00a350:	00f58623          	sb	a5,12(a1)
1c00a354:	ff3e0493          	addi	s1,t3,-13
1c00a358:	00d58513          	addi	a0,a1,13
1c00a35c:	001f1793          	slli	a5,t5,0x1
1c00a360:	01d6ffb3          	and	t6,a3,t4
1c00a364:	0c905463          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a368:	0cd8a263          	p.beqimm	a7,13,1c00a42c <pos_libc_prf+0x1984>
1c00a36c:	003f1693          	slli	a3,t5,0x3
1c00a370:	002f9513          	slli	a0,t6,0x2
1c00a374:	01e7df13          	srli	t5,a5,0x1e
1c00a378:	00af6533          	or	a0,t5,a0
1c00a37c:	97b6                	add	a5,a5,a3
1c00a37e:	957e                	add	a0,a0,t6
1c00a380:	00d7b6b3          	sltu	a3,a5,a3
1c00a384:	96aa                	add	a3,a3,a0
1c00a386:	0686                	slli	a3,a3,0x1
1c00a388:	01f7d513          	srli	a0,a5,0x1f
1c00a38c:	8ec9                	or	a3,a3,a0
1c00a38e:	01c6d513          	srli	a0,a3,0x1c
1c00a392:	03050513          	addi	a0,a0,48
1c00a396:	00a586a3          	sb	a0,13(a1)
1c00a39a:	ff2e0493          	addi	s1,t3,-14
1c00a39e:	00e58513          	addi	a0,a1,14
1c00a3a2:	00179f93          	slli	t6,a5,0x1
1c00a3a6:	01d6ff33          	and	t5,a3,t4
1c00a3aa:	08905163          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a3ae:	06e8af63          	p.beqimm	a7,14,1c00a42c <pos_libc_prf+0x1984>
1c00a3b2:	078e                	slli	a5,a5,0x3
1c00a3b4:	002f1513          	slli	a0,t5,0x2
1c00a3b8:	01efd293          	srli	t0,t6,0x1e
1c00a3bc:	01f786b3          	add	a3,a5,t6
1c00a3c0:	00a2e533          	or	a0,t0,a0
1c00a3c4:	957a                	add	a0,a0,t5
1c00a3c6:	00f6b7b3          	sltu	a5,a3,a5
1c00a3ca:	97aa                	add	a5,a5,a0
1c00a3cc:	00179f13          	slli	t5,a5,0x1
1c00a3d0:	01f6d513          	srli	a0,a3,0x1f
1c00a3d4:	01e56f33          	or	t5,a0,t5
1c00a3d8:	01cf5793          	srli	a5,t5,0x1c
1c00a3dc:	03078793          	addi	a5,a5,48
1c00a3e0:	00f58723          	sb	a5,14(a1)
1c00a3e4:	ff1e0493          	addi	s1,t3,-15
1c00a3e8:	00f58513          	addi	a0,a1,15
1c00a3ec:	00169793          	slli	a5,a3,0x1
1c00a3f0:	01df7eb3          	and	t4,t5,t4
1c00a3f4:	02905c63          	blez	s1,1c00a42c <pos_libc_prf+0x1984>
1c00a3f8:	46c1                	li	a3,16
1c00a3fa:	02d89963          	bne	a7,a3,1c00a42c <pos_libc_prf+0x1984>
1c00a3fe:	00279513          	slli	a0,a5,0x2
1c00a402:	01e7d893          	srli	a7,a5,0x1e
1c00a406:	002e9693          	slli	a3,t4,0x2
1c00a40a:	97aa                	add	a5,a5,a0
1c00a40c:	00d8e6b3          	or	a3,a7,a3
1c00a410:	00a7b7b3          	sltu	a5,a5,a0
1c00a414:	9eb6                	add	t4,t4,a3
1c00a416:	97f6                	add	a5,a5,t4
1c00a418:	0786                	slli	a5,a5,0x1
1c00a41a:	83f1                	srli	a5,a5,0x1c
1c00a41c:	03078793          	addi	a5,a5,48
1c00a420:	01058513          	addi	a0,a1,16
1c00a424:	00f587a3          	sb	a5,15(a1)
1c00a428:	ff0e0493          	addi	s1,t3,-16
1c00a42c:	47e2                	lw	a5,24(sp)
1c00a42e:	014785b3          	add	a1,a5,s4
1c00a432:	9c081663          	bnez	a6,1c0095fe <pos_libc_prf+0xb56>
1c00a436:	95a6                	add	a1,a1,s1
1c00a438:	8ca6                	mv	s9,s1
1c00a43a:	9f0ff06f          	j	1c00962a <pos_libc_prf+0xb82>
1c00a43e:	02d00793          	li	a5,45
1c00a442:	40600333          	neg	t1,t1
1c00a446:	00f500a3          	sb	a5,1(a0)
1c00a44a:	db4ff06f          	j	1c0099fe <pos_libc_prf+0xf56>
1c00a44e:	41fad793          	srai	a5,s5,0x1f
1c00a452:	0156a023          	sw	s5,0(a3)
1c00a456:	c2dc                	sw	a5,4(a3)
1c00a458:	e8efe06f          	j	1c008ae6 <pos_libc_prf+0x3e>
1c00a45c:	4a62                	lw	s4,24(sp)
1c00a45e:	a039                	j	1c00a46c <pos_libc_prf+0x19c4>
1c00a460:	9982                	jalr	s3
1c00a462:	1a7d                	addi	s4,s4,-1
1c00a464:	01f53463          	p.bneimm	a0,-1,1c00a46c <pos_libc_prf+0x19c4>
1c00a468:	fb6fe06f          	j	1c008c1e <pos_libc_prf+0x176>
1c00a46c:	85de                	mv	a1,s7
1c00a46e:	03000513          	li	a0,48
1c00a472:	ff4047e3          	bgtz	s4,1c00a460 <pos_libc_prf+0x19b8>
1c00a476:	4762                	lw	a4,24(sp)
1c00a478:	40e90933          	sub	s2,s2,a4
1c00a47c:	933fe06f          	j	1c008dae <pos_libc_prf+0x306>
1c00a480:	4741                	li	a4,16
1c00a482:	04e4ceb3          	p.min	t4,s1,a4
1c00a486:	1efd                	addi	t4,t4,-1
1c00a488:	84be                	mv	s1,a5
1c00a48a:	4801                	li	a6,0
1c00a48c:	c63fe06f          	j	1c0090ee <pos_libc_prf+0x646>
1c00a490:	104c                	addi	a1,sp,36
1c00a492:	4901                	li	s2,0
1c00a494:	86ae                	mv	a3,a1
1c00a496:	ed8ff06f          	j	1c009b6e <pos_libc_prf+0x10c6>
1c00a49a:	0c904463          	bgtz	s1,1c00a562 <pos_libc_prf+0x1aba>
1c00a49e:	4301                	li	t1,0
1c00a4a0:	cc02                	sw	zero,24(sp)
1c00a4a2:	b769                	j	1c00a42c <pos_libc_prf+0x1984>
1c00a4a4:	4712                	lw	a4,4(sp)
1c00a4a6:	4801                	li	a6,0
1c00a4a8:	e319                	bnez	a4,1c00a4ae <pos_libc_prf+0x1a06>
1c00a4aa:	c39fe06f          	j	1c0090e2 <pos_libc_prf+0x63a>
1c00a4ae:	4e81                	li	t4,0
1c00a4b0:	4801                	li	a6,0
1c00a4b2:	c3dfe06f          	j	1c0090ee <pos_libc_prf+0x646>
1c00a4b6:	020102a3          	sb	zero,37(sp)
1c00a4ba:	c202                	sw	zero,4(sp)
1c00a4bc:	4905                	li	s2,1
1c00a4be:	86ffe06f          	j	1c008d2c <pos_libc_prf+0x284>
1c00a4c2:	06600d93          	li	s11,102
1c00a4c6:	d1cff06f          	j	1c0099e2 <pos_libc_prf+0xf3a>
1c00a4ca:	4712                	lw	a4,4(sp)
1c00a4cc:	03000593          	li	a1,48
1c00a4d0:	00be0023          	sb	a1,0(t3)
1c00a4d4:	e335                	bnez	a4,1c00a538 <pos_libc_prf+0x1a90>
1c00a4d6:	06905b63          	blez	s1,1c00a54c <pos_libc_prf+0x1aa4>
1c00a4da:	02e00593          	li	a1,46
1c00a4de:	00be00a3          	sb	a1,1(t3)
1c00a4e2:	002e0513          	addi	a0,t3,2
1c00a4e6:	48c1                	li	a7,16
1c00a4e8:	08030363          	beqz	t1,1c00a56e <pos_libc_prf+0x1ac6>
1c00a4ec:	40600733          	neg	a4,t1
1c00a4f0:	04974733          	p.min	a4,a4,s1
1c00a4f4:	cc3a                	sw	a4,24(sp)
1c00a4f6:	40e48e33          	sub	t3,s1,a4
1c00a4fa:	85aa                	mv	a1,a0
1c00a4fc:	4a01                	li	s4,0
1c00a4fe:	48c1                	li	a7,16
1c00a500:	adc044e3          	bgtz	t3,1c009fc8 <pos_libc_prf+0x1520>
1c00a504:	a0d5                	j	1c00a5e8 <pos_libc_prf+0x1b40>
1c00a506:	4a72                	lw	s4,28(sp)
1c00a508:	ddefe06f          	j	1c008ae6 <pos_libc_prf+0x3e>
1c00a50c:	6799                	lui	a5,0x6
1c00a50e:	16e78793          	addi	a5,a5,366 # 616e <pos_soc_event_callback+0x5d36>
1c00a512:	00fe1023          	sh	a5,0(t3)
1c00a516:	06e00793          	li	a5,110
1c00a51a:	00fe0123          	sb	a5,2(t3)
1c00a51e:	c38ff06f          	j	1c009956 <pos_libc_prf+0xeae>
1c00a522:	679d                	lui	a5,0x7
1c00a524:	e6978793          	addi	a5,a5,-407 # 6e69 <pos_soc_event_callback+0x6a31>
1c00a528:	00fe1023          	sh	a5,0(t3)
1c00a52c:	06600793          	li	a5,102
1c00a530:	00fe0123          	sb	a5,2(t3)
1c00a534:	c22ff06f          	j	1c009956 <pos_libc_prf+0xeae>
1c00a538:	02e00593          	li	a1,46
1c00a53c:	00be00a3          	sb	a1,1(t3)
1c00a540:	002e0513          	addi	a0,t3,2
1c00a544:	00030763          	beqz	t1,1c00a552 <pos_libc_prf+0x1aaa>
1c00a548:	fa9042e3          	bgtz	s1,1c00a4ec <pos_libc_prf+0x1a44>
1c00a54c:	4a01                	li	s4,0
1c00a54e:	cc02                	sw	zero,24(sp)
1c00a550:	bdf1                	j	1c00a42c <pos_libc_prf+0x1984>
1c00a552:	fe905de3          	blez	s1,1c00a54c <pos_libc_prf+0x1aa4>
1c00a556:	85aa                	mv	a1,a0
1c00a558:	4a01                	li	s4,0
1c00a55a:	cc02                	sw	zero,24(sp)
1c00a55c:	8e26                	mv	t3,s1
1c00a55e:	48c1                	li	a7,16
1c00a560:	b4b5                	j	1c009fcc <pos_libc_prf+0x1524>
1c00a562:	02e00593          	li	a1,46
1c00a566:	00b50023          	sb	a1,0(a0)
1c00a56a:	8352                	mv	t1,s4
1c00a56c:	0505                	addi	a0,a0,1
1c00a56e:	8a1a                	mv	s4,t1
1c00a570:	85aa                	mv	a1,a0
1c00a572:	8e26                	mv	t3,s1
1c00a574:	cc02                	sw	zero,24(sp)
1c00a576:	4301                	li	t1,0
1c00a578:	bc81                	j	1c009fc8 <pos_libc_prf+0x1520>
1c00a57a:	4a01                	li	s4,0
1c00a57c:	48bd                	li	a7,15
1c00a57e:	b43d                	j	1c009fac <pos_libc_prf+0x1504>
1c00a580:	00ee0513          	addi	a0,t3,14
1c00a584:	4889                	li	a7,2
1c00a586:	b41d                	j	1c009fac <pos_libc_prf+0x1504>
1c00a588:	00ce0513          	addi	a0,t3,12
1c00a58c:	b405                	j	1c009fac <pos_libc_prf+0x1504>
1c00a58e:	c0200893          	li	a7,-1022
1c00a592:	a5cff06f          	j	1c0097ee <pos_libc_prf+0xd46>
1c00a596:	003e0513          	addi	a0,t3,3
1c00a59a:	48b5                	li	a7,13
1c00a59c:	bc01                	j	1c009fac <pos_libc_prf+0x1504>
1c00a59e:	002e0513          	addi	a0,t3,2
1c00a5a2:	4a01                	li	s4,0
1c00a5a4:	48b9                	li	a7,14
1c00a5a6:	b419                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5a8:	00be0513          	addi	a0,t3,11
1c00a5ac:	4895                	li	a7,5
1c00a5ae:	bafd                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5b0:	00ae0513          	addi	a0,t3,10
1c00a5b4:	4899                	li	a7,6
1c00a5b6:	badd                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5b8:	009e0513          	addi	a0,t3,9
1c00a5bc:	489d                	li	a7,7
1c00a5be:	b2fd                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5c0:	008e0513          	addi	a0,t3,8
1c00a5c4:	48a1                	li	a7,8
1c00a5c6:	b2dd                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5c8:	007e0513          	addi	a0,t3,7
1c00a5cc:	48a5                	li	a7,9
1c00a5ce:	baf9                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5d0:	006e0513          	addi	a0,t3,6
1c00a5d4:	48a9                	li	a7,10
1c00a5d6:	bad9                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5d8:	005e0513          	addi	a0,t3,5
1c00a5dc:	48ad                	li	a7,11
1c00a5de:	b2f9                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5e0:	004e0513          	addi	a0,t3,4
1c00a5e4:	48b1                	li	a7,12
1c00a5e6:	b2d9                	j	1c009fac <pos_libc_prf+0x1504>
1c00a5e8:	84f2                	mv	s1,t3
1c00a5ea:	852e                	mv	a0,a1
1c00a5ec:	b581                	j	1c00a42c <pos_libc_prf+0x1984>
1c00a5ee:	41990933          	sub	s2,s2,s9
1c00a5f2:	8edfe06f          	j	1c008ede <pos_libc_prf+0x436>
1c00a5f6:	00d78513          	addi	a0,a5,13
1c00a5fa:	ffbfe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a5fe:	00c78513          	addi	a0,a5,12
1c00a602:	ff3fe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a606:	00b78513          	addi	a0,a5,11
1c00a60a:	febfe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a60e:	00978513          	addi	a0,a5,9
1c00a612:	fe3fe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a616:	00878513          	addi	a0,a5,8
1c00a61a:	fdbfe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a61e:	00778513          	addi	a0,a5,7
1c00a622:	fd3fe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a626:	00678513          	addi	a0,a5,6
1c00a62a:	fcbfe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a62e:	00578513          	addi	a0,a5,5
1c00a632:	fc3fe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a636:	00478513          	addi	a0,a5,4
1c00a63a:	fbbfe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a63e:	00378513          	addi	a0,a5,3
1c00a642:	fb3fe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a646:	00278513          	addi	a0,a5,2
1c00a64a:	fabfe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>
1c00a64e:	00178513          	addi	a0,a5,1
1c00a652:	4c81                	li	s9,0
1c00a654:	fa1fe06f          	j	1c0095f4 <pos_libc_prf+0xb4c>

1c00a658 <pos_init_start>:
1c00a658:	1141                	addi	sp,sp,-16
1c00a65a:	c422                	sw	s0,8(sp)
1c00a65c:	1c001437          	lui	s0,0x1c001
1c00a660:	c606                	sw	ra,12(sp)
1c00a662:	83c40413          	addi	s0,s0,-1988 # 1c00083c <ctor_list>
1c00a666:	244d                	jal	1c00a908 <pos_irq_init>
1c00a668:	b72fe0ef          	jal	ra,1c0089da <pos_soc_init>
1c00a66c:	2c5d                	jal	1c00a922 <pos_soc_event_init>
1c00a66e:	2a6d                	jal	1c00a828 <pos_allocs_init>
1c00a670:	284d                	jal	1c00a722 <pos_sched_init>
1c00a672:	405c                	lw	a5,4(s0)
1c00a674:	c791                	beqz	a5,1c00a680 <pos_init_start+0x28>
1c00a676:	0421                	addi	s0,s0,8
1c00a678:	9782                	jalr	a5
1c00a67a:	0044278b          	p.lw	a5,4(s0!)
1c00a67e:	ffed                	bnez	a5,1c00a678 <pos_init_start+0x20>
1c00a680:	bf2fe0ef          	jal	ra,1c008a72 <pos_io_start>
1c00a684:	300467f3          	csrrsi	a5,mstatus,8
1c00a688:	40b2                	lw	ra,12(sp)
1c00a68a:	4422                	lw	s0,8(sp)
1c00a68c:	0141                	addi	sp,sp,16
1c00a68e:	8082                	ret

1c00a690 <pos_init_stop>:
1c00a690:	1141                	addi	sp,sp,-16
1c00a692:	c422                	sw	s0,8(sp)
1c00a694:	1c001437          	lui	s0,0x1c001
1c00a698:	c606                	sw	ra,12(sp)
1c00a69a:	85040413          	addi	s0,s0,-1968 # 1c000850 <dtor_list>
1c00a69e:	bd8fe0ef          	jal	ra,1c008a76 <pos_io_stop>
1c00a6a2:	405c                	lw	a5,4(s0)
1c00a6a4:	c791                	beqz	a5,1c00a6b0 <pos_init_stop+0x20>
1c00a6a6:	0421                	addi	s0,s0,8
1c00a6a8:	9782                	jalr	a5
1c00a6aa:	0044278b          	p.lw	a5,4(s0!)
1c00a6ae:	ffed                	bnez	a5,1c00a6a8 <pos_init_stop+0x18>
1c00a6b0:	40b2                	lw	ra,12(sp)
1c00a6b2:	4422                	lw	s0,8(sp)
1c00a6b4:	0141                	addi	sp,sp,16
1c00a6b6:	8082                	ret

1c00a6b8 <pos_cbsys_add>:
1c00a6b8:	00259793          	slli	a5,a1,0x2
1c00a6bc:	1c0015b7          	lui	a1,0x1c001
1c00a6c0:	24058593          	addi	a1,a1,576 # 1c001240 <stack>
1c00a6c4:	95be                	add	a1,a1,a5
1c00a6c6:	419c                	lw	a5,0(a1)
1c00a6c8:	c110                	sw	a2,0(a0)
1c00a6ca:	c154                	sw	a3,4(a0)
1c00a6cc:	c51c                	sw	a5,8(a0)
1c00a6ce:	c188                	sw	a0,0(a1)
1c00a6d0:	8082                	ret

1c00a6d2 <pi_open_from_conf>:
1c00a6d2:	c14c                	sw	a1,4(a0)
1c00a6d4:	8082                	ret

1c00a6d6 <pos_task_handle_blocking>:
1c00a6d6:	4785                	li	a5,1
1c00a6d8:	00f50a23          	sb	a5,20(a0)
1c00a6dc:	8082                	ret

1c00a6de <pos_task_handle>:
1c00a6de:	1141                	addi	sp,sp,-16
1c00a6e0:	c422                	sw	s0,8(sp)
1c00a6e2:	01000413          	li	s0,16
1c00a6e6:	401c                	lw	a5,0(s0)
1c00a6e8:	c606                	sw	ra,12(sp)
1c00a6ea:	c385                	beqz	a5,1c00a70a <pos_task_handle+0x2c>
1c00a6ec:	4394                	lw	a3,0(a5)
1c00a6ee:	43d8                	lw	a4,4(a5)
1c00a6f0:	4788                	lw	a0,8(a5)
1c00a6f2:	c014                	sw	a3,0(s0)
1c00a6f4:	300467f3          	csrrsi	a5,mstatus,8
1c00a6f8:	9702                	jalr	a4
1c00a6fa:	300477f3          	csrrci	a5,mstatus,8
1c00a6fe:	401c                	lw	a5,0(s0)
1c00a700:	f7f5                	bnez	a5,1c00a6ec <pos_task_handle+0xe>
1c00a702:	40b2                	lw	ra,12(sp)
1c00a704:	4422                	lw	s0,8(sp)
1c00a706:	0141                	addi	sp,sp,16
1c00a708:	8082                	ret
1c00a70a:	10500073          	wfi
1c00a70e:	300467f3          	csrrsi	a5,mstatus,8
1c00a712:	300477f3          	csrrci	a5,mstatus,8
1c00a716:	401c                	lw	a5,0(s0)
1c00a718:	fbf1                	bnez	a5,1c00a6ec <pos_task_handle+0xe>
1c00a71a:	40b2                	lw	ra,12(sp)
1c00a71c:	4422                	lw	s0,8(sp)
1c00a71e:	0141                	addi	sp,sp,16
1c00a720:	8082                	ret

1c00a722 <pos_sched_init>:
1c00a722:	00002823          	sw	zero,16(zero) # 10 <pos_sched_first>
1c00a726:	8082                	ret

1c00a728 <pos_alloc_init>:
1c00a728:	00758793          	addi	a5,a1,7
1c00a72c:	c407b7b3          	p.bclr	a5,a5,2,0
1c00a730:	40b785b3          	sub	a1,a5,a1
1c00a734:	c11c                	sw	a5,0(a0)
1c00a736:	8e0d                	sub	a2,a2,a1
1c00a738:	00c05763          	blez	a2,1c00a746 <pos_alloc_init+0x1e>
1c00a73c:	c4063633          	p.bclr	a2,a2,2,0
1c00a740:	c390                	sw	a2,0(a5)
1c00a742:	0007a223          	sw	zero,4(a5)
1c00a746:	8082                	ret

1c00a748 <pos_alloc>:
1c00a748:	4110                	lw	a2,0(a0)
1c00a74a:	059d                	addi	a1,a1,7
1c00a74c:	c405b5b3          	p.bclr	a1,a1,2,0
1c00a750:	ca31                	beqz	a2,1c00a7a4 <pos_alloc+0x5c>
1c00a752:	4218                	lw	a4,0(a2)
1c00a754:	425c                	lw	a5,4(a2)
1c00a756:	02b75963          	ble	a1,a4,1c00a788 <pos_alloc+0x40>
1c00a75a:	cb81                	beqz	a5,1c00a76a <pos_alloc+0x22>
1c00a75c:	4398                	lw	a4,0(a5)
1c00a75e:	43d4                	lw	a3,4(a5)
1c00a760:	00b75763          	ble	a1,a4,1c00a76e <pos_alloc+0x26>
1c00a764:	863e                	mv	a2,a5
1c00a766:	87b6                	mv	a5,a3
1c00a768:	fbf5                	bnez	a5,1c00a75c <pos_alloc+0x14>
1c00a76a:	853e                	mv	a0,a5
1c00a76c:	8082                	ret
1c00a76e:	00b70a63          	beq	a4,a1,1c00a782 <pos_alloc+0x3a>
1c00a772:	00b78533          	add	a0,a5,a1
1c00a776:	8f0d                	sub	a4,a4,a1
1c00a778:	c118                	sw	a4,0(a0)
1c00a77a:	c154                	sw	a3,4(a0)
1c00a77c:	c248                	sw	a0,4(a2)
1c00a77e:	853e                	mv	a0,a5
1c00a780:	8082                	ret
1c00a782:	c254                	sw	a3,4(a2)
1c00a784:	853e                	mv	a0,a5
1c00a786:	8082                	ret
1c00a788:	00e58b63          	beq	a1,a4,1c00a79e <pos_alloc+0x56>
1c00a78c:	00b606b3          	add	a3,a2,a1
1c00a790:	8f0d                	sub	a4,a4,a1
1c00a792:	c2dc                	sw	a5,4(a3)
1c00a794:	c298                	sw	a4,0(a3)
1c00a796:	87b2                	mv	a5,a2
1c00a798:	c114                	sw	a3,0(a0)
1c00a79a:	853e                	mv	a0,a5
1c00a79c:	8082                	ret
1c00a79e:	c11c                	sw	a5,0(a0)
1c00a7a0:	87b2                	mv	a5,a2
1c00a7a2:	b7e1                	j	1c00a76a <pos_alloc+0x22>
1c00a7a4:	4781                	li	a5,0
1c00a7a6:	b7d1                	j	1c00a76a <pos_alloc+0x22>

1c00a7a8 <pos_free>:
1c00a7a8:	4118                	lw	a4,0(a0)
1c00a7aa:	061d                	addi	a2,a2,7
1c00a7ac:	c4063633          	p.bclr	a2,a2,2,0
1c00a7b0:	c729                	beqz	a4,1c00a7fa <pos_free+0x52>
1c00a7b2:	00b76663          	bltu	a4,a1,1c00a7be <pos_free+0x16>
1c00a7b6:	a0a1                	j	1c00a7fe <pos_free+0x56>
1c00a7b8:	00b7f563          	bleu	a1,a5,1c00a7c2 <pos_free+0x1a>
1c00a7bc:	873e                	mv	a4,a5
1c00a7be:	435c                	lw	a5,4(a4)
1c00a7c0:	ffe5                	bnez	a5,1c00a7b8 <pos_free+0x10>
1c00a7c2:	00c586b3          	add	a3,a1,a2
1c00a7c6:	02d78463          	beq	a5,a3,1c00a7ee <pos_free+0x46>
1c00a7ca:	c190                	sw	a2,0(a1)
1c00a7cc:	c1dc                	sw	a5,4(a1)
1c00a7ce:	cf11                	beqz	a4,1c00a7ea <pos_free+0x42>
1c00a7d0:	431c                	lw	a5,0(a4)
1c00a7d2:	00f706b3          	add	a3,a4,a5
1c00a7d6:	00d58463          	beq	a1,a3,1c00a7de <pos_free+0x36>
1c00a7da:	c34c                	sw	a1,4(a4)
1c00a7dc:	8082                	ret
1c00a7de:	4194                	lw	a3,0(a1)
1c00a7e0:	41d0                	lw	a2,4(a1)
1c00a7e2:	97b6                	add	a5,a5,a3
1c00a7e4:	c31c                	sw	a5,0(a4)
1c00a7e6:	c350                	sw	a2,4(a4)
1c00a7e8:	8082                	ret
1c00a7ea:	c10c                	sw	a1,0(a0)
1c00a7ec:	8082                	ret
1c00a7ee:	4394                	lw	a3,0(a5)
1c00a7f0:	43dc                	lw	a5,4(a5)
1c00a7f2:	9636                	add	a2,a2,a3
1c00a7f4:	c190                	sw	a2,0(a1)
1c00a7f6:	c1dc                	sw	a5,4(a1)
1c00a7f8:	bfd9                	j	1c00a7ce <pos_free+0x26>
1c00a7fa:	4781                	li	a5,0
1c00a7fc:	b7d9                	j	1c00a7c2 <pos_free+0x1a>
1c00a7fe:	87ba                	mv	a5,a4
1c00a800:	4701                	li	a4,0
1c00a802:	b7c1                	j	1c00a7c2 <pos_free+0x1a>

1c00a804 <pos_alloc_init_l1>:
1c00a804:	1c0017b7          	lui	a5,0x1c001
1c00a808:	39c7a703          	lw	a4,924(a5) # 1c00139c <pos_alloc_l1>
1c00a80c:	700007b7          	lui	a5,0x70000
1c00a810:	01751593          	slli	a1,a0,0x17
1c00a814:	00100637          	lui	a2,0x100
1c00a818:	050a                	slli	a0,a0,0x2
1c00a81a:	02878793          	addi	a5,a5,40 # 70000028 <__l1_end>
1c00a81e:	fd860613          	addi	a2,a2,-40 # fffd8 <__l1_heap_size>
1c00a822:	95be                	add	a1,a1,a5
1c00a824:	953a                	add	a0,a0,a4
1c00a826:	b709                	j	1c00a728 <pos_alloc_init>

1c00a828 <pos_allocs_init>:
1c00a828:	1141                	addi	sp,sp,-16
1c00a82a:	1c0015b7          	lui	a1,0x1c001
1c00a82e:	c606                	sw	ra,12(sp)
1c00a830:	c422                	sw	s0,8(sp)
1c00a832:	3c858793          	addi	a5,a1,968 # 1c0013c8 <__l2_priv0_end>
1c00a836:	1c008637          	lui	a2,0x1c008
1c00a83a:	04c7c363          	blt	a5,a2,1c00a880 <pos_allocs_init+0x58>
1c00a83e:	4581                	li	a1,0
1c00a840:	4601                	li	a2,0
1c00a842:	1c001437          	lui	s0,0x1c001
1c00a846:	3a040513          	addi	a0,s0,928 # 1c0013a0 <pos_alloc_l2>
1c00a84a:	3df9                	jal	1c00a728 <pos_alloc_init>
1c00a84c:	1c0105b7          	lui	a1,0x1c010
1c00a850:	1b058793          	addi	a5,a1,432 # 1c0101b0 <__l2_shared_end>
1c00a854:	54000637          	lui	a2,0x54000
1c00a858:	1c001537          	lui	a0,0x1c001
1c00a85c:	8e1d                	sub	a2,a2,a5
1c00a85e:	1b058593          	addi	a1,a1,432
1c00a862:	3a450513          	addi	a0,a0,932 # 1c0013a4 <pos_alloc_l2+0x4>
1c00a866:	35c9                	jal	1c00a728 <pos_alloc_init>
1c00a868:	3a040513          	addi	a0,s0,928
1c00a86c:	4591                	li	a1,4
1c00a86e:	3de9                	jal	1c00a748 <pos_alloc>
1c00a870:	40b2                	lw	ra,12(sp)
1c00a872:	4422                	lw	s0,8(sp)
1c00a874:	1c0017b7          	lui	a5,0x1c001
1c00a878:	38a7ae23          	sw	a0,924(a5) # 1c00139c <pos_alloc_l1>
1c00a87c:	0141                	addi	sp,sp,16
1c00a87e:	8082                	ret
1c00a880:	8e1d                	sub	a2,a2,a5
1c00a882:	3c858593          	addi	a1,a1,968
1c00a886:	bf75                	j	1c00a842 <pos_allocs_init+0x1a>

1c00a888 <pi_cl_l1_malloc>:
1c00a888:	4781                	li	a5,0
1c00a88a:	c509                	beqz	a0,1c00a894 <pi_cl_l1_malloc+0xc>
1c00a88c:	451c                	lw	a5,8(a0)
1c00a88e:	01c7c783          	lbu	a5,28(a5)
1c00a892:	078a                	slli	a5,a5,0x2
1c00a894:	1c001737          	lui	a4,0x1c001
1c00a898:	39c72503          	lw	a0,924(a4) # 1c00139c <pos_alloc_l1>
1c00a89c:	953e                	add	a0,a0,a5
1c00a89e:	b56d                	j	1c00a748 <pos_alloc>

1c00a8a0 <pi_cl_l1_free>:
1c00a8a0:	4781                	li	a5,0
1c00a8a2:	c509                	beqz	a0,1c00a8ac <pi_cl_l1_free+0xc>
1c00a8a4:	451c                	lw	a5,8(a0)
1c00a8a6:	01c7c783          	lbu	a5,28(a5)
1c00a8aa:	078a                	slli	a5,a5,0x2
1c00a8ac:	1c001737          	lui	a4,0x1c001
1c00a8b0:	39c72503          	lw	a0,924(a4) # 1c00139c <pos_alloc_l1>
1c00a8b4:	953e                	add	a0,a0,a5
1c00a8b6:	bdcd                	j	1c00a7a8 <pos_free>

1c00a8b8 <pi_l2_malloc>:
1c00a8b8:	85aa                	mv	a1,a0
1c00a8ba:	1c001537          	lui	a0,0x1c001
1c00a8be:	3a450513          	addi	a0,a0,932 # 1c0013a4 <pos_alloc_l2+0x4>
1c00a8c2:	b559                	j	1c00a748 <pos_alloc>

1c00a8c4 <pi_l2_free>:
1c00a8c4:	862e                	mv	a2,a1
1c00a8c6:	85aa                	mv	a1,a0
1c00a8c8:	1c001537          	lui	a0,0x1c001
1c00a8cc:	3a450513          	addi	a0,a0,932 # 1c0013a4 <pos_alloc_l2+0x4>
1c00a8d0:	bde1                	j	1c00a7a8 <pos_free>

1c00a8d2 <pos_irq_set_handler>:
1c00a8d2:	002007b7          	lui	a5,0x200
1c00a8d6:	43b8                	lw	a4,64(a5)
1c00a8d8:	050a                	slli	a0,a0,0x2
1c00a8da:	8d89                	sub	a1,a1,a0
1c00a8dc:	8d99                	sub	a1,a1,a4
1c00a8de:	c14586b3          	p.extract	a3,a1,0,20
1c00a8e2:	06f00793          	li	a5,111
1c00a8e6:	c1f6a7b3          	p.insert	a5,a3,0,31
1c00a8ea:	d21586b3          	p.extract	a3,a1,9,1
1c00a8ee:	d356a7b3          	p.insert	a5,a3,9,21
1c00a8f2:	c0b586b3          	p.extract	a3,a1,0,11
1c00a8f6:	c146a7b3          	p.insert	a5,a3,0,20
1c00a8fa:	cec585b3          	p.extract	a1,a1,7,12
1c00a8fe:	cec5a7b3          	p.insert	a5,a1,7,12
1c00a902:	00f56723          	p.sw	a5,a4(a0)
1c00a906:	8082                	ret

1c00a908 <pos_irq_init>:
1c00a908:	1a10a7b7          	lui	a5,0x1a10a
1c00a90c:	56fd                	li	a3,-1
1c00a90e:	80d7a423          	sw	a3,-2040(a5) # 1a109808 <__l1_heap_size+0x1a009830>
1c00a912:	1c0087b7          	lui	a5,0x1c008
1c00a916:	00200737          	lui	a4,0x200
1c00a91a:	00078793          	mv	a5,a5
1c00a91e:	c33c                	sw	a5,64(a4)
1c00a920:	8082                	ret

1c00a922 <pos_soc_event_init>:
1c00a922:	1a1067b7          	lui	a5,0x1a106
1c00a926:	1141                	addi	sp,sp,-16
1c00a928:	c606                	sw	ra,12(sp)
1c00a92a:	577d                	li	a4,-1
1c00a92c:	00478693          	addi	a3,a5,4 # 1a106004 <__l1_heap_size+0x1a00602c>
1c00a930:	c298                	sw	a4,0(a3)
1c00a932:	00878693          	addi	a3,a5,8
1c00a936:	c298                	sw	a4,0(a3)
1c00a938:	00c78693          	addi	a3,a5,12
1c00a93c:	c298                	sw	a4,0(a3)
1c00a93e:	01078693          	addi	a3,a5,16
1c00a942:	c298                	sw	a4,0(a3)
1c00a944:	01478693          	addi	a3,a5,20
1c00a948:	c298                	sw	a4,0(a3)
1c00a94a:	01878693          	addi	a3,a5,24
1c00a94e:	c298                	sw	a4,0(a3)
1c00a950:	01c78693          	addi	a3,a5,28
1c00a954:	c298                	sw	a4,0(a3)
1c00a956:	02078793          	addi	a5,a5,32
1c00a95a:	1c00b5b7          	lui	a1,0x1c00b
1c00a95e:	c398                	sw	a4,0(a5)
1c00a960:	f1058593          	addi	a1,a1,-240 # 1c00af10 <pos_soc_event_handler_asm>
1c00a964:	4569                	li	a0,26
1c00a966:	37b5                	jal	1c00a8d2 <pos_irq_set_handler>
1c00a968:	40b2                	lw	ra,12(sp)
1c00a96a:	1a10a7b7          	lui	a5,0x1a10a
1c00a96e:	04000737          	lui	a4,0x4000
1c00a972:	80e7a223          	sw	a4,-2044(a5) # 1a109804 <__l1_heap_size+0x1a00982c>
1c00a976:	0141                	addi	sp,sp,16
1c00a978:	8082                	ret

1c00a97a <pos_time_poweroff>:
1c00a97a:	1a10b7b7          	lui	a5,0x1a10b
1c00a97e:	0791                	addi	a5,a5,4
1c00a980:	0087a783          	lw	a5,8(a5) # 1a10b008 <__l1_heap_size+0x1a00b030>
1c00a984:	1c001737          	lui	a4,0x1c001
1c00a988:	24f72c23          	sw	a5,600(a4) # 1c001258 <pos_time_timer_count>
1c00a98c:	4501                	li	a0,0
1c00a98e:	8082                	ret

1c00a990 <pos_time_poweron>:
1c00a990:	1c0017b7          	lui	a5,0x1c001
1c00a994:	2587a703          	lw	a4,600(a5) # 1c001258 <pos_time_timer_count>
1c00a998:	1a10b7b7          	lui	a5,0x1a10b
1c00a99c:	0791                	addi	a5,a5,4
1c00a99e:	00e7a423          	sw	a4,8(a5) # 1a10b008 <__l1_heap_size+0x1a00b030>
1c00a9a2:	4501                	li	a0,0
1c00a9a4:	8082                	ret

1c00a9a6 <pos_time_timer_handler>:
1c00a9a6:	1c0018b7          	lui	a7,0x1c001
1c00a9aa:	25888893          	addi	a7,a7,600 # 1c001258 <pos_time_timer_count>
1c00a9ae:	0048a783          	lw	a5,4(a7)
1c00a9b2:	1a10b637          	lui	a2,0x1a10b
1c00a9b6:	0611                	addi	a2,a2,4
1c00a9b8:	00862603          	lw	a2,8(a2) # 1a10b008 <__l1_heap_size+0x1a00b030>
1c00a9bc:	cba9                	beqz	a5,1c00aa0e <pos_time_timer_handler+0x68>
1c00a9be:	5fd8                	lw	a4,60(a5)
1c00a9c0:	800005b7          	lui	a1,0x80000
1c00a9c4:	ffe5c593          	xori	a1,a1,-2
1c00a9c8:	40e60733          	sub	a4,a2,a4
1c00a9cc:	08e5e863          	bltu	a1,a4,1c00aa5c <pos_time_timer_handler+0xb6>
1c00a9d0:	01002803          	lw	a6,16(zero) # 10 <pos_sched_first>
1c00a9d4:	01402503          	lw	a0,20(zero) # 14 <pos_sched_last>
1c00a9d8:	4398                	lw	a4,0(a5)
1c00a9da:	0007a023          	sw	zero,0(a5)
1c00a9de:	4301                	li	t1,0
1c00a9e0:	02080063          	beqz	a6,1c00aa00 <pos_time_timer_handler+0x5a>
1c00a9e4:	c11c                	sw	a5,0(a0)
1c00a9e6:	c305                	beqz	a4,1c00aa06 <pos_time_timer_handler+0x60>
1c00a9e8:	5f54                	lw	a3,60(a4)
1c00a9ea:	853e                	mv	a0,a5
1c00a9ec:	40d606b3          	sub	a3,a2,a3
1c00a9f0:	04d5e063          	bltu	a1,a3,1c00aa30 <pos_time_timer_handler+0x8a>
1c00a9f4:	87ba                	mv	a5,a4
1c00a9f6:	4398                	lw	a4,0(a5)
1c00a9f8:	0007a023          	sw	zero,0(a5)
1c00a9fc:	fe0814e3          	bnez	a6,1c00a9e4 <pos_time_timer_handler+0x3e>
1c00aa00:	883e                	mv	a6,a5
1c00aa02:	4305                	li	t1,1
1c00aa04:	f375                	bnez	a4,1c00a9e8 <pos_time_timer_handler+0x42>
1c00aa06:	06031063          	bnez	t1,1c00aa66 <pos_time_timer_handler+0xc0>
1c00aa0a:	00f02a23          	sw	a5,20(zero) # 14 <pos_sched_last>
1c00aa0e:	1a10b7b7          	lui	a5,0x1a10b
1c00aa12:	08100713          	li	a4,129
1c00aa16:	0791                	addi	a5,a5,4
1c00aa18:	0008a223          	sw	zero,4(a7)
1c00aa1c:	00e7a023          	sw	a4,0(a5) # 1a10b000 <__l1_heap_size+0x1a00b028>
1c00aa20:	6785                	lui	a5,0x1
1c00aa22:	80078793          	addi	a5,a5,-2048 # 800 <pos_soc_event_callback+0x3c8>
1c00aa26:	00204737          	lui	a4,0x204
1c00aa2a:	02f72423          	sw	a5,40(a4) # 204028 <__l1_heap_size+0x104050>
1c00aa2e:	8082                	ret
1c00aa30:	02031863          	bnez	t1,1c00aa60 <pos_time_timer_handler+0xba>
1c00aa34:	00f02a23          	sw	a5,20(zero) # 14 <pos_sched_last>
1c00aa38:	1a10b7b7          	lui	a5,0x1a10b
1c00aa3c:	0791                	addi	a5,a5,4
1c00aa3e:	00e8a223          	sw	a4,4(a7)
1c00aa42:	0087a683          	lw	a3,8(a5) # 1a10b008 <__l1_heap_size+0x1a00b030>
1c00aa46:	5f58                	lw	a4,60(a4)
1c00aa48:	40c70633          	sub	a2,a4,a2
1c00aa4c:	9636                	add	a2,a2,a3
1c00aa4e:	00c7a823          	sw	a2,16(a5)
1c00aa52:	08500713          	li	a4,133
1c00aa56:	00e7a023          	sw	a4,0(a5)
1c00aa5a:	8082                	ret
1c00aa5c:	873e                	mv	a4,a5
1c00aa5e:	bfe9                	j	1c00aa38 <pos_time_timer_handler+0x92>
1c00aa60:	01002823          	sw	a6,16(zero) # 10 <pos_sched_first>
1c00aa64:	bfc1                	j	1c00aa34 <pos_time_timer_handler+0x8e>
1c00aa66:	01002823          	sw	a6,16(zero) # 10 <pos_sched_first>
1c00aa6a:	b745                	j	1c00aa0a <pos_time_timer_handler+0x64>

1c00aa6c <pos_time_init>:
1c00aa6c:	1141                	addi	sp,sp,-16
1c00aa6e:	c422                	sw	s0,8(sp)
1c00aa70:	1a10b7b7          	lui	a5,0x1a10b
1c00aa74:	1c001437          	lui	s0,0x1c001
1c00aa78:	c606                	sw	ra,12(sp)
1c00aa7a:	25840413          	addi	s0,s0,600 # 1c001258 <pos_time_timer_count>
1c00aa7e:	08300713          	li	a4,131
1c00aa82:	0791                	addi	a5,a5,4
1c00aa84:	00042223          	sw	zero,4(s0)
1c00aa88:	00e7a023          	sw	a4,0(a5) # 1a10b000 <__l1_heap_size+0x1a00b028>
1c00aa8c:	1c00b5b7          	lui	a1,0x1c00b
1c00aa90:	eec58593          	addi	a1,a1,-276 # 1c00aeec <pos_time_timer_handler_asm>
1c00aa94:	452d                	li	a0,11
1c00aa96:	3d35                	jal	1c00a8d2 <pos_irq_set_handler>
1c00aa98:	6785                	lui	a5,0x1
1c00aa9a:	1a10a737          	lui	a4,0x1a10a
1c00aa9e:	80078793          	addi	a5,a5,-2048 # 800 <pos_soc_event_callback+0x3c8>
1c00aaa2:	1c00b637          	lui	a2,0x1c00b
1c00aaa6:	00840513          	addi	a0,s0,8
1c00aaaa:	4681                	li	a3,0
1c00aaac:	97a60613          	addi	a2,a2,-1670 # 1c00a97a <pos_time_poweroff>
1c00aab0:	4589                	li	a1,2
1c00aab2:	80f72223          	sw	a5,-2044(a4) # 1a109804 <__l1_heap_size+0x1a00982c>
1c00aab6:	3109                	jal	1c00a6b8 <pos_cbsys_add>
1c00aab8:	01840513          	addi	a0,s0,24
1c00aabc:	4422                	lw	s0,8(sp)
1c00aabe:	40b2                	lw	ra,12(sp)
1c00aac0:	1c00b637          	lui	a2,0x1c00b
1c00aac4:	4681                	li	a3,0
1c00aac6:	99060613          	addi	a2,a2,-1648 # 1c00a990 <pos_time_poweron>
1c00aaca:	458d                	li	a1,3
1c00aacc:	0141                	addi	sp,sp,16
1c00aace:	b6ed                	j	1c00a6b8 <pos_cbsys_add>

1c00aad0 <pos_uart_init>:
1c00aad0:	1c0107b7          	lui	a5,0x1c010
1c00aad4:	1407aa23          	sw	zero,340(a5) # 1c010154 <pos_uart>
1c00aad8:	8082                	ret

1c00aada <pi_cluster_conf_init>:
1c00aada:	00052223          	sw	zero,4(a0)
1c00aade:	00052a23          	sw	zero,20(a0)
1c00aae2:	8082                	ret

1c00aae4 <pi_cluster_open>:
1c00aae4:	1101                	addi	sp,sp,-32
1c00aae6:	c452                	sw	s4,8(sp)
1c00aae8:	00452a03          	lw	s4,4(a0)
1c00aaec:	c64e                	sw	s3,12(sp)
1c00aaee:	1c0017b7          	lui	a5,0x1c001
1c00aaf2:	004a2983          	lw	s3,4(s4)
1c00aaf6:	cc22                	sw	s0,24(sp)
1c00aaf8:	c05a                	sw	s6,0(sp)
1c00aafa:	3a878413          	addi	s0,a5,936 # 1c0013a8 <pos_cluster>
1c00aafe:	00599b13          	slli	s6,s3,0x5
1c00ab02:	ca26                	sw	s1,20(sp)
1c00ab04:	c84a                	sw	s2,16(sp)
1c00ab06:	c256                	sw	s5,4(sp)
1c00ab08:	016404b3          	add	s1,s0,s6
1c00ab0c:	ce06                	sw	ra,28(sp)
1c00ab0e:	c504                	sw	s1,8(a0)
1c00ab10:	0ff9fa93          	andi	s5,s3,255
1c00ab14:	1c00b5b7          	lui	a1,0x1c00b
1c00ab18:	01548e23          	sb	s5,28(s1)
1c00ab1c:	e6458593          	addi	a1,a1,-412 # 1c00ae64 <pos_task_remote_enqueue>
1c00ab20:	4505                	li	a0,1
1c00ab22:	3b45                	jal	1c00a8d2 <pos_irq_set_handler>
1c00ab24:	6685                	lui	a3,0x1
1c00ab26:	0e098793          	addi	a5,s3,224
1c00ab2a:	fff68713          	addi	a4,a3,-1 # fff <pos_soc_event_callback+0xbc7>
1c00ab2e:	1a10a637          	lui	a2,0x1a10a
1c00ab32:	4689                	li	a3,2
1c00ab34:	00800593          	li	a1,8
1c00ab38:	80d62223          	sw	a3,-2044(a2) # 1a109804 <__l1_heap_size+0x1a00982c>
1c00ab3c:	01779913          	slli	s2,a5,0x17
1c00ab40:	8df9                	and	a1,a1,a4
1c00ab42:	0004a023          	sw	zero,0(s1)
1c00ab46:	95ca                	add	a1,a1,s2
1c00ab48:	70000837          	lui	a6,0x70000
1c00ab4c:	002004b7          	lui	s1,0x200
1c00ab50:	0005a023          	sw	zero,0(a1)
1c00ab54:	02080813          	addi	a6,a6,32 # 70000020 <pos_cluster_fc_task_lock>
1c00ab58:	94ca                	add	s1,s1,s2
1c00ab5a:	4785                	li	a5,1
1c00ab5c:	0005a623          	sw	zero,12(a1)
1c00ab60:	0005a223          	sw	zero,4(a1)
1c00ab64:	00082023          	sw	zero,0(a6)
1c00ab68:	02f4a023          	sw	a5,32(s1) # 200020 <__l1_heap_size+0x100048>
1c00ab6c:	00400693          	li	a3,4
1c00ab70:	8ef9                	and	a3,a3,a4
1c00ab72:	02400793          	li	a5,36
1c00ab76:	96ca                	add	a3,a3,s2
1c00ab78:	02f05563          	blez	a5,1c00aba2 <pi_cluster_open+0xbe>
1c00ab7c:	17fd                	addi	a5,a5,-1
1c00ab7e:	1c010737          	lui	a4,0x1c010
1c00ab82:	18c70713          	addi	a4,a4,396 # 1c01018c <_l1_preload_start_inL2>
1c00ab86:	8389                	srli	a5,a5,0x2
1c00ab88:	02000613          	li	a2,32
1c00ab8c:	5575                	li	a0,-3
1c00ab8e:	8e99                	sub	a3,a3,a4
1c00ab90:	0785                	addi	a5,a5,1
1c00ab92:	08a64b63          	blt	a2,a0,1c00ac28 <pi_cluster_open+0x144>
1c00ab96:	0057c0fb          	lp.setup	x1,a5,1c00aba0 <pi_cluster_open+0xbc>
1c00ab9a:	4310                	lw	a2,0(a4)
1c00ab9c:	00c766a3          	p.sw	a2,a3(a4)
1c00aba0:	0711                	addi	a4,a4,4
1c00aba2:	016407b3          	add	a5,s0,s6
1c00aba6:	01578e23          	sb	s5,28(a5)
1c00abaa:	014a4683          	lbu	a3,20(s4)
1c00abae:	00201437          	lui	s0,0x201
1c00abb2:	e0440713          	addi	a4,s0,-508 # 200e04 <__l1_heap_size+0x100e2c>
1c00abb6:	974a                	add	a4,a4,s2
1c00abb8:	cf98                	sw	a4,24(a5)
1c00abba:	cb98                	sw	a4,16(a5)
1c00abbc:	c3cc                	sw	a1,4(a5)
1c00abbe:	00d78ea3          	sb	a3,29(a5)
1c00abc2:	854e                	mv	a0,s3
1c00abc4:	0007a423          	sw	zero,8(a5)
1c00abc8:	0007aa23          	sw	zero,20(a5)
1c00abcc:	00078f23          	sb	zero,30(a5)
1c00abd0:	00d80223          	sb	a3,4(a6)
1c00abd4:	3905                	jal	1c00a804 <pos_alloc_init_l1>
1c00abd6:	40040793          	addi	a5,s0,1024
1c00abda:	97ca                	add	a5,a5,s2
1c00abdc:	577d                	li	a4,-1
1c00abde:	00e7a023          	sw	a4,0(a5)
1c00abe2:	1c0087b7          	lui	a5,0x1c008
1c00abe6:	08078793          	addi	a5,a5,128 # 1c008080 <_start>
1c00abea:	04f4a023          	sw	a5,64(s1)
1c00abee:	04f4a223          	sw	a5,68(s1)
1c00abf2:	04f4a423          	sw	a5,72(s1)
1c00abf6:	04f4a623          	sw	a5,76(s1)
1c00abfa:	04f4a823          	sw	a5,80(s1)
1c00abfe:	04f4aa23          	sw	a5,84(s1)
1c00ac02:	04f4ac23          	sw	a5,88(s1)
1c00ac06:	04f4ae23          	sw	a5,92(s1)
1c00ac0a:	0ff00793          	li	a5,255
1c00ac0e:	00f4a423          	sw	a5,8(s1)
1c00ac12:	40f2                	lw	ra,28(sp)
1c00ac14:	4462                	lw	s0,24(sp)
1c00ac16:	44d2                	lw	s1,20(sp)
1c00ac18:	4942                	lw	s2,16(sp)
1c00ac1a:	49b2                	lw	s3,12(sp)
1c00ac1c:	4a22                	lw	s4,8(sp)
1c00ac1e:	4a92                	lw	s5,4(sp)
1c00ac20:	4b02                	lw	s6,0(sp)
1c00ac22:	4501                	li	a0,0
1c00ac24:	6105                	addi	sp,sp,32
1c00ac26:	8082                	ret
1c00ac28:	4785                	li	a5,1
1c00ac2a:	b7b5                	j	1c00ab96 <pi_cluster_open+0xb2>

1c00ac2c <pi_cluster_close>:
1c00ac2c:	4501                	li	a0,0
1c00ac2e:	8082                	ret

1c00ac30 <pos_cluster_task_set_stack>:
1c00ac30:	1101                	addi	sp,sp,-32
1c00ac32:	c84a                	sw	s2,16(sp)
1c00ac34:	00852903          	lw	s2,8(a0)
1c00ac38:	ca26                	sw	s1,20(sp)
1c00ac3a:	c64e                	sw	s3,12(sp)
1c00ac3c:	4785                	li	a5,1
1c00ac3e:	ce06                	sw	ra,28(sp)
1c00ac40:	cc22                	sw	s0,24(sp)
1c00ac42:	00f90f23          	sb	a5,30(s2)
1c00ac46:	45dc                	lw	a5,12(a1)
1c00ac48:	89aa                	mv	s3,a0
1c00ac4a:	84ae                	mv	s1,a1
1c00ac4c:	ebb1                	bnez	a5,1c00aca0 <pos_cluster_task_set_stack+0x70>
1c00ac4e:	6785                	lui	a5,0x1
1c00ac50:	80078793          	addi	a5,a5,-2048 # 800 <pos_soc_event_callback+0x3c8>
1c00ac54:	40000713          	li	a4,1024
1c00ac58:	c5dc                	sw	a5,12(a1)
1c00ac5a:	c998                	sw	a4,16(a1)
1c00ac5c:	40000693          	li	a3,1024
1c00ac60:	48d8                	lw	a4,20(s1)
1c00ac62:	00892503          	lw	a0,8(s2)
1c00ac66:	843e                	mv	s0,a5
1c00ac68:	177d                	addi	a4,a4,-1
1c00ac6a:	42d70433          	p.mac	s0,a4,a3
1c00ac6e:	c901                	beqz	a0,1c00ac7e <pos_cluster_task_set_stack+0x4e>
1c00ac70:	00c92603          	lw	a2,12(s2)
1c00ac74:	00860d63          	beq	a2,s0,1c00ac8e <pos_cluster_task_set_stack+0x5e>
1c00ac78:	85aa                	mv	a1,a0
1c00ac7a:	854e                	mv	a0,s3
1c00ac7c:	3115                	jal	1c00a8a0 <pi_cl_l1_free>
1c00ac7e:	00892623          	sw	s0,12(s2)
1c00ac82:	85a2                	mv	a1,s0
1c00ac84:	854e                	mv	a0,s3
1c00ac86:	3109                	jal	1c00a888 <pi_cl_l1_malloc>
1c00ac88:	00a92423          	sw	a0,8(s2)
1c00ac8c:	cd19                	beqz	a0,1c00acaa <pos_cluster_task_set_stack+0x7a>
1c00ac8e:	c488                	sw	a0,8(s1)
1c00ac90:	4501                	li	a0,0
1c00ac92:	40f2                	lw	ra,28(sp)
1c00ac94:	4462                	lw	s0,24(sp)
1c00ac96:	44d2                	lw	s1,20(sp)
1c00ac98:	4942                	lw	s2,16(sp)
1c00ac9a:	49b2                	lw	s3,12(sp)
1c00ac9c:	6105                	addi	sp,sp,32
1c00ac9e:	8082                	ret
1c00aca0:	4994                	lw	a3,16(a1)
1c00aca2:	fedd                	bnez	a3,1c00ac60 <pos_cluster_task_set_stack+0x30>
1c00aca4:	c99c                	sw	a5,16(a1)
1c00aca6:	86be                	mv	a3,a5
1c00aca8:	bf65                	j	1c00ac60 <pos_cluster_task_set_stack+0x30>
1c00acaa:	557d                	li	a0,-1
1c00acac:	b7dd                	j	1c00ac92 <pos_cluster_task_set_stack+0x62>

1c00acae <pi_cluster_send_task_to_cl_async>:
1c00acae:	1101                	addi	sp,sp,-32
1c00acb0:	ca26                	sw	s1,20(sp)
1c00acb2:	4504                	lw	s1,8(a0)
1c00acb4:	cc22                	sw	s0,24(sp)
1c00acb6:	c84a                	sw	s2,16(sp)
1c00acb8:	ce06                	sw	ra,28(sp)
1c00acba:	01d4c703          	lbu	a4,29(s1)
1c00acbe:	842e                	mv	s0,a1
1c00acc0:	0044a903          	lw	s2,4(s1)
1c00acc4:	459c                	lw	a5,8(a1)
1c00acc6:	02173e63          	p.bneimm	a4,1,1c00ad02 <pi_cluster_send_task_to_cl_async+0x54>
1c00acca:	c7a1                	beqz	a5,1c00ad12 <pi_cluster_send_task_to_cl_async+0x64>
1c00accc:	02042023          	sw	zero,32(s0)
1c00acd0:	cc10                	sw	a2,24(s0)
1c00acd2:	30047773          	csrrci	a4,mstatus,8
1c00acd6:	409c                	lw	a5,0(s1)
1c00acd8:	c391                	beqz	a5,1c00acdc <pi_cluster_send_task_to_cl_async+0x2e>
1c00acda:	d380                	sw	s0,32(a5)
1c00acdc:	c080                	sw	s0,0(s1)
1c00acde:	00092783          	lw	a5,0(s2)
1c00ace2:	cf89                	beqz	a5,1c00acfc <pi_cluster_send_task_to_cl_async+0x4e>
1c00ace4:	4c9c                	lw	a5,24(s1)
1c00ace6:	0007a023          	sw	zero,0(a5)
1c00acea:	30071073          	csrw	mstatus,a4
1c00acee:	4501                	li	a0,0
1c00acf0:	40f2                	lw	ra,28(sp)
1c00acf2:	4462                	lw	s0,24(sp)
1c00acf4:	44d2                	lw	s1,20(sp)
1c00acf6:	4942                	lw	s2,16(sp)
1c00acf8:	6105                	addi	sp,sp,32
1c00acfa:	8082                	ret
1c00acfc:	00892023          	sw	s0,0(s2)
1c00ad00:	b7d5                	j	1c00ace4 <pi_cluster_send_task_to_cl_async+0x36>
1c00ad02:	c38d                	beqz	a5,1c00ad24 <pi_cluster_send_task_to_cl_async+0x76>
1c00ad04:	4858                	lw	a4,20(s0)
1c00ad06:	4785                	li	a5,1
1c00ad08:	00e797b3          	sll	a5,a5,a4
1c00ad0c:	17fd                	addi	a5,a5,-1
1c00ad0e:	d05c                	sw	a5,36(s0)
1c00ad10:	bf75                	j	1c00accc <pi_cluster_send_task_to_cl_async+0x1e>
1c00ad12:	01e4c783          	lbu	a5,30(s1)
1c00ad16:	fbdd                	bnez	a5,1c00accc <pi_cluster_send_task_to_cl_async+0x1e>
1c00ad18:	c632                	sw	a2,12(sp)
1c00ad1a:	3f19                	jal	1c00ac30 <pos_cluster_task_set_stack>
1c00ad1c:	4632                	lw	a2,12(sp)
1c00ad1e:	d55d                	beqz	a0,1c00accc <pi_cluster_send_task_to_cl_async+0x1e>
1c00ad20:	557d                	li	a0,-1
1c00ad22:	b7f9                	j	1c00acf0 <pi_cluster_send_task_to_cl_async+0x42>
1c00ad24:	c632                	sw	a2,12(sp)
1c00ad26:	3729                	jal	1c00ac30 <pos_cluster_task_set_stack>
1c00ad28:	4632                	lw	a2,12(sp)
1c00ad2a:	dd69                	beqz	a0,1c00ad04 <pi_cluster_send_task_to_cl_async+0x56>
1c00ad2c:	557d                	li	a0,-1
1c00ad2e:	b7c9                	j	1c00acf0 <pi_cluster_send_task_to_cl_async+0x42>

1c00ad30 <pos_init_entry>:
1c00ad30:	cc101073          	csrw	0xcc1,zero
1c00ad34:	f1402573          	csrr	a0,mhartid
1c00ad38:	01f57593          	andi	a1,a0,31
1c00ad3c:	8115                	srli	a0,a0,0x5
1c00ad3e:	04000613          	li	a2,64
1c00ad42:	00c50463          	beq	a0,a2,1c00ad4a <pos_init_entry+0x1a>
1c00ad46:	2ba0506f          	j	1c010000 <__cluster_text_start>
1c00ad4a:	ffff6297          	auipc	t0,0xffff6
1c00ad4e:	53628293          	addi	t0,t0,1334 # 1c001280 <_edata>
1c00ad52:	ffff6317          	auipc	t1,0xffff6
1c00ad56:	67630313          	addi	t1,t1,1654 # 1c0013c8 <__l2_priv0_end>
1c00ad5a:	0002a023          	sw	zero,0(t0)
1c00ad5e:	0291                	addi	t0,t0,4
1c00ad60:	fe62ede3          	bltu	t0,t1,1c00ad5a <pos_init_entry+0x2a>
1c00ad64:	ffff6117          	auipc	sp,0xffff6
1c00ad68:	4dc10113          	addi	sp,sp,1244 # 1c001240 <stack>
1c00ad6c:	00000297          	auipc	t0,0x0
1c00ad70:	8ec28293          	addi	t0,t0,-1812 # 1c00a658 <pos_init_start>
1c00ad74:	000280e7          	jalr	t0
1c00ad78:	00000513          	li	a0,0
1c00ad7c:	00000593          	li	a1,0
1c00ad80:	ffffe397          	auipc	t2,0xffffe
1c00ad84:	abe38393          	addi	t2,t2,-1346 # 1c00883e <main>
1c00ad88:	000380e7          	jalr	t2
1c00ad8c:	842a                	mv	s0,a0
1c00ad8e:	8522                	mv	a0,s0
1c00ad90:	ffffe297          	auipc	t0,0xffffe
1c00ad94:	cb628293          	addi	t0,t0,-842 # 1c008a46 <exit>
1c00ad98:	000280e7          	jalr	t0

1c00ad9c <pos_irq_call_external_c_function>:
1c00ad9c:	7119                	addi	sp,sp,-128
1c00ad9e:	c006                	sw	ra,0(sp)
1c00ada0:	c20e                	sw	gp,4(sp)
1c00ada2:	c412                	sw	tp,8(sp)
1c00ada4:	c616                	sw	t0,12(sp)
1c00ada6:	c81a                	sw	t1,16(sp)
1c00ada8:	ca1e                	sw	t2,20(sp)
1c00adaa:	d236                	sw	a3,36(sp)
1c00adac:	d43a                	sw	a4,40(sp)
1c00adae:	d63e                	sw	a5,44(sp)
1c00adb0:	d842                	sw	a6,48(sp)
1c00adb2:	da46                	sw	a7,52(sp)
1c00adb4:	dc72                	sw	t3,56(sp)
1c00adb6:	de76                	sw	t4,60(sp)
1c00adb8:	c0fa                	sw	t5,64(sp)
1c00adba:	c6fe                	sw	t6,76(sp)
1c00adbc:	000600e7          	jalr	a2
1c00adc0:	4082                	lw	ra,0(sp)
1c00adc2:	4192                	lw	gp,4(sp)
1c00adc4:	4222                	lw	tp,8(sp)
1c00adc6:	42b2                	lw	t0,12(sp)
1c00adc8:	4342                	lw	t1,16(sp)
1c00adca:	43d2                	lw	t2,20(sp)
1c00adcc:	5692                	lw	a3,36(sp)
1c00adce:	5722                	lw	a4,40(sp)
1c00add0:	57b2                	lw	a5,44(sp)
1c00add2:	5842                	lw	a6,48(sp)
1c00add4:	58d2                	lw	a7,52(sp)
1c00add6:	5e62                	lw	t3,56(sp)
1c00add8:	5ef2                	lw	t4,60(sp)
1c00adda:	4f06                	lw	t5,64(sp)
1c00addc:	4fb6                	lw	t6,76(sp)
1c00adde:	6109                	addi	sp,sp,128
1c00ade0:	8482                	jr	s1

1c00ade2 <pos_irq_call_external_c_function_full>:
1c00ade2:	7119                	addi	sp,sp,-128
1c00ade4:	c006                	sw	ra,0(sp)
1c00ade6:	c20e                	sw	gp,4(sp)
1c00ade8:	c412                	sw	tp,8(sp)
1c00adea:	c616                	sw	t0,12(sp)
1c00adec:	c81a                	sw	t1,16(sp)
1c00adee:	ca1e                	sw	t2,20(sp)
1c00adf0:	cc2a                	sw	a0,24(sp)
1c00adf2:	ce2e                	sw	a1,28(sp)
1c00adf4:	d236                	sw	a3,36(sp)
1c00adf6:	d43a                	sw	a4,40(sp)
1c00adf8:	d63e                	sw	a5,44(sp)
1c00adfa:	d842                	sw	a6,48(sp)
1c00adfc:	da46                	sw	a7,52(sp)
1c00adfe:	dc72                	sw	t3,56(sp)
1c00ae00:	de76                	sw	t4,60(sp)
1c00ae02:	c0fa                	sw	t5,64(sp)
1c00ae04:	c6fe                	sw	t6,76(sp)
1c00ae06:	000600e7          	jalr	a2
1c00ae0a:	4082                	lw	ra,0(sp)
1c00ae0c:	4192                	lw	gp,4(sp)
1c00ae0e:	4222                	lw	tp,8(sp)
1c00ae10:	42b2                	lw	t0,12(sp)
1c00ae12:	4342                	lw	t1,16(sp)
1c00ae14:	43d2                	lw	t2,20(sp)
1c00ae16:	4562                	lw	a0,24(sp)
1c00ae18:	45f2                	lw	a1,28(sp)
1c00ae1a:	5692                	lw	a3,36(sp)
1c00ae1c:	5722                	lw	a4,40(sp)
1c00ae1e:	57b2                	lw	a5,44(sp)
1c00ae20:	5842                	lw	a6,48(sp)
1c00ae22:	58d2                	lw	a7,52(sp)
1c00ae24:	5e62                	lw	t3,56(sp)
1c00ae26:	5ef2                	lw	t4,60(sp)
1c00ae28:	4f06                	lw	t5,64(sp)
1c00ae2a:	4fb6                	lw	t6,76(sp)
1c00ae2c:	6109                	addi	sp,sp,128
1c00ae2e:	8482                	jr	s1

1c00ae30 <pos_task_push_asm>:
1c00ae30:	e3ff5297          	auipc	t0,0xe3ff5
1c00ae34:	1e028293          	addi	t0,t0,480 # 10 <pos_sched_first>
1c00ae38:	0002a603          	lw	a2,0(t0)
1c00ae3c:	0005a023          	sw	zero,0(a1)
1c00ae40:	ca09                	beqz	a2,1c00ae52 <__rt_no_first>
1c00ae42:	e3ff5297          	auipc	t0,0xe3ff5
1c00ae46:	1d228293          	addi	t0,t0,466 # 14 <pos_sched_last>
1c00ae4a:	0002a603          	lw	a2,0(t0)
1c00ae4e:	c20c                	sw	a1,0(a2)
1c00ae50:	a029                	j	1c00ae5a <__rt_common>

1c00ae52 <__rt_no_first>:
1c00ae52:	e3ff5297          	auipc	t0,0xe3ff5
1c00ae56:	1ab2af23          	sw	a1,446(t0) # 10 <pos_sched_first>

1c00ae5a <__rt_common>:
1c00ae5a:	e3ff5297          	auipc	t0,0xe3ff5
1c00ae5e:	1ab2ad23          	sw	a1,442(t0) # 14 <pos_sched_last>

1c00ae62 <enqueue_end>:
1c00ae62:	8482                	jr	s1

1c00ae64 <pos_task_remote_enqueue>:
1c00ae64:	fe812e23          	sw	s0,-4(sp)
1c00ae68:	fe912c23          	sw	s1,-8(sp)
1c00ae6c:	fea12a23          	sw	a0,-12(sp)
1c00ae70:	feb12823          	sw	a1,-16(sp)
1c00ae74:	fec12623          	sw	a2,-20(sp)
1c00ae78:	4405                	li	s0,1
1c00ae7a:	ffff6497          	auipc	s1,0xffff6
1c00ae7e:	52e48493          	addi	s1,s1,1326 # 1c0013a8 <pos_cluster>

1c00ae82 <pos_task_remote_enqueue_event_loop_cluster>:
1c00ae82:	48cc                	lw	a1,20(s1)
1c00ae84:	40d0                	lw	a2,4(s1)
1c00ae86:	02058a63          	beqz	a1,1c00aeba <pos_task_remote_enqueue_event_loop_cluster_continue>
1c00ae8a:	4208                	lw	a0,0(a2)
1c00ae8c:	e119                	bnez	a0,1c00ae92 <pos_task_remote_enqueue_no_queue_update>
1c00ae8e:	0004a023          	sw	zero,0(s1)

1c00ae92 <pos_task_remote_enqueue_no_queue_update>:
1c00ae92:	4890                	lw	a2,16(s1)
1c00ae94:	0004aa23          	sw	zero,20(s1)
1c00ae98:	00062023          	sw	zero,0(a2)
1c00ae9c:	00000497          	auipc	s1,0x0
1c00aea0:	01e48493          	addi	s1,s1,30 # 1c00aeba <pos_task_remote_enqueue_event_loop_cluster_continue>
1c00aea4:	0035f513          	andi	a0,a1,3
1c00aea8:	00051363          	bnez	a0,1c00aeae <pos_task_callback>
1c00aeac:	b751                	j	1c00ae30 <pos_task_push_asm>

1c00aeae <pos_task_callback>:
1c00aeae:	5571                	li	a0,-4
1c00aeb0:	8de9                	and	a1,a1,a0
1c00aeb2:	41d0                	lw	a2,4(a1)
1c00aeb4:	4588                	lw	a0,8(a1)
1c00aeb6:	ee7ff06f          	j	1c00ad9c <pos_irq_call_external_c_function>

1c00aeba <pos_task_remote_enqueue_event_loop_cluster_continue>:
1c00aeba:	147d                	addi	s0,s0,-1
1c00aebc:	00804e63          	bgtz	s0,1c00aed8 <pos_task_remote_enqueue_event_loop_next_cluster>
1c00aec0:	ffc12403          	lw	s0,-4(sp)
1c00aec4:	ff812483          	lw	s1,-8(sp)
1c00aec8:	ff412503          	lw	a0,-12(sp)
1c00aecc:	ff012583          	lw	a1,-16(sp)
1c00aed0:	fec12603          	lw	a2,-20(sp)
1c00aed4:	30200073          	mret

1c00aed8 <pos_task_remote_enqueue_event_loop_next_cluster>:
1c00aed8:	ffff6497          	auipc	s1,0xffff6
1c00aedc:	4d048493          	addi	s1,s1,1232 # 1c0013a8 <pos_cluster>
1c00aee0:	02000593          	li	a1,32
1c00aee4:	02b405b3          	mul	a1,s0,a1
1c00aee8:	94ae                	add	s1,s1,a1
1c00aeea:	bf61                	j	1c00ae82 <pos_task_remote_enqueue_event_loop_cluster>

1c00aeec <pos_time_timer_handler_asm>:
1c00aeec:	1161                	addi	sp,sp,-8
1c00aeee:	c032                	sw	a2,0(sp)
1c00aef0:	c226                	sw	s1,4(sp)
1c00aef2:	00000617          	auipc	a2,0x0
1c00aef6:	ab460613          	addi	a2,a2,-1356 # 1c00a9a6 <pos_time_timer_handler>
1c00aefa:	00000497          	auipc	s1,0x0
1c00aefe:	00c48493          	addi	s1,s1,12 # 1c00af06 <pos_time_timer_handler_asm_ret>
1c00af02:	ee1ff06f          	j	1c00ade2 <pos_irq_call_external_c_function_full>

1c00af06 <pos_time_timer_handler_asm_ret>:
1c00af06:	4492                	lw	s1,4(sp)
1c00af08:	4602                	lw	a2,0(sp)
1c00af0a:	0121                	addi	sp,sp,8
1c00af0c:	30200073          	mret

1c00af10 <pos_soc_event_handler_asm>:
1c00af10:	7119                	addi	sp,sp,-128
1c00af12:	c022                	sw	s0,0(sp)
1c00af14:	c226                	sw	s1,4(sp)
1c00af16:	c42a                	sw	a0,8(sp)
1c00af18:	c62e                	sw	a1,12(sp)
1c00af1a:	c832                	sw	a2,16(sp)
1c00af1c:	1a10a437          	lui	s0,0x1a10a
1c00af20:	80040413          	addi	s0,s0,-2048 # 1a109800 <__l1_heap_size+0x1a009828>
1c00af24:	5048                	lw	a0,36(s0)
1c00af26:	00251593          	slli	a1,a0,0x2
1c00af2a:	e3ff5297          	auipc	t0,0xe3ff5
1c00af2e:	50e28293          	addi	t0,t0,1294 # 438 <pos_soc_event_callback>
1c00af32:	2055f603          	p.lw	a2,t0(a1)
1c00af36:	e3ff5297          	auipc	t0,0xe3ff5
1c00af3a:	10228293          	addi	t0,t0,258 # 38 <pos_soc_event_callback_arg>
1c00af3e:	2055f583          	p.lw	a1,t0(a1)
1c00af42:	00000497          	auipc	s1,0x0
1c00af46:	03048493          	addi	s1,s1,48 # 1c00af72 <pos_soc_event_handler_end_asm>
1c00af4a:	e53ff06f          	j	1c00ad9c <pos_irq_call_external_c_function>

1c00af4e <pos_soc_event_no_udma_asm>:
1c00af4e:	00555593          	srli	a1,a0,0x5
1c00af52:	058a                	slli	a1,a1,0x2
1c00af54:	e3ff5297          	auipc	t0,0xe3ff5
1c00af58:	0c428293          	addi	t0,t0,196 # 18 <pos_soc_event_status>
1c00af5c:	2055f603          	p.lw	a2,t0(a1)
1c00af60:	897d                	andi	a0,a0,31
1c00af62:	80a64633          	p.bsetr	a2,a2,a0
1c00af66:	e3ff5297          	auipc	t0,0xe3ff5
1c00af6a:	0b228293          	addi	t0,t0,178 # 18 <pos_soc_event_status>
1c00af6e:	00c5e2a3          	p.sw	a2,t0(a1)

1c00af72 <pos_soc_event_handler_end_asm>:
1c00af72:	4402                	lw	s0,0(sp)
1c00af74:	4492                	lw	s1,4(sp)
1c00af76:	4522                	lw	a0,8(sp)
1c00af78:	45b2                	lw	a1,12(sp)
1c00af7a:	4642                	lw	a2,16(sp)
1c00af7c:	6109                	addi	sp,sp,128
1c00af7e:	30200073          	mret

1c00af82 <_endtext>:
	...

Disassembly of section .l2_data:

1c010000 <__cluster_text_start>:
1c010000:	f1402573          	csrr	a0,mhartid
1c010004:	01f57593          	andi	a1,a0,31
1c010008:	8115                	srli	a0,a0,0x5
1c01000a:	000702b7          	lui	t0,0x70
1c01000e:	00204337          	lui	t1,0x204
1c010012:	00532023          	sw	t0,0(t1) # 204000 <__l1_heap_size+0x104028>
1c010016:	4381                	li	t2,0
1c010018:	0e759463          	bne	a1,t2,1c010100 <pos_slave_start>
1c01001c:	20000293          	li	t0,512
1c010020:	00204337          	lui	t1,0x204
1c010024:	00532a23          	sw	t0,20(t1) # 204014 <__l1_heap_size+0x10403c>
1c010028:	e3ff0417          	auipc	s0,0xe3ff0
1c01002c:	fe040413          	addi	s0,s0,-32 # 8 <pos_cluster_pool>
1c010030:	002049b7          	lui	s3,0x204
1c010034:	4a09                	li	s4,2
1c010036:	00000a97          	auipc	s5,0x0
1c01003a:	038a8a93          	addi	s5,s5,56 # 1c01006e <pos_master_event>
1c01003e:	ffff1b97          	auipc	s7,0xffff1
1c010042:	36ab8b93          	addi	s7,s7,874 # 1c0013a8 <pos_cluster>
1c010046:	02000393          	li	t2,32
1c01004a:	02a383b3          	mul	t2,t2,a0
1c01004e:	9b9e                	add	s7,s7,t2
1c010050:	0bd1                	addi	s7,s7,20
1c010052:	1a10acb7          	lui	s9,0x1a10a
1c010056:	810c8c93          	addi	s9,s9,-2032 # 1a109810 <__l1_heap_size+0x1a009838>
1c01005a:	4c09                	li	s8,2
1c01005c:	00000d17          	auipc	s10,0x0
1c010060:	0e2d0d13          	addi	s10,s10,226 # 1c01013e <pos_set_slave_stack>
1c010064:	001d6d13          	ori	s10,s10,1
1c010068:	30045073          	csrwi	mstatus,8
1c01006c:	a829                	j	1c010086 <pos_master_loop>

1c01006e <pos_master_event>:
1c01006e:	018b2b03          	lw	s6,24(s6)
1c010072:	000b0a63          	beqz	s6,1c010086 <pos_master_loop>

1c010076 <pos_push_event_to_fc_retry>:
1c010076:	000ba283          	lw	t0,0(s7)
1c01007a:	06029c63          	bnez	t0,1c0100f2 <pos_push_event_to_fc_wait>
1c01007e:	016ba023          	sw	s6,0(s7)
1c010082:	018ca023          	sw	s8,0(s9)

1c010086 <pos_master_loop>:
1c010086:	00042b03          	lw	s6,0(s0)
1c01008a:	040b0d63          	beqz	s6,1c0100e4 <pos_master_sleep>

1c01008e <pos_master_loop_update_next>:
1c01008e:	020b2e83          	lw	t4,32(s6)
1c010092:	01d42023          	sw	t4,0(s0)
1c010096:	020b2f03          	lw	t5,32(s6)
1c01009a:	ffee9ae3          	bne	t4,t5,1c01008e <pos_master_loop_update_next>

1c01009e <pos_master_loop_exec_task>:
1c01009e:	004b2503          	lw	a0,4(s6)
1c0100a2:	000b2283          	lw	t0,0(s6)
1c0100a6:	008b2103          	lw	sp,8(s6)
1c0100aa:	00cb2303          	lw	t1,12(s6)
1c0100ae:	010b2383          	lw	t2,16(s6)
1c0100b2:	024b2f03          	lw	t5,36(s6)
1c0100b6:	014b2f83          	lw	t6,20(s6)
1c0100ba:	80d6                	mv	ra,s5
1c0100bc:	911a                	add	sp,sp,t1
1c0100be:	e3ff0e17          	auipc	t3,0xe3ff0
1c0100c2:	f5fe2f23          	sw	t6,-162(t3) # 1c <pos_cluster_nb_active_pe>

1c0100c6 <pos_no_stack_check>:
1c0100c6:	09e9a223          	sw	t5,132(s3) # 204084 <__l1_heap_size+0x1040ac>
1c0100ca:	21e9a023          	sw	t5,512(s3)
1c0100ce:	21e9a623          	sw	t5,524(s3)

1c0100d2 <pos_master_no_slave_barrier>:
1c0100d2:	000f2863          	p.beqimm	t5,0,1c0100e2 <pos_master_loop_no_slave>
1c0100d6:	09a9a023          	sw	s10,128(s3)
1c0100da:	0879a023          	sw	t2,128(s3)
1c0100de:	0829a023          	sw	sp,128(s3)

1c0100e2 <pos_master_loop_no_slave>:
1c0100e2:	8282                	jr	t0

1c0100e4 <pos_master_sleep>:
1c0100e4:	0149a423          	sw	s4,8(s3)
1c0100e8:	03c9e003          	p.elw	zero,60(s3)
1c0100ec:	0149a223          	sw	s4,4(s3)
1c0100f0:	bf59                	j	1c010086 <pos_master_loop>

1c0100f2 <pos_push_event_to_fc_wait>:
1c0100f2:	0149a423          	sw	s4,8(s3)
1c0100f6:	03c9e003          	p.elw	zero,60(s3)
1c0100fa:	0149a223          	sw	s4,4(s3)
1c0100fe:	bfa5                	j	1c010076 <pos_push_event_to_fc_retry>

1c010100 <pos_slave_start>:
1c010100:	00204937          	lui	s2,0x204
1c010104:	f14029f3          	csrr	s3,mhartid
1c010108:	01f9f993          	andi	s3,s3,31
1c01010c:	00000a17          	auipc	s4,0x0
1c010110:	012a0a13          	addi	s4,s4,18 # 1c01011e <pos_fork_return>
1c010114:	00000a97          	auipc	s5,0x0
1c010118:	00ea8a93          	addi	s5,s5,14 # 1c010122 <pos_wait_for_dispatch>
1c01011c:	a019                	j	1c010122 <pos_wait_for_dispatch>

1c01011e <pos_fork_return>:
1c01011e:	21c96283          	p.elw	t0,540(s2) # 20421c <__l1_heap_size+0x104244>

1c010122 <pos_wait_for_dispatch>:
1c010122:	08096283          	p.elw	t0,128(s2)
1c010126:	08096503          	p.elw	a0,128(s2)
1c01012a:	0012f313          	andi	t1,t0,1
1c01012e:	00031563          	bnez	t1,1c010138 <pos_other_entry>

1c010132 <pos_fork_entry>:
1c010132:	000a00b3          	add	ra,s4,zero
1c010136:	8282                	jr	t0

1c010138 <pos_other_entry>:
1c010138:	000a80b3          	add	ra,s5,zero
1c01013c:	8282                	jr	t0

1c01013e <pos_set_slave_stack>:
1c01013e:	08096283          	p.elw	t0,128(s2)
1c010142:	00098f13          	mv	t5,s3
1c010146:	02af0eb3          	mul	t4,t5,a0
1c01014a:	005e8133          	add	sp,t4,t0
1c01014e:	8082                	ret

1c010150 <array_fc_id>:
1c010150:	0000 0000                                   ....

1c010154 <pos_uart>:
	...
