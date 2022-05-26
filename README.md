# RFQI
This repository is an anonymous code submission for Neurips 2022. It will be removed afterwards.

Our method is tested in OpenAI gym discrete control task, [CartPole](https://www.gymlibrary.ml/environments/classic_control/cart_pole/), and two [MuJoCo](http://www.mujoco.org/) continuous control tasks, Hopper and HalfCheetah, using the [D4RL](https://github.com/rail-berkeley/d4rl) benchmark. Thus it is required that MuJoCo and D4RL are both installed prior to using this repo.

## Setup
After installing MuJoCo and D4RL, you can run the following script to download D4RL offline data and make it conform to our format:
```
python load_d4rl_data.py
```
Next, you need to properly register the perturbed Gym environments which are placed under the folder perturbed_env. A recommended way to do this: first, place cartpole_perturbed.py under gym/envs/classic_control, hopper_perturbed.py and half_cheetah_perturbed.py under gym/envs/mujoco. Then add the following to \__init__.py unde gym/envs:
```
register(
    id="CartPolePerturbed-v0",
    entry_point="gym.envs.classic_control.cartpole_perturbed:CartPolePerturbedEnv",
    max_episode_steps=200,
    reward_threshold=195.0,
)
register(
    id="HopperPerturbed-v3",
    entry_point="gym.envs.mujoco.hopper_preturbed:HopperPerturbedEnv",
    max_episode_steps=1000,
    reward_threshold=3800.0,
)
register(
    id="HalfCheetahPerturbed-v3",
    entry_point="gym.envs.mujoco.half_cheetah_perturbed:HalfCheetahPerturbedEnv",
    max_episode_steps=1000,
    reward_threshold=4800.0,
)
```
You can test this by running:
```
import gym

gym.make('HopperPerturbed-v3')
```
## TL;DR
Here you can find shell scripts that take you directly from offline data generation to evaluation results.

To get all data, run
```
sh scripts/gen_all_data.sh
```
To get all results, run
```
sh scripts/run_cartpole.sh
sh scripts/run_hopper.sh
```
## Detailed instructions 
To generate the epsilon-greedy dataset for `CartPole-v0` with `epsilon=0.3`, run the following:
```
python generate_offline_data.py --env=CartPole-v0 --gendata_pol=ppo --eps=0.3
```

To generate the mixed dataset specified in Appendix E.1, run the following:
```
python generate_offline_data.py --env=Hopper-v3 --gendata_pol=sac --eps=0.3 --mixed=True
```
To train a RFQI policy on `Hopper-v3` with `d4rl-hopper-medium-v0` and uncertainty hyperparameter `rho=0.5`, please run:
```
python train_rfqi.py --env=Hopper-v3 --d4rl=True --rho=0.5
```
You can also train a RFQI policy on `Hopper-v3` with mixed dataset and uncertainty hyperparameter `rho=0.5` by running
```
python train_rfqi.py --env=Hopper-v3 --data_eps=0.3 --gendata_pol=sac --mixed=True --rho0.5
```
