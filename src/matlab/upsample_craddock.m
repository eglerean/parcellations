clear all
close all

addpath(genpath('external'))
nii=load_nii('../../data/Craddock2011/random_all.nii.gz');

% these data are at 4mm isotropic, we upsample at 2mm.
oo=nii.hdr.hist.originator;

niiout=load_nii('/usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz');
K=size(nii.img);

outvoltemp=zeros(K(1)*2,K(2)*2,K(3)*2,K(4));
outvol=zeros(91,109,91,K(4));
offset=oo(1:3)*2-niiout.hdr.hist.originator(1:3);
for t=1:K(4)
    for x=1:K(1)
       temp=squeeze(nii.img(x,:,:,t));
       temp2=imresize(temp,2,'nearest');
       outvoltemp(2*(x-1)+1,:,:,t)=temp2;
       outvoltemp(2*(x-1)+2,:,:,t)=temp2;
       outvol(:,:,:,t)=outvoltemp(offset(1)+(1:91),offset(2)+(1:109),offset(3)+(1:91),t);
       
    end
    
end


target=make_nii(outvol,[2 2 2]);
target.hdr.dime.pixdim = niiout.hdr.dime.pixdim;
target.hdr.dime.scl_slope = niiout.hdr.dime.scl_slope;
target.hdr.dime.xyzt_units = niiout.hdr.dime.xyzt_units;
target.hdr.hist = niiout.hdr.hist;


target.original.hdr.dime.pixdim = niiout.original.hdr.dime.pixdim;
target.original.hdr.dime.scl_slope = niiout.original.hdr.dime.scl_slope;
target.original.hdr.dime.xyzt_units = niiout.original.hdr.dime.xyzt_units;
target.original.hdr.hist = niiout.original.hdr.hist;

save_nii(target,'../../output/2mm/Craddock_random_all.nii');
