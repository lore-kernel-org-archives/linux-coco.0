Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99233FA
	for <linux-coco@lists.linux.dev>; Thu,  5 Jan 2023 11:58:03 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9DE7A1EC068E;
	Thu,  5 Jan 2023 12:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1672919870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=rxDSQBwHRnb3E0R5N+GbgGmVgnJfEtgemZ1Yx2+Gk0s=;
	b=fldm+pr1lRU+kw1bGYeepeJ61YDNxYNDV/pcfHJ/IOXUbKH/PN2ZPlU05O6jiGqdCz82ln
	wDA9OdQjMbBD4Z4+ywfQUHpCu0QmJxA4IayDocp0uWJ3TDe1F2JOoeQ0jvYhHYOG5/+hrI
	Ge843g8gWeg+u7ueLcu+wFhZdv+LMBE=
Date: Thu, 5 Jan 2023 12:57:47 +0100
From: Borislav Petkov <bp@alien8.de>
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
	dovmurik@linux.ibm.com, tobin@ibm.com, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
	ashish.kalra@amd.com, harald@profian.com,
	chao.p.peng@linux.intel.com
Subject: Re: [PATCH RFC v7 02/64] KVM: x86: Add
 KVM_CAP_UNMAPPED_PRIVATE_MEMORY
Message-ID: <Y7a7O5VY+EyHPzA+@zn.tnic>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-3-michael.roth@amd.com>
 <Y6RM8RRryLgK8KiB@zn.tnic>
 <20230104174721.wa4detzppqzvsgsy@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230104174721.wa4detzppqzvsgsy@amd.com>

On Wed, Jan 04, 2023 at 11:47:21AM -0600, Michael Roth wrote:
> But maybe it's okay to just make KVM_CAP_MEMORY_ATTRIBUTES writeable and
> require userspace to negotiate it rather than just tying it to
> CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES. Or maybe introducing a new
> KVM_SET_SUPPORTED_MEMORY_ATTRIBUTES ioctl to pair with
> KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES. It sort of makes sense, since userspace
> needs to be prepared to deal with KVM_EXIT_MEMORY_FAULTs relating to these
> attributes.

Makes sense.

AFAICT, ofc.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
