
      SUBROUTINE DISKFBB(EAR,NE,PARAM,IDT,PHOTAR,PHOTER)

      INTEGER NE, IDT
      REAL    EAR(0:NE), PARAM(2), PHOTAR(NE), PHOTER(NE)

c     Multicolour disk blackbody model used in ISAS, Japan.
c     See Mitsuda et al. PASJ, 36, 741 (1984)
c     & Makishima et al. ApJ 308, 635 1986)
c     Ken Ebisawa 1992/12/22

C     Modified to use double precision and to make numerical
C     integration faster.
C     Ken Ebisawa 1993/07/29

C     Modified the algorithm. by Kazuhisa MITSUDA May 31, 1994
C     A numerical calculation was first done within an accruacy of 0.01 %.
C     Then an interpolation formula was found.
C     The interpolation is precise within 1e-5 level.
c
c     Edited by Abigail Stevens, 25 Apr 2016
c     Now has spectral hardening factor f

      INTEGER I, J
      REAL XN, XH, f

      double precision TIN, E, photon

C     These coefficients are taken from the spectral fitting program SPFD
C     in ISAS.
C     These are used for Gaussian Integral in the given energy band

      DOUBLE PRECISION  GAUSS(5,2)

      SAVE GAUSS

      DATA  GAUSS /
     $     0.236926885,  0.478628670, 0.568888888, 0.478628670,
     $     0.236926885, -0.906179846, -0.538469310, 0.0,  0.538469310,
     $     0.906179846 /

c suppress a warning message from the compiler
      i = idt

c this model has no errors
      DO I = 1, NE
         PHOTER(I) = 0.0
      ENDDO
c f is the spectral hardening factor (f = Tcol / Teff)
c TIN starts as Teff (since that's what we want to fit for/find)
	  f = PARAM(2)
      TIN = DBLE(PARAM(1)) * f
c Now TIN is Tcol

      DO 100 I = 1, NE
         XN = (EAR(I)-EAR(I-1))/2.0
         PHOTAR(I) = 0.0
         XH = XN + EAR(I-1)
         DO 200 J = 1, 5
            E = DBLE(XN) * GAUSS(J,2) + DBLE(XH)
            CALL mcdspc(E, TIN, 1.0d0, PHOTON)
            PHOTAR(I) = PHOTAR(I) + REAL(GAUSS(J,1) * PHOTON)
 200     CONTINUE
c         PHOTAR(I) = PHOTAR(I) * XN
c	Need to divide by f^4 to account for using Tcol instead of Teff
         PHOTAR(I) = PHOTAR(I) * XN / f**4

 100  CONTINUE
      END