Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7972
	for <linux-coco@lists.linux.dev>; Thu, 23 Sep 2021 20:55:12 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id q26-20020a4adc5a000000b002918a69c8eeso2569716oov.13
        for <linux-coco@lists.linux.dev>; Thu, 23 Sep 2021 13:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuAuDbYoqWTX1qLGSlEdN/vEAB2ogbMYztyFItd+EBc=;
        b=kffc8Bs2M9fmas9cVTmc2dxOYcmX43mfJnInRmBRfKL4ci0Ra/Ed4N8E9aIVQqSA24
         y6quxScpBT1ZO+7locgf2IBsBtTWSV1MKNtI2oVT4do2OZeKdRz10YZCGL/52KyupAbV
         8aWkm3j9u3p+CMwFtEy2BYAl++cwlQPKQPEbredKllWpQDcZG0YCswdFmrI0IV65882C
         QrAs7PCAcggjX4Ld0w7WKDz9iYcyrX72CHPj2bDCzmi5ujt9pcaMq+9eQgQMIWSurH2G
         Eys/T351rHFPil0fxp9pW01KjxiNyz8ucX3AGU0NrklTz5k2qrrM1pH/hsaX+WoH5gj0
         HvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuAuDbYoqWTX1qLGSlEdN/vEAB2ogbMYztyFItd+EBc=;
        b=vjikXLLC5PJGqDhIf5c41RX+77IPYhUj7B088R2jUeIipRfURrbhj1vJlyjWU513M6
         a6IRnu09SK0j0BJkk1SLrqUjRFGvep2RsPQUa4KqAU8mXIXo3PcQQBdieNWo8+yu14ei
         OT4p4p3eL4qQbSo24OrelvFPXvJ6/HWElPqqbH/AmdRSlwAoGkrwqNrjkNWiDU8YVGIU
         vfzrMejNIfU3E1uE7RZ7DGejAcdJuXU67rzbWH8WnQE2H0NqdKw8oje4jxSia+GfWoX5
         KyagxI0xlt+FibgZASUSVsjF2zyT8UwQ33Qp/VLbGu222Eyz9C2Fx3/gfaArijkRAOXd
         I7rA==
X-Gm-Message-State: AOAM533O+57sm1HMUeBnWi0JmlKZA2zfdy+P/QqNG1K9vv5YzF0SsVNr
	RMi+ICg+gUAqWxRa0iKf3AhMwGLR8De+pSFQ9nEPJA==
X-Google-Smtp-Source: ABdhPJyrQCd4do4odQK5DYKgmv7IsQ+AMJhA+BxnQq44T7hGl3RRh3tzoKAYCmy4S2uMMD9KFjWXH8MfmAL80dEIdbw=
X-Received: by 2002:a4a:7452:: with SMTP id t18mr5499065ooe.20.1632430511717;
 Thu, 23 Sep 2021 13:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820155918.7518-1-brijesh.singh@amd.com> <20210820155918.7518-22-brijesh.singh@amd.com>
 <YUt8KOiwTwwa6xZK@work-vm> <b3f340dc-ceee-3d04-227d-741ad0c17c49@amd.com>
 <CAA03e5FTpmCXqsB9OZfkxVY4TQb8n5KfRiFAsmd6jjvbb1DdCQ@mail.gmail.com> <9f89fce8-421a-2219-91d0-73147aca4689@amd.com>
In-Reply-To: <9f89fce8-421a-2219-91d0-73147aca4689@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 23 Sep 2021 13:55:00 -0700
Message-ID: <CAA03e5EOb1=ndtroDw=mZgfCBPJ5OOEYLDLBxrBKrhZb=WtWAQ@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 21/45] KVM: SVM: Make AVIC backing, VMSA and VMCB
 memory allocation SNP safe
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, x86 <x86@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
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

On Thu, Sep 23, 2021 at 1:44 PM Brijesh Singh <brijesh.singh@amd.com> wrote:
>
>
> On 9/23/21 2:17 PM, Marc Orr wrote:
>
> >>>> +
> >>>> +struct page *snp_safe_alloc_page(struct kvm_vcpu *vcpu)
> >>>> +{
> >>>> +    unsigned long pfn;
> >>>> +    struct page *p;
> >>>> +
> >>>> +    if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))
> >>>> +            return alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> > Continuing my other comment, above: if we introduce a
> > `snp_globally_enabled` var, we could use that here, rather than
> > `cpu_feature_enabled(X86_FEATURE_SEV_SNP)`.
>
>
> Maybe I am missing something, what is wrong with
> cpu_feature_enabled(...) check ? It's same as creating a global
> variable. The feature enabled bit is not set if the said is not
> enabled.  See the patch #3 [1] in this series.
>
> [1]
> https://lore.kernel.org/linux-mm/YUN+L0dlFMbC3bd4@zn.tnic/T/#m2ac1242b33abfcd0d9fb22a89f4c103eacf67ea7
>
> thanks

You are right. Patch #3 does exactly what I was asking for in
`snp_rmptable_init()`. Thanks!
