python train_rfqi.py --env=Hopper-v3 --max_trn_steps=500000 --eval_freq=1000 --device=cuda:0 --data_size=1000000 --batch_size=1000 --rho=0.5 --actor_lr=1e-4 --critic_lr=6e-4 --adam_eps=1e-6 --adam_lr=1e-3 --eval_episodes=10 --d4rl=True

python eval_rfqi.py --env=Hopper-v3 --rho=0.5 --device=cuda --d4rl=True
