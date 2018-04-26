---
title: Kiali - Observability for the service mesh
---


![Kiali screenshot](/assets/img/kiali-graph.png)

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

To deploy Kiali to your Istio-enabled OpenShift cluster you can run the following. Kiali currently requires Istio version 0.7.1 (see below if you have not yet installed Istio).

### Preparation

First you need to grant the user that is installing Istio and Kiali the `cluster-admin` role. In the following case this will be the `admin` user:

````
oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin -z default admin

````

<span id="admin-user"/>
Then log in as this `admin` user:

	oc login -u admin -p admin

You can now install Istio if needed ( [see below](#install-istio) ).

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

````


If you don't have `envsubst` installed, you can get it via the Gnu `gettext` package.

Once the above has completed and the Docker image has been pulled from Dockerhub, go to the OpenShift console, select the istio-system project and determine the base-URL of Kiali

![OpenShift console](/assets/img/os-console.png)

In this case it is `http://kiali-istio-system.192.168.64.13.nip.io`. In your case this could be a different IP.

You can also use the `oc` command to determine the base-url:

```
oc get route -n istio-system -l app=kiali
```

Log in to the Kiali-UI as `jdoe`/`password`. 

To achieve the best results you should have an example application like 'bookinfo' from the Istio examples deployed (if you use the install script from [below](#install-istio) it is already installed).

### Detail view of a single service

![Service view](/assets/img/kiali-service.png)


### Distributed tracing view

![Jaeger view](/assets/img/kiali-jaeger.png)

## License

Kiali is open source and released under [Apache License v2](https://www.apache.org/licenses/LICENSE-2.0.txt)

## More...

[Kiali-Users](https://groups.google.com/forum/#!forum/kiali-users) Google Group

[Kiali-Dev](https://groups.google.com/forum/#!forum/kiali-dev">) Google Group

[Kiali on GitHub](https://github.com/kiali">)

[Kiali on Irc](irc://irc.freenode.net/#kiali)


## Appendix

<h3 id="install-istio">Installing Istio</h3>


You can use the following script to install Istio. The user installing it needs cluster-admin rights (e.g. the `admin` user from [above](#admin-user)).

```
cd /tmp/
wget https://raw.githubusercontent.com/kiali/kiali/master/hack/istio/istio-install.sh
sh istio-install.sh
```

If the script fails (on Openshift 3.9) you may need to edit `/tmp/istio/install/ansible/istio/tasks/assert_oc_admin.yml`

and comment out the entire `-assert:` block at the end of the file and re-run the script

```
- assert:
    that:
      - ro.rc == 0
      - uo.rc == 0
[...]
```