# Helios

Helios lets you change the color of the lighting at New Relic's offices.

Create your own color effects by following the existing examples, as long as
your color effect has a change! method it will run when you queue the effect.

To queue an effect post JSON like this to http://newrelic-helios.herokuapp.com:

```
{ "effect": "StaticColor", "args": { "r": 255, "g" : 0, "b": 255 } }
```

That will change the color of all the lights to purple. You can pass a specific
light or series of lights in the args (this example defaults to lights 1-25). If
you want a specific light just pass the number, for a range use this syntax:

```
  "args": { "r": 255, "g": 0, "b": 255, "lights": ["1", "..", "5"] }
```

If you want to create your own effect limit the duration to about 15 seconds
somehow and we'll merge and deploy it for you.

Have fun!
