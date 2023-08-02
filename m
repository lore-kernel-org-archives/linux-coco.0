Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DAB7488
	for <linux-coco@lists.linux.dev>; Wed,  2 Aug 2023 14:01:35 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-c647150c254so1729983276.1
        for <linux-coco@lists.linux.dev>; Wed, 02 Aug 2023 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690984894; x=1691589694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LWQhgcpOHDr1rw8y2Xbv/aNJIPmCPmv4Y4vUkSeErdM=;
        b=qhpzbe5SFqOiIrHvQHgOqDoxegwElVej3r0xmxwLd7SQG26HPdgavSHYZak5haXn9H
         U2y0MbkYKjUUoIEop6x4GmtgEWy4X+ks6QSZ7elCQFh0Hws/FnbZ4c35mRi4TvSy0OSq
         en/oMx6ixoQO5YXiQoJUwVrO79aK3kMZPWkxxa5SQCS2XGh32xSlFQbEueGyeBGfVjl9
         7emEzrJhp9MnBpKQDwqxXLupfKVS946VBgivBYdx3hitHZL+2WiHcKbQkAVCOYp/YbsM
         J7QmMs5q2nFKRn1/OVlAj5aaMCgTZrMjxi0as2SRoKyIF0VQBUKpk/cdKRxsmbGI1zu6
         TArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690984894; x=1691589694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWQhgcpOHDr1rw8y2Xbv/aNJIPmCPmv4Y4vUkSeErdM=;
        b=ghrgMF39KxH8hKhe+4dh2HpoDFGpryN92aRPoIHPrjYGm8saQAeLckg7+sqRu+bGst
         FwDx6eOwRAVySl1+8lVrvuMA8Mg1c4hBnSophjRRmKu2ErOvi8XQ8sjOQSNY+cXnO7Kn
         I958o93iKSL7nqQC8b8xBYsXqFKiKof3eDtY9QiydirR9GhkRGZfPIvprjseM2hkyO/7
         p0aibtr2LYqn9nHgYPKaLD0JNqEGcrOopYaEpymrr5SBeGs5HX3xKnC6rwkxN3IpSsDl
         17VDgLvRFN3ktjBRLdY6T9BGwxm0k0mDbPXzU2RkCVY+kT49Gy6RH+7dsHI5ELOyVoP8
         IJjg==
X-Gm-Message-State: ABy/qLZ3K2d4cfTKXmNBIB3pg8/3O6cbYrNZrBVuhqzqPj2pvhsBK00G
	5nTYvBS6tzv6mF3ZwtXKfmZpp5p53/0=
X-Google-Smtp-Source: APBJJlHg+Xe6hYniFjo5V5A9YHAm4vVueRG5AdwMAFAOIdfDulVy0asCFDgtH1f/gmpKpCh5WHs9WGMyhbQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:11cb:b0:d16:7ccc:b406 with SMTP id
 n11-20020a05690211cb00b00d167cccb406mr187562ybu.5.1690984894557; Wed, 02 Aug
 2023 07:01:34 -0700 (PDT)
Date: Wed, 2 Aug 2023 07:01:32 -0700
In-Reply-To: <ZMpEUVsv5hSmrcH8@iZuf6hx7901barev1c282cZ>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <8eb933fd-2cf3-d7a9-32fe-2a1d82eac42a@mail.ustc.edu.cn>
 <ZMfFaF2M6Vrh/QdW@google.com> <4ebb3e20-a043-8ad3-ef6c-f64c2443412c@amd.com>
 <544b7f95-4b34-654d-a57b-3791a6f4fd5f@mail.ustc.edu.cn> <ZMpEUVsv5hSmrcH8@iZuf6hx7901barev1c282cZ>
Message-ID: <ZMphvF+0H9wHQr5B@google.com>
Subject: Re: [Question] int3 instruction generates a #UD in SEV VM
From: Sean Christopherson <seanjc@google.com>
To: Wu Zongyo <wuzongyo@mail.ustc.edu.cn>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 02, 2023, Wu Zongyo wrote:
> On Mon, Jul 31, 2023 at 11:45:29PM +0800, wuzongyong wrote:
> > 
> > On 2023/7/31 23:03, Tom Lendacky wrote:
> > > On 7/31/23 09:30, Sean Christopherson wrote:
> > >> On Sat, Jul 29, 2023, wuzongyong wrote:
> > >>> Hi,
> > >>> I am writing a firmware in Rust to support SEV based on project td-shim[1].
> > >>> But when I create a SEV VM (just SEV, no SEV-ES and no SEV-SNP) with the firmware,
> > >>> the linux kernel crashed because the int3 instruction in int3_selftest() cause a
> > >>> #UD.
> > >>
> > >> ...
> > >>
> > >>> BTW, if a create a normal VM without SEV by qemu & OVMF, the int3 instruction always generates a
> > >>> #BP.
> > >>> So I am confused now about the behaviour of int3 instruction, could anyone help to explain the behaviour?
> > >>> Any suggestion is appreciated!
> > >>
> > >> Have you tried my suggestions from the other thread[*]?
> > Firstly, I'm sorry for sending muliple mails with the same content. I thought the mails I sent previously 
> > didn't be sent successfully.
> > And let's talk the problem here.
> > >>
> > >>    : > > I'm curious how this happend. I cannot find any condition that would
> > >>    : > > cause the int3 instruction generate a #UD according to the AMD's spec.
> > >>    :
> > >>    : One possibility is that the value from memory that gets executed diverges from the
> > >>    : value that is read out be the #UD handler, e.g. due to patching (doesn't seem to
> > >>    : be the case in this test), stale cache/tlb entries, etc.
> > >>    :
> > >>    : > > BTW, it worked nomarlly with qemu and ovmf.
> > >>    : >
> > >>    : > Does this happen every time you boot the guest with your firmware? What
> > >>    : > processor are you running on?
> > >>    :
> > Yes, every time.
> > The processor I used is EPYC 7T83.
> > >>    : And have you ruled out KVM as the culprit?  I.e. verified that KVM is NOT injecting
> > >>    : a #UD.  That obviously shouldn't happen, but it should be easy to check via KVM
> > >>    : tracepoints.
> > >
> > > I have a feeling that KVM is injecting the #UD, but it will take instrumenting KVM to see which path the #UD is being injected from.
> > >
> > > Wu Zongyo, can you add some instrumentation to figure that out if the trace points towards KVM injecting the #UD?
> > Ok, I will try to do that.
> You're right. The #UD is injected by KVM.
> 
> The path I found is:
>     svm_vcpu_run
>         svm_complete_interrupts
> 	    kvm_requeue_exception // vector = 3
> 	        kvm_make_request
> 
>     vcpu_enter_guest
>         kvm_check_and_inject_events
> 	    svm_inject_exception
> 	        svm_update_soft_interrupt_rip
> 		    __svm_skip_emulated_instruction
> 		        x86_emulate_instruction
> 			    svm_can_emulate_instruction
> 			        kvm_queue_exception(vcpu, UD_VECTOR)
> 
> Does this mean a #PF intercept occur when the guest try to deliver a
> #BP through the IDT? But why?

I doubt it's a #PF.  A #NPF is much more likely, though it could be something
else entirely, but I'm pretty sure that would require bugs in both the host and
guest.

What is the last exit recorded by trace_kvm_exit() before the #UD is injected?
