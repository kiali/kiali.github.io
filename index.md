---
title: Kiali - Observability for the service mesh
---

# Kiali - Observability for the service mesh

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

## More...

[Kiali-Users](https://groups.google.com/forum/#!forum/kiali-users) Google Group

[Kiali-Dev](https://groups.google.com/forum/#!forum/kiali-dev">) Google Group

[Kiali on GitHub](https://github.com/kiali">)



