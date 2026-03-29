FROM python:3.12-slim

RUN mkdir -p /output

CMD python3 -c "
import json, platform, os, datetime
result = {
    'test': 'cpu-quick',
    'python': platform.python_version(),
    'arch': platform.machine(),
    'timestamp': datetime.datetime.now().isoformat(),
    'pid': os.getpid(),
}
with open('/output/result.json', 'w') as f:
    json.dump(result, f, indent=2)
print('CPU quick test completed')
print(json.dumps(result, indent=2))
"
