# Create a Helm Chart to deploy the image from the previous step. 
The chart should have
flexibility to allow Developer to adjust Values without having to rebuild the chart
frequently

Developer can config in file `values.yaml` before deploy

command to deploy chart
```
helm install mtla-devops-assignment-deployment . --values values.yaml
```
