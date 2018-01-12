# pyspark deeplearning with tensor flow and Nvidia Docker

The project is to benchmark Deep learning use Tensorflow on Pyspark. The solution will attempt to simplify the library setup complexity of having Tensorflow, Pyspark and Nvidia GPU to work together. The document will also benchmark Tensorflow on GPU vs CPU only.

## Technologies used
- Tensor flow for neural network
- Pyspark 2.2
- Docker 18
- Nvidia-Docker

## Building docker images

There are two docker files on the project. One for CPU and another for GPU. 

to build a docker image use this command:

    docker build -t tensor_pyspark .

## Running the script

You can simply run deep_learning.py or submit it to spark cluster for this.