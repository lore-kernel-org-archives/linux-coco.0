Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5C2F3F
	for <linux-coco@lists.linux.dev>; Sat, 31 Dec 2022 15:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0190C433EF;
	Sat, 31 Dec 2022 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672499808;
	bh=E5b0+Tex/od7yWpcV4nYzqZ1OMql0EqcYI9TkDd+6UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSqK18kqooBPs0gssQK+KGvL8ppzWQrcmlIRDw0J/x8gYG5zyYMHMmw5BQYmcBWfA
	 1RyeGCz4cwim395EYMRaSgqL8Y4a4bJPRO101rH9ojdrTKeLT0drBEX9/aGJFAaPfG
	 mWL5h2IbMNUzK0m/urKGC6o29WOl82x31dd5QBFkeYNoV0DrJxnHQo9JXXJ5SOsYb+
	 h80eq/BXfRnnOcLjtJJsk8f2Dbi6ia0G9j8hv7Z9eBQ1QNPOPOG3ztSUsYfODODaau
	 EMwKhhnmD7WvxIKcjJWWTwrtxdnpWTbvIHSoHu6OQuER6RKfkwZyYTRc9Ida/jxpWe
	 WX+rIU11NRcJQ==
Date: Sat, 31 Dec 2022 15:16:45 +0000
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com,
	pgonda@google.com, peterz@infradead.org,
	srinivas.pandruvada@linux.intel.com, rientjes@google.com,
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, ashish.kalra@amd.com,
	harald@profian.com, Brijesh Singh <brijesh.singh@amd.com>,
	Pavan Kumar Paluri <papaluri@amd.com>
Subject: Re: [PATCH RFC v7 37/64] KVM: SVM: Add KVM_SNP_INIT command
Message-ID: <Y7BSXT5ddtwsnomq@kernel.org>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-38-michael.roth@amd.com>
 <Y7BG6pSuoZsBQYrx@kernel.org>
 <Y7BLfq9TB3iYIUjp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7BLfq9TB3iYIUjp@kernel.org>

On Sat, Dec 31, 2022 at 02:47:29PM +0000, Jarkko Sakkinen wrote:
> A couple of fixups.
> 
> On Sat, Dec 31, 2022 at 02:27:57PM +0000, Jarkko Sakkinen wrote:
> > diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> > index 6c4fdcaed72b..462c9aaa2e7e 100644
> > --- a/drivers/crypto/ccp/sev-dev.c
> > +++ b/drivers/crypto/ccp/sev-dev.c
> > @@ -1381,6 +1381,12 @@ static int __sev_snp_init_locked(int *error)
> >  	if (sev->snp_initialized)
> >  		return 0;
> >  
> > +	if (!sev_version_greater_or_equal(SNP_MIN_API_MAJOR, SNP_MIN_API_MINOR)) {
> > +		dev_dbg(sev->dev, "SEV-SNP support requires firmware version >= %d:%d\n",
> > +			SNP_MIN_API_MAJOR, SNP_MIN_API_MINOR);
> > +		return -ENODEV;
> 
>         return 0;
> 
> It is not a failure case anyway.
> 
> > +	}
> > +
> >  	/*
> >  	 * The SNP_INIT requires the MSR_VM_HSAVE_PA must be set to 0h
> >  	 * across all cores.
> > @@ -2313,25 +2319,19 @@ void sev_pci_init(void)
> >  		}
> >  	}
> >  
> > +	rc = sev_snp_init(&error, true);
> > +	if (rc != -ENODEV)
> 
> 
> if (rc)
> 
> Because other wise there would need to be nasty "if (rc && rc != ENODEV)"
> so that this does not happen:
> 
> [    9.321588] ccp 0000:49:00.1: SEV-SNP: failed to INIT error 0x0
> 
> BR, Jarkko

This patch (not dependent on the series) is kind of related to my
feedback. Since platform init can span from quite many locations
it would be useful to get errors reported from all locations:

https://www.lkml.org/lkml/2022/12/31/175

Would be IMHO good to have this in the baseline when testing SNP init
functionality.

BR, Jarkko
