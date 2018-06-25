
<a name="definitions"></a>
## Definitions

<a name="istioconfiglist"></a>
### IstioConfigList
This is used for returning a response of IstioConfigList


|Name|Description|Schema|
|---|---|---|
|**destinationPolicies**  <br>*optional*|**Example** : `"[destinationpolicies](#destinationpolicies)"`|[destinationPolicies](definitions.md#destinationpolicies)|
|**destinationRules**  <br>*optional*|**Example** : `"[destinationrules](#destinationrules)"`|[destinationRules](definitions.md#destinationrules)|
|**namespace**  <br>*required*|**Example** : `"[namespace](#namespace)"`|[namespace](definitions.md#namespace)|
|**routeRules**  <br>*optional*|**Example** : `"[routerules](#routerules)"`|[routeRules](definitions.md#routerules)|
|**rules**  <br>*optional*|**Example** : `"[istiorules](#istiorules)"`|[istioRules](definitions.md#istiorules)|
|**virtualServices**  <br>*optional*|**Example** : `"[virtualservices](#virtualservices)"`|[virtualServices](definitions.md#virtualservices)|


<a name="statusinfo"></a>
### StatusInfo
This is used for returning a response of Kiali Status


|Name|Description|Schema|
|---|---|---|
|**externalServices**  <br>*required*|An array of external services installed  <br>**Example** : `[ "[externalserviceinfo](#externalserviceinfo)" ]`|< [externalServiceInfo](definitions.md#externalserviceinfo) > array|
|**status**  <br>*required*|The state of Kiali<br>A hash of key,values with versions of Kiali and state  <br>**Example** : `{<br>  "string" : "string"<br>}`|< string, string > map|
|**warningMessages**  <br>*optional*|An array of warningMessages  <br>**Example** : `[ "string" ]`|< string > array|


<a name="tokengenerated"></a>
### TokenGenerated
This is used for returning the token


|Name|Description|Schema|
|---|---|---|
|**expired_at**  <br>*required*|The expired time for the token<br>A string with the Datetime when the token will be expired  <br>**Example** : `"2018-06-20 19:40:54.116369887 +0000 UTC m=+43224.838320603"`|string|
|**token**  <br>*required*|The authentication token<br>A string with the authentication token for the user  <br>**Example** : `"zI1NiIsIsR5cCI6IkpXVCJ9.ezJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNTI5NTIzNjU0fQ.PPZvRGnR6VA4v7FmgSfQcGQr-VD"`|string|


<a name="destinationpolicies"></a>
### destinationPolicies
This is used for returning an array of DestinationPolicies

*Type* : < [destinationPolicy](definitions.md#destinationpolicy) > array


<a name="destinationpolicy"></a>
### destinationPolicy
This is used for returning a DestinationPolicy


|Name|Description|Schema|
|---|---|---|
|**circuitBreaker**  <br>*optional*|**Example** : `"object"`|object|
|**createdAt**  <br>*required*|The creation date of the destinationPolicy  <br>**Example** : `"string"`|string|
|**destination**  <br>*optional*|**Example** : `"object"`|object|
|**loadbalancing**  <br>*optional*|**Example** : `"object"`|object|
|**name**  <br>*required*|The name of the destinationPolicy  <br>**Example** : `"string"`|string|
|**resourceVersion**  <br>*required*|The resource version of the destinationPolicy  <br>**Example** : `"string"`|string|
|**source**  <br>*optional*|**Example** : `"object"`|object|


<a name="destinationrule"></a>
### destinationRule
This is used for returning a DestinationRule


|Name|Description|Schema|
|---|---|---|
|**createdAt**  <br>*required*|The creation date of the destinationRule  <br>**Example** : `"string"`|string|
|**host**  <br>*optional*|**Example** : `"object"`|object|
|**name**  <br>*required*|The name of the destinationRule  <br>**Example** : `"string"`|string|
|**resourceVersion**  <br>*required*|The resource version of the destinationRule  <br>**Example** : `"string"`|string|
|**subsets**  <br>*optional*|**Example** : `"object"`|object|
|**trafficPolicy**  <br>*optional*|**Example** : `"object"`|object|


<a name="destinationrules"></a>
### destinationRules
This is used for returning an array of DestinationRules

*Type* : < [destinationRule](definitions.md#destinationrule) > array


<a name="externalserviceinfo"></a>
### externalServiceInfo
This is used for returning a response of Kiali Status


|Name|Description|Schema|
|---|---|---|
|**name**  <br>*required*|The name of the service  <br>**Example** : `"Istio"`|string|
|**version**  <br>*required*|The installed version of the service  <br>**Example** : `"0.8.0"`|string|


<a name="istiorule"></a>
### istioRule
This is used for returning a IstioRule


|Name|Description|Schema|
|---|---|---|
|**actions**  <br>*optional*|**Example** : `"object"`|object|
|**match**  <br>*optional*|**Example** : `"object"`|object|
|**name**  <br>*required*|The name of the istioRule  <br>**Example** : `"string"`|string|


<a name="istiorules"></a>
### istioRules
This is used for returning an array of IstioRules

*Type* : < [istioRule](definitions.md#istiorule) > array


<a name="namespace"></a>
### namespace
It is used to describe a set of objects.


|Name|Description|Schema|
|---|---|---|
|**name**  <br>*required*|The id of the namespace.  <br>**Example** : `"istio-system"`|string|


<a name="routerule"></a>
### routeRule
This is used for returning a RouteRule


|Name|Description|Schema|
|---|---|---|
|**appendHeaders**  <br>*optional*|**Example** : `"object"`|object|
|**corsPolicy**  <br>*optional*|**Example** : `"object"`|object|
|**createdAt**  <br>*required*|The created time  <br>**Example** : `"2018-06-20T07:39:52Z"`|string|
|**destination**  <br>*optional*|**Example** : `"object"`|object|
|**httpFault**  <br>*optional*|**Example** : `"object"`|object|
|**httpReqRetries**  <br>*optional*|**Example** : `"object"`|object|
|**httpReqTimeout**  <br>*optional*|**Example** : `"object"`|object|
|**l4Fault**  <br>*optional*|**Example** : `"object"`|object|
|**match**  <br>*optional*|**Example** : `"object"`|object|
|**mirror**  <br>*optional*|**Example** : `"object"`|object|
|**name**  <br>*required*|The name of the routeRule  <br>**Example** : `"details-default"`|string|
|**precedence**  <br>*optional*|**Example** : `"object"`|object|
|**redirect**  <br>*optional*|**Example** : `"object"`|object|
|**resourceVersion**  <br>*required*|**Example** : `"1507"`|string|
|**rewrite**  <br>*optional*|**Example** : `"object"`|object|
|**route**  <br>*optional*|**Example** : `"object"`|object|
|**routeWarning**  <br>*optional*|**Example** : `"string"`|string|
|**websocketUpgrade**  <br>*optional*|**Example** : `"object"`|object|


<a name="routerules"></a>
### routeRules
This is used for returning an array of RouteRule

*Type* : < [routeRule](definitions.md#routerule) > array


<a name="virtualservice"></a>
### virtualService
This is used for returning a VirtualService


|Name|Description|Schema|
|---|---|---|
|**createdAt**  <br>*required*|The creation date of the virtualService  <br>**Example** : `"string"`|string|
|**gateways**  <br>*optional*|**Example** : `"object"`|object|
|**hosts**  <br>*optional*|**Example** : `"object"`|object|
|**http**  <br>*optional*|**Example** : `"object"`|object|
|**name**  <br>*required*|The name of the virtualService  <br>**Example** : `"string"`|string|
|**resourceVersion**  <br>*required*|The resource version of the virtualService  <br>**Example** : `"string"`|string|
|**tcp**  <br>*optional*|**Example** : `"object"`|object|


<a name="virtualservices"></a>
### virtualServices
This is used for returning an array of VirtualServices

*Type* : < [virtualService](definitions.md#virtualservice) > array



