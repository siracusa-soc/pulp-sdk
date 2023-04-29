import filecmp

file1 = "/scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor/BUILD/sensor_data.hpp"
 
file2 = "/scratch/prasadar/siracusa/camera/pulp-sdk/tests/sensor/isp_smem_sensor/BUILD/isp_data.hpp"

comp = filecmp.cmp(file1, file2)

print(comp)

comp = filecmp.cmp(file1, file2, shallow = False)

print(comp)