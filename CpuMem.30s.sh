#!/usr/bin/env bash
#
# Setup variables
NumberProcessors=4			# The number of processors the machine have
CpuWarning=50				# The CPU warning theshold
CpuAlert=80					# The CPU alert theshold
MemWarning=50				# The memory warning theshold
MemAlert=80					# The memory alert theshold
NbWarning=2					# General Warning from 1 to this value, General Alert if more
#
# Compute CPU usage
#
Warning=0
for ((I = 0; I < $NumberProcessors ; I++))
do 
	UsedCpu=$((mpstat -P $I 1 1 | tail -1) | awk '{print 100-$12;}')
	Cpu[$I]=$UsedCpu
	if (($UsedCpu < $CpuWarning ))
	then
		Smiley[$I]='😎'
		elif (($UsedCpu < $CpuAlert ))
		then 
			Smiley[$I]='🥵'
			let Warning++
		else
			Smiley[$I]='😈'
			let Warning++
		fi
	done
#
# Compute Memory Usage
#
UsedMem=$(free -h | head -2 | tail -1 | awk '{ print int(($2-$7)/$2*100) ; }' | sed -e 's/i//g')
if (($UsedMem < $MemWarning))
then
	Memory='📗'
	elif (($UsedMem < $MemAlert))
	then
		Memory='📙'
		let Warning++
	else
		Memory='🏮'
		let Warning++
fi
#
# Display General status
#
if (($Warning == 0))
then
	echo '😎'
	elif (($Warning <= $NbWarning))
		then
			echo '🥵'
		else
			echo '😈'
		fi
echo '---'
#
# Display CPU status
#
for ((I = 0; I < $NumberProcessors ; I++))
do
	echo ${Smiley[$I]}' CPU '${Cpu[$I]}'%'
done
#
# Display Memory status
#
echo $Memory' used mem '$UsedMem'%'
