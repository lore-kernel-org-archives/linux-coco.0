Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF201168
	for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 17:53:34 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id q190so2891505qkd.2
        for <linux-coco@lists.linux.dev>; Wed, 21 Jul 2021 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yFvLCK83EARCEJW2USL66XPk2Snwg9rOn4V8eQnKq4=;
        b=LmYH4vBpP8tsrP/2QQX/a4c4LvuM1+b4/24JikG+Eg3ffRRWq1sLdvVWqmdZSpffFs
         zYMHn1k1Y7JSxueTKglktRFPafjcur+BGgT8Ux3LXzZB1CNjBqPF55WMoTS3UHR/naUy
         5HN4fHlgHkJlsYXgo1YafStP4kmIs1l/2txFBajcHQd5DgvTLQTHypzSg1u2dEsyWtNa
         1Gnt5R/qqXAZ4zGACvt2zRiwgMwtDzYJEII9SZ5Ev6ztWv9+tg0z29/yQFcibOFahdej
         SPDfQhV5wiSgG/WdTlqfqtvyXLh0cVDvfnKvx7ZZJF7FSQsGy43aezRKof8MJZkcTPGM
         o0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6yFvLCK83EARCEJW2USL66XPk2Snwg9rOn4V8eQnKq4=;
        b=qhr6lUyeEtS31G4Gf7RSMDNDuRx/RhFBbAjiItWqwR2E5KvP+Hv/UA6GHfbbOJIwv5
         W6uJT2gvSwEQY5IFa2adM/vrydfNbuLTTgPxlYdZkeXhasJmThFGLth6egJ/3Fu5RI34
         FUiUadNHBZtbOp0BMGMsgTXWpOrUiY6GGRO2L0u5O2b+On8EBTuT0eEEH8OqBUSmUouO
         S3tm+2MpRs8vSSG0mM7AEBc3UTfFyQS8YCRQ0vcL5l2DduLmJlkG2Cyd9YxzwRgabhhC
         UiSI/1ssw6W7cmMlIP2Oqi39wCVASfGPrBkH5aHVm8uMOx/OlUjCbwqLQS1u0FZyFama
         mS1g==
X-Gm-Message-State: AOAM530/zUSvnSVqhgRCgqrH0SaC9N64i3iOp9wTUffKalu8AlKOvEsv
	RGV19M1zbc2k6+gsE+rpwnnToejeTyl+zq6XUOQANQ==
X-Google-Smtp-Source: ABdhPJzkyyOAFQakNLKPpJl5joOFjae/AcNTO5l2I8TPcjJJXSsAIKXc+xGIz33Gsbm9HQbKLCjKhxqfB9nnHVogi3Y=
X-Received: by 2002:a37:8044:: with SMTP id b65mr22312539qkd.150.1626890013396;
 Wed, 21 Jul 2021 10:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210707183616.5620-1-brijesh.singh@amd.com> <20210707183616.5620-27-brijesh.singh@amd.com>
 <YPHpk3RFSmE13ZXz@google.com> <9ee5a991-3e43-3489-5ee1-ff8c66cfabc1@amd.com> <YPWuVY+rKU2/DVUS@google.com>
In-Reply-To: <YPWuVY+rKU2/DVUS@google.com>
From: Marc Orr <marcorr@google.com>
Date: Wed, 21 Jul 2021 10:53:22 -0700
Message-ID: <CAA03e5EW1HUZW7xWbMyYMC1Q+A18G=91qfKT-ew=X0XNGHbVtg@mail.gmail.com>
Subject: Re: [PATCH Part2 RFC v4 26/40] KVM: SVM: Add KVM_SEV_SNP_LAUNCH_FINISH
 command
To: Sean Christopherson <seanjc@google.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com, 
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 9:54 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Jul 16, 2021, Brijesh Singh wrote:
> >
> > On 7/16/21 3:18 PM, Sean Christopherson wrote:
> > > On Wed, Jul 07, 2021, Brijesh Singh wrote:
> > >> +  data->gctx_paddr = __psp_pa(sev->snp_context);
> > >> +  ret = sev_issue_cmd(kvm, SEV_CMD_SNP_LAUNCH_FINISH, data, &argp->error);
> > > Shouldn't KVM unwind everything it did if LAUNCH_FINISH fails?  And if that's
> > > not possible, take steps to make the VM unusable?
> >
> > Well, I am not sure if VM need to unwind. If the command fail but VMM decide
> > to ignore the error then VMRUN will probably fail and user will get the KVM
> > shutdown event. The LAUNCH_FINISH command finalizes the VM launch process,
> > the firmware will probably not load the memory encryption keys until it moves
> > to the running state.
>
> Within reason, KVM needs to provide consistent, deterministic behavior.  Yes, more
> than likely failure at this point will be fatal to the VM, but that doesn't justify
> leaving the VM in a random/bogus state.  In addition to being a poor ABI, it also
> makes it more difficult to reason about what is/isn't possible in KVM.

+1 to Sean's feedback to unwind everything here properly here.
Comments of the nature of "XYZ should happen" -- without a test (e.g.,
selftest or kvm-unit-test) to ensure the XYZ _does_ happen -- are a
time bomb waiting to happen.

Also, I wonder if we leave pages, RMPUPDATE'd to immutable in previous
loop iterations, is it possible for them to remain as immutable and be
reused later on (after this guest is destroyed)? And if this happens,
will we get an RMP violation? Even if the answer is no -- go read this
code 2,000 lines away -- it handles this case. That's still not a very
satisfying answer. I'd rather see things cleaned up ASAP as soon as
the code starts to go off the rails.
