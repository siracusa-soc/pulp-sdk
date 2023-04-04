import random

EL_MIN = 0 
RL_MIN = 0 
DL_MIN = 0 
NI_MIN = 0 
NR_MIN = 1 
NC_MIN = 1 
BW_MIN = 1 
EL_MAX = 100
RL_MAX = 20
DL_MAX = 0
NI_MAX = 3
NR_MAX = 256
NC_MAX = 64
BW_MAX = 10 # max bandwidth is 400 as the max image size is 400
N_ITERS = 100
def generate_build(fd):
	EL = random.randint(EL_MIN, EL_MAX)
	RL = random.randint(RL_MIN, RL_MAX)
	DL = random.randint(DL_MIN, DL_MAX)
	NI = random.randint(NI_MIN, NI_MAX)
	NR = random.randint(NR_MIN, NR_MAX)
	NC = 4*random.randint(NC_MIN, NC_MAX)
	BW = 4*(random.randint(BW_MIN, BW_MAX))
	name=f'  EL{EL}_RL{RL}_DL{DL}_NI{NI}_NR{NR}_NC{NC}_BW{BW}:\n'
	path=f'    path: . #ok\n'
	command=f'    command: make stimuli sim_trace EL={EL} RL={RL} DL={DL} NI={NI} NR={NR} NC={NC} BW={BW}\n'
	fd.write(name)
	fd.write(path)
	fd.write(command)


with open('tests/generated.yaml', 'w') as fd:
	fd.write("camera_basic_tests:\n")
	for i in range(0, N_ITERS):
		generate_build(fd)
	fd.close()