Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1603D3BC
	for <linux-coco@lists.linux.dev>; Mon, 20 May 2024 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716246932; cv=none; b=kUiqsSU0DmiLN+e69tcZUSaCrd27pov0xaasE6K/5iFgx6k+75QTUGSafrxvOH5xzvGGx2+5qsN9aSDaCamGXkHGr1u6smvkxIICZc031DV8KdN9a22IWHs87J/Zm2ntTIejP96jFsMsZbV/iiAqDKMhmewMH8R+LJHRsgR7xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716246932; c=relaxed/simple;
	bh=9UKSTyxeIo7ms1MzG6LVINnuAwbI4QebTI1VvbPk+cs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hIqEo5DtKtfPQTiszc9+PLIZMHrqGPVtKGAxSOVtqZV4lrKDIDJGULFWUX3kd+N3W9LfSsWOAwZ4P8UvM5Hv9R1exx6dVpQJ8rMQRDsntDa6xEwHPC6Txqooa65RkASfTD3vdHqHK2f5doBjsrqn3za6CdF3vNo3JeBlKZ97ca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hg+4yw0Y; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hg+4yw0Y"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5d8df7c5500so10206749a12.2
        for <linux-coco@lists.linux.dev>; Mon, 20 May 2024 16:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716246930; x=1716851730; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=twyGBTDDHaKdZ8SvbyxDVnqYzF64Bkyy6CUrxLoAK6Y=;
        b=hg+4yw0YDf3d5JiSA4NUk/pWycPLA3FvL4cesm7p3b3P4jrIel7Nw0eQyno7wreoph
         fsF1DC087M8/sFFKfp1WuJYfd2G6UB/rsBRqLFcDfY1Vw8tmWFORhhEnyz4pheqAjPxu
         qT0kWqXn5JtIBiF2/nLtI50agX0kpF3P0+FjWeDUERcPPfQKjz027amvAJvIAGCIPFzU
         W6TZG3E/4M5XLhHb//Xix0qbCg1Ic7O6sEkmZ9uo5sp4NMI+JrUpAZPS9zsY/hzx7dWG
         iJm5Rralx/hTw+Y+Naic38M9gDNJVm/DDfVf7LYlOMkkjlHwX5KCn6A2zf9Rza2c9uJq
         5LqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716246930; x=1716851730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twyGBTDDHaKdZ8SvbyxDVnqYzF64Bkyy6CUrxLoAK6Y=;
        b=IxByK9kCT/qW8GYjPs+oZvdYnYDh3+IJqTVBKA2+oHSTmwBN1l/FtX7IiXTCnrRoo8
         1oEE6LfkmURyITLNkaE5LZooDztdTLCarmSAHlMU0S4b3dDwUmEV3Ne5DGEira34jsBz
         NRew/MjOFcvvNMBCDDYsZJ+OjGMvujmhUkkwKjUW0bb539EQ6klfuFn7XYjoXd4Vywp9
         PsDOo8WDTYzqFc8HoSJkB53Yj7Ei6PAzBrpJkqfVwZxhxQrsoBxMkU9UKMD960sGLZVe
         ztSwPRgDkWYsNFNiFvyiribpnmJJrNJxJwGCAilJhI8m4LmfLW6ta/Z15TtJvgHw3Qfg
         8sMA==
X-Forwarded-Encrypted: i=1; AJvYcCW1CpwXZKu0BmX8GGBU0ncb+1qyW8xPTU9B99tN7dFlGp4uaLYSoEPxB+cXn7FKq2cqEJzAZ6pBRV2q7SXo67FAqkAceK/kFGm5fw==
X-Gm-Message-State: AOJu0YxtL+cVpRKdqlhXuV5wf7Bu/WOdK/5UwxMArbCJ0u9e4hVge+AP
	+I6ctlH9Zvm/61rInv6Rb3uvFXrZlH1mxS29hPBj8RQtZEjM8nfBKjIcejhiH4mSPx27fXJDjLE
	pcQ==
X-Google-Smtp-Source: AGHT+IEb1f5CvIuuxXv4wmgiPRrmKycduR1sWh9xhUNpPR81OBtrrM1PtIOQ9UT8e0m4a7A35MqsxNzI03I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:688:b0:655:199c:eb1b with SMTP id
 41be03b00d2f7-655199cebe4mr46923a12.10.1716246930361; Mon, 20 May 2024
 16:15:30 -0700 (PDT)
Date: Mon, 20 May 2024 16:15:28 -0700
In-Reply-To: <e771a7ba-0445-483e-9c42-66bd5b331dce@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240501085210.2213060-14-michael.roth@amd.com> <41d8ba3a48d33de82baa67ef5ee88e5f8995aea8.camel@intel.com>
 <ZkuJ27DKOCkqogHn@google.com> <e771a7ba-0445-483e-9c42-66bd5b331dce@intel.com>
Message-ID: <ZkvZkPvHqqPnVa9k@google.com>
Subject: Re: [PATCH v15 13/20] KVM: SEV: Implement gmem hook for initializing
 private pages
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"tobin@ibm.com" <tobin@ibm.com>, "liam.merwick@oracle.com" <liam.merwick@oracle.com>, 
	"alpergun@google.com" <alpergun@google.com>, Tony Luck <tony.luck@intel.com>, 
	"jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, 
	"ak@linux.intel.com" <ak@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"pgonda@google.com" <pgonda@google.com>, 
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, "slp@redhat.com" <slp@redhat.com>, 
	"rientjes@google.com" <rientjes@google.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"nikunj.dadhania@amd.com" <nikunj.dadhania@amd.com>, Jorg Rodel <jroedel@suse.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, "kirill@shutemov.name" <kirill@shutemov.name>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 21, 2024, Kai Huang wrote:
> On 21/05/2024 5:35 am, Sean Christopherson wrote:
> > On Mon, May 20, 2024, Kai Huang wrote:
> > > I am wondering whether this can be done in the KVM page fault handler?
> > 
> > No, because the state of a pfn in the RMP is tied to the guest_memfd inode,
> > not to the file descriptor, i.e. not to an individual VM.
> 
> It's strange that as state of a PFN of SNP doesn't bind to individual VM, at
> least for the private pages.  The command rpm_make_private() indeed reflects
> the mapping between PFN <-> <GFN, SSID>.

s/SSID/ASID

KVM allows a single ASID to be bound to multiple "struct kvm" instances, e.g.
for intra-host migration.  If/when trusted I/O is a thing, presumably KVM will
also need to share the ASID with other entities, e.g. IOMMUFD.

> 	rc = rmp_make_private(pfn_aligned, gfn_to_gpa(gfn_aligned),
> 			level, sev->asid, false);
>
> > And the NPT page tables are treated as ephemeral for SNP.
> 
> Do you mean private mappings for SNP guest can be zapped from the VM (the
> private pages are still there unchanged) and re-mapped later w/o needing to
> have guest's explicit acceptance?

Correct.

> If so, I think "we can zap" doesn't mean "we need to zap"?

Correct.

> Because the privates are now pinned anyway.

Pinning is an orthogonal issue.  And it's not so much that the pfns are pinned
as it is that guest_memfd simply doesn't support page migration or swap at this
time.

Regardless of whether or not guest_memfd supports page migration, KVM needs to
track the state of the physical page in guest_memfd, e.g. if it's been assigned
to the ASID versus if it's still in a shared state.

> If we truly want to zap private mappings for SNP, IIUC it can be done by
> distinguishing whether a VM needs to use a separate private table, which is
> TDX-only.

I wouldn't say we "want" to zap private mappings for SNP, rather that it's a lot
less work to keep KVM's existing behavior (literally do nothing) than it is to
rework the MMU and whatnot to not zap SPTEs.  And there's no big motivation to
avoid zapping because SNP VMs are unlikely to delete memslots.

If it turns out that it's easy to preserve SNP mappings after TDX lands, then we
can certainly go that route, but AFAIK there's no reason to force the issue.
