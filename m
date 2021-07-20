Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCC70
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 23:10:09 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id m83so846833pfd.0
        for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 16:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8GS05+M5HxIVJGD8swK1udLTBOXRLN/mWtXb22swtSk=;
        b=fo7zBSNhZlxBGzkz3iTxRF04ETYxLay9z+B74c7Cg9MTGKARF6wNQDL6q+0N/KxSfl
         VLUxHuJ5MJN0JblQC1tyuMrE0i7tLBZmec860Nfc3faibAL9ODWdv+ALf0RFIFpA/S/b
         oWwJwl7NlZhlbe6lDXeTNbXcoYJ0gz7zkzIjgvYilStAlGtFsfG6+ilddzZCoVbvMinJ
         4UoIGGW/+WEgbQlYRMMujTb9gf9UQBmbggDlAOPNeCNkqTA/0AjDbP6zECVsRGVfRl76
         spBal5q+vUjpQpkSSBV+BnecwkN8oJJaVlfvRlMljXTmh0LdiRQYOSaIcfXrZJzLQs6n
         ipWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8GS05+M5HxIVJGD8swK1udLTBOXRLN/mWtXb22swtSk=;
        b=tjz871oDpWCwuywI/0PGbXcKF7fzHWuw/qsfYbAaoy08cgeikB0sGGCIROs50B1N9P
         3DPEJUix2S/eT7J0Lai+dYJ2pnm1SowgORbkCohRx+w+WXH4dW9nC/Th5o2siYQpKI4O
         xL05gpV6wouYpjNKdieI1N4xZXGeAhiHvo8pMpBzC71I2Wv3PVgQySlyLkmWQNwkgdO0
         6/mfLuWxi5o3mbdYca0X95P8EkbRIfPU6mbGIqtu8PCz0vPBIn9r20scR1Szd9GzTSti
         VCL9nxDv3eFhePpkw3gxGF0+ZGPj6ekFCVoW5ofscQQOncL16f3XTA4i8Rp052bQ7wP+
         NNWQ==
X-Gm-Message-State: AOAM533otDFuC63VSswILT/tSVxZFx7PIxXH3xSqhAnmBfyZ3g6uOQSh
	cLDN5/6fkSd+XemrGlcnEflB/TbkbaDdUKqPt10IHg==
X-Google-Smtp-Source: ABdhPJzRYfGoJ4OMK4+YDvysh2ep9yENDjPmZ3bVp/z4TLjM/bNNnaSTdqVgm0u/oD9Rksv6bkICleek0amw+M3BuAs=
X-Received: by 2002:a05:6a00:8c4:b029:2b4:8334:ed4d with SMTP id
 s4-20020a056a0008c4b02902b48334ed4dmr33013122pfu.36.1626822608693; Tue, 20
 Jul 2021 16:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com> <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
In-Reply-To: <aa564856-36c7-ae19-7a82-17638cdf5ec1@linux.intel.com>
From: Erdem Aktas <erdemaktas@google.com>
Date: Tue, 20 Jul 2021 16:09:58 -0700
Message-ID: <CAAYXXYxfpc8ix2dWzsPJ8Ew-fHROKm+WYLemjD1U8cTqzy6BHQ@mail.gmail.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Andi Kleen <ak@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Joerg Roedel <jroedel@suse.de>, 
	David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kaplan, David" <David.Kaplan@amd.com>, 
	Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 10:17 PM Andi Kleen <ak@linux.intel.com> wrote:
>
> First I suspect for crash it's not a real security problem if a
> malicious hypervisor would inject zeroed pages. That means actual strong
> checks against revalidation/reaccept are not needed. That still leaves
> the issue of triggering an exception when the memory is not there. TDX
> has an option to trigger a #VE in this case, but we will actually force
> disable it to avoid #VE in the system call gap. But the standard crash
> dump tools already know how to parse mem_map to distinguish different
> types of pages. So they already would be able to do that. We just need
> some kind of safety mechanism to prevent any crashes, but that should be
> doable. Actually I'm not sure they're really needed because that's a
> root operation.

Just to make sure that I am not confused. We are talking about a
scenario where no private/shared page mapping is transferred between
normal kernel and crash kernel.

It is very hard to identify a security issue without seeing an
implementation but if the crash kernel does not revalidate the memory,
it might use a memory which was not accepted before (for example a
previously shared page) and then it needs to handle EPT-violation #VE
to accept it and now the content is gone. - assuming that we want to
dump all the pages. I might be missing something obvious here but I am
not sure how to crash kernel dumps all the memory when #VE handler is
disabled or without having some private/shared page mapping. Once you
have that #VE handler to accept pages, then VMM can inject zeroed
pages to any location unless the guest keeps track of what has been
accepted before.

> > >> Also in general i don't think it will really happen, at least
> > initially.
> > >> All the shared buffers we use are allocated and never freed. So such a
> > >> problem could be deferred.
> >
> > Does it not depend on kernel configs? Currently, there is a valid
> > control path in dma_alloc_coherent which might alloc and free shared
> > pages.
>
> If the device filter is active it won't.
>

If I am not missing something, I do not see that the device filter
checks for CONFIG_DMA_COHERENT_POOL and if it is not enabled,
dma_alloc_coherent will allocate a regular memory, convert it to
shared and convert it back to private when it is freed.

-Erdem


> > >> At the risk of asking a potentially silly question, would it be
> > >> reasonable to treat non-validated memory as not-present for kernel
> > >> purposes and hot-add it in a thread as it gets validated?
> >
> > My concern with this is, it assumes that all the present memory is
> > private. UEFI might have some pages which are shared therefore also
> > are present.
>
>
> Hot add is nearly always a bad idea.
>
>
> -Andi
>
>
>
