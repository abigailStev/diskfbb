# diskfbb
A modification of the XSPEC model `diskbb` that includes a spectral hardening 
factor *f*. `diskbb` is a multi-colour blackbody model of an accretion disk.

* *f* is the spectral hardening factor. *f* = *T_col* / *T_eff*
* *T_col* is the color or apparent peak blackbody temperature.
* *T_eff* is the effective or actual peak blackbody temperature.
* The total flux of the bin is divided by *f*^4 to account for using *T_col*, not 
*T_eff*, in the Planck function (when it should be *T_eff* by definition).

This model assumes that you already have diskbb working, since it uses some 
subroutines from that. 
An up-to-date version of HEASOFT, with XSPEC 12.8.2 or higher, is required.

To initialize this model in your build of xspec: 
>`> xspec`
> (it loads an xspec session)
>`XSPEC> initpackage diskfbb lmodel.dat /absolute/path/to/diskfbb`

Then, to load the model (must be done in every session you want to use it):
>`XSPEC> lmod diskfbb /absolute/path/to/diskfbb`

Relevant papers for physics behind the original diskbb model: 
* Mitsuda et al. PASJ, 36, 741 (1984)
* Makishima et al. ApJ 308, 635 1986)

## Contents:

#### diskfbb.f
The fortran file containing the model.
#### lmodel.dat
The required initialization file for custom models.

## Authors:
* Abigail Stevens (UvA-API)

