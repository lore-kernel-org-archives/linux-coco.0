Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB81DA43
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Wa8G/9V"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c9da175faaso7270105ad.1
        for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697814800; x=1698419600; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3V/dl8/M0q65AbM9FO9EXQIgvMQ5r2H2FMc2x5re+aA=;
        b=2Wa8G/9Vp4h9u/PMkdS/A/U11stk2FC9xWSG7DanfwulEtoRRKruiD/Cw/fqMhmAvz
         tyAuwHDvhtFmDyici/x82DL+2OQhiLthK+P2RZOZLth4XxfDnuN/ErNTM2qH6AaysqBX
         MtaOERP5HgkLTGonh1yH5qzd023GEnNcSc90IdYndk1AcuvkriH7xPpfWxf5VlmByiZu
         SqXIsOhx7/kXLMN77pLyszdFKBWfPqTWmYQgE8qTlkb50vQ/ulIyNfsEr17DKAb4p+8v
         AEulOmRlmh3VWbGZgTDsAMMo75kKiSrM0l5in77eaisrPPH6w73nuw9Wty7wVtQQyNep
         /IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697814800; x=1698419600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3V/dl8/M0q65AbM9FO9EXQIgvMQ5r2H2FMc2x5re+aA=;
        b=mWuHNb2d0m2xcJCIC6jcqK2cr2EH6tlH2rr2nbVm2nFF0PEnciQtd+NOF2AKwdSD3C
         MILXIw3jug+sjUE8esSjsow57AJ4koz8lkub+9sVLchJXRf/0HlS84g+NcUaVkJfyIft
         Pw2N15N91K5NNSaN5vavGc+wBAQ/C47PrXIxLnVoNNwJMTI7vWb3QF63iXJw5sdKUQNQ
         1BM/6NUAbwM3sSVpAiQ0mSJj4MCX1oPW0qrNzmW60Syxh2rdY78Pr/MVZ2Voz6dR0u6B
         JTQeAX4eZMFkOTyoCEugdhMtVRnR9OJit96cf+aqkct1bt7BYwIVakNihogMhtET5EuN
         NQYg==
X-Gm-Message-State: AOJu0Yx7I2yJDaBcUnsCii7ui0ctSRhycfWxkqC1R2pMLP4t1WAGOLPc
	nbentQN6haRsL9buk2TQ1ALh/laUsQo=
X-Google-Smtp-Source: AGHT+IHj2CnltiuYTZGUURvallHU7NdpsdbRO5EASAoqLjOVj8l+CRE78eMRyOyK3JHzlnarHigshf8H7dA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d346:b0:1c6:d25:8730 with SMTP id
 l6-20020a170902d34600b001c60d258730mr54330plk.0.1697814799716; Fri, 20 Oct
 2023 08:13:19 -0700 (PDT)
Date: Fri, 20 Oct 2023 08:13:18 -0700
In-Reply-To: <eea3a2f0-8aae-435e-b839-3f21c4a8e2e6@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231016132819.1002933-49-michael.roth@amd.com>
 <CAAH4kHb=hNH88poYw-fj+ewYgt8F-hseZcRuLDdvbgpSQ5FDZQ@mail.gmail.com>
 <ZS614OSoritrE1d2@google.com> <b9da2fed-b527-4242-a588-7fc3ee6c9070@amd.com>
 <ZS_iS4UOgBbssp7Z@google.com> <924b755a-977a-4476-9525-a7626d728e18@amd.com>
 <ZTFD8y5T9nPOpCyX@google.com> <2034624b-579f-482e-8a7a-0dfc91740d7e@amd.com>
 <ZTHGPlTXvLnEDbmd@google.com> <eea3a2f0-8aae-435e-b839-3f21c4a8e2e6@amd.com>
Message-ID: <ZTKY18SvZ6lxMsF3@google.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
From: Sean Christopherson <seanjc@google.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, jarkko@kernel.org, ashish.kalra@amd.com, 
	nikunj.dadhania@amd.com, pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 20, 2023, Alexey Kardashevskiy wrote:
> 
> On 20/10/23 11:13, Sean Christopherson wrote:
> > On Fri, Oct 20, 2023, Alexey Kardashevskiy wrote:
> > > Plus, GHCB now has to go via the userspace before talking to the PSP which
> > > was not the case so far (though I cannot think of immediate implication
> > > right now).
> > 
> > Any argument along the lines of "because that's how we've always done it" is going
> > to fall on deaf ears.  If there's a real performance bottleneck with kicking out
> > to userspace, then I'll happily work to figure out a solution.  If.
> 
> No, not performance, I was trying to imagine what can go wrong if multiple
> vcpus are making this call, all exiting to QEMU, in a loop, racing,
> something like this.

I am not at all concerned about userspace being able to handle parallel requests
to get a certificate.  Per-vCPU exits that access global/shared resources might
not be super common, but they're certainly not rare.  E.g. a guest access to an
option ROM can trigger memslot updates in QEMU, which requires at least taking a
mutex to guard KVM_SET_USER_MEMORY_REGION, and IIRC QEMU also uses RCU to protect
QEMU accesses to address spaces.

Given that we know there will be scenarios where certificates are changed/updated,
I wouldn't be at all surprised if handling this in userspace is actually easier
as it will give userspace more control and options, and make it easier to reason
about the resulting behavior.  E.g. userspace could choose between a lockless
scheme and a r/w lock if there's a need to ensure per-VM and global certs are
updated atomically from the guest's perspective.
