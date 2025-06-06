# Kingfall-AB-Test 模型支持说明

## 修改内容

已成功为 Hajimi Gemini API 代理添加了 **kingfall-ab-test** 模型的强制支持。

## 修改详情

在 `app/services/gemini.py` 文件中修改了 `EXTRA_MODELS` 的默认值：

```python
# 修改前
EXTRA_MODELS = os.environ.get("EXTRA_MODELS", "").split(",")

# 修改后  
EXTRA_MODELS = os.environ.get("EXTRA_MODELS", "kingfall-ab-test").split(",")
```

## 使用方法

1. **启动项目**
   - 双击 `Windows双击这里运行.bat` 启动项目
   - 或者手动运行: `uvicorn app.main:app --host 0.0.0.0 --port 7860`

2. **验证模型可用性**
   - 访问 `http://127.0.0.1:7860/v1/models` 查看可用模型列表
   - 在返回的模型列表中应该能看到 `kingfall-ab-test`

3. **API调用示例**
   ```bash
   curl -X POST http://127.0.0.1:7860/v1/chat/completions \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer 你的密码" \
     -d '{
       "model": "kingfall-ab-test",
       "messages": [
         {"role": "user", "content": "Hello"}
       ]
     }'
   ```
## 注意事项

- 需要确保在 `.env` 文件中配置了有效的 `GEMINI_API_KEYS`
- 如果需要添加更多自定义模型，可以通过环境变量 `EXTRA_MODELS` 来配置，多个模型用逗号分隔
- 当前修改是在代码层面强制添加，即使环境变量中没有设置 `EXTRA_MODELS`，`kingfall-ab-test` 也会被默认包含在可用模型列表中

## 项目原始信息

- 原项目地址: https://github.com/lashimao/hajimi
- 这是一个基于 FastAPI 构建的 Gemini API 代理
- 支持 OpenAI API 格式兼容

## 完成时间

修改完成时间: 2025年6月6日
修改的文件:
- `app/services/gemini.py`: 添加了 kingfall-ab-test 模型到默认额外模型列表