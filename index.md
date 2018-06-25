---
title: Kiali - Observability for the service mesh
layout: home
---



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

## License

Kiali is open source and released under [Apache License v2](https://www.apache.org/licenses/LICENSE-2.0.txt)

## Reporting issues and feature requests

The Kiali team uses [JIRA at JBoss.org](http://issues.jboss.org/browse/KIALI) as its preferred tracker. Please use it to report issues and create new feature requests (select issue type 'Bug' for bugs and 'Story' for enhancement requests).

Alternatively you can also use the [GitHub tracker](https://github.com/kiali/kiali/issues) for this purpose.

## More...

[Kiali-Users](https://groups.google.com/forum/#!forum/kiali-users) Google Group about using Kiali

[Kiali-Dev](https://groups.google.com/forum/#!forum/kiali-dev) Google Group about developing Kiali

[Kiali Sources on GitHub](https://github.com/kiali) and [detailed instructions for building and deploying Kiali](https://github.com/kiali/kiali/blob/master/README.adoc) (includes notes for running on plain Kubernetes)

[Kiali on Irc](irc://irc.freenode.net/#kiali)
