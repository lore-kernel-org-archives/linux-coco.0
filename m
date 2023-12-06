Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2F62A
	for <linux-coco@lists.linux.dev>; Wed,  6 Dec 2023 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qe5BIH/u"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54c79cca895so5382a12.0
        for <linux-coco@lists.linux.dev>; Tue, 05 Dec 2023 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701823395; x=1702428195; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CGpNMJzqHfBBmrth6e1MGteUUzf7hdy/lyzvmA95dY=;
        b=qe5BIH/u3hghFlSNofJFwNFAi2rR7/9t5VXKtSiJIof+TpZzj+M8QfgfsyNybsVm0g
         Zl17H4Yh7fFz2TI4QDPRXUPT72v43+PntWWMkNiTWPxP8UYlpuplWcNc8+FXmGXz7R4B
         ZhuojoNmnunZ7uos1E3WDdEopliVrsglO/zzDAeKuHB9O9AXrB/0yuduIfBiQ2iB78Z5
         /weVv7opaNS7EauQ14pO0aL2DlMamuw+KON28wB8U+cB1QMCnJjrjoAcSDfcHQTPTxk6
         rULxisqM3M6FdGTOTkdrnmcIwN4ZXp0KE6y/rd5KnU9KLpgHw964VIWacAhH0XN6Yr9d
         7Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701823395; x=1702428195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CGpNMJzqHfBBmrth6e1MGteUUzf7hdy/lyzvmA95dY=;
        b=ofMkqhEr37qw5riYAlZNczgoqLgCmqlsoCxzFgwAND2ZvP8Jb+VADTfEGZAq7vzDpE
         SdSmlVsXESsZZzJVLqBkBIIa1DWW+55nfAOGA1DTYLbupjV6x/TmepbSCbE0cwbI793+
         oyzcASnZGiq+7t6flZdZrMHxL46uz3fN16RUhpTkLAooVQ8xWEUN/uO+greOyv9Br4uW
         gYapTOHPGLnfkC70qt+d/W07N6LdNy+v2vY15P6uVAKunmj20I+5YBYPMG03qIIyvxtZ
         ZdY5PKB89+jSC4pFuZZD9+WGV4+QtKYjbnSjh8ncbZuyPblW6tGnIYYnEJ7SHqKTuSqd
         HDvQ==
X-Gm-Message-State: AOJu0Yz9QFhRNlplu9AzyI6i27sgLw+pM+Nre2Qsl6bpSDI6YfzMIyXs
	UMwO8TC92dWrCDOBIwk+5eN7WA636J1JeArKKS/mOg==
X-Google-Smtp-Source: AGHT+IHnxQI+DCFCxmScTp7bseun1ubBzYz2vloVjxDiicjaclByuyc4HtX+jd86aOQ5xnHQeVkN+gBTvB5g8n8nI7I=
X-Received: by 2002:a50:c35d:0:b0:54c:79ed:a018 with SMTP id
 q29-20020a50c35d000000b0054c79eda018mr44800edb.2.1701823394564; Tue, 05 Dec
 2023 16:43:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZS614OSoritrE1d2@google.com> <b9da2fed-b527-4242-a588-7fc3ee6c9070@amd.com>
 <ZS_iS4UOgBbssp7Z@google.com> <20231110220756.7hhiy36jc6jiu7nm@amd.com>
 <ZU6zGgvfhga0Oiob@google.com> <CAAH4kHYPAiS+_KKhb1=8q=OkS+XBsES8J3K_acJ_5YcNZPi=kA@mail.gmail.com>
 <656e6f0aa1c5_4568a29451@dwillia2-xfh.jf.intel.com.notmuch>
 <CAAH4kHb7cfMetpC=AYy=FjTTve6g0W8NZdeSwQ8uVxkqi2491Q@mail.gmail.com>
 <656f82b4b1972_45e012944e@dwillia2-xfh.jf.intel.com.notmuch>
 <CAAH4kHb9O9FeaTmNuNAkhrdrDLJPo8qgD5vNow3w-sY-DA4Ung@mail.gmail.com> <656fae221bf90_45e01294d2@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <656fae221bf90_45e01294d2@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 5 Dec 2023 16:43:03 -0800
Message-ID: <CAAH4kHY0Bcq+nCLhX6XrqkR=Jb7eYcC+61n6F1J5qamOZxn4bA@mail.gmail.com>
Subject: Re: [PATCH v10 48/50] KVM: SEV: Provide support for SNP_GUEST_REQUEST
 NAE event
To: Dan Williams <dan.j.williams@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>, 
	Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, vkuznets@redhat.com, jmattson@google.com, 
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com, 
	pgonda@google.com, peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, zhi.a.wang@intel.com, 
	Brijesh Singh <brijesh.singh@amd.com>, dan.middleton@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> So it's not only SBOM that you are concerned about, but instead want to
> have a one stop shop for auxiliary evidence and get the vendors agree on
> following the same GUID+blob precedent that is already there for the AMD
> cert chain? That sounds reasonable, but I still feel it should be
> limited to things that do not fit into an existing ABI namespace.
>

The tl;dr is I want something simple for a hard problem and I'll
probably lose this argument.

The unfortunate state of affairs here is that it is "vendor dependent"
whatever pathway they choose to provide reference material for
attestations. Even with the RATS framework, "reference value provider"
is just a bubble in a diagram and not a federated service protocol
that we've all agreed on. TCG's recommendation for delivering the RIM
in the efi volume doesn't quite work in the cloud setting, since
images own that and not us as the firmware provider. There's no
standard for how to inform a user where to get a RIM other than that
:(

> ...unless its evidence / material that only a TVM would ever need.

There's the rub. Evidence may be provided to the TVM to forward to
verifiers, but really it's the verifiers that are tasked with
gathering all this attestation collateral. The TVM doesn't have to do
anything, even provide machine-specific certificates. That's pretty
dreadful system design though, since you end up with global services
in your hot path rather than getting cached data from the machine
you're getting an attestation from. My first stab at it is to just
have a storage bucket with objects named based on expected measurement
values, so you just construct a URL and download the endorsement if
you need it. I'd really rather just make that part of what the guest
can get from auxblob since they pay the bandwidth of forwarding it to
verifiers rather than my cost center paying for the storage bucket
bandwidth (is this the real reason I'm pushing on this? I'm unsure).

If you're instead asking if this information would need to get piped
to a non-TVM (say, a non-confidential VM with a virtual TPM), then the
answer is maa~aaa~aaybe but probably not. PCR0 in the cloud really
needs its own profile, since the TCG platform firmware profile (PFP)
is unsuitable. There's not a whole lot of point delivering a signed
endorsement of a firmware measurement that we don't include in the
event log anyway for stability reasons, even if that's against the PFP
spec. So probably not. I think we're pretty clear that host-cached
data would only need to be for TVMs.

If you ask the folks I've been talking to at Intel or NVIDIA, they'd
probably say to put a service in your dependencies and be done with
it; it's the vendor's responsibility to provide an available enough
service to provide all the evidence that an attestation verifier may
want. That's quite unfriendly to the smaller players in the field, but
maybe it's easy to integrate with something like Veraison's
endorsement provisioning API [1] or Intel's Trust Authority (n=C3=A9e
Project Amber). I haven't done it.

[1] https://github.com/veraison/docs/tree/main/api/endorsement-provisioning

--=20
-Dionna Glaze, PhD (she/her)
