Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324E3FC2
	for <linux-coco@lists.linux.dev>; Fri, 10 Sep 2021 03:30:37 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id r26so1114096oij.2
        for <linux-coco@lists.linux.dev>; Thu, 09 Sep 2021 20:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NNboQ/FR4h0376TGbPOg84fczWq1c0viqJFh4kJpLOo=;
        b=DOWVLWOxYph3rCExJ6yJTlcc1s6U/I3mbRtoHPSRkXdkWwTcFm3mjoOrRLkY4fytA9
         0MyW+YeqXjf9HXZv7TJPKSd7UE3UcCWj+cYfQcBX6vbFByevBmZEuafXo9MXazkUmO5+
         6dwbOE/QzI0XGmZsV3K79MBvd6Y15aDLFALfeAF7kLvp7FeK0AOE2nC30749dih4elGu
         uyZmD0f2M+RK4S7/7YjQaGhoIzOl+g/b1xOBsJ9VA1Fjo2i7MYPJz2Nr3o02fdQOy8SD
         7e3bc8KeQMkMqxK4xNykHuuIxmQoYlWgk6Q2sp0Vb5IG+XeVopue08zLomU9bzVjK+J1
         S4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NNboQ/FR4h0376TGbPOg84fczWq1c0viqJFh4kJpLOo=;
        b=htEXQtV1E86zZMhQWSUoOpP+F9PF3XOSAsUr292fK1igsZCIZFvXJqFCVybP73nEMX
         tZchnjfD0bKNFmq95NxcSo+QxTUvoqVZllFlAGlf6udKb2v30hu0UF2kHLSj7XjjotDh
         xGuj3ohAReCnvxfwBMw7k1vatZwN97Cu19EGi2QyV8+S+2mHk2Cf6S/tro+6RtuJiODE
         bFPw4jG54z0yj6+4q8kyU3uDtEx12z7UNtCteprloOFd6tvIAmttM7UFF+IVgLm3jKz1
         hCr3IPtPJmG7sNVIGDMhRonkiBLsmxy+r3ksmp1RE0uSqLQqVdGPaZvvV51p6S+9eL5q
         NGLg==
X-Gm-Message-State: AOAM533l25P8SmZe0wwezI5m4qWq4d3asemmWGbItNU4mK4qyn+uj3MZ
	5w3MIE+v5WyHzF5wbn12Zn0+yzavzspkYF6tulNq9g==
X-Google-Smtp-Source: ABdhPJyMHOEn4H9rfV4O2+PMzf0ccVbYklwH5xFOd06p1a88RXslpULKUsmN2vs6tHJbgkdkc/h+sJIlfaTplJ4cEtw=
X-Received: by 2002:a05:6808:909:: with SMTP id w9mr2624314oih.164.1631244636311;
 Thu, 09 Sep 2021 20:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820155918.7518-1-brijesh.singh@amd.com> <20210820155918.7518-19-brijesh.singh@amd.com>
In-Reply-To: <20210820155918.7518-19-brijesh.singh@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 9 Sep 2021 20:30:25 -0700
Message-ID: <CAA03e5FMCp7cZLXKPZ53SOUK-cOF+WmGRj256K9=+wivHvTA0Q@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 18/45] crypto: ccp: Provide APIs to query
 extended attestation report
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 9:00 AM Brijesh Singh <brijesh.singh@amd.com> wrote:
>
> Version 2 of the GHCB specification defines VMGEXIT that is used to get
> the extended attestation report. The extended attestation report includes
> the certificate blobs provided through the SNP_SET_EXT_CONFIG.
>
> The snp_guest_ext_guest_request() will be used by the hypervisor to get
> the extended attestation report. See the GHCB specification for more
> details.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  drivers/crypto/ccp/sev-dev.c | 43 ++++++++++++++++++++++++++++++++++++
>  include/linux/psp-sev.h      | 24 ++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index 9ba194acbe85..e2650c3d0d0a 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware.h>
>  #include <linux/gfp.h>
>  #include <linux/cpufeature.h>
> +#include <linux/sev-guest.h>
>
>  #include <asm/smp.h>
>
> @@ -1677,6 +1678,48 @@ int snp_guest_dbg_decrypt(struct sev_data_snp_dbg *data, int *error)
>  }
>  EXPORT_SYMBOL_GPL(snp_guest_dbg_decrypt);
>
> +int snp_guest_ext_guest_request(struct sev_data_snp_guest_request *data,
> +                               unsigned long vaddr, unsigned long *npages, unsigned long *fw_err)
> +{
> +       unsigned long expected_npages;
> +       struct sev_device *sev;
> +       int rc;
> +
> +       if (!psp_master || !psp_master->sev_data)
> +               return -ENODEV;
> +
> +       sev = psp_master->sev_data;
> +
> +       if (!sev->snp_inited)
> +               return -EINVAL;
> +
> +       /*
> +        * Check if there is enough space to copy the certificate chain. Otherwise
> +        * return ERROR code defined in the GHCB specification.
> +        */
> +       expected_npages = sev->snp_certs_len >> PAGE_SHIFT;

Is this calculation for `expected_npages` correct? Assume that
`sev->snp_certs_len` is less than a page (e.g., 2000). Then, this
calculation will return `0` for `expected_npages`, rather than round
up to 1.

> +       if (*npages < expected_npages) {
> +               *npages = expected_npages;
> +               *fw_err = SNP_GUEST_REQ_INVALID_LEN;
> +               return -EINVAL;
> +       }
> +
> +       rc = sev_do_cmd(SEV_CMD_SNP_GUEST_REQUEST, data, (int *)&fw_err);
> +       if (rc)
> +               return rc;
> +
> +       /* Copy the certificate blob */
> +       if (sev->snp_certs_data) {
> +               *npages = expected_npages;
> +               memcpy((void *)vaddr, sev->snp_certs_data, *npages << PAGE_SHIFT);
> +       } else {
> +               *npages = 0;
> +       }
> +
> +       return rc;
> +}
> +EXPORT_SYMBOL_GPL(snp_guest_ext_guest_request);
> +
>  static void sev_exit(struct kref *ref)
>  {
>         misc_deregister(&misc_dev->misc);
> diff --git a/include/linux/psp-sev.h b/include/linux/psp-sev.h
> index 00bd684dc094..ea94ce4d834a 100644
> --- a/include/linux/psp-sev.h
> +++ b/include/linux/psp-sev.h
> @@ -924,6 +924,23 @@ void *psp_copy_user_blob(u64 uaddr, u32 len);
>  void *snp_alloc_firmware_page(gfp_t mask);
>  void snp_free_firmware_page(void *addr);
>
> +/**
> + * snp_guest_ext_guest_request - perform the SNP extended guest request command
> + *  defined in the GHCB specification.
> + *
> + * @data: the input guest request structure
> + * @vaddr: address where the certificate blob need to be copied.
> + * @npages: number of pages for the certificate blob.
> + *    If the specified page count is less than the certificate blob size, then the
> + *    required page count is returned with error code defined in the GHCB spec.
> + *    If the specified page count is more than the certificate blob size, then
> + *    page count is updated to reflect the amount of valid data copied in the
> + *    vaddr.
> + */
> +int snp_guest_ext_guest_request(struct sev_data_snp_guest_request *data,
> +                               unsigned long vaddr, unsigned long *npages,
> +                               unsigned long *error);
> +
>  #else  /* !CONFIG_CRYPTO_DEV_SP_PSP */
>
>  static inline int
> @@ -971,6 +988,13 @@ static inline void *snp_alloc_firmware_page(gfp_t mask)
>
>  static inline void snp_free_firmware_page(void *addr) { }
>
> +static inline int snp_guest_ext_guest_request(struct sev_data_snp_guest_request *data,
> +                                             unsigned long vaddr, unsigned long *n,
> +                                             unsigned long *error)
> +{
> +       return -ENODEV;
> +}
> +
>  #endif /* CONFIG_CRYPTO_DEV_SP_PSP */
>
>  #endif /* __PSP_SEV_H__ */
> --
> 2.17.1
>
