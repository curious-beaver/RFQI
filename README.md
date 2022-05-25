# RFQI
This repository is an anonymous code submission for Neurips 2022. It will be removed afterwards.

Our method is tested in OpenAI gym discrete control task, [CartPole](https://www.gymlibrary.ml/environments/classic_control/cart_pole/), and two [MuJoCo](http://www.mujoco.org/) continuous control tasks, Hopper and HalfCheetah, using the [D4RL](https://github.com/rail-berkeley/d4rl) benchmark. Thus it is required that MuJoCo and D4RL are both installed prior to using this repo.

After installing MuJoCo and D4RL, you can run the following script to download D4RL offline data and make it conform to our format:
```
python load_d4rl_data.py
```
