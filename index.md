---
title: Kiali - Observability for the service mesh
---

[![Kiali intro](/assets/img/kiali-graph.png)](https://www.youtube.com/watch?v=8HZlDGURzLc)

## tl;dr:

Kiali provides answers to the question _What are the microservices in my Istio service mesh doing?_

## Description of Kiali

A Microservice Architecture breaks up the monolith into many smaller pieces
that are composed together. Patterns to secure the communication between
services like fault tolerance (via timeout, retry, circuit breaking, etc.)
have come up as well as distributed tracing to be able to see where calls
are going.

A service mesh can now provide these services on a platform level and
frees the application writers from those tasks. Routing decisions are
done at the mesh level.

Kiali works with Istio to visualise the service mesh topology, features
like circuit breakers or request rates. 

Kiali also includes Jaeger Tracing
to provide distributed tracing out of the box.

## Getting started on OpenShift

Kiali is still in development. Snapshots releases are pushed on Dockerhub from the CI pipeline.

To deploy Kiali to your Istio-enabled OpenShift cluster you can run the following. Kiali currently requires Istio version 0.8.0 (see below if you have not yet installed Istio).

### Preparation

First you need to grant the user that is installing Istio and Kiali the `cluster-admin` role. In the following case this will be the `admin` user:

````
oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin -z default admin

````

<span id="admin-user"/>
Then log in as this `admin` user:

	oc login -u admin -p admin

You can now install Istio if needed. See https://istio.io/docs/setup/ for details.

### Install Kiali

Then install Kiali:

```
curl https://raw.githubusercontent.com/kiali/kiali/master/deploy/openshift/kiali-configmap.yaml | \
   VERSION_LABEL=master envsubst | oc create -n istio-system -f -

curl https://raw.githubusercontent.com/kiali/kiali/master/deploy/openshift/kiali.yaml | \
   IMAGE_NAME=kiali/kiali \
   IMAGE_VERSION=latest \
   NAMESPACE=istio-system \
   VERSION_LABEL=master \
   VERBOSE_MODE=4 envsubst | oc create -n istio-system -f -

```

If you do not have `envsubst` installed, you can get it via the Gnu `gettext` package.

Once the above has completed and the Docker image has been pulled from Dockerhub, go to the OpenShift console, select the istio-system project and determine the base-URL of Kiali

![OpenShift console](/assets/img/os-console.png)

In this case it is `http://kiali-istio-system.192.168.64.13.nip.io`. In your case this could be a different IP.

You can also use the `oc` command to determine the base-url:

```
oc get route -n istio-system -l app=kiali
```

## Getting started on Kubernetes

To deploy Kiali to your Istio-enabled Kubernetes cluster you can run the following. Kiali currently requires Istio version 0.8.0 (see below if you have not yet installed Istio).

[NOTE]
If you wish to install in Minikube, ensure that you enable the Ingress add-on by executing `minikube addons enable ingress`.

```
curl https://raw.githubusercontent.com/kiali/kiali/master/deploy/kubernetes/kiali-configmap.yaml | \
   VERSION_LABEL=master envsubst | kubectl create -n istio-system -f -

curl https://raw.githubusercontent.com/kiali/kiali/master/deploy/kubernetes/kiali.yaml | \
   IMAGE_NAME=kiali/kiali \
   IMAGE_VERSION=latest \
   NAMESPACE=istio-system \
   VERSION_LABEL=master \
   VERBOSE_MODE=4 envsubst | kubectl create -n istio-system -f -

```

Once this is done, Kiali will be deployed and running in Kubernetes. An Ingress will have been set up so you can go directly to the Kiali UI at the URL `http://[minikube-ip]/` where `[minikube-ip]` is what is reported when you run the command: `minikube ip`.

## Quick Start

If you do not already have an Istio-enabled cluster but want to see what Kiali is all about, you can try to run the convenience hack script [cluster-openshift.sh](https://github.com/kiali/kiali/tree/master/hack) which will install OpenShift, Istio, and Kiali all at once:

```
wget https://raw.githubusercontent.com/kiali/kiali/master/hack/cluster-openshift.sh
sh cluster-openshift.sh --istio-version 0.8.0 --kiali-enabled true up
```

[NOTE]
We are recommending 0.8.0 in the above command, but keep in mind Kiali is currently in active development to get it to support 0.8.0 fully. You could try 0.7.1 instead..

If you do not already have an Istio-enabled application to test with, you can install one using the [Bookinfo Sample install script](https://github.com/kiali/kiali/blob/master/hack/istio) provided as a convenience. See [the Istio docs](https://istio.io/docs/guides/bookinfo/) for more details about this sample application.

## The Kiali UI

Log in to Kiali-UI as `admin`/`admin`. 

To achieve the best results you should have an example application like 'bookinfo' from the Istio examples deployed.

### Detail view of a single service

![Service view](/assets/img/kiali-service.png)


### Distributed tracing view

![Jaeger view](/assets/img/kiali-jaeger.png)

## License

Kiali is open source and released under [Apache License v2](https://www.apache.org/licenses/LICENSE-2.0.txt)

## More...

[Kiali-Users](https://groups.google.com/forum/#!forum/kiali-users) Google Group about using Kiali

[Kiali-Dev](https://groups.google.com/forum/#!forum/kiali-dev) Google Group about developing Kiali

[Kiali Sources on GitHub](https://github.com/kiali) and [detailed instructions for building and deploying Kiali](https://github.com/kiali/kiali/blob/master/README.adoc) (includes notes for running on plain Kubernetes)

[Kiali on Irc](irc://irc.freenode.net/#kiali)
