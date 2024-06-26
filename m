Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64EE18FDAD
	for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422028; cv=none; b=Y1+utjRbZVvg7j/4iIzo6ECPc1SSaX2jetIfXD0H0iDMuLKhvVjAqLnZr9r5+5Fp0ABdj2nY4deUcgB/YImuAotRdYxUjsboDPPIfqFwockDmnJ599XSvPfK2drxiGLXznE2Drh61EjKCQelBNgXm8c89Rk1enlbCH6AHJ4DkiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422028; c=relaxed/simple;
	bh=7+9pW6VPOl8JWdal9zejXeZCcwzeiZ8F+LDpocNBT84=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=STlyyjX+v+v2vl5jHjpRUFD6OVFNig1il4yOGJYvnJYgY1CVNXGKhPLmsAhbpX+iDELfd4Kytht4ekidkUIR2BiT0csBtF0wmJJtnxjTwD91W0cx+G9EQdHDUNfxylkPsstf5I1RTjxLNquB3hSJZQ5kILz1aBOX9tGatn8F8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cP9VTRox; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cP9VTRox"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6344d164c35so150273737b3.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719422026; x=1720026826; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq1NG/a/h0TZsAI2XZ3QDBZsq03pVAcY6r8Z/zu7ZOc=;
        b=cP9VTRox7kZYPvgVjSldIpm+ZbfEYLuKNUsXl8s3k6XGX5UDIIrRCD1/M8aZk9whWm
         QuIIMCtAcXbPMkUwoZaIEI36yyIKzieKZGOxA2hhReQAKJvNTMjD1+NyJxiSuSH35Hhj
         WLMaKQ9kdAWYbluGrCpw30slKPBUxiMv+dWRwrdPgh9Ws+/650HbTxw7Da12Y8iW95LA
         lva/AxBws/0sqtCN18Wdnlik2pzCR4YtkgPdYFeYV3A/XQMZB8Pdr8F8H17zR+iR3/Wv
         GJjefjI2+8054tSQwNqkU/QcrmWdTCZVyIA+cIRYhxLRaiqkTeRcwtdeXegGFe4QeVza
         tYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422026; x=1720026826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq1NG/a/h0TZsAI2XZ3QDBZsq03pVAcY6r8Z/zu7ZOc=;
        b=UrHzp/0/uQsLdtFoK0x3eTRMjZgOjBmHrMcWTPHw+NBHRcQQrUmaN6O+CLFzbObvIU
         fy+LEeugNR1kMgRltNpwFxeQALpguccQgRnPGI18qxo0pYiYyEvyj6Sl8f/6FcsnEgFO
         txWnYGwsfCYq+wCpg/ZhSJG+qiZ+6KP/alKfyFSGnFoZXbIjjzHbzVv685FWXO6nA9fz
         7nQQJPHttiu7vcpC8DRLyniMo8SpR/2vAzX2IuDiPYDojQ4YvI9rl+rUjOOQf9DRPQK3
         R2ZTClJqHowCg3+ljUVRA/pGV1tzcV3TS12XBLviUiNMvyAwGLNbLTS+9sqA4QC6434c
         evyw==
X-Forwarded-Encrypted: i=1; AJvYcCUgdZeE4GLfQGoe3lQbL/YuyVgQvKMBfd0WHpRH32paUk1mGo1x9vm3My0TAfKI579tDg5W2lQ2XoJoPCgEL1y0Ly0se2V2/9uYPA==
X-Gm-Message-State: AOJu0Yy4EXKKRCrlmvV59wxpSaqQ8csvorg5I5vt/YOXqr8Su0qrbgkW
	vdXNaOFe7TDZtZ/ctgCIK3K0VFkWZOF6lSixVUILOP2obkB/DpKh8zL5tiy1g87PchfMbvsqDr3
	gKw==
X-Google-Smtp-Source: AGHT+IHHUDL9hDTLZC5TAs8wuSJPSHFY0Nrwjw6weKSINDSTSt97JYC+ahGMUQji6YGhsKw/AdUVsE713nI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6e0d:b0:631:d4ea:3749 with SMTP id
 00721157ae682-643abe41014mr1520537b3.4.1719422025649; Wed, 26 Jun 2024
 10:13:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 10:13:44 -0700
In-Reply-To: <6sczq2nmoefcociyffssdtoav2zjtuenzmhybgdtqyyvk5zps6@nnkw2u74j7pu>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-2-michael.roth@amd.com> <ZnwecZ5SZ8MrTRRT@google.com> <6sczq2nmoefcociyffssdtoav2zjtuenzmhybgdtqyyvk5zps6@nnkw2u74j7pu>
Message-ID: <ZnxMSEVR_2NRKMRy@google.com>
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
> On Wed, Jun 26, 2024 at 06:58:09AM -0700, Sean Christopherson wrote:
> > [*] https://lore.kernel.org/all/20240229025759.1187910-1-stevensd@google.com
> > 
> > > +	if (is_error_noslot_pfn(req_pfn))
> > > +		return -EINVAL;
> > > +
> > > +	resp_pfn = gfn_to_pfn(kvm, gpa_to_gfn(resp_gpa));
> > > +	if (is_error_noslot_pfn(resp_pfn)) {
> > > +		ret = EINVAL;
> > > +		goto release_req;
> > > +	}
> > > +
> > > +	if (rmp_make_private(resp_pfn, 0, PG_LEVEL_4K, 0, true)) {
> > > +		ret = -EINVAL;
> > > +		kvm_release_pfn_clean(resp_pfn);
> > > +		goto release_req;
> > > +	}
> > 
> > I don't see how this is safe.  KVM holds no locks, i.e. can't guarantee that the
> > resp_pfn stays private for the duration of the operation.  And on the opposite
> 
> When the page is set to private with asid=0,immutable=true arguments,
> this puts the page in a special 'firmware-owned' state that specifically
> to avoid any changes to the page state happening from under the ASPs feet.
> The only way to switch the page to any other state at this point is to
> issue the SEV_CMD_SNP_PAGE_RECLAIM request to the ASP via
> snp_page_reclaim().
>
> I could see the guest shooting itself in the foot by issuing 2 guest
> requests with the same req_pfn/resp_pfn, but on the KVM side whichever
> request issues rmp_make_private() first would succeed, and then the
> 2nd request would generate an EINVAL to userspace.
> 
> In that sense, rmp_make_private()/snp_page_reclaim() sort of pair to
> lock/unlock a page that's being handed to the ASP. But this should be
> better documented either way.

What about the host kernel though?  I don't see anything here that ensures resp_pfn
isn't "regular" memory, i.e. that ensure the page isn't being concurrently accessed
by the host kernel (or some other userspace process).

Or is the "private" memory still accessible by the host?

> > resp_pfn stays private for the duration of the operation.  And on the opposite
> > side, KVM can't guarantee that resp_pfn isn't being actively used by something
> > in the kernel, e.g. KVM might induce an unexpected #PF(RMP).
> > 
> > Why can't KVM require that the response/destination page already be private?  I'm
> 
> Hmm. This is a bit tricky. The GHCB spec states:
> 
>   The Guest Request NAE event requires two unique pages, one page for the
>   request and one page for the response. Both pages must be assigned to the
>   hypervisor (shared). The guest must supply the guest physical address of
>   the pages (i.e., page aligned) as input.
> 
>   The hypervisor must translate the guest physical address (GPA) of each
>   page into a system physical address (SPA). The SPA is used to verify that
>   the request and response pages are assigned to the hypervisor.
> 
> At least for req_pfn, this makes sense because the header of the message
> is actually plain text, and KVM does need to parse it to read the message
> type from the header. It's just the req/resp payload that are encrypted
> by the guest/firmware, i.e. it's not relying on hardware-based memory
> encryption in this case.
> 
> Because of that though, I think we could potential address this by
> allocating the req/resp page as separate pages outside of guest memory,
> and simply copy the contents to/from the GPAs provided by the guest.
> I'll look more into this approach.
> 
> If we go that route I think some of the concerns above go away as well,
> but we might still need to a lock or something to serialize access to
> these separate/intermediate pages to avoid needed to allocate them every
> time or per-request.
> 
> > also somewhat confused by the reclaim below.  If KVM converts the response page
> > back to shared, doesn't that clobber the data?  If so, how does the guest actually
> > get the response?  I feel like I'm missing something.
> 
> In this case we're just setting it immutable/firmware-owned, which just
> happens to be equivalent (in terms of the RMP table) to a guest-owned page,
> but with rmp_entry.ASID=0/rmp_entry.immutable=true instead of
> rmp_entry.ASID=<guest asid>/rmp_entry.immutable=false. So the contents remain
> intact/readable after the reclaim.

Ah, I see the @asid=0 now.  The @asid=0,@immutable=true should be a separate API,
because IIUC, this always holds true:

	!asid == immutable

E.g.

static int rmp_assign_pfn(u64 pfn, u64 gpa, enum pg_level level, u32 asid, bool immutable)
{
	struct rmp_state state;

	memset(&state, 0, sizeof(state));
	state.assigned = 1;
	state.asid = asid;
	state.immutable = immutable;
	state.gpa = gpa;
	state.pagesize = PG_LEVEL_TO_RMP(level);

	return rmpupdate(pfn, &state);	
}

/* Transition a page to guest-owned/private state in the RMP table. */
int rmp_make_private(u64 pfn, u64 gpa, enum pg_level level, u32 asid)
{
	if (WARN_ON_ONCE(!asid))
		return -EIO;

	return rmp_assign_pfn(pfn, gpa, level, asid, false);
}
EXPORT_SYMBOL_GPL(rmp_make_private);

/* Transition a page to AMD-SP owned state in the RMP table. */
int rmp_make_firmware(u64 pfn, u64 gpa)
{
	return rmp_assign_pfn(pfn, gpa, PG_LEVEL_4K, 0, true);
}
EXPORT_SYMBOL_GPL(rmp_make_firmware);
