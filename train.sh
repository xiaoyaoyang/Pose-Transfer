
echo "==== First generate dataset (for creating paired data later) ===="

python tool/generate_fashion_datasets.py

echo "==== Compute pose cordinate (annotation) ===="

python ./tool/compute_coordinates.py

echo "==== Create paired data ===="

python ./tool/create_pairs_dataset.py

echo "==== Generate pose heat map, (from annotation) ===="

python ./tool/generate_pose_map_fashion.py

echo "====  generate segments ===="

python ./tool/gen_segment_bbox.py

echo "==== Train Model ===="
#### Training Model This setting if for testing purpose
python train.py \
--dataroot ./fashion_data/ \
--name fashion_PATN_Fine \
--model PATN_Fine \
--lambda_GAN 5 \
--lambda_A 1 \
--lambda_B 1 \
--lambda_style 10 \
--dataset_mode key_segments \
--n_layers 3 \
--norm instance \
--batchSize 1 \
--pool_size 0 \
--resize_or_crop no \
--gpu_ids -1 \
--BP_input_nc 18 \
--no_flip \
--which_model_netG PATN_Fine \
--niter 4 \
--niter_decay 2 \
--checkpoints_dir ./checkpoints \
--pairLst ./fashion_data/fasion-resize-pairs-train.csv \
--L1_type l1_plus_seperate_segments_style \
--which_model_netD resnet_in \
--n_layers_D 3 \
--with_D_PP 1 \
--with_D_PB 1  \
--display_id 0 \
--no_lsgan \
--max_dataset_size 6 \
--print_freq 1 \
--save_latest_freq 3 \
--save_epoch_freq 3 \
--update_html_freq 3\



# python test.py \
# --dataroot ./fashion_data/ \
# --name fashion_PATN_Fine \
# --model PATN_Fine \
# --phase test \
# --dataset_mode key_segments \
# --norm instance \
# --batchSize 1 \
# --resize_or_crop no \
# --gpu_ids -1 \
# --BP_input_nc 18 \
# --no_flip \
# --which_model_netG PATN_Fine \
# --checkpoints_dir ./checkpoints \
# --pairLst ./fashion_data/fasion-resize-pairs-test.csv \
# --which_epoch latest \
# --results_dir ./results


