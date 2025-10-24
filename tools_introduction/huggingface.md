# huggingface相关

* 安装依赖：pip install -U huggingface_hub
* 设置环境变量：
  * Linux：`export HF_ENDPOINT=https://hf-mirror.com`（可以写入bash）
  * Windows：`$env:HF_ENDPOINT = "https://hf-mirror.com"`
* 下载：
  * 下载模型：huggingface-cli download --resume-download naver-clova-ix/donut-base-finetuned-docvqa --local-dir naver-clova-ix/donut-base-finetuned-docvqa
  * 下载数据集：huggingface-cli download --repo-type dataset --resume-download wikitext --local-dir wikitext
