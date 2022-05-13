Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013120F3
	for <linux-coco@lists.linux.dev>; Fri, 13 May 2022 05:34:13 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2feb8eac315so1521777b3.3
        for <linux-coco@lists.linux.dev>; Thu, 12 May 2022 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzuLZkvGtBtGQw1pDL6vVc7H+kdQt/J9TPee+0oSim0=;
        b=aJUNIyh0bt3QZBpNiFdkambzLl3faJNTEzhdur1OgekhYmVwx4JYk0LTXQcg+OFwzx
         tgWk34RcWG8/Y4/7fPJJ1tzImbyE1MXVgT1f/btb2jmoOI03bWLr3qJsQbJ0poQdQQph
         eQvRtlvKAdyr82raWhu+JQi2JNaKpAbyuZYMA4jCcoXxv3sHPJpenbeWg2gOCUq8QR7l
         Id3os4GVb0FoGWuliBiz4c2TXNY1sV5sApK6JdyfvfH2WSD/RIT+54qt4Yd7/Z7Phj20
         04xEmautD+SZxJB9aakX8kR52XAMIniucHIOgzuPJYUXP/RRj1fxItIHfNvmlh+TXQ0Y
         dVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzuLZkvGtBtGQw1pDL6vVc7H+kdQt/J9TPee+0oSim0=;
        b=Fp75npGqeWEIOPQCvbo2uvikQyiTKgwYIVWpxkkao+aW8BXi0uCD5MLi/4iSPN9nVl
         I6S/7Eo8oQVQ+TYPsljtSBzBN3GU0CTVbRhKcgYlITV/2VFMYuT9z+AkLmX6Z9sVsYJS
         iCGg87jnUTiRXX8QtxsDIyzBrLPOdnOF7YPQXn/gDp+19YC+IILxyybV5bAlr4eRTrdn
         gzo2T9+Sc35VidURYsqrRU10kTqgCmt7HycU+aIzNHvr91J9efiarJd7S3dHL1sVlM6B
         2lpx1Ri1Mz0lKwBppd05QoC4VUeZDVzs9A5K0W1OWulL09WM7L75CFgMYmNAmu1bFe6R
         ePCQ==
X-Gm-Message-State: AOAM531VmiksmoCnmuHb+gnownTxumYmqSXiocqchREtDUOhc8LSKdoU
	tAOeb6zXtY7yYnQp0kpyX5aKDWMiTPmKLZTV21q7yg==
X-Google-Smtp-Source: ABdhPJzbvJITAyF9pezasvdbf9Ebv/WVdiqeWUMVoaO1Sw2Z4IgmSKbjl1gIk4rgrnQk4UVM1yDalurYFkxnnMGZV0c=
X-Received: by 2002:a0d:db43:0:b0:2f8:9a:8c1d with SMTP id d64-20020a0ddb43000000b002f8009a8c1dmr3941612ywe.72.1652420052877;
 Thu, 12 May 2022 22:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-7-kirill.shutemov@linux.intel.com> <YnE4ZzzVrxUnr3Uv@zn.tnic>
 <20220506153013.e6v4q2qhuhqumfiu@box.shutemov.name> <YnpGnMoviGoK4Ucq@zn.tnic>
In-Reply-To: <YnpGnMoviGoK4Ucq@zn.tnic>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 12 May 2022 22:34:02 -0700
Message-ID: <CAAH4kHYRxgUNnGRUO473q02q3akLzgiTvbA2qKEP5jq6jFV-uA@mail.gmail.com>
Subject: Re: [PATCHv5 06/12] x86/boot/compressed: Handle unaccepted memory
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Dave Hansen <dave.hansen@intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, x86@kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Kirill, I've been tracking these changes to see if we can handle the
unaccepted memory type for SEV-SNP, but testing has been an issue. The
proposed patch in Ovmf to introduce unaccepted memory seems to have
stalled out last September
(https://www.mail-archive.com/devel@edk2.groups.io/msg35842.html) and
is particularly difficult to adapt to SEV-SNP since it doesn't follow
the TDVF way of initializing all memory. Is there a different
development I might have missed so that we might test these cases?
Without the UEFI introducing EFI_UNACCEPTED_MEMORY type, any kernel
uses are essentially dead code.

Thanks,
-Dionna

(apologies for repost in text mode)

On Tue, May 10, 2022 at 4:04 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, May 06, 2022 at 06:30:13PM +0300, Kirill A. Shutemov wrote:
> > I find it harder to follow.
>
> If in doubt, always consider using a helper function:
>
> ---
>
> diff --git a/arch/x86/boot/compressed/efi.h b/arch/x86/boot/compressed/efi.h
> index 7db2f41b54cd..cf475243b6d5 100644
> --- a/arch/x86/boot/compressed/efi.h
> +++ b/arch/x86/boot/compressed/efi.h
> @@ -32,6 +32,7 @@ typedef       struct {
>  } efi_table_hdr_t;
>
>  #define EFI_CONVENTIONAL_MEMORY                 7
> +#define EFI_UNACCEPTED_MEMORY          15
>
>  #define EFI_MEMORY_MORE_RELIABLE \
>                                 ((u64)0x0000000000010000ULL)    /* higher reliability */
> diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
> index 28b91df9d31e..39bb4c319dfc 100644
> --- a/arch/x86/boot/compressed/kaslr.c
> +++ b/arch/x86/boot/compressed/kaslr.c
> @@ -671,6 +671,23 @@ static bool process_mem_region(struct mem_vector *region,
>  }
>
>  #ifdef CONFIG_EFI
> +
> +/*
> + * Only EFI_CONVENTIONAL_MEMORY and EFI_UNACCEPTED_MEMORY (if supported) are guaranteed
> + * to be free.
> + */
> +static inline bool memory_type_is_free(efi_memory_desc_t *md)
> +{
> +       if (md->type == EFI_CONVENTIONAL_MEMORY)
> +               return true;
> +
> +       if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
> +               if (md->type == EFI_UNACCEPTED_MEMORY)
> +                       return true;
> +
> +       return false;
> +}
> +
>  /*
>   * Returns true if we processed the EFI memmap, which we prefer over the E820
>   * table if it is available.
> @@ -723,21 +740,9 @@ process_efi_entries(unsigned long minimum, unsigned long image_size)
>                  * free memory and thus available to place the kernel image into,
>                  * but in practice there's firmware where using that memory leads
>                  * to crashes.
> -                *
> -                * Only EFI_CONVENTIONAL_MEMORY and EFI_UNACCEPTED_MEMORY (if
> -                * supported) are guaranteed to be free.
>                  */
> -
> -               switch (md->type) {
> -               case EFI_CONVENTIONAL_MEMORY:
> -                       break;
> -               case EFI_UNACCEPTED_MEMORY:
> -                       if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
> -                               break;
> +               if (!memory_type_is_free(md))
>                         continue;
> -               default:
> -                       continue;
> -               }
>
>                 if (efi_soft_reserve_enabled() &&
>                     (md->attribute & EFI_MEMORY_SP))
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette



-- 
-Dionna Glaze, PhD (she/her)
