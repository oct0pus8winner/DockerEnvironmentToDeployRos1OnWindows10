# DockerEnvironmentToDeployRos1OnWindows10
For generating container from dockerfile to run roscore, rosrun, and rviz.

# My Environment

- CPU : Intel(R) Core(TM) i9-9900k CPU @ 3.60GHz
- RAM : 64GB
- GPU : NVIDIA TITAN RTX (not used for this package)
- windows : windows10 Education 22H2
- wsl2 :
 - Description: Ubuntu 22.04.3 LTS
 - Release: 22.04
 - Codename: jammy

# How to use

run next commands
```
$docker compoes up -d
```
First time u compose this packages, it may take 30 min...sry

Then, the terminal generate a container named ros1.

To run rviz, u must run $roscore before running rviz.

so open 2 terminal, run next codes.

```
$docker exec -it TestEnvForC /bin/bash
#roscore
```


```
$docker exec -it TestEnvForC /bin/bash
#rosrun rviz rviz
```

After runnnig them, u will see the app starting.
