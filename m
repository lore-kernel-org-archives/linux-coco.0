Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E7019149E
	for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719431685; cv=none; b=E2jJMnEaC2UiOYAkdYM8YJWyl3avqAQQGJDZE7Bsgbkx6Yjc9N798xD+H7i90esUirau4UvDMVvbbH4D8c0gKJXKALgWQEIqox9ci8dB4AY+jQtNzL3ZRM2LI5j3zFAGfo004UllZ1VvG4aBP/U9bTuk3V1d7pV+gMdsuAltJ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719431685; c=relaxed/simple;
	bh=UdHTQOSX7Km3cZSiYgkk31AZTE6moQgEO9Q5MH3sEME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ss9g0FqrHNVu/vgeVLIWdKouJ/qZOFx+KLWoM1PEgpbMxBWeXptM0yYKkq8+cYvbBIKqMMWblSKcIf6135e9yK6PLSoxAF/Hzs37LqVOyBj7T6mNTDrcLhechF0ej1vIigVdmyCsaHs4Gh8XkDprdwyZKkIDyB4cB9izlfC8kvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aoQRQ5I/; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aoQRQ5I/"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-63bca8ce79eso150691857b3.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719431683; x=1720036483; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bPUXoB4WicVXeQU5K1G3z57co6ZndiCkVz/lqTR/Pns=;
        b=aoQRQ5I/9ZD2Risn2AaHsy7PlFfdAJpG5kmD2pc8zNCBE1xEobW4u0h9/4PJFU+PXn
         /+htDpgBTttczRcbiMC9LiKee6RGgsqAIRUHXHeO9cs1j4sIfdJ82H1zXRkp/u7SNrLp
         OLfJBJp+uC5IW2biKeNuzqxPqQSD8eP4aUudRuExnBJ1j7jg0HCX6izX8aIxHuHkXi4s
         71rjBNc/UHUmfPYU/oMZ6ixrabv7gS4ecR/UE8ZLSbm5ClCw73qGBUtitzi7obMa81A1
         sryx0FNuET3QQG9ihXK9FxNbPFHRcfbw8BlWSU+xmyF3YFzEsSdXM7VMic7fKvVMd9vC
         QdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719431683; x=1720036483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPUXoB4WicVXeQU5K1G3z57co6ZndiCkVz/lqTR/Pns=;
        b=YhBAGl1k2FZr6S0lFK53TEpfRV0TIH8ga/VWwZzMLs8z6mFhWL5FDISiX/bPVOjf8U
         5/N99Lip8GENWCBuwqEDgivhShfyGev0V/5pwoow1g7TC33oBRhAyXJTH2dVy1RsLQqS
         Vf4gtP+5IErbPFG3JFqNQSNEqG+sTbQ0eTzw3V19xLN/KM2cSJ6QooLcfKS/7+onK42z
         yXtzhwXMmcgfbMjdq8EZ3XZGo+Q5X3TEhHpxgYqy2VLDC1eQVxFMPfBAiTgsEJTriRWq
         tWV77iz6I0O8XT+9eWkvaL9mGn0fe6vNHMr4Y3tTSe7TYG65poo/Bv+qh5YAn8XRFhki
         vHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD1jj7XMYK7h2QiWsC+naclUMx3ILYD85DXIJWUz8N75JywdhAvCe5ICqtg069vpLMLqtFVQjmR69sLa9ETaGHEsrYzu9DTGl0qA==
X-Gm-Message-State: AOJu0Yz3Gxcj8qLxhaw6WN9sia6+P8PvCsrUbjB6i/totWCR8MdTum6j
	CWn/kMhIKBUVOdMWSwFiywKMsg71XWh1TSZRLli0Cxm2d3JGkNTX0m1sGCPFM6iPxfxHf3RBJQ6
	U3Q==
X-Google-Smtp-Source: AGHT+IF/MuePa6kq1/3pH9PDPsT95qNUWlvGn8Hv4+YHMNEXsj8xRxB+BfP0mTgqgttvjciz4uFSvH9s1i8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4c89:0:b0:648:3f93:796e with SMTP id
 00721157ae682-6483fa2bc62mr57577b3.7.1719431683355; Wed, 26 Jun 2024 12:54:43
 -0700 (PDT)
Date: Wed, 26 Jun 2024 12:54:41 -0700
In-Reply-To: <fbzi5bals5rmva3efgdpnljsfzdbehg4akwli7b5io7kqs3ikw@qfpdpxfec7ks>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-2-michael.roth@amd.com> <ZnwecZ5SZ8MrTRRT@google.com>
 <6sczq2nmoefcociyffssdtoav2zjtuenzmhybgdtqyyvk5zps6@nnkw2u74j7pu>
 <ZnxMSEVR_2NRKMRy@google.com> <fbzi5bals5rmva3efgdpnljsfzdbehg4akwli7b5io7kqs3ikw@qfpdpxfec7ks>
Message-ID: <ZnxyAWmKIu680R_5@google.com>
Subject: Re: [PATCH v1 1/5] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, pgonda@google.com, 
	ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com, Brijesh Singh <brijesh.singh@amd.com>, 
	Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 26, 2024, Michael Roth wrote:
> On Wed, Jun 26, 2024 at 10:13:44AM -0700, Sean Christopherson wrote:
> > On Wed, Jun 26, 2024, Michael Roth wrote:
> > > On Wed, Jun 26, 2024 at 06:58:09AM -0700, Sean Christopherson wrote:
> > > > [*] https://lore.kernel.org/all/20240229025759.1187910-1-stevensd@google.com
> > > > 
> > > > > +	if (is_error_noslot_pfn(req_pfn))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	resp_pfn = gfn_to_pfn(kvm, gpa_to_gfn(resp_gpa));
> > > > > +	if (is_error_noslot_pfn(resp_pfn)) {
> > > > > +		ret = EINVAL;
> > > > > +		goto release_req;
> > > > > +	}
> > > > > +
> > > > > +	if (rmp_make_private(resp_pfn, 0, PG_LEVEL_4K, 0, true)) {
> > > > > +		ret = -EINVAL;
> > > > > +		kvm_release_pfn_clean(resp_pfn);
> > > > > +		goto release_req;
> > > > > +	}
> > > > 
> > > > I don't see how this is safe.  KVM holds no locks, i.e. can't guarantee that the
> > > > resp_pfn stays private for the duration of the operation.  And on the opposite
> > > 
> > > When the page is set to private with asid=0,immutable=true arguments,
> > > this puts the page in a special 'firmware-owned' state that specifically
> > > to avoid any changes to the page state happening from under the ASPs feet.
> > > The only way to switch the page to any other state at this point is to
> > > issue the SEV_CMD_SNP_PAGE_RECLAIM request to the ASP via
> > > snp_page_reclaim().
> > >
> > > I could see the guest shooting itself in the foot by issuing 2 guest
> > > requests with the same req_pfn/resp_pfn, but on the KVM side whichever
> > > request issues rmp_make_private() first would succeed, and then the
> > > 2nd request would generate an EINVAL to userspace.
> > > 
> > > In that sense, rmp_make_private()/snp_page_reclaim() sort of pair to
> > > lock/unlock a page that's being handed to the ASP. But this should be
> > > better documented either way.
> > 
> > What about the host kernel though?  I don't see anything here that ensures resp_pfn
> > isn't "regular" memory, i.e. that ensure the page isn't being concurrently accessed
> > by the host kernel (or some other userspace process).
> > 
> > Or is the "private" memory still accessible by the host?
> 
> It's accessible, but it is immutable according to RMP table, so so it would
> require KVM to be elsewhere doing a write to the page,

I take it "immutable" means "read-only"?  If so, it would be super helpful to
document that in the APM.  I assumed "immutable" only meant that the RMP entry
itself is immutable, and that Assigned=AMD-SP is what prevented host accesses.

> but that seems possible if the guest is misbehaved. So I do think the RMP #PF
> concerns are warranted, and that looking at using KVM-allocated
> intermediary/"bounce" pages to pass to firmware is definitely worth looking
> into for v2 as that's just about the safest way to guarantee nothing else
> will be writing to the page after it gets set to immutable/firmware-owned.
