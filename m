Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943127F
	for <linux-coco@lists.linux.dev>; Sat, 22 Apr 2023 03:17:55 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b60366047so2372501b3a.1
        for <linux-coco@lists.linux.dev>; Fri, 21 Apr 2023 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682133475; x=1684725475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ro9WxBg3nAsMPx4XvKLNPdXQpuH038dO7bV4dlzLzyM=;
        b=ocKjaQmFsMBBPD53/mf+PXlwKLosIf2W1+0alr1mh8QE0TjaMhkCHb62g0JN17fRxg
         CflH83+LrJhEF/mE8j18M7flZAv4q6/4WNzM5d/q1LBXMNnDwrvX/x2LTsegvfiC5LT6
         o9M8DczIUyb5Zbb9NpWo+23r3ZndIBl7zHJcl8SI9w1hioNFRTATnh1ej8BozYekcFZY
         qJYApoXY1xtVN+hJRtWUmZj6VtAKoihTn8B3R/blOE++CLI2qroUx/10tuhQ56aImoqF
         8C881wG6PT+s22vcEfgEhA5uJU1bUVqpo+EEpqHFAlWPUeubPkPNBEhKcO0X9LxQCwxF
         kQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682133475; x=1684725475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro9WxBg3nAsMPx4XvKLNPdXQpuH038dO7bV4dlzLzyM=;
        b=DzL4s3Gv18EN9SDrAOyxIqvZML6VO6KXowMouGAwlSGrB2OM+l3B0wlflDd5gk7H4j
         41/W/qntOd/ipOYtDxjbWyG9tOeuS0TPRcqXHjo2IMgUJTg4XWT1AsRgA7LVXLUooh51
         F8gkznS8xbtGvAoHEZEW7vE0pFlD3j1rnBxrbwrFzfyuSCOoxPTH82pD4qfxDrzz7BZi
         VL8LLE9RVNVcZ0WsW0fEdmU4/RrFkMbDbpt6WXzZxstZs7F6rX3z+HIWQPBAPGrDOeMg
         NrIwTEmZzOxoZJfJx1HvmNDjMbXo6oPxSIJvSJIlKYSSfRIXpPpd4F3RAbUAInCms633
         RZCg==
X-Gm-Message-State: AAQBX9fDFbP/kcwJbXYgvKfFclLXcvVEeCS+4eGVmuQaz05LkI0RiSFx
	WPFFPj0Uhp5pwRDejI8qzo0=
X-Google-Smtp-Source: AKy350ahrxtMfvGaOr/CB/BRc/hQA+C6Ggm3IkcnUj5nQb6eRkPlyvwmkRxMb9/q89kqCUBlY+qMfQ==
X-Received: by 2002:a17:902:a989:b0:1a6:5575:9059 with SMTP id bh9-20020a170902a98900b001a655759059mr6736489plb.62.1682133474789;
        Fri, 21 Apr 2023 20:17:54 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-89.three.co.id. [180.214.233.89])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b001a661000398sm3287567pll.103.2023.04.21.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 20:17:54 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 83E371068A8; Sat, 22 Apr 2023 10:17:50 +0700 (WIB)
Date: Sat, 22 Apr 2023 10:17:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Carlos Bilbao <carlos.bilbao@amd.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ardb@kernel.org, kraxel@redhat.com, dovmurik@linux.ibm.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	Dhaval.Giani@amd.com, michael.day@amd.com,
	pavankumar.paluri@amd.com, David.Kaplan@amd.com, Reshma.Lal@amd.com,
	Jeremy.Powell@amd.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alexander.shishkin@linux.intel.com, thomas.lendacky@amd.com,
	tglx@linutronix.de, dgilbert@redhat.com, dinechin@redhat.com,
	linux-coco@lists.linux.dev, berrange@redhat.com, mst@redhat.com,
	tytso@mit.edu, jikos@kernel.org, joro@8bytes.org, leon@kernel.org,
	richard.weinberger@gmail.com, lukas@wunner.de, jejb@linux.ibm.com,
	cdupontd@redhat.com, jasowang@redhat.com, sameo@rivosinc.com,
	bp@alien8.de, seanjc@google.com, security@kernel.org
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat
 model
Message-ID: <ZENR3go7UFkd7/0a@debian.me>
References: <20230327141816.2648615-1-carlos.bilbao@amd.com>
 <ZCQVmIKXWXX2xvo-@kroah.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3g8wlG6vw73gCno8"
Content-Disposition: inline
In-Reply-To: <ZCQVmIKXWXX2xvo-@kroah.com>


--3g8wlG6vw73gCno8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 12:40:24PM +0200, Greg KH wrote:
> > +   * - Guest malicious configuration
> > +     - A malicious host modifies one of the following guest's
> > +       configuration:
> > +
> > +       1. Guest firmware or bootloader
> > +
> > +       2. Guest kernel or module binaries
> > +
> > +       3. Guest command line parameters
> > +
> > +       This allows the host to break the integrity of the code running
> > +       inside a CoCo guest and violate the CoCo security objectives.
>=20
> So hosts are not allowed to change this?  I don't understand the use of
> "violate" here, sorry.

I think the situation described above is when malicious actors gain
control of a CoCo host.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--3g8wlG6vw73gCno8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZENR2AAKCRD2uYlJVVFO
ox5gAQDr0xDZcHVst4ZSWAsItsLfu4e/paGzNVDkaipTysmkPgEA5zp3+WfbAkW+
XHdKvwKTa9cvmJFockTMXNcdcO9C4gI=
=yGwU
-----END PGP SIGNATURE-----

--3g8wlG6vw73gCno8--
