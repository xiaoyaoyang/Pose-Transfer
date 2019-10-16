
FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-runtime

RUN pip install git+https://github.com/meikuam/RoIAlign.pytorch
RUN pip install scikit-image dominate tqdm pillow pandas scipy numpy


WORKDIR /mnt
COPY . /mnt

#ENTRYPOINT ["./run.sh"]