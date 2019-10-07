#!/bin/bash

for n in $(ls ../../data/atlases_to_convert/);do 
	echo $n;
	echo flirt -in ../../data/atlases_to_convert/$n -ref avg_group_mask.nii.gz -applyxfm -usesqform -out ../../output/3x3x4mm/$n -interp nearestneighbour
	flirt -in ../../data/atlases_to_convert/$n -ref avg_group_mask.nii.gz -applyxfm -usesqform -out ../../output/3x3x4mm/$n -interp nearestneighbour
done
