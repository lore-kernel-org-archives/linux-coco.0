Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BE8809
	for <linux-coco@lists.linux.dev>; Wed,  1 Feb 2023 18:22:40 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C97791EC0426;
	Wed,  1 Feb 2023 19:22:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1675275751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=LK1P/CMLNeISz/c0nlGst2RWi/0NZ0o/BpvrK0rFx2Q=;
	b=OFXvmyKPcyconiHwMNrgQAUNOb0dhANdfQjhsK1+Kr8nj9iA+ITBUH/1kjILD7uoP/A/d9
	G3Jihf+k44XEUC+K34HG/rOGRbCMHMbFe0JMSFsqVnG2UGxr1YUgSM2sL+g+LqvF1lO6NK
	poXHV6aglKBiEyXYXfKUQsOYwEpKe+s=
Date: Wed, 1 Feb 2023 19:22:31 +0100
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
	Nikunj A Dadhania <nikunj@amd.com>
Subject: Re: [PATCH RFC v7 11/64] KVM: SEV: Support private pages in
 LAUNCH_UPDATE_DATA
Message-ID: <Y9qt50zW+eJcz7cm@zn.tnic>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-12-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221214194056.161492-12-michael.roth@amd.com>

On Wed, Dec 14, 2022 at 01:40:03PM -0600, Michael Roth wrote:
> From: Nikunj A Dadhania <nikunj@amd.com>
> 
> Pre-boot guest payload needs to be encrypted and VMM has copied it

"has to have copied it over" I presume?

> over to the private-fd. Add support to get the pfn from the memfile fd
> for encrypting the payload in-place.

Why is that a good thing?

I guess with UPM you're supposed to get the PFN of that encrypted guest
payload from that memslot.

IOW, such commit messages are too laconic for my taste and you could try
to explain more why this is happening instead of me having to
"reverse-deduce" what you're doing from the code...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
