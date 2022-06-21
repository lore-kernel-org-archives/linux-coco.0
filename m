Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61C10E1
	for <linux-coco@lists.linux.dev>; Tue, 21 Jun 2022 15:28:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s14so9137622ljs.3
        for <linux-coco@lists.linux.dev>; Tue, 21 Jun 2022 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPDc7qXBrAf8hM+ois/4M7n9y0Ctx2nTK0cCddntA00=;
        b=Fi5EjLIzvDAJUiiuADLK7DwH7YYV7f0bHceXlX43VOliKsB9BBv4L4DTZlFmLFmkLk
         POofabhBgj7RE3usD0FttRM8D8eDilGLOLPHqgnO8YDVQiE1OoG9dKOP/Dt3N9HP2E97
         pFaXlwW+xYC2rWvtNgYANRwcpOUunAVpIJRCpoGyJRPa7VTijqJgFrS7RPtiWetYUA/S
         nI082qoNoGUD37fI/pZXTw5gtv676RW9g4oemXpkcgvuAWhRvJ3ckQa3MARMB7BRSwwp
         c9I9EW0jqRTQRaIdnXBNrGAivBi4QpIXdTKVVrEiFHYLvbScsPkiQHkbzokqo2gVc8J3
         Pkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PPDc7qXBrAf8hM+ois/4M7n9y0Ctx2nTK0cCddntA00=;
        b=RXGw/1ES65Rh+ND7EGo64kRPILf0dQ3lZ2z99KjXqg7K9IbSWEHDh2psM+zDcXeq2j
         CGe4VJALtm2ZsmBYh2KnSob0YD4DsxMdZTlJaC/FjdRPfQJYrCz8p6y9S7M8yN5fXdSB
         l9qWfxNdC0HXhA1YA1r0Mh+r6DkyWqT03HOFgmEKmjo9dUIVqeYQdhGvoMFINFRM9f60
         +92t/bI2a6Cu+NHn0xUUs+l6GBTxcZ+XjPslDUZh0/FONmcrB69n4NQp2WzFC4kbU9gH
         ZzhxzPQPoEHC4J2UQVV8w0YTD/rnPzej9z25WUfuwTsBSIzSKCDmHnpSADYsVZ/RnmaR
         pZDg==
X-Gm-Message-State: AJIora/sufWjj6pyh7mtKAIRyxlhBATP9c0RfhvU6NOKCVUpHzusNziw
	h7KQHSvSeyhw3ZikRnzqCLaQ3Ls6Fk+m7k3bw8IjTA==
X-Google-Smtp-Source: AGRyM1tCe4/jK6PDAE71M19F4NM9E58kJKDMKB8cBjF0f/1wes7fLBrrgPNVl2oI3WpdVtZrOfMqeKvvJybe5z/2EzA=
X-Received: by 2002:a2e:8091:0:b0:25a:8496:b255 with SMTP id
 i17-20020a2e8091000000b0025a8496b255mr75993ljg.369.1655825296513; Tue, 21 Jun
 2022 08:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <12df64394b1788156c8a3c2ee8dfd62b51ab3a81.1655761627.git.ashish.kalra@amd.com>
In-Reply-To: <12df64394b1788156c8a3c2ee8dfd62b51ab3a81.1655761627.git.ashish.kalra@amd.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 21 Jun 2022 09:28:04 -0600
Message-ID: <CAMkAt6r+WSYXLZj-Bs5jpo4CR3+H5cpND0GHjsmgPacBK1GH_Q@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 02/49] iommu/amd: Introduce function to check
 SEV-SNP support
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	"Lendacky, Thomas" <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, Marc Orr <marcorr@google.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alper Gun <alpergun@google.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 4:59 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> The SEV-SNP support requires that IOMMU must to enabled, see the IOMMU
> spec section 2.12 for further details. If IOMMU is not enabled or the
> SNPSup extended feature register is not set then the SNP_INIT command
> (used for initializing firmware) will fail.
>
> The iommu_sev_snp_supported() can be used to check if IOMMU supports the
> SEV-SNP feature.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  drivers/iommu/amd/init.c | 30 ++++++++++++++++++++++++++++++
>  include/linux/iommu.h    |  9 +++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index 1a3ad58ba846..82be8067ddf5 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -3361,3 +3361,33 @@ int amd_iommu_pc_set_reg(struct amd_iommu *iommu, u8 bank, u8 cntr, u8 fxn, u64
>
>         return iommu_pc_get_set_reg(iommu, bank, cntr, fxn, value, true);
>  }
> +
> +bool iommu_sev_snp_supported(void)
> +{
> +       struct amd_iommu *iommu;
> +
> +       /*
> +        * The SEV-SNP support requires that IOMMU must be enabled, and is
> +        * not configured in the passthrough mode.
> +        */
> +       if (no_iommu || iommu_default_passthrough()) {
> +               pr_err("SEV-SNP: IOMMU is either disabled or configured in passthrough mode.\n");

Like below could this say something like snp support is disabled
because of iommu settings.

> +               return false;
> +       }
> +
> +       /*
> +        * Iterate through all the IOMMUs and verify the SNPSup feature is
> +        * enabled.
> +        */
> +       for_each_iommu(iommu) {
> +               if (!iommu_feature(iommu, FEATURE_SNP)) {
> +                       pr_err("SNPSup is disabled (devid: %02x:%02x.%x)\n",

SNPSup might not be obvious to readers, what about " SNP Support is
disabled ...".

Also should this have the "SEV-SNP:" prefix like the above log?

> +                              PCI_BUS_NUM(iommu->devid), PCI_SLOT(iommu->devid),
> +                              PCI_FUNC(iommu->devid));
> +                       return false;
> +               }
> +       }
> +
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(iommu_sev_snp_supported);
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 9208eca4b0d1..fecb72e1b11b 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -675,6 +675,12 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev,
>  void iommu_sva_unbind_device(struct iommu_sva *handle);
>  u32 iommu_sva_get_pasid(struct iommu_sva *handle);
>
> +#ifdef CONFIG_AMD_MEM_ENCRYPT
> +bool iommu_sev_snp_supported(void);
> +#else
> +static inline bool iommu_sev_snp_supported(void) { return false; }
> +#endif
> +
>  #else /* CONFIG_IOMMU_API */
>
>  struct iommu_ops {};
> @@ -1031,6 +1037,9 @@ static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
>  {
>         return NULL;
>  }
> +
> +static inline bool iommu_sev_snp_supported(void) { return false; }
> +
>  #endif /* CONFIG_IOMMU_API */
>
>  /**
> --
> 2.25.1
>
