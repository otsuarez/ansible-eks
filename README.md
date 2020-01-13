# ansible-eks

## Requirements
* AWS CLI
* kubectl
* aws-iam-authenticator
* Python 3, with pip packages:
  * ansible
  * boto
  * boto3
  * botocore
  * openshift

## Build EKS
To build EKS, run command below.

```
$ make create
```

## Destroy EKS
To destroy EKS, run command below.

```
$ make delete
```

## Deployment

To deploy a web app (`httpbin`) and a service (`Type: Loadbalancer`), run command below.
```sh
$ make deploy
```

Test it:

```sh
$ curl -s $(kubectl get svc --namespace=testing test-httpbin -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')/get
{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Host": "ad3daf7ce359a11eaa8b2062c62f2967-1236691161.us-west-2.elb.amazonaws.com",
    "User-Agent": "curl/7.61.1"
  },
  "origin": "10.0.11.56",
  "url": "http://ad3daf7ce359a11eaa8b2062c62f2967-1236691161.us-west-2.elb.amazonaws.com/get"
}
```
