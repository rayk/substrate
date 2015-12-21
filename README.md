# Substrate

This application substrate package is an attempt to encapsulate the environment
upon which a modern browser base application would be executed in.

I helps separate out the concerns of the application state usually managed by the 
application shell with that of the environment the application is executing in.
  
In particular it covers the life cycle of the **service worker**, **browser feature
detection**, **environmental information**, **online and offline cache service**. In many 
ways it is Browser Abstraction Layer (BAL).

Under this substrate there is no reinventing of the wheel, libraries like modernizer
are used to probe the browser. All communication with the navigator object and
external resources are handled via calls to the common JS API sets.

What it provides is a clean Dart API to the B.A.L, therefore cleaner front end
code and less demand on your UI rendering thread, by offload all environmental task
to the substrate that uses it's own thread and heap space. What it does not 
provide is any kind of unification of the various browsers and devices. 
These differences and variations will continue but just  be neater to manage.

### Objectives

- No addition baggage, only get the parts of the B.A.L you need.
- Does not get in the way of any frameworks you wish to use. It leaves the DOM alone.
- Simple consistent API to Substrate. 
- Does not get in the way of achieving the best, first meaningful render time. 


### LifeCycle

The application should get to a 'Meaning First Render' A.S.A.P. When the Substrate
has not been installed, this means delivering M.F.R via a static HTML page.
When the substrate is in place, the M.F.R static page is replaced with the application
from the cache.

Substrate installation (Service Worker Rego, etc) is kicked of by the M.F.R static page
provided the correct conditions exist. When ready the Substrate claims ownership allowing
and init or boot strap process to be commence. These can be initiated by the substrate.


### Usage

The application resting upon the substrate interacts at runtime via messages and listening
for substrate event on a provided stream. Generally what you can do at runtime is 
greatly limited by how you configure the substrate at development/build time.

Your substrate configurations wills drive the code generation that shapes the substrate
that you end up with.

Hence Substrate is a development time dependence that generates the B.A.L substrate
code that is included in your final application. This allows you to initialise the substrate
and have it start performing it's duties when your boot sequence is ready.


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
