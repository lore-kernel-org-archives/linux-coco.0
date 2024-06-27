Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF39199246
	for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502504; cv=none; b=RxPeGIDHKncKzqHbeGaUyInOsa1fnNZ4vo1CKnA/x2eM9FbLn6WGc6I21PCdyXMM4Z73bZXq2kFHlcKok8iEyE6fj/+xAka65LImaklmsVH2jN8qaud0QyZWH2ms37MXm+/xIXjbl/3X83lGBfyT91WOBPtL6+K5JhB2seodprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502504; c=relaxed/simple;
	bh=B4B+7Qegfc8xqRAIl73gUCcFR/R5LPG8JWLBvTTX94w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eXYft0SRNQHte4WyLCa3cm/Qx0GLAae2dvcEGpf10KfyNF8125PfN8VPNbT5GUgo2CJuuFIS5EK+uVKcXOnw1DcjnxacmgpWSUaRDUv348XM/EacsoBvPIYnK/v5iq+xysR6jYZfLYVIGxpolFToejti/fBe3VRVa/taBafG+40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JoMkFn51; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JoMkFn51"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfeff1ae480so15047235276.2
        for <linux-coco@lists.linux.dev>; Thu, 27 Jun 2024 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719502502; x=1720107302; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwfQmZ9NIpbsBfaBGly2IYRr+v7gRdeIIwzA8stq+iM=;
        b=JoMkFn518G3Gx3IyHamxOYLvNFW8JI3JwjgbPhSMiIGLQdrqRv0BsfcxGHWezl6+Ff
         0VHhG+pwRB18Uu0smirvEE/swiqULCZuzGkqIBz/XEun8sCgCv+p3BK3w5K6ETmIGIYN
         nZ8l0Wbtio4uLN0JF60C8HNho+EFq05lZmW8K0VA91ZrdyBxfdK4Mj5kOK+bnSIuwQo0
         44GTrFWGPqj7i5qbs5drW0B7ZVhBZsWrEcvAf4Uidr+yH671ZFLgtZul3Zx9L987/ZS+
         Ups7bfNXXFqTX+v3DTElPsF6Ad3L8h3i60xwRUf9vFZ2keSR8nH5TW4XQWb9RGWKJV8n
         B5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502502; x=1720107302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwfQmZ9NIpbsBfaBGly2IYRr+v7gRdeIIwzA8stq+iM=;
        b=EqR2u4vF81rf9ldeJ8PPJBGBOAFJJNlTiUTYVGN0MUzXI90ahLR7asUh4oYlTYuESD
         h2KudODht0NbG7Ursqw46MEKwTUBdavDII7gR+TjJ9xE0RR1Bc7a3w5TMcjBOaEmOPM/
         S68aZuJ0rkpKOzqNHXPs3sesdFwOC5HXdv+RyMeh0bgrPKVL47lvfVaftpzCdDXxiqPO
         TKiZDVFuTX29Hh6ByNpTeSSZtyIqjGMNZ7klUiBtbMEmElYwFgAvmBR6oegWbKLNG1aq
         ddn52Lk4hoJ2HPNo6wM7+q8LD4rsYGHmkWnPG5S9JI+28q9M5ppmU4XQUBiPes5b2qbl
         fM7A==
X-Forwarded-Encrypted: i=1; AJvYcCXhXx5NCjYan3sSf+RsL04Jm86zCTFEnzgbi+Sh1fbSb2Y5JcolrQqdYbc6VNHlsF+NoCeuhoMbskc5zHp0tiWoZWYpTQ4NIThxCw==
X-Gm-Message-State: AOJu0Ywb/ouuCm0AfmoIMEbpFcnxojIzbWh553N2+BmVFsEQXbkH8z3Q
	NGcHAlZk7BJr2pZbhRz7Q6ELEw3iLD5T0yft2Dz+Vnqi+JV3bHy+cD3XKVmGmySaaUiUHzfc5Nw
	xDQ==
X-Google-Smtp-Source: AGHT+IHEi2Jyn7G4AkqbarTu97kFAUKrcEOi465mYHsg50AqIgEPtVFdPWfoFGoEoYmptmXIFg5d8pn8ivU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b84:b0:e02:c739:367 with SMTP id
 3f1490d57ef6-e0303fe4816mr697575276.13.1719502502278; Thu, 27 Jun 2024
 08:35:02 -0700 (PDT)
Date: Thu, 27 Jun 2024 08:35:00 -0700
In-Reply-To: <87320ee5-8a66-6437-8c91-c6de1b7d80c1@amd.com>
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
 <ZnxyAWmKIu680R_5@google.com> <87320ee5-8a66-6437-8c91-c6de1b7d80c1@amd.com>
Message-ID: <Zn2GpHFZkXciuJOw@google.com>
Subject: Re: [PATCH v1 1/5] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	jroedel@suse.de, pgonda@google.com, ashish.kalra@amd.com, bp@alien8.de, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 27, 2024, Tom Lendacky wrote:
> On 6/26/24 14:54, Sean Christopherson wrote:
> > On Wed, Jun 26, 2024, Michael Roth wrote:
> >>> What about the host kernel though?  I don't see anything here that ensures resp_pfn
> >>> isn't "regular" memory, i.e. that ensure the page isn't being concurrently accessed
> >>> by the host kernel (or some other userspace process).
> >>>
> >>> Or is the "private" memory still accessible by the host?
> >>
> >> It's accessible, but it is immutable according to RMP table, so so it would
> >> require KVM to be elsewhere doing a write to the page,
> > 
> > I take it "immutable" means "read-only"?  If so, it would be super helpful to
> > document that in the APM.  I assumed "immutable" only meant that the RMP entry
> > itself is immutable, and that Assigned=AMD-SP is what prevented host accesses.
> 
> Not quite. It depends on the page state associated with the page. For
> example, Hypervisor-Fixed pages have the immutable bit set, but can be
> read and written.
> 
> The page states are documented in the SNP API (Chapter 5, Page
> Management):

Heh, but then that section says:

  Pages in the Firmware state are owned by the firmware. Because the RMP.Immutable
                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^
  bit is set, the hypervisor cannot write to Firmware pages nor alter the RMP entry
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with the RMPUPDATE instruction.

which to me very clearly suggests that the RMP.Immutable bit is what makes the
page read-only.

Can you ask^Wbribe someone to add a "Table 11. Page State Properties" or something?
E.g. to explicitly list out the read vs. write protections and the state of the
page's data (encrypted, integrity-protected, zeroed?, etc).  I've read through
all of "5.2 Page States" and genuinely have no clue as to what protections most
of the states have.

Ah, never mind, I found "Table 15-39. RMP Memory Access Checks" in the APM.  FWIW,
that somewhat contradicts this blurb from the SNP ABI spec:

  The content of a Context page is encrypted and integrity protected so that the
  hypervisor cannot read or write to it.

I also find that statement confusing.  IIUC, the fact that the Context page is
encrypted and integrity protected doesn't actually have anything to do with the
host's ability to access the data.  The host _can_ read the data, but it will get
ciphertext.  But the host can't write the data because the page isn't HV-owned.

Actually, isn't the intregrity protected part wrong?  I thought one of the benefits
of SNP vs. ES is that the RMP means the VMSA doesn't have to be integrity protected,
and so VMRUN and #VMEXIT transitions are faster because the CPU doesn't need to do
as much work.
