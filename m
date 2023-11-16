Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E84CA57
	for <linux-coco@lists.linux.dev>; Thu, 16 Nov 2023 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nj7eHqmZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53eeb28e8e5so4465a12.1
        for <linux-coco@lists.linux.dev>; Wed, 15 Nov 2023 21:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700112708; x=1700717508; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4diCtTL3EivIaKd6Yrty+RIJmvtzTDLTo/nXfRxccPk=;
        b=nj7eHqmZMtvU+rqiEzq9HBzjeFtIz4xnTUk0DV8okpX6MkSG5uBrnf/Idh91eAgnPW
         rgWT2Mo/ROTlnVc/a/PrbfdM66cU6XpN76jRof/Ab4bhsAkXMyCixzsJbLTIbZ5EO/zi
         +cKDde6eeFe41uRas3ouplE/onnI2WZ089KXyJ9WpSjfZdSPHRQOP5a/7U4OXjoRMVL1
         IB7CuZPjEs6LBL9SrfFkxF77aTXrOUDAOgGswHH4mqV96y6M4rtMqZhoSAIw30pdquRC
         U8MJ3cB60OMUt4lsaa6PYtgEhLXxUb6hP6a60p6d6C3pvFgm+hGnBDKv/SsvNOKpz2vW
         vNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700112708; x=1700717508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4diCtTL3EivIaKd6Yrty+RIJmvtzTDLTo/nXfRxccPk=;
        b=Ihe6bCEZTcf/b4Dfhcl4yRQvpsB6Cxpa1wE/N0Y1AQpFFiG0wt/XgO+PjMMhi6e9Q3
         wGk2os3dLoePmRWILQ2QxRRF8zUxCWS2KAWBQ1dbiem9pJ+OSfliEwyc96trJNnfkE5N
         gRCVFBqwma+OUqfWSJn+aw8gxGrRkbdkJnmWsZOMNlg3ICtHaOubOnBzqRkMK1ixqwQT
         4OqPA7nmT6T5dgZ8l6oXBhUrVZ3Dj2tjZgpLZnOGr5C5sbzJQqCDAeqGMoGCNmH8ijsw
         SpdI0cK+1zOCPRWqVdD7M6a5r0HuklTam96b7WovgXXUeqStO80x/sYDFwQEF3TGl3rr
         uelw==
X-Gm-Message-State: AOJu0YyKlXJUKSoJXGsxx/fYYMJqbdvXpP0QxsilmLhoeRZWVewmfeqh
	20VtuETQG4y5G2eQNEbCet99ip6bA2rZRb6/oftsfA==
X-Google-Smtp-Source: AGHT+IGOHarkPwgABVlEMIKneg9bFJeC/Sizgt1g86eNBkXhc6lGj6UX9Rcz+JOCTeiCxNp2DrA60v/aOwz4dSqmSxY=
X-Received: by 2002:a05:6402:1bcb:b0:547:3f1:84e0 with SMTP id
 ch11-20020a0564021bcb00b0054703f184e0mr60685edb.7.1700112707847; Wed, 15 Nov
 2023 21:31:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016132819.1002933-1-michael.roth@amd.com>
 <20231016132819.1002933-49-michael.roth@amd.com> <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
 <ZS614OSoritrE1d2@google.com> <b9da2fed-b527-4242-a588-7fc3ee6c9070@amd.com>
 <ZS_iS4UOgBbssp7Z@google.com> <20231110220756.7hhiy36jc6jiu7nm@amd.com> <ZU6zGgvfhga0Oiob@google.com>
In-Reply-To: <ZU6zGgvfhga0Oiob@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 15 Nov 2023 21:31:34 -0800
Message-ID: <CAAH4kHYPAiS+_KKhb1=8q=OkS+XBsES8J3K_acJ_5YcNZPi=kA@mail.gmail.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
To: Sean Christopherson <seanjc@google.com>
Cc: Michael Roth <michael.roth@amd.com>, Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

> > So we're sort of complicating the more common case to support a more niche
> > one (as far as userspace is concerned anyway; as far as kernel goes, your
> > approach is certainly simplest :)).
> >
> > Instead, maybe a compromise is warranted so the requirements on userspace
> > side are less complicated for a more basic deployment:
> >
> >   1) If /dev/sev is used to set a global certificate, then that will be
> >      used unconditionally by KVM, protected by simple dumb mutex during
> >      usage/update.
> >   2) If /dev/sev is not used to set the global certificate is the value
> >      is NULL, we assume userspace wants full responsibility for managing
> >      certificates and exit to userspace to request the certs in the manner
> >      you suggested.
> >
> > Sean, Dionna, would this cover your concerns and address the certificate
> > update use-case?
>
> Honestly, no.  I see zero reason for the kernel to be involved.  IIUC, there's no
> privileged operations that require kernel intervention, which means that shoving
> a global cert into /dev/sev is using the CCP driver as middleman.  Just use a
> userspace daemon.  I have a very hard time believing that passing around large-ish
> blobs of data in userspace isn't already a solved problem.

ping sathyanarayanan.kuppuswamy@linux.intel.com and +Dan Williams

I think for a uniform experience for all coco technologies, we need
someone from Intel to weigh in on supporting auxblob through a similar
vmexit. Whereas the quoting enclave gets its PCK cert installed by the
host, something like the firmware's SBOM [1] could be delivered in
auxblob. The proposal to embed the compressed SBOM binary in a coff
section of the UEFI doesn't get it communicated to user space, so this
is a good place to get that info about the expected TDMR in. The SBOM
proposal itself would need additional modeling in the coRIM profile to
have extra coco-specific measurements or we need to find some other
method of getting this info bundled with the attestation report.

My own plan for SEV-SNP was to have a bespoke signed measurement of
the UEFI in the GUID table, but that doesn't extend to TDX. If we're
looking more at an industry alignment on coRIM for SBOM formats (yes
please), then it'd be great to start getting that kind of info plumbed
to the user in a uniform way that doesn't have to rely on servers
providing the endorsements.

[1] https://uefi.org/blog/firmware-sbom-proposal



-- 
-Dionna Glaze, PhD (she/her)
