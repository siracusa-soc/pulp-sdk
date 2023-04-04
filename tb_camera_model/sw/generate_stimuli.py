import random

import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--EL_MIN", type=int, required=False, 
                    help="Minimum Exposure Latency")
parser.add_argument("--RL_MIN", type=int, required=False,
                    help="Minimum Reset Latency")
parser.add_argument("--DL_MIN", type=int, required=False,
                    help="Minimum Readout Latency")
parser.add_argument("--NI_MIN", type=int, required=False,
                    help="Minimum Number of Iteration")
parser.add_argument("--NR_MIN", type=int, required=False,
                    help="Minimum Number of Rows")
parser.add_argument("--NC_MIN", type=int, required=False,
                    help="Minimum Number of Columns")
parser.add_argument("--BW_MIN", type=int, required=False,
                    help="Minimum Bandwidth (Number of ADCs)")
parser.add_argument("--EL_MAX", type=int, required=False,
                    help="Maximum Exposure Latency")
parser.add_argument("--RL_MAX", type=int, required=False,
                    help="Maximum Reset Latency")
parser.add_argument("--DL_MAX", type=int, required=False,
                    help="Maximum Readout Latency")
parser.add_argument("--NI_MAX", type=int, required=False,
                    help="Maximum Number of Iteration")
parser.add_argument("--NR_MAX", type=int, required=False,
                    help="Maximum Number of Rows")
parser.add_argument("--NC_MAX", type=int, required=False,
                    help="Maximum Number of Columns")
parser.add_argument("--BW_MAX", type=int, required=False,
                    help="Maximum Bandwidth (Number of ADCs)")
parser.add_argument("--N_ITERS", type=int, required=False,
                    help="Maximum Number of STIMULI")

args=parser.parse_args()

EL_MIN = args.EL_MIN if args.EL_MIN else 0 
RL_MIN = args.RL_MIN if args.RL_MIN else 0 
DL_MIN = args.DL_MIN if args.DL_MIN else 0 
NI_MIN = args.NI_MIN if args.NI_MIN else 0 
NR_MIN = args.NR_MIN if args.NR_MIN else 1 
NC_MIN = args.NC_MIN if args.NC_MIN else 1 
BW_MIN = args.BW_MIN if args.BW_MIN else 1 
EL_MAX = args.EL_MAX if args.EL_MAX else 100
RL_MAX = args.RL_MAX if args.RL_MAX else 20
DL_MAX = args.DL_MAX if args.DL_MAX else 0
NI_MAX = args.NI_MAX if args.NI_MAX else 3
NR_MAX = args.NR_MAX if args.NR_MAX else 256
NC_MAX = args.NC_MAX if args.NC_MAX else 64
BW_MAX = args.BW_MAX if args.BW_MAX else 10 # max bandwidth is 400 as the max image size is 400
N_ITERS = args.N_ITERS if args.N_ITERS else 10
def generate_build(fd):
	EL = random.randint(EL_MIN, EL_MAX)
	RL = random.randint(RL_MIN, RL_MAX)
	DL = random.randint(DL_MIN, DL_MAX) 
	NI = random.randint(NI_MIN, NI_MAX)
	NR = random.randint(NR_MIN, NR_MAX)
	NC = 4*random.randint(NC_MIN, NC_MAX)
	BW = 4*(random.randint(BW_MIN, BW_MAX))
	STDOUT = 0
	name=f'  EL{EL}_RL{RL}_DL{DL}_NI{NI}_NR{NR}_NC{NC}_BW{BW}_STDOUT{STDOUT}:\n'
	path=f'    path: . #ok\n'
	command=f'    command: make stimuli sim_trace EL={EL} RL={RL} DL={DL} NI={NI} NR={NR} NC={NC} BW={BW} STDOUT={STDOUT}\n'
	fd.write(name)
	fd.write(path)
	fd.write(command)


with open('tests/generated.yaml', 'w') as fd:
	fd.write("camera_basic_tests:\n")
	for i in range(0, N_ITERS):
		generate_build(fd)
	fd.close()