Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7563D385
	for <linux-coco@lists.linux.dev>; Thu,  3 Aug 2023 14:34:52 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d326cb4c97fso1105637276.0
        for <linux-coco@lists.linux.dev>; Thu, 03 Aug 2023 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691073292; x=1691678092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HeVObJQnYDsmrxbFy3UKyOXJ/04Tm/UrYLmx2eoTf0=;
        b=mY+VlJDI/9R96lHrF/byfI80tHJ1s5Gus55V305s7E4SAg0rPoHWmnYIjWZxnR96Qg
         wNgVWy+nar1i5fCgkhUIxyuPYnwULI/CDGcui4W4frLoCo2Xs6Mvmh4O93VXwINaG4MD
         aLQSjEgY5Sr++uwder4uv1U1zr+RE/TZw70suJBkPoAxfERYGUAh65xpMXXf1VC4L6YR
         QI1yBioovUHQV314pZya8DbV6ot00JQTOHznRjjB0MHBwoe648gepwgyrhx6yF+obTXg
         4b5zV85RlYKVZAVdlQIMyXxU5SyIvwC4aueFb8qZtbmEWd++S6ziiWUINJuLfm1ROpFm
         9WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691073292; x=1691678092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HeVObJQnYDsmrxbFy3UKyOXJ/04Tm/UrYLmx2eoTf0=;
        b=CBdKZs6EZcpYxk5y2vLdPBga9oHcAmKLgyIWP2TFnOS2xD7gl9tpHryOVaUpUqS9Xs
         sY+KKSDClIbHFSMliVHpCvJ3oreBsi+xHUgmb/V1wOr8zELhS1MKytPEUIUwNceXgT2J
         ZyoU12u7tl8hg8Lh0tGraLiPQ907Kn2vo/QSOo8aggRkZf6q7JBHW4beu7HUoeoIP1wd
         hFIBzThvX0GJf/FoPQY8hE3hQNFkW9q8RvK2WB3In7reW13LpxlrSdyBoNOgOUWCMvku
         zBbxOtaJOFgMKH6LcXHxWarW6E42K0wrXNfStiUsmSuWPKhuvLyx9kkVJwEnbYOlgbAz
         p2+w==
X-Gm-Message-State: ABy/qLbqCem36w70kgzSOdLFRPxoDyFRCTDOJycrc59zJwSxBRTG7acl
	9AsO18H6Fw3YO/eyElwjphPvQbRkO+o=
X-Google-Smtp-Source: APBJJlFFzKkAdKTRoLZ2bhoaeb1cJvVOWKX7WmBJwxFpjymL5GMdod+dfzaL5IdKDJfMFpNHYNav47SkUAk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:37d8:0:b0:c64:2bcd:a451 with SMTP id
 e207-20020a2537d8000000b00c642bcda451mr133323yba.7.1691073291936; Thu, 03 Aug
 2023 07:34:51 -0700 (PDT)
Date: Thu, 3 Aug 2023 14:34:50 +0000
In-Reply-To: <ZMto2Yza4rd2JdXf@iZuf6hx7901barev1c282cZ>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZMfFaF2M6Vrh/QdW@google.com> <4ebb3e20-a043-8ad3-ef6c-f64c2443412c@amd.com>
 <544b7f95-4b34-654d-a57b-3791a6f4fd5f@mail.ustc.edu.cn> <ZMpEUVsv5hSmrcH8@iZuf6hx7901barev1c282cZ>
 <ZMphvF+0H9wHQr5B@google.com> <bbc52f40-2661-3fa2-8e09-bec772728812@amd.com>
 <7a4f3f59-1482-49c4-92b2-aa621e9b06b3@amd.com> <bdf548d1-84cb-6885-c4eb-cbb16c4a3e3b@amd.com>
 <ZMsekJG8PF0f4sCp@iZuf6hx7901barev1c282cZ> <ZMto2Yza4rd2JdXf@iZuf6hx7901barev1c282cZ>
Message-ID: <ZMu7Cl6im9JwjHIQ@google.com>
Subject: Re: [Question] int3 instruction generates a #UD in SEV VM
From: Sean Christopherson <seanjc@google.com>
To: Wu Zongyo <wuzongyo@mail.ustc.edu.cn>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 03, 2023, Wu Zongyo wrote:
> On Thu, Aug 03, 2023 at 11:27:12AM +0800, Wu Zongyo wrote:
> > > > > 
> > > > > I'm guessing it was a #NPF, too. Could it be related to the changes that
> > > > > went in around svm_update_soft_interrupt_rip()?
> > Yes, it's a #NPF with exit code 0x400.
> > 
> > There must be something I didn't handle corretly since it behave normally with
> > qemu & ovmf If I don't add int3 before mcheck_cpu_init().
> > 
> > So it'a about memory, is there something I need to pay special attention
> > to?
> > 
> > Thanks
> I check the fault address of #NPF, and it is the IDT entry address of
> the guest kernel. The NPT page table is not constructed for the IDT
> entry and the #NPF is generated when guest try to access IDT.
> 
> With qemu & ovmf, I didn't see the #NPF when guest invoke the int3
> handler. That means the NPT page table has already been constructed, but
> when?

More than likely, the page was used by the guest at some point earlier in boot.
Why the page is faulted in for certain setups but not others isn't really all
that interesting in terms of fixing the KVM bug, both guest behaviors are completely
normal and should work.

Can you try this patch I suggested earlier?  If this fixes the problem, I'll post
a formal patch.

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d381ad424554..2eace114a934 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -385,6 +385,9 @@ static int __svm_skip_emulated_instruction(struct kvm_vcpu *vcpu,
        }

        if (!svm->next_rip) {
+               if (sev_guest(vcpu->kvm))
+                       return 0;
+
                if (unlikely(!commit_side_effects))
                        old_rflags = svm->vmcb->save.rflags;

