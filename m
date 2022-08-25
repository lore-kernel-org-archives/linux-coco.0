Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02991363
	for <linux-coco@lists.linux.dev>; Thu, 25 Aug 2022 01:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE1AC433D6;
	Thu, 25 Aug 2022 01:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661390896;
	bh=KdfESfYDLxO2XAcAN1Pjq//nSCmby8cyiRMO36V/AbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYkfrDoHWTFpRb5p6nTiO3yQyNvMZcsTq3EMLESmzSPEkeVE+so6RtzqHZ26eTxPo
	 5TtDY2Uf+WO2U+ngIoj/TYGjXPGfQOz8boctoTqRdyRB8hX9AShjuMfkeZdI8AvfPC
	 TiOS1r3qhW9KmfX0nZMkQTEonf6P9znVtymDGIkeA7Wph89RPjIFo8OLWyOkq1prf8
	 stun41z4QkO06qX1X+c/u46TWG+8XSbqkMYNbwR+vRAF7L+PTzeYC2vWN+Cb8lCBlw
	 +OnwojQFLsyrLoG/y5f13AxsC/ev99sW9ga6mm/mZ6+5CwqVDnywov1anYPMjcUVUb
	 M0D1wC/tvB8TA==
Date: Thu, 25 Aug 2022 04:28:09 +0300
From: "jarkko@kernel.org" <jarkko@kernel.org>
To: Peter Gonda <pgonda@google.com>
Cc: "Kalra, Ashish" <Ashish.Kalra@amd.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, kvm list <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	"Roth, Michael" <Michael.Roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, Tony Luck <tony.luck@intel.com>,
	Marc Orr <marcorr@google.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Alper Gun <alpergun@google.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH Part2 v6 02/49] iommu/amd: Introduce function to check
 SEV-SNP support
Message-ID: <YwbQKeDRQF0XGWo7@kernel.org>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <12df64394b1788156c8a3c2ee8dfd62b51ab3a81.1655761627.git.ashish.kalra@amd.com>
 <CAMkAt6r+WSYXLZj-Bs5jpo4CR3+H5cpND0GHjsmgPacBK1GH_Q@mail.gmail.com>
 <SN6PR12MB2767A51D40E7F53395770DE58EB39@SN6PR12MB2767.namprd12.prod.outlook.com>
 <CAMkAt6qorwbAXaPaCaSm0SC9o2uQ9ZQzB6s1kBkvAv2D4tkUug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMkAt6qorwbAXaPaCaSm0SC9o2uQ9ZQzB6s1kBkvAv2D4tkUug@mail.gmail.com>

On Tue, Jun 21, 2022 at 11:50:59AM -0600, Peter Gonda wrote:
> On Tue, Jun 21, 2022 at 11:45 AM Kalra, Ashish <Ashish.Kalra@amd.com> wrote:
> >
> > [AMD Official Use Only - General]
> >
> > Hello Peter,
> >
> > >> +bool iommu_sev_snp_supported(void)
> > >> +{
> > >> +       struct amd_iommu *iommu;
> > >> +
> > >> +       /*
> > >> +        * The SEV-SNP support requires that IOMMU must be enabled, and is
> > >> +        * not configured in the passthrough mode.
> > >> +        */
> > >> +       if (no_iommu || iommu_default_passthrough()) {
> > >> +               pr_err("SEV-SNP: IOMMU is either disabled or
> > >> + configured in passthrough mode.\n");
> >
> > > Like below could this say something like snp support is disabled because of iommu settings.
> >
> > Here we may need to be more precise with the error information indicating why SNP is not enabled.
> > Please note that this patch may actually become part of the IOMMU + SNP patch series, where
> > additional checks are done, for example, not enabling SNP if IOMMU v2 page tables are enabled,
> > so precise error information will be useful here.
> 
> I agree we should be more precise. I just thought we should explicitly
> state something like: "SEV-SNP: IOMMU is either disabled or configured
> in passthrough mode, SNP cannot be supported".

It really should be, in order to have any practical use:

	if (no_iommu) {
		pr_err("SEV-SNP: IOMMU is disabled.\n");
		return false;
	}

	if (iommu_default_passthrough()) {
		pr_err("SEV-SNP: IOMMU is configured in passthrough mode.\n");
		return false;
	}

The comment is *completely* redundant, it absolutely does
not serve any sane purpose. It just tells what the code
already clearly stating.

The combo error message on the other hand leaves you to
the question "which one was it", and for that reason
combining the checks leaves you to a louse debugging
experience.

BR, Jarkko
