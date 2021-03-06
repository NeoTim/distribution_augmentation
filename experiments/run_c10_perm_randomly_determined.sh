#!/bin/bash

mkdir -p logs

CUDA_VISIBLE_DEVICES=0 python train.py --seed 43 --aug_seed 314 --no_sample_during_eval --desc c10-small-rd-s42-lhd-nocond-nope-a1 --hps c10_small_rd --randomly_determined_order_use_lookahead --no_permute_embeddings --resid_pdrop 0.005 --use_unconditional_augmentation &> logs/c10-small-rd-s42-lhd-nocond-nope.out &
CUDA_VISIBLE_DEVICES=1 python train.py --seed 43 --aug_seed 314 --no_sample_during_eval --desc c10-small-rd-s42-lhd-nocond-pe-a1 --hps c10_small_rd --randomly_determined_order_use_lookahead --permute_embeddings --resid_pdrop 0.005 --use_unconditional_augmentation &> logs/c10-small-rd-s42-lhd-nocond-pe.out &
CUDA_VISIBLE_DEVICES=2 python train.py --seed 43 --aug_seed 314 --no_sample_during_eval --desc c10-small-rd-s42-lhd-cond-nope-a1 --hps c10_small_rd --randomly_determined_order_use_lookahead --no_permute_embeddings --resid_pdrop 0.005 &> logs/c10-small-rd-s42-lhd-cond-nope.out &
CUDA_VISIBLE_DEVICES=3 python train.py --seed 43 --aug_seed 314 --no_sample_during_eval --desc c10-small-rd-s42-lhd-cond-pe-a1 --hps c10_small_rd --randomly_determined_order_use_lookahead --permute_embeddings --resid_pdrop 0.005 &> logs/c10-small-rd-s42-lhd-cond-pe.out &

CUDA_VISIBLE_DEVICES=4 python train.py --seed 43 --aug_seed 314 --desc c10-small-rd-s42-nocond-nope-a1 --hps c10_small_rd --no_permute_embeddings --resid_pdrop 0.005 --use_unconditional_augmentation &> logs/c10-small-rd-s42-nocond-nope.out &
CUDA_VISIBLE_DEVICES=5 python train.py --seed 43 --aug_seed 314 --desc c10-small-rd-s42-nocond-pe-a1 --hps c10_small_rd --permute_embeddings --resid_pdrop 0.005 --use_unconditional_augmentation &> logs/c10-small-rd-s42-nocond-pe.out &
CUDA_VISIBLE_DEVICES=6 python train.py --seed 43 --aug_seed 314 --desc c10-small-rd-s42-cond-nope-a1 --hps c10_small_rd --no_permute_embeddings --resid_pdrop 0.005 &> logs/c10-small-rd-s42-cond-nope.out &
CUDA_VISIBLE_DEVICES=7 python train.py --seed 43 --aug_seed 314 --desc c10-small-rd-s42-cond-pe-a1 --hps c10_small_rd --permute_embeddings --resid_pdrop 0.005 &> logs/c10-small-rd-s42-cond-pe.out &
