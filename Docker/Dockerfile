FROM nvcr.io/nvidia/pytorch:20.03-py3

# ENTRYPOINT命令はコンテナ起動時に実行するコマンドを指定（基本docker runの時に上書きしないもの）
# "jupyter-lab" => jupyter-lab立ち上げコマンド
# "--ip=0.0.0.0" => ip制限なし
# "--port=8888" => EXPOSE命令で書いたポート番号と合わせる
# ”--no-browser” => ブラウザを立ち上げない。コンテナ側にはブラウザがないので 。
# "--allow-root" => rootユーザーの許可。セキュリティ的には良くないので、自分で使うときだけ。
# "--NotebookApp.token=''" => トークンなしで起動許可。これもセキュリティ的には良くない。
# ENTRYPOINT ["xvfb-run", "-s", "-screen 0 1280x720x24", "jupyter-lab", "--ip=0.0.0.0", "--port=8887", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

# CMD命令はコンテナ起動時に実行するコマンドを指定（docker runの時に上書きする可能性のあるもの）
# "--notebook-dir=/workdir" => Jupyter Labのルートとなるディレクトリを指定
CMD ["--notebook-dir=/workspace"]

RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master \
jupyter_nbextensions_configurator
RUN jupyter contrib nbextension install --user && jupyter nbextensions_configurator enable --user

RUN pip install ipywidgets --user

RUN apt-get update && apt-get install -y python-opengl xvfb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD ./Docker/requirements.txt /workspace
RUN pip install -r /workspace/requirements.txt 

RUN echo '#!/bin/bash' > /tmp/openai-gym.sh && \
    echo '/usr/bin/xvfb-run -s "-screen 0 1280x720x24" jupyter-lab --port=8887 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' ' >> /tmp/openai-gym.sh && \
    chmod +x /tmp/openai-gym.sh
CMD ["/tmp/openai-gym.sh"]