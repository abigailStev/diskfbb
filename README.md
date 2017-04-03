# diskfbb
`diskfbb` is a modification of the XSPEC model `diskbb` that includes a spectral
hardening factor *f*. 
`diskbb` is a multi-colour blackbody model of an accretion disk.

This model assumes that you already have `diskbb` working, since it uses some 
subroutines from that. 
An up-to-date version of HEASOFT, with XSPEC v12.8.2 or higher, is required.

Relevant papers for the physics behind the original `diskbb` model: 
* [Mitsuda et al. 1984, PASJ, 36, 741](https://ui.adsabs.harvard.edu/#abs/1984PASJ...36..741M/abstract)
* [Makishima et al. 1986, ApJ, 308, 635](https://ui.adsabs.harvard.edu/#abs/1986ApJ...308..635M/abstract)

### In comparison with `diskbb`
* *f* is the spectral hardening factor. *f* = *T_col* / *T_eff*
* *T_col* is the color or apparent peak blackbody temperature.
* *T_eff* is the effective or actual peak blackbody temperature.
* The total flux of the bin is divided by *f*^4 to account for using *T_col*,
not *T_eff*, in the Planck function (when it should be *T_eff* by definition).

### Using local XSPEC models
To initialize this model in your build of XSPEC: 
>`> xspec`
>
> (it loads an xspec session)
>
>`XSPEC> initpackage diskfbb lmodel.dat /absolute/path/to/diskfbb`

Then, to load the model (must be done in every session you want to use it):
>`XSPEC> lmod diskfbb /absolute/path/to/diskfbb`

If you experience difficulties setting up `diskfbb`, consult the 
[XSPEC documentation on local models](http://heasarc.gsfc.nasa.gov/xanadu/xspec/manual/XSappendixLocal.html) .

## Contents

#### diskfbb.f
The fortran file containing the model.
#### lmodel.dat
The required initialization file for custom models.

## Authors
* Abigail Stevens (UvA-API)
* Phil Uttley (UvA-API)


This model was developed for [Stevens and Uttley 2016](https://ui.adsabs.harvard.edu/#abs/2016MNRAS.460.2796S/abstract).