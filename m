Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A8A7A
	for <linux-coco@lists.linux.dev>; Tue, 14 Jun 2022 15:43:53 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id f9so8112923plg.0
        for <linux-coco@lists.linux.dev>; Tue, 14 Jun 2022 08:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v7R3AU8eay3jFLbgOIExfUOsI5EdQhSbQRsdrHwotJw=;
        b=ehHmS6K8XnQ2SrjXe0GbtBVb7v2r/7AcW7sIGGWUjjSMTDgZG99AgHzHG+emgMuy78
         oJg0pzPpvCtiu3YGgen4uTSgcaIQrSr23K6ULxNbRwaPO6Yv/2KLZXVbn7tBDmMEA+JB
         /OEgfzksSH1MA4vy1vX+tyavgxHUWffoUJgQft6aRg+kifewPpPNV53IAZXgkNQBHTWY
         Ql4t/SIvDY0bHTODMSic0GJaxZI6gfqzTzQMvW4xvnj/rmFRw+k9nbzv081yS6sEUTLa
         VSazk4yWTKuGPfHB+dJmXxfbDPgU54AVHMrrKLFMMzFiEc/Rb9mMF6g9UULaB5YLhewT
         nzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v7R3AU8eay3jFLbgOIExfUOsI5EdQhSbQRsdrHwotJw=;
        b=4Gk2qrSWqMfh9/azAiDgISXtK/3zpwA3iKnNYg3CE9K+io7ph1nj+2/pPmgkhO9aup
         HLj2dU46WrBAV7qw8RSJAqN+CyM4NkKAVAq5VCwjE5AGjK1M9O+hZHy4Sh6VvW9DHEgk
         CYIMCRT3FNnVaQmCK808+/YfOhXUHTkcgK7Pp1smI1Zpx2sZ6TTfHDlYu284d5oAnYUr
         3QDZazjOCRjcjMMyqD5dIWY5bLmY1oyEYvL9cELmSfOcpp6SYmXBsgkiwtCTeCSKY794
         mIyPJ1TtNIeppTTSwxpTIL3o6x/H2o+zgAi4HdZOvEie4Vx0ttzOy5gPTXIwRgHOiZnS
         JwPg==
X-Gm-Message-State: AJIora8W1imCX7UJe4S12q8TCvBuVhd0YSPaOm8Ox+ybQKKhKUC8IlWu
	6n7EOtmK0z7gS+dhmN64qolU9Q==
X-Google-Smtp-Source: AGRyM1sSpS8ksQoeFsAiBuqnaVFCfTWw36cqGK81vkz64eI2RfYURAd4rfysk6IagqiDsDg27788vA==
X-Received: by 2002:a17:90a:fd0d:b0:1ea:b661:4fa1 with SMTP id cv13-20020a17090afd0d00b001eab6614fa1mr5238743pjb.46.1655221432801;
        Tue, 14 Jun 2022 08:43:52 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b00165105518f6sm7390006plo.287.2022.06.14.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:43:52 -0700 (PDT)
Date: Tue, 14 Jun 2022 15:43:48 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	brijesh.ksingh@gmail.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v12 19/46] x86/kernel: Make the .bss..decrypted section
 shared in RMP table
Message-ID: <YqistMvngNKEJu2o@google.com>
References: <20220307213356.2797205-1-brijesh.singh@amd.com>
 <20220307213356.2797205-20-brijesh.singh@amd.com>
 <YqfabnTRxFSM+LoX@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqfabnTRxFSM+LoX@google.com>

On Tue, Jun 14, 2022, Sean Christopherson wrote:
> s/Brijesh/Michael
> 
> On Mon, Mar 07, 2022, Brijesh Singh wrote:
> > The encryption attribute for the .bss..decrypted section is cleared in the
> > initial page table build. This is because the section contains the data
> > that need to be shared between the guest and the hypervisor.
> > 
> > When SEV-SNP is active, just clearing the encryption attribute in the
> > page table is not enough. The page state need to be updated in the RMP
> > table.
> > 
> > Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> > ---
> >  arch/x86/kernel/head64.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> > index 83514b9827e6..656d2f3e2cf0 100644
> > --- a/arch/x86/kernel/head64.c
> > +++ b/arch/x86/kernel/head64.c
> > @@ -143,7 +143,20 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp, pmdv
> >  	if (sme_get_me_mask()) {
> >  		vaddr = (unsigned long)__start_bss_decrypted;
> >  		vaddr_end = (unsigned long)__end_bss_decrypted;
> > +
> >  		for (; vaddr < vaddr_end; vaddr += PMD_SIZE) {
> > +			/*
> > +			 * On SNP, transition the page to shared in the RMP table so that
> > +			 * it is consistent with the page table attribute change.
> > +			 *
> > +			 * __start_bss_decrypted has a virtual address in the high range
> > +			 * mapping (kernel .text). PVALIDATE, by way of
> > +			 * early_snp_set_memory_shared(), requires a valid virtual
> > +			 * address but the kernel is currently running off of the identity
> > +			 * mapping so use __pa() to get a *currently* valid virtual address.
> > +			 */
> > +			early_snp_set_memory_shared(__pa(vaddr), __pa(vaddr), PTRS_PER_PMD);
> 
> This breaks SME on Rome and Milan when compiling with clang-13.  I haven't been
> able to figure out exactly what goes wrong.  printk isn't functional at this point,
> and interactive debug during boot on our test systems is beyond me.  I can't even
> verify that the bug is specific to clang because the draconian build system for our
> test systems apparently is stuck pointing at gcc-4.9.
> 
> I suspect the issue is related to relocation and/or encrypting memory, as skipping
> the call to early_snp_set_memory_shared() if SNP isn't active masks the issue.
> I've dug through the assembly and haven't spotted a smoking gun, e.g. no obvious
> use of absolute addresses.
> 
> Forcing a VM through the same path doesn't fail.  I can't test an SEV guest at the
> moment because INIT_EX is also broken.

The SEV INIT_EX was a PEBKAC issue.  An SEV guest boots just fine with a clang-built
kernel, so either it's a finnicky relocation issue or something specific to SME.

> The crash incurs a very, very slow reboot, and I was out of cycles to work on this
> about three hours ago.  If someone on the AMD side can repro, it would be much
> appreciated.
