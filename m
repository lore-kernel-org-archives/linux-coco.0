Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8A7C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 00:06:28 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id o23-20020a4ad497000000b0041bd038b4dbso173386oos.4
        for <linux-coco@lists.linux.dev>; Thu, 23 Jun 2022 17:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ztn/U14y4+bLEVfHDiR279Ws4kSCGIatUDLg6ETdSA=;
        b=sE1nWpmur5YxV9tq2Xcbc8zQ7qv68r4grAVVsiWE+Hb5IjzYTfE2kF71zHL669RRu1
         8EOee7QUNQm5IwxycAlLVHbYxsj9/B6zjw6THdaB8U9bCQ04QFEyuYMUqXCJL/VwKgQw
         pERU0qG1+ubCmP0USVfbwqV9mQ7Ae/RYAmO3fT7BMk97N+H1MM15EKJoEsqjc0jqIM4J
         ZmZqKBi+d2WXbVUkR5ZsnAH9c+tnaqZuMUUSeMcuNV+zfEnu/lsMYmuSZtLU8S8UCtss
         yBdMMbxpNC6LgDmkRNH0oPPD4EO3hws1baml0AuV16zVe/kIfr0tuYlgKqK5lM8mR69W
         tMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ztn/U14y4+bLEVfHDiR279Ws4kSCGIatUDLg6ETdSA=;
        b=fNiB+jRHW/k/oqGWbZamdREtR+G2dWz8bftIm3yKkSL36qAbsQDoN7bM5ozGHP/h4j
         dmCcNDwjuDOx/+7T1akOeJU6dTdCfRByooOzAW1elAAJNqX2LPwVuM/dnaVlXc/vLJDT
         fftPIv2x6Fj1L+UrwUp7ShHby6O4YPGxWEeGPrdEmd9qrNIMje+IGS1vXlD3hYYv25qs
         xd4Ptmn3lnD4cEIDMBtOza02fSjnKdLyA8O0pgFsWe7lWUs5SCsIhFuFEzqSXReLZAzQ
         nt2EZlrIMrW+c9nJPD3+nbOp2xgMBxWGoG+/cQLnM0S/5YM5d5Kr3rUNndVXaJ8KrElA
         3v7g==
X-Gm-Message-State: AJIora/QcxHqls91+HHTf9SyS2bHtezP3OdmwruBjCLIazRLrgoP/Q6G
	oW4swkExks1rePdZTs3CBNSC89Az+HJq9EKvG3yyJg==
X-Google-Smtp-Source: AGRyM1v+s5D9Hg1qgXGD+4GvtPs2SxeqIL4O85m4dCEssimCyLkAYn0KyTciSq2Hm2MRqFVC/wqLMIaPXf3Gq+wcLLY=
X-Received: by 2002:a4a:d842:0:b0:41b:c75d:f2dd with SMTP id
 g2-20020a4ad842000000b0041bc75df2ddmr4805823oov.20.1656029187423; Thu, 23 Jun
 2022 17:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <243778c282cd55a554af9c11d2ecd3ff9ea6820f.1655761627.git.ashish.kalra@amd.com>
In-Reply-To: <243778c282cd55a554af9c11d2ecd3ff9ea6820f.1655761627.git.ashish.kalra@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 23 Jun 2022 17:06:16 -0700
Message-ID: <CAA03e5HDxkhV1rnVfPj7W_Hf85JMAG0s8eLKN6hA0n4sCy8tww@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 07/49] x86/sev: Invalid pages from direct map
 when adding it to RMP table
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	"Lendacky, Thomas" <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	"Roth, Michael" <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alper Gun <alpergun@google.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 4:03 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> The integrity guarantee of SEV-SNP is enforced through the RMP table.
> The RMP is used with standard x86 and IOMMU page tables to enforce memory
> restrictions and page access rights. The RMP check is enforced as soon as
> SEV-SNP is enabled globally in the system. When hardware encounters an
> RMP checks failure, it raises a page-fault exception.

nit: "RMP checks ..." -> "RMP-check ..."

>
> The rmp_make_private() and rmp_make_shared() helpers are used to add
> or remove the pages from the RMP table. Improve the rmp_make_private() to
> invalid state so that pages cannot be used in the direct-map after its

nit: "invalid state ..." -> "invalidate state ..."
nit: "... after its" -> "... after they're"

(Here, and in the patch subject too.)

> added in the RMP table, and restore to its default valid permission after

nit: "... restore to its ..." -> "... restored to their ..."

> the pages are removed from the RMP table.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/kernel/sev.c | 61 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index f6c64a722e94..734cddd837f5 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -2451,10 +2451,42 @@ int psmash(u64 pfn)
>  }
>  EXPORT_SYMBOL_GPL(psmash);
>
> +static int restore_direct_map(u64 pfn, int npages)
> +{
> +       int i, ret = 0;
> +
> +       for (i = 0; i < npages; i++) {
> +               ret = set_direct_map_default_noflush(pfn_to_page(pfn + i));
> +               if (ret)
> +                       goto cleanup;
> +       }
> +
> +cleanup:
> +       WARN(ret > 0, "Failed to restore direct map for pfn 0x%llx\n", pfn + i);
> +       return ret;
> +}
> +
> +static int invalid_direct_map(unsigned long pfn, int npages)

I think we should rename this function to "invalidate_direct_map()".

> +{
> +       int i, ret = 0;
> +
> +       for (i = 0; i < npages; i++) {
> +               ret = set_direct_map_invalid_noflush(pfn_to_page(pfn + i));
> +               if (ret)
> +                       goto cleanup;
> +       }
> +
> +       return 0;
> +
> +cleanup:
> +       restore_direct_map(pfn, i);
> +       return ret;
> +}
> +
>  static int rmpupdate(u64 pfn, struct rmpupdate *val)
>  {
>         unsigned long paddr = pfn << PAGE_SHIFT;
> -       int ret;
> +       int ret, level, npages;
>
>         if (!pfn_valid(pfn))
>                 return -EINVAL;
> @@ -2462,11 +2494,38 @@ static int rmpupdate(u64 pfn, struct rmpupdate *val)
>         if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))
>                 return -ENXIO;
>
> +       level = RMP_TO_X86_PG_LEVEL(val->pagesize);
> +       npages = page_level_size(level) / PAGE_SIZE;
> +
> +       /*
> +        * If page is getting assigned in the RMP table then unmap it from the
> +        * direct map.
> +        */
> +       if (val->assigned) {
> +               if (invalid_direct_map(pfn, npages)) {
> +                       pr_err("Failed to unmap pfn 0x%llx pages %d from direct_map\n",
> +                              pfn, npages);
> +                       return -EFAULT;
> +               }
> +       }
> +
>         /* Binutils version 2.36 supports the RMPUPDATE mnemonic. */
>         asm volatile(".byte 0xF2, 0x0F, 0x01, 0xFE"
>                      : "=a"(ret)
>                      : "a"(paddr), "c"((unsigned long)val)
>                      : "memory", "cc");
> +
> +       /*
> +        * Restore the direct map after the page is removed from the RMP table.
> +        */
> +       if (!ret && !val->assigned) {
> +               if (restore_direct_map(pfn, npages)) {
> +                       pr_err("Failed to map pfn 0x%llx pages %d in direct_map\n",
> +                              pfn, npages);
> +                       return -EFAULT;
> +               }
> +       }
> +
>         return ret;
>  }
>
> --
> 2.25.1
>
>
