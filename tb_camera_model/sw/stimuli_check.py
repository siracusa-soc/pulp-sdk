filedir = '/scratch/prasadar/siracusa/camera/pulp-sdk/tb_camera_model/build/'
workload = 'EL8_RL3_DL0_NI1_NR256_NC256_BW16'
buildfolder = '/BUILD/SIRACUSA/GCC_RISCV/'
filename = 'trace.txt'
MEM_BW=64

import os
import pandas as pd
import math
import numpy as np

entries = os.listdir(filedir)
# print(entries)

filepath = filedir+workload+buildfolder+filename

def extract_actual_cycles(filepath):
   with open(filepath) as fp:
      line = fp.readline()
      cnt = 1
      return(line.split("cycles=")[1].split(".")[0])

def extract_params(workload_path):
   param_dict = dict()
   EL = int(workload_path.split("_")[0].split("EL")[1])
   RL = int(workload_path.split("_")[1].split("RL")[1])
   DL = int(workload_path.split("_")[2].split("DL")[1])
   NI = int(workload_path.split("_")[3].split("NI")[1])
   NR = int(workload_path.split("_")[4].split("NR")[1])
   NC = int(workload_path.split("_")[5].split("NC")[1])
   BW = int(workload_path.split("_")[6].split("BW")[1])
   actual_cycles = extract_actual_cycles(filedir+workload_path+buildfolder+filename)
   expected_cycles = 0 
   param_dict = {"EL":EL,"RL":RL,"DL":DL,"NI":NI,"NR":NR,"NC":NC,"BW":BW, "ActualCycles":actual_cycles, "ExpectedCycles":expected_cycles, "diff":0}
   expected_cycles = extract_expected_cycles(param_dict)
   param_dict["ExpectedCycles"] = expected_cycles
   param_dict["diff"] = np.abs(int(expected_cycles) - int(actual_cycles))
   return param_dict

def extract_expected_cycles(params):
   EL = params['EL']
   RL = params["RL"]
   DL = params["DL"]
   NI = params["NI"]
   NR = params["NR"]
   NC = params["NC"]
   BW = params["BW"]
   if(BW>MEM_BW):
      BW=MEM_BW
   bw_cycles = math.ceil(NC/BW)*math.ceil(BW/MEM_BW)
   readout_cycles = bw_cycles if (bw_cycles>DL) else DL

   cycles = (EL+RL)*(1+NI)+NR*(1+NI)*readout_cycles+(NI+2)
   # print(f'params{params} with readout_cycles={readout_cycles} total_cycles={cycles}')
   return cycles


df = pd.DataFrame(columns=["EL","RL","DL","NI","NR","NC","BW", "ActualCycles", "ExpectedCycles", "diff"])
df_row = pd.DataFrame(columns=["EL","RL","DL","NI","NR","NC","BW", "ActualCycles", "ExpectedCycles", "diff"])
for entry in entries: 
   # print(entry)
   # print(extract_params(entry))
   df_row = pd.DataFrame(extract_params(entry), index=[0])
   df = pd.concat([df,df_row])
df=df.reset_index()  
print(f'Sum of difference obtained = {df["diff"].sum()}')
df.to_csv("result.csv")